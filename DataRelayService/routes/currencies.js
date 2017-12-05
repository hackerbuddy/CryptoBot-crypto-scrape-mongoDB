'use strict';
var express = require('express');
var router = express.Router();
var debug = require('debug')('DataRelayService');
var bitcoinTest = require('../dataAccess/bitcoinTestDataAccess');

router.get('/', function (req, res) {
    bitcoinTest.getTop100Coins()
        .then((coins) => {
            res.json(coins);
        }).catch((err) => {
            console.log(err);
            debug(err);

            res.statusCode = 500;
            res.json({ errorMessage: err.message });
        });
});

module.exports = router;
