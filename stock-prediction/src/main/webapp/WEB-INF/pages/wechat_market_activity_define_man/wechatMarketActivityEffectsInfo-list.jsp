<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="wechatMarketActivityEffectsInfo.activeTitle"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr><td><label><ju:txt value="wechatMarketActivityEffectsInfo.activeId"                     />:</label></td><td><input type="text"  vui-name="activeId"              vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatMarketActivityEffectsInfo.activeTitle"                  />:</label></td><td><input type="text"  vui-name="activeTitle"           vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="wechatMarketActivityEffectsInfo.estimatedNum"                 />:</label></td><td><input type="text"  vui-name="estimatedNum"          vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatMarketActivityEffectsInfo.particiNum"                   />:</label></td><td><input type="text"  vui-name="particiNum"            vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"activeId":"HD001","activeTitle":"关注抽大奖201401","estimatedNum":"1000","particiNum":"1093"}
                  ,{"activeId":"HD002","activeTitle":"积分抽奖201401  ","estimatedNum":"1500","particiNum":"1786"}
                  ,{"activeId":"HD003","activeTitle":"关注抽大奖201402","estimatedNum":"1000","particiNum":"803 "}
                  ,{"activeId":"HD004","activeTitle":"积分抽奖201402  ","estimatedNum":"1500","particiNum":"2209"}
                  ,{"activeId":"HD005","activeTitle":"关注抽大奖201403","estimatedNum":"1000","particiNum":"1087"}
                  ,{"activeId":"HD006","activeTitle":"积分抽奖201403  ","estimatedNum":"1500","particiNum":"1587"}
                  ,{"activeId":"HD007","activeTitle":"关注抽大奖201404","estimatedNum":"1000","particiNum":"    "}
                  ,{"activeId":"HD008","activeTitle":"积分抽奖201404  ","estimatedNum":"1500","particiNum":"    "}
                  ,{"activeId":"HD009","activeTitle":"关注抽大奖201405","estimatedNum":"1000","particiNum":"    "}
                  ,{"activeId":"DH010","activeTitle":"积分抽奖201405  ","estimatedNum":"1500","particiNum":"    "}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"activeId"        ,              label:"<ju:txt value="wechatMarketActivityEffectsInfo.activeId"           />",                     align:"center"}
	 		,{name:"activeTitle"     ,              label:"<ju:txt value="wechatMarketActivityEffectsInfo.activeTitle"        />",                     align:"left"}
	 		,{name:"estimatedNum"    ,              label:"<ju:txt value="wechatMarketActivityEffectsInfo.estimatedNum"       />",                     align:"right"}
	 		,{name:"particiNum"      ,              label:"<ju:txt value="wechatMarketActivityEffectsInfo.particiNum"         />",                     align:"right"}
	 	]
	,
	caption:"<ju:txt value="wechatMarketActivityEffectsInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridwechatMarketActivityEffectsInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertwechatMarketActivityEffectsInfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"getwechatMarketActivityEffectsInfo",           label:"<ju:txt value="button.read"/>",       param:["activeId"],         resourceID:"300041"}
		,update:   {url:"updatewechatMarketActivityEffectsInfo.json",   label:"<ju:txt value="button.update"/>",     param:["activeId"],         resourceID:"300041"}
		,"delete": {url:"deletewechatMarketActivityEffectsInfo.json",   label:"<ju:txt value="button.del"/>",        param:["activeId"],         resourceID:"300041"}
	}	
	,
	controller:{
		end:["read"],
		bottom:[""]
	}
});


</script>
