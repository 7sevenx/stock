<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="wechatScoreExchangeSummaryInfo.goodsName"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr><td><label><ju:txt value="wechatScoreExchangeSummaryInfo.goodsId"                   />:</label></td><td><input type="text"  vui-name="goodsId"            vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatScoreExchangeSummaryInfo.goodsName"                 />:</label></td><td><input type="text"  vui-name="goodsName"          vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="wechatScoreExchangeSummaryInfo.totleNum"                  />:</label></td><td><input type="text"  vui-name="totleNum"           vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatScoreExchangeSummaryInfo.redNum"                    />:</label></td><td><input type="text"  vui-name="redNum"             vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatScoreExchangeSummaryInfo.leftNum"                   />:</label></td><td><input type="text"  vui-name="leftNum"            vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"goodsId":"V0001001","goodsName":"小肥羊19元现金券  ","totleNum":"1000","redNum":"1000","leftNum":"0  "}
                  ,{"goodsId":"V0001002","goodsName":"小肥羊29元现金券  ","totleNum":"1000","redNum":"1000","leftNum":"0  "}
                  ,{"goodsId":"V0002001","goodsName":"许留山9元现金券   ","totleNum":"1000","redNum":"1000","leftNum":"0  "}
                  ,{"goodsId":"V0002002","goodsName":"许留山饮品兑换券  ","totleNum":"1000","redNum":"1000","leftNum":"0  "}
                  ,{"goodsId":"V0002003","goodsName":"许留山甜品兑换券  ","totleNum":"1000","redNum":"1000","leftNum":"0  "}
                  ,{"goodsId":"S0002001","goodsName":"纪念版购物袋（小）","totleNum":"2000","redNum":"2000","leftNum":"0  "}
                  ,{"goodsId":"S0002002","goodsName":"纪念版购物袋（大）","totleNum":"2000","redNum":"2000","leftNum":"0  "}
                  ,{"goodsId":"S0003001","goodsName":"纪念版笔记本      ","totleNum":"1000","redNum":"1000","leftNum":"0  "}
                  ,{"goodsId":"S0004001","goodsName":"纪念版雨伞        ","totleNum":"1000","redNum":"1000","leftNum":"0  "}
                  ,{"goodsId":"S0005001","goodsName":"纪念版钥匙扣      ","totleNum":"1000","redNum":"894 ","leftNum":"106"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"goodsId"        ,              label:"<ju:txt value="wechatScoreExchangeSummaryInfo.goodsId"           />",                     align:"center"}
	 		,{name:"goodsName"      ,              label:"<ju:txt value="wechatScoreExchangeSummaryInfo.goodsName"         />",                     align:"left"}
	 		,{name:"totleNum"       ,              label:"<ju:txt value="wechatScoreExchangeSummaryInfo.totleNum"          />",                     align:"right"}
	 		,{name:"redNum"         ,              label:"<ju:txt value="wechatScoreExchangeSummaryInfo.redNum"            />",                     align:"right"}
	 		,{name:"leftNum"        ,              label:"<ju:txt value="wechatScoreExchangeSummaryInfo.leftNum"           />",                     align:"right"}
	 	]
	,
	caption:"<ju:txt value="wechatScoreExchangeSummaryInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridwechatScoreExchangeSummaryInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertwechatScoreExchangeSummaryInfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"getwechatScoreExchangeSummaryInfo",           label:"<ju:txt value="button.read"/>",       param:["busiType"],         resourceID:"300041"}
		,update:   {url:"updatewechatScoreExchangeSummaryInfo.json",   label:"<ju:txt value="button.update"/>",     param:["busiType"],         resourceID:"300041"}
		,"delete": {url:"deletewechatScoreExchangeSummaryInfo.json",   label:"<ju:txt value="button.del"/>",        param:["busiType"],         resourceID:"300041"}
	}			
	,
	controller:{
		end:["read"],
		bottom:[""]
	}
});


</script>
