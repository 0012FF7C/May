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
        sql  =  "select * from t_corp where CORP_NAME like '%" + val+"%' limit 10 ";
        DBTCorpDist.queryDB(sql,function (data) {
            console.log("data :"+ JSON.stringify(data));
            res.send({ data: data });
        });
});
router.post('/', function(req, res, next) {
    var val = req.body.val;
    var opt = req.body.opt;
    console.log("val :"+ val);
    console.log("opt :"+ opt);

    console.log("sql :" + sql);

    if(opt === "TorpBaseInfo"){//企业基本信息
        var sql = "select * from t_corp where CORP_NAME = '"+val+"'";
        DBTCorpDist.queryDB(sql,function (data) {
            console.log("data :"+ JSON.stringify(data));
            res.send({ data: data });
        });
    }else if(opt === "OwnershipStructure"){//股权结构

        var sql = "select corp_name,STOCK_NAME,STOCK_CAPI,STOCK_PERCENT from t_corp join t_m_corp_corp_stock on t_corp.ORG=t_m_corp_corp_stock.ORG AND t_corp.ID=t_m_corp_corp_stock.ID AND t_corp.SEQ_ID=t_m_corp_corp_stock.SEQ_ID join t_corp_stock on t_corp_stock.ORG=t_m_corp_corp_stock.SUB_ORG AND t_corp_stock.ID=t_m_corp_corp_stock.SUB_ID AND t_corp_stock.SEQ_ID=t_m_corp_corp_stock.SUB_SEQ_ID where corp_name ='"
        sql+=val;
        sql+="' order by stock_capi desc";
        DBTCorp.queryDB(sql,function (data) {//企业基本信息
            console.log("data :"+ JSON.stringify(data));
            res.send({ data: data });
        });
    }else if(opt === "InvestmentGenealogy"){//投资族谱

        var sql = "select corp_name,STOCK_NAME,STOCK_CAPI,STOCK_PERCENT from t_corp join t_m_corp_corp_stock on t_corp.ORG=t_m_corp_corp_stock.ORG AND t_corp.ID=t_m_corp_corp_stock.ID AND t_corp.SEQ_ID=t_m_corp_corp_stock.SEQ_ID join t_corp_stock on t_corp_stock.ORG=t_m_corp_corp_stock.SUB_ORG AND t_corp_stock.ID=t_m_corp_corp_stock.SUB_ID AND t_corp_stock.SEQ_ID=t_m_corp_corp_stock.SUB_SEQ_ID where corp_name ='"
        sql+=val;
        sql+="' order by stock_capi desc";
        DBTCorp.queryDB(sql,function (data) {//企业基本信息
            console.log("data :"+ JSON.stringify(data));
            var node=[];
            var link=[];
            var corpname = {};
            corpname.name = val;
            corpname.group=0;
            node.push(corpname);

            var outward={};
            outward.name="对外投资";
            outward.group=1;
            node.push(outward);

            var owners={};
            owners.name="股东";
            owners.group=2;
            node.push(owners);

            link.push({"source":0,"target":1});
            link.push({"source":0,"target":2});
            for(var i=0;i<data.length;i++) {
                var temp = {};
                temp.name = data[i].STOCK_NAME;
                temp.group=2;
                node.push(temp);
                link.push({"source":2,"target":3+i});
            }
            var sql="select corp_name,STOCK_NAME,STOCK_CAPI,STOCK_PERCENT \n" +
                " from t_corp join t_m_corp_corp_stock on t_corp.ORG=t_m_corp_corp_stock.ORG AND t_corp.ID=t_m_corp_corp_stock.ID AND t_corp.SEQ_ID=t_m_corp_corp_stock.SEQ_ID \n" +
                " join t_corp_stock on t_corp_stock.ORG=t_m_corp_corp_stock.SUB_ORG AND t_corp_stock.ID=t_m_corp_corp_stock.SUB_ID AND t_corp_stock.SEQ_ID=t_m_corp_corp_stock.SUB_SEQ_ID \n" +
                " where STOCK_NAME ='"
            sql+=val;
            sql+="'";
            var len=node.length;
            DBTCorp.queryDB(sql,function (data) {

                for(var i=0;i<data.length;i++) {
                    var temp = {};
                    temp.name = data[i].STOCK_NAME;
                    temp.group=1;
                    node.push(temp);
                    link.push({"source":1,"target":len+i});
                }
                var json={};
                json.node=node;
                json.link=link;
                res.send({data:json});
            })

        });
    }else if(opt === "EnterpriseAtlas"){//企业图谱
        DBTCorp.queryDB(sql,function (data) {//企业基本信
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


module.exports = router