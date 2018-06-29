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
            corpname.size=7000;
            corpname.name = val;
            corpname.group=0;
            node.push(corpname);

            var outward={};
            outward.name="对外投资";
            outward.group=1;
            outward.size=5000;
            node.push(outward);

            var owners={};
            owners.name="股东";
            owners.group=2;
            owners.size=5000;
            node.push(owners);

            link.push({"source":0,"target":1});
            link.push({"source":0,"target":2});
            for(var i=0;i<data.length;i++) {
                var temp = {};
                temp.name = data[i].STOCK_NAME;
                temp.group=2;
                temp.size=3000;
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
                    temp.size=3000;
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

router.post('/owner', function(req, res, next) {
    var val = req.body.val;
    var opt = req.body.opt;
    console.log("val :"+ val);
    console.log("opt :"+ opt);

    console.log("sql :" + sql);
        var sql = "select STOCK_NAME from t_corp join t_m_corp_corp_stock on t_corp.ORG=t_m_corp_corp_stock.ORG AND t_corp.ID=t_m_corp_corp_stock.ID AND t_corp.SEQ_ID=t_m_corp_corp_stock.SEQ_ID join t_corp_stock on t_corp_stock.ORG=t_m_corp_corp_stock.SUB_ORG AND t_corp_stock.ID=t_m_corp_corp_stock.SUB_ID AND t_corp_stock.SEQ_ID=t_m_corp_corp_stock.SUB_SEQ_ID where corp_name ='"
        sql+=val;
        sql+="' order by stock_capi desc";
        DBTCorp.queryDB(sql,function (data) {//企业基本信息
            console.log("data :"+ JSON.stringify(data));
            res.send({data:data});
        });
});
router.post('/investment', function(req, res, next) {
    var val = req.body.val;
    var opt = req.body.opt;
    console.log("val :"+ val);
    console.log("opt :"+ opt);

    console.log("sql :" + sql);
    var sql="select corp_name,STOCK_NAME,STOCK_CAPI,STOCK_PERCENT \n" +
        " from t_corp join t_m_corp_corp_stock on t_corp.ORG=t_m_corp_corp_stock.ORG AND t_corp.ID=t_m_corp_corp_stock.ID AND t_corp.SEQ_ID=t_m_corp_corp_stock.SEQ_ID \n" +
        " join t_corp_stock on t_corp_stock.ORG=t_m_corp_corp_stock.SUB_ORG AND t_corp_stock.ID=t_m_corp_corp_stock.SUB_ID AND t_corp_stock.SEQ_ID=t_m_corp_corp_stock.SUB_SEQ_ID \n" +
        " where STOCK_NAME ='";
            sql+=val;
            sql+="'";
            DBTCorp.queryDB(sql,function (data) {
                res.send({data:data});
            });
});
router.post('/layerup', function(req, res, next) {
    var val = JSON.parse(req.body.val);
    var opt = req.body.opt;
    console.log("layer up val :"+ val);
    console.log("opt :"+ opt);
    var sql="select corp_name as name,STOCK_NAME from t_corp join t_m_corp_corp_stock on t_corp.ORG=t_m_corp_corp_stock.ORG AND t_corp.ID=t_m_corp_corp_stock.ID AND t_corp.SEQ_ID=t_m_corp_corp_stock.SEQ_ID join t_corp_stock on t_corp_stock.ORG=t_m_corp_corp_stock.SUB_ORG AND t_corp_stock.ID=t_m_corp_corp_stock.SUB_ID AND t_corp_stock.SEQ_ID=t_m_corp_corp_stock.SUB_SEQ_ID where corp_name in(" ;
    for(var i=0;i<val.length;i++)
    {
        val[i].children=[];
        var owner={name:"股东",children:[]};
        var investment={name:"对外投资",children:[]};
        val[i].children.push(owner);
        val[i].children.push(investment);
        sql+="'";
        sql+=val[i].name;
        sql+="'";
        if(i!==val.length-1)
            sql+=",";
    }
    sql+=") order by stock_capi desc";
    console.log('sql'+ sql);
    DBTCorp.queryDB(sql,function (data) {
        for(var i=0;i<val.length;i++) {
            var pointer = val[i].children[0].children;
            for(var j=0;j<data.length;j++)
            if(val[i].name===data[j].name) {
                var temp={name:data[j].STOCK_NAME,children:[]}
                pointer.push(temp);
            }
        }
        sql="select corp_name,STOCK_NAME as name from t_corp join t_m_corp_corp_stock on t_corp.ORG=t_m_corp_corp_stock.ORG AND t_corp.ID=t_m_corp_corp_stock.ID AND t_corp.SEQ_ID=t_m_corp_corp_stock.SEQ_ID join t_corp_stock on t_corp_stock.ORG=t_m_corp_corp_stock.SUB_ORG AND t_corp_stock.ID=t_m_corp_corp_stock.SUB_ID AND t_corp_stock.SEQ_ID=t_m_corp_corp_stock.SUB_SEQ_ID where STOCK_NAME in(";
        for(var i=0;i<val.length;i++)
        {
            sql+="'";
            sql+=val[i].name;
            sql+="'";
            if(i!==val.length-1)
                sql+=",";
        }
        sql+=")";
        DBTCorp.queryDB(sql,function (data) {
            console.log("sdfkjhna"+JSON.stringify(data));
            for(var i=0;i<val.length;i++) {
                var pointer = val[i].children[1].children;
                for(var j=0;j<data.length;j++)
                    if(val[i].name===data[j].name) {
                    var temp={name:data[j].corp_name,children:[]}
                        pointer.push(temp);
                    }
            }
            res.send({data: val});
        })
    });
});

router.post('/EnterpriseAtlas', function(req, res, next) {
    var val = req.body.val;
    var opt = req.body.opt;
    console.log("EnterpriseAtlas :"+ val);
    console.log("opt :"+ opt);
    var sql="select OPER_MAN_NAME\n" +
        "from t_corp\n" +
        "where corp_name='";
    sql+=val;
    sql+="'";
    DBTCorp.queryDB(sql,function (data) {
        console.log(JSON.stringify(data));
        var temp={};
        temp.name=val;
        temp.children=[];
        var corporation={name:"法人",children:[]};
        var OPER_MAN_NAME={name:data[0].OPER_MAN_NAME,children:[]};
        corporation.children.push(OPER_MAN_NAME);
        temp.children.push(corporation);
        sql="select corp_name,dist_NAME as name \n" +
            "from t_corp join t_m_corp_corp_dist on t_corp.ORG=t_m_corp_corp_dist.ORG AND t_corp.ID=t_m_corp_corp_dist.ID AND t_corp.SEQ_ID=t_m_corp_corp_dist.SEQ_ID \n" +
            "join t_corp_dist on t_corp_dist.ORG=t_m_corp_corp_dist.SUB_ORG AND t_corp_dist.ID=t_m_corp_corp_dist.SUB_ID AND t_corp_dist.SEQ_ID=t_m_corp_corp_dist.SUB_SEQ_ID \n" +
            "where CORP_NAME='公司01'";
        DBTCorp.queryDB(sql,function (data) {
            var dist={name:"子公司",children:[]};
            for(var i=0;i<data.length;i++){
                var temp1={name:data[i].name,children:[]};
                dist.children.push(temp1);
            }
            temp.children.push(dist);
            sql="select corp_name,PERSON_NAME as name \n" +
                "from t_corp join t_m_corp_corp_pertains on t_corp.ORG=t_m_corp_corp_pertains.ORG AND t_corp.ID=t_m_corp_corp_pertains.ID AND t_corp.SEQ_ID=t_m_corp_corp_pertains.SEQ_ID \n" +
                "join t_corp_pertains on t_corp_pertains.ORG=t_m_corp_corp_pertains.SUB_ORG AND t_corp_pertains.ID=t_m_corp_corp_pertains.SUB_ID AND t_corp_pertains.SEQ_ID=t_m_corp_corp_pertains.SUB_SEQ_ID \n" +
                "where CORP_NAME='公司01'\n";
            DBTCorp.queryDB(sql,function (data) {
                var person={name:"高管/经理",children:[]};
                for(var i=0;i<data.length;i++){
                    var temp1={name:data[i].name,children:[]};
                    person.children.push(temp1);
                }
                console.log("投资族谱"+JSON.stringify(temp));
                temp.children.push(person);
                res.send({data: temp});
            })
        });

        })
});

router.get('/chat', function(req, res, next) {
    res.render('chat', { title: 'chat' });
});


module.exports = router;