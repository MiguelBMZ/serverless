'use strict';
var moment = require('moment');

module.exports.handler = function(event, context, cb) {

  return cb(null, {
    message: 'la hora es: '+moment().format()
  });
};
