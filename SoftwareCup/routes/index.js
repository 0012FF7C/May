var express = require('express');
var router = express.Router();

var DBTCorp = require("../db/DBTCorp");
router.get('/', function(req, res, next) {
    var val = req.body.val;
    console.log("val :"+val);
  res.render('index', { title: 'Express' });
});

router.post('/', function(req, res, next) {
    var val = req.body.val;
    var option = req.body.val;
    console.log("val :"+ val);
    var sql = "select from t_corp where corp_name ="+val;
    var data = DBTCorp.queryDB(sql);
    console.log("data :"+ JSON.stringify(data));
    res.send({ data: data });
});

router.get('/chat', function(req, res, next) {
    res.render('chat', { title: 'chat' });
});


module.exports = router;
