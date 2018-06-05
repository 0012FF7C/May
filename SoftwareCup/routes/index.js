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


router.post('/association', function(req, res, next) {
    var val = req.body.val;
    var opt = req.body.opt;
    if(opt === "TorpBaseInfo"){//企业基本信息
        sql  =  "select * from t_corp where CORP_NAME like '%" + val+"%' limit 10 ";
        DBTCorpDist.queryDB(sql,function (data) {
            console.log("data :"+ JSON.stringify(data));
            res.send({ data: data });
        });
    }else if(opt === "OwnershipStructure"){//股权结构
        
    }else if(opt === "InvestmentGenealogy"){//投资族谱

    }else if(opt === "EnterpriseAtlas"){//企业图谱

    }else if(opt === "DoubtfulRelationship"){//疑似关系

    }else{

    }


});

router.post('/', function(req, res, next) {
    var val = req.body.val;
    var opt = req.body.opt;
    console.log("val :"+ val);
    console.log("opt :"+ opt);

    if(opt === "TorpBaseInfo"){//企业基本信息
        var sql = "select * from t_corp where CORP_NAME like '%" + val+"%' limit 10 ";
        DBTCorpDist.queryDB(sql,function (data) {
            console.log("data :"+ JSON.stringify(data));
            res.send({ data: data });
        });
    }else if(opt === "OwnershipStructure"){//股权结构
        var sql = "select * ";

        sql += " from t_corp A ";

        sql += "inner join t_m_corp_corp_stock M1 on A.ORG=M1.ORG AND A.ID=M1.ID AND A.SEQ_ID=M1.SEQ_ID ";

        sql += "inner join T_CORP_STOCK S on S.ORG=M1.SUB_ORG AND S.ID=M1.SUB_ID AND S.SEQ_ID=M1.SUB_SEQ_ID ";

        sql += "where CORP_NAME like '%" + val+"%'";
        DBTCorp.queryDB(sql,function (data) {
            console.log("data :"+ JSON.stringify(data));
            res.send({ data: data });
        });
    }else if(opt === "InvestmentGenealogy"){//投资族谱
        var json={};
        json.nodes=[];
        json.links=[];

        var sql = "select distinct CORP_NAME,STOCK_NAME,STOCK_CAPI_RMB,STOCK_PERCENT,STOCK_CAPI ";
        sql += "from t_corp as A ";
        sql += "inner join t_m_corp_corp_stock as M1 on A.ORG=M1.ORG AND A.ID=M1.ID AND A.SEQ_ID=M1.SEQ_ID ";
        sql += "inner join T_CORP_STOCK as S on S.ORG=M1.SUB_ORG AND S.ID=M1.SUB_ID AND S.SEQ_ID=M1.SUB_SEQ_ID ";
        sql += "where CORP_NAME like '%" + val+"%' ";
        sql += "order by STOCK_PERCENT ";
        sql += "limit 2 ";
        DBTCorp.queryDB(sql,function (data) {//企业基本信息
            console.log("data :"+ JSON.stringify(data));
            var node = {};
            // node.name = data[0].CORP_NAME;
            node.name = "dddd";
            node.group = 0;
            json.nodes.push(node);

            node.name = "股东";
            node.group = 1;
            json.nodes.push(node);

            node.name = "对外投资";
            node.group = 2;
            json.nodes.push(node);

            data.forEach(function (item) {
                console.log(item);
                node.name = item.STOCK_NAME;
                node.group = 1;
                json.nodes.push(node);
            });
            var sql = "select STOCK_NAME ,CORP_NAME ";
            sql += "from t_corp as A ";
            sql += "inner join t_m_corp_corp_stock as M1 on A.ORG=M1.ORG AND A.ID=M1.ID AND A.SEQ_ID=M1.SEQ_ID ";
            sql += "inner join T_CORP_STOCK as S on S.ORG=M1.SUB_ORG AND S.ID=M1.SUB_ID AND S.SEQ_ID=M1.SUB_SEQ_ID ";
            sql += "where STOCK_NAME like   '%" + val+"%'";
            sql += "limit 2 ";
            DBTCorp.queryDB(sql,function (data) {
                console.log("data :"+ JSON.stringify(data));
                var node = {};
                // node.name = data[0].STOCK_NAME;
                node.name = "ddd";
                node.group = 0;
                json.nodes.push(node);
                data.forEach(function (item) {
                    console.log(item);
                    node.name = item.COPR_NAME;
                    node.group = 2;
                    json.nodes.push(node);
                });
                json.nodes.forEach(function (item,index) {
                    console.log(index+" :"+JSON.stringify(item))
                });
                // json.links.push
                // res.send({ json: json });

            });


        });
    }else if(opt === "EnterpriseAtlas"){//企业图谱
        DBTCorp.queryDB(sql,function (data) {
            console.log("data :"+ JSON.stringify(data));
            res.send({ data: data });
        });
    }else if(opt === "DoubtfulRelationship"){//疑似关系
        DBTCorp.queryDB(sql,function (data) {
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
