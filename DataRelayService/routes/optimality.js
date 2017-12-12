'use strict';
var express = require('express');
var router = express.Router();
var debug = require('debug')('DataRelayService');
var optimalityService = require('../domain/optimalityService');

router.get('/', function (req, res) {
    optimalityService.getLatestOptimalities()
        .then((optimalities) => {
            res.json(optimalities);
        }).catch((err) => {
            console.log(err);
            debug(err);

            res.statusCode = 500;
            res.json({ errorMessage: err.message });
        });
});

module.exports = router;
