<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="wechatMarketActivitySummaryInfo.activeTitle"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr><td><label><ju:txt value="wechatMarketActivitySummaryInfo.activeId"                    />:</label></td><td><input type="text"  vui-name="activeId"            vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatMarketActivitySummaryInfo.activeTitle"                 />:</label></td><td><input type="text"  vui-name="activeTitle"         vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="wechatMarketActivitySummaryInfo.particiNum"                  />:</label></td><td><input type="text"  vui-name="particiNum"          vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatMarketActivitySummaryInfo.awardGetNum"                 />:</label></td><td><input type="text"  vui-name="awardGetNum"         vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"activeId":"HD001","activeTitle":"关注抽大奖201401","particiNum":"1093","awardGetNum":"100"}
                  ,{"activeId":"HD002","activeTitle":"积分抽奖201401  ","particiNum":"1786","awardGetNum":"200"}
                  ,{"activeId":"HD003","activeTitle":"关注抽大奖201402","particiNum":"803 ","awardGetNum":"100"}
                  ,{"activeId":"HD004","activeTitle":"积分抽奖201402  ","particiNum":"2209","awardGetNum":"200"}
                  ,{"activeId":"HD005","activeTitle":"关注抽大奖201403","particiNum":"1087","awardGetNum":"100"}
                  ,{"activeId":"HD006","activeTitle":"积分抽奖201403  ","particiNum":"1587","awardGetNum":"200"}
                  ,{"activeId":"HD007","activeTitle":"关注抽大奖201404","particiNum":"    ","awardGetNum":"   "}
                  ,{"activeId":"HD008","activeTitle":"积分抽奖201404  ","particiNum":"    ","awardGetNum":"   "}
                  ,{"activeId":"HD009","activeTitle":"关注抽大奖201405","particiNum":"    ","awardGetNum":"   "}
                  ,{"activeId":"DH010","activeTitle":"积分抽奖201405  ","particiNum":"    ","awardGetNum":"   "}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"activeId"        ,              label:"<ju:txt value="wechatMarketActivitySummaryInfo.activeId"           />",                     align:"center"}
	 		,{name:"activeTitle"     ,              label:"<ju:txt value="wechatMarketActivitySummaryInfo.activeTitle"        />",                     align:"left"}
	 		,{name:"particiNum"      ,              label:"<ju:txt value="wechatMarketActivitySummaryInfo.particiNum"         />",                     align:"right"}
	 		,{name:"awardGetNum"     ,              label:"<ju:txt value="wechatMarketActivitySummaryInfo.awardGetNum"        />",                     align:"right"}
	 	]
	,
	caption:"<ju:txt value="wechatMarketActivitySummaryInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridwechatMarketActivitySummaryInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertwechatMarketActivitySummaryInfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"getwechatMarketActivitySummaryInfo",           label:"<ju:txt value="button.read"/>",       param:["activeId"],         resourceID:"300041"}
		,update:   {url:"updatewechatMarketActivitySummaryInfo.json",   label:"<ju:txt value="button.update"/>",     param:["activeId"],         resourceID:"300041"}
		,"delete": {url:"deletewechatMarketActivitySummaryInfo.json",   label:"<ju:txt value="button.del"/>",        param:["activeId"],         resourceID:"300041"}
	}	
	,
	controller:{
		end:["read"],
		bottom:[""]
	}
});


</script>
