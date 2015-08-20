<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="wechatSvrScoreSetInfo.busiType"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr><td><label><ju:txt value="wechatSvrScoreSetInfo.busiType"                  />:</label></td><td><input type="text"  vui-name="busiType"           vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatSvrScoreSetInfo.business"                  />:</label></td><td><input type="text"  vui-name="business"           vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="wechatSvrScoreSetInfo.scoreNum"                  />:</label></td><td><input type="text"  vui-name="scoreNum"           vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatSvrScoreSetInfo.isRepeat"                  />:</label></td><td><input type="text"  vui-name="isRepeat"           vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatSvrScoreSetInfo.maxAmount"                 />:</label></td><td><input type="text"  vui-name="maxAmount"          vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"busiType":"账户管理  ","business":"关联银行卡        ","scoreNum":"10 ","isRepeat":"N","maxAmount":"   "}
                  ,{"busiType":"信用卡业务","business":"信用卡申请        ","scoreNum":"100","isRepeat":"N","maxAmount":"   "}
                  ,{"busiType":"信用卡业务","business":"信用卡账单查询    ","scoreNum":"1  ","isRepeat":"Y","maxAmount":"100"}
                  ,{"busiType":"信用卡业务","business":"信用卡未出账单查询","scoreNum":"1  ","isRepeat":"Y","maxAmount":"100"}
                  ,{"busiType":"信用卡业务","business":"推荐他人办理信用卡","scoreNum":"50 ","isRepeat":"Y","maxAmount":"   "}
                  ,{"busiType":"个人理财  ","business":"最新理财产品查询  ","scoreNum":"1  ","isRepeat":"Y","maxAmount":"100"}
                  ,{"busiType":"客户服务  ","business":"微信客服          ","scoreNum":"50 ","isRepeat":"N","maxAmount":"   "}
                  ,{"busiType":"客户服务  ","business":"投诉建议          ","scoreNum":"50 ","isRepeat":"N","maxAmount":"   "}
                  ,{"busiType":"客户服务  ","business":"预约              ","scoreNum":"1  ","isRepeat":"Y","maxAmount":"100"}
                  ,{"busiType":"银行卡业务","business":"查询余额          ","scoreNum":"1  ","isRepeat":"Y","maxAmount":"100"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"busiType"        ,              label:"<ju:txt value="wechatSvrScoreSetInfo.busiType"           />",                     align:"left"}
	 		,{name:"business"        ,              label:"<ju:txt value="wechatSvrScoreSetInfo.business"           />",                     align:"left"}
	 		,{name:"scoreNum"        ,              label:"<ju:txt value="wechatSvrScoreSetInfo.scoreNum"           />",                     align:"right"}
	 		,{name:"isRepeat"        ,              label:"<ju:txt value="wechatSvrScoreSetInfo.isRepeat"           />",                     align:"center"}
	 		,{name:"maxAmount"       ,              label:"<ju:txt value="wechatSvrScoreSetInfo.maxAmount"          />",                     align:"right"}
	 	]
	,
	caption:"<ju:txt value="wechatSvrScoreSetInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridwechatSvrScoreSetInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertwechatSvrScoreSetInfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"getwechatSvrScoreSetInfo",           label:"<ju:txt value="button.read"/>",       param:["busiType"],         resourceID:"300041"}
		,update:   {url:"updatewechatSvrScoreSetInfo.json",   label:"<ju:txt value="button.update"/>",     param:["busiType"],         resourceID:"300041"}
		,"delete": {url:"deletewechatSvrScoreSetInfo.json",   label:"<ju:txt value="button.del"/>",        param:["busiType"],         resourceID:"300041"}
	}	
	,
	controller:{
		end:["read","update","delete"],
		bottom:["create","delete"]
	}
});


</script>
