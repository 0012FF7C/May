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
    var opt = req.body.opt;
    console.log("val :"+ val);
    console.log("opt :"+ opt);
    var sql = "select * from t_corp where CORP_NAME like '%" + val+"%'";
    console.log("sql :" + sql);
    DBTCorp.queryDB(sql,function (data) {
        console.log("data :"+ JSON.stringify(data));
        res.send({ data: data });
    });

});

router.get('/chat', function(req, res, next) {
    res.render('chat', { title: 'chat' });
});


module.exports = router;
