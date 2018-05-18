var express = require('express');
var router = express.Router();

/* GET home page. */

//var DBTCorp = require("../db/DBTCorp");
router.get('/', function(req, res, next) {
    var val = req.body.val;
    console.log("val :"+val);
  res.render('index', { title: 'Express' });
});

router.post('/', function(req, res, next) {
    var val = req.body.val;
    console.log("val :"+val);
    res.send({ title: 'Express' });
});

router.get('/chat', function(req, res, next) {
    res.render('chat', { title: 'chat' });
});


module.exports = router;
