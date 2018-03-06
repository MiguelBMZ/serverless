var envVars = {
  "SERVERLESS_PROJECT": process.env.SERVERLESS_PROJECT,
  "SERVERLESS_STAGE": process.env.SERVERLESS_STAGE,
  "SERVERLESS_REGION": process.env.SERVERLESS_REGION,
  "SERVERLESS_DATA_MODEL_STAGE": process.env.SERVERLESS_STAGE
};
for (var key in envVars) {
  process.env[key] = envVars[key];
}
exports.handler = require("./handler")["handler"];
