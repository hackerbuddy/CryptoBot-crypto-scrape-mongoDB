'use strict';
var express = require('express');
var router = express.Router();

router.get('/', function (req, res) {
    res.setHeader('Content-Type', 'application/json');
    var message = { 'optimality': 'good' };
    res.send(message);
});

router.get('/:test', function (req, res) {
    res.setHeader('Content-Type', 'application/json');
    var message = { 'optimality': req.params.test };
    res.send(message);
});

module.exports = router;
