<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="wechatActivityRuleInfo.rule"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr><td><label><ju:txt value="wechatActivityRuleInfo.activeId"                 />:</label></td><td><input type="text"  vui-name="activeId"           vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatActivityRuleInfo.rule"                     />:</label></td><td><input type="text"  vui-name="rule"               vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"activeId":"HD001","rule":"1"}
                  ,{"activeId":"HD002","rule":"2"}
                  ,{"activeId":"HD003","rule":"1"}
                  ,{"activeId":"HD004","rule":"2"}
                  ,{"activeId":"HD005","rule":"1"}
                  ,{"activeId":"HD006","rule":"2"}
                  ,{"activeId":"HD007","rule":"1"}
                  ,{"activeId":"HD008","rule":"2"}
                  ,{"activeId":"HD009","rule":"1"}
                  ,{"activeId":"DH010","rule":"2"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"activeId"           ,              label:"<ju:txt value="wechatActivityRuleInfo.activeId"       />",                     align:"center"}
	 		,{name:"rule"               ,              label:"<ju:txt value="wechatActivityRuleInfo.rule"           />",                     align:"center"}
	 	]
	,
	caption:"<ju:txt value="wechatActivityRuleInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridwechatActivityRuleInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertwechatActivityRuleInfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"getwechatActivityRuleInfo",           label:"<ju:txt value="button.read"/>",       param:["activeId"],         resourceID:"300041"}
		,update:   {url:"updatewechatActivityRuleInfo.json",   label:"<ju:txt value="button.update"/>",     param:["activeId"],         resourceID:"300041"}
		,"delete": {url:"deletewechatActivityRuleInfo.json",   label:"<ju:txt value="button.del"/>",        param:["activeId"],         resourceID:"300041"}
	}	
	,
	controller:{
		end:["read","update","delete"],
		bottom:["create","delete"]
	}
});


</script>
