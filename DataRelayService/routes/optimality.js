'use strict';
var express = require('express');
var router = express.Router();

router.get('/', function (req, res) {
    res.json({ optimality: 'good' });
});

router.get('/:test', function (req, res) {
    res.json({ optimality: req.params.test });
});

module.exports = router;
