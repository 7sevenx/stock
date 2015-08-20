<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="wechatGoodsScoreRelInfo.goodsName"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr><td><label><ju:txt value="wechatGoodsScoreRelInfo.goodsId"                   />:</label></td><td><input type="text"  vui-name="goodsId"             vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatGoodsScoreRelInfo.goodsName"                 />:</label></td><td><input type="text"  vui-name="goodsName"           vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="wechatGoodsScoreRelInfo.score"                     />:</label></td><td><input type="text"  vui-name="score"               vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"goodsId":"V0001001","goodsName":"小肥羊19元现金券  ","score":"9  "}
                  ,{"goodsId":"V0001002","goodsName":"小肥羊29元现金券  ","score":"19 "}
                  ,{"goodsId":"V0002001","goodsName":"许留山9元现金券   ","score":"9  "}
                  ,{"goodsId":"V0002002","goodsName":"许留山饮品兑换券  ","score":"19 "}
                  ,{"goodsId":"V0002003","goodsName":"许留山甜品兑换券  ","score":"29 "}
                  ,{"goodsId":"S0002001","goodsName":"纪念版购物袋（小）","score":"100"}
                  ,{"goodsId":"S0002002","goodsName":"纪念版购物袋（大）","score":"100"}
                  ,{"goodsId":"S0003001","goodsName":"纪念版笔记本      ","score":"100"}
                  ,{"goodsId":"S0004001","goodsName":"纪念版雨伞        ","score":"500"}
                  ,{"goodsId":"S0005001","goodsName":"纪念版钥匙扣      ","score":"100"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"goodsId"       ,              label:"<ju:txt value="wechatGoodsScoreRelInfo.goodsId"              />",                     align:"center"}
	 		,{name:"goodsName"     ,              label:"<ju:txt value="wechatGoodsScoreRelInfo.goodsName"            />",                     align:"left"}
	 		,{name:"score"         ,              label:"<ju:txt value="wechatGoodsScoreRelInfo.score"                />",                     align:"right"}
	 	]
	,
	caption:"<ju:txt value="wechatGoodsScoreRelInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridwechatGoodsScoreRelInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertwechatGoodsScoreRelInfo.json",   label:"<ju:txt value="button.create"/>" ,                              resourceID:"300041"}
		,read:     {url:"getwechatGoodsScoreRelInfo",           label:"<ju:txt value="button.read"/>",       param:["openId"],         resourceID:"300041"}
		,update:   {url:"updatewechatGoodsScoreRelInfo.json",   label:"<ju:txt value="button.update"/>",     param:["openId"],         resourceID:"300041"}
		,"delete": {url:"deletewechatGoodsScoreRelInfo.json",   label:"<ju:txt value="button.del"/>",        param:["openId"],         resourceID:"300041"}
	}		
	,
	controller:{
		end:["read","update","delete"],
		bottom:["create","delete"]
	}
});


</script>
