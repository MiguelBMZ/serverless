'use strict';
var moment = require('moment');

module.exports.handler = function(event, context, cb) {

  return cb(null, {
    message: 'la horas bb esta: '+moment().format()
  });
};
