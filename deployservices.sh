declare -A servicio0=([nombre]='general_prueba' [direccion]='general_prueba/') 
for id_service in ${!servicio@}; 
do
  declare -n servicio=$id_service
  cd ${servicio[direccion]}
  zip -r ${servicio[nombre]}.zip .
  echo "deploy lambda named ${servicio[nombre]}"
  aws lambda update-function-code --function-name ejemplo-deploy-${servicio[nombre]} --zip-file fileb://${servicio[nombre]}.zip --publish
  lambdaaws="arn:aws:lambda:eu-central-1:876586008247:function:ejemplo-deploy-"${servicio[nombre]}
  lambda_publish="$(aws lambda publish-version --function-name $lambdaaws --description '1' --region 'eu-central-1')"
  export PYTHONIOENCODING=utf8
  lambda_version="$(echo $lambda_publish | /usr/bin/python -c 'import sys, json; print json.load(sys.stdin)["Version"]')"
  aws lambda update-alias --function-name ejemplo-deploy-${servicio[nombre]} --name "dev" --function-version $lambda_version
done
