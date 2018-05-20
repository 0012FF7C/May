var express = require('express');
var router = express.Router();

var DBTCorp = require("../db/DBTCorp");
var DBTCorpDist = require("../db/DBTCorpDist");
var DBTCorpPertains = require("../db/DBTCorpPertains");
var DBTCorpStock = require("../db/DBTCorpStock");
var DBTMCorpCorpDist = require("../db/DBTMCorpCorpDist");
var DBTMCorpCorpStock = require("../db/DBTMCorpCorpStock");

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

    console.log("sql :" + sql);
    if(opt === "TorpBaseInfo"){
        var sql = "select * from t_corp where CORP_NAME like '%" + val+"%'";
        DBTCorpDist.queryDB(sql,function (data) {//企业基本信息
            console.log("data :"+ JSON.stringify(data));
            res.send({ data: data });
        });
    }else if(opt === "OwnershipStructure"){//股权结构
        var sql = "select *";

        sql += " from t_corp A ";

        sql += "inner join t_m_corp_corp_stock M1 on A.ORG=M1.ORG AND A.ID=M1.ID AND A.SEQ_ID=M1.SEQ_ID ";

        sql += "inner join T_CORP_STOCK S on S.ORG=M1.SUB_ORG AND S.ID=M1.SUB_ID AND S.SEQ_ID=M1.SUB_SEQ_ID ";

        sql += "where CORP_NAME like '%" + val+"%'";
        DBTCorp.queryDB(sql,function (data) {//企业基本信息
            console.log("data :"+ JSON.stringify(data));
            res.send({ data: data });
        });
    }else if(opt === "InvestmentGenealogy"){//投资族谱
        DBTCorp.queryDB(sql,function (data) {//企业基本信息
            console.log("data :"+ JSON.stringify(data));
            res.send({ data: data });
        });
    }else if(opt === "EnterpriseAtlas"){//企业图谱
        DBTCorp.queryDB(sql,function (data) {//企业基本信息
            console.log("data :"+ JSON.stringify(data));
            res.send({ data: data });
        });
    }else if(opt === "DoubtfulRelationship"){//疑似关系
        DBTCorp.queryDB(sql,function (data) {//企业基本信息
            console.log("data :"+ JSON.stringify(data));
            res.send({ data: data });
        });
    }else{
        res.send({ data: "没有该类别" });
    }



});

router.get('/chat', function(req, res, next) {
    res.render('chat', { title: 'chat' });
});


module.exports = router;
