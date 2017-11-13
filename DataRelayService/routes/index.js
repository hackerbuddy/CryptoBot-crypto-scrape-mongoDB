'use strict';
var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function (req, res) {
    res.setHeader('Content-Type', 'text/html');
    res.render('index', { title: 'DataRelayService' });
});

module.exports = router;
