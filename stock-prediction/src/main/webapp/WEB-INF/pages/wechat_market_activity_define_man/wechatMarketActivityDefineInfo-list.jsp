<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="wechatMarketActivityDefineInfo.activeTitle"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr><td><label><ju:txt value="wechatMarketActivityDefineInfo.activeId"                    />:</label></td><td><input type="text"  vui-name="activeId"            vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatMarketActivityDefineInfo.activeTitle"                 />:</label></td><td><input type="text"  vui-name="activeTitle"         vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="wechatMarketActivityDefineInfo.content"                     />:</label></td><td><input type="text"  vui-name="content"             vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatMarketActivityDefineInfo.awardType"                   />:</label></td><td><input type="text"  vui-name="awardType"           vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="wechatMarketActivityDefineInfo.awardNum"                    />:</label></td><td><input type="text"  vui-name="awardNum"            vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatMarketActivityDefineInfo.startDate"                   />:</label></td><td><input type="text"  vui-name="startDate"           vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="wechatMarketActivityDefineInfo.endDate"                     />:</label></td><td><input type="text"  vui-name="endDate"             vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatMarketActivityDefineInfo.estimatedNum"                />:</label></td><td><input type="text"  vui-name="estimatedNum"        vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"activeId":"HD001","activeTitle":"关注抽大奖201401","content":"活动期间新关注用户，关联银行卡，即可参与抽奖。","awardType":"礼品      ","awardNum":"100","startDate":"2014/1/1","endDate":"2014/1/31","estimatedNum":"1000"}
                  ,{"activeId":"HD002","activeTitle":"积分抽奖201401  ","content":"9积分抽大奖，奖品为合作商户电子现金券。       ","awardType":"电子现金券","awardNum":"200","startDate":"2014/1/1","endDate":"2014/1/31","estimatedNum":"1500"}
                  ,{"activeId":"HD003","activeTitle":"关注抽大奖201402","content":"活动期间新关注用户，关联银行卡，即可参与抽奖。","awardType":"礼品      ","awardNum":"100","startDate":"2014/2/1","endDate":"2014/2/28","estimatedNum":"1000"}
                  ,{"activeId":"HD004","activeTitle":"积分抽奖201402  ","content":"9积分抽大奖，奖品为合作商户电子现金券。       ","awardType":"电子现金券","awardNum":"200","startDate":"2014/2/1","endDate":"2014/2/28","estimatedNum":"1500"}
                  ,{"activeId":"HD005","activeTitle":"关注抽大奖201403","content":"活动期间新关注用户，关联银行卡，即可参与抽奖。","awardType":"礼品      ","awardNum":"100","startDate":"2014/3/1","endDate":"2014/3/31","estimatedNum":"1000"}
                  ,{"activeId":"HD006","activeTitle":"积分抽奖201403  ","content":"9积分抽大奖，奖品为合作商户电子现金券。       ","awardType":"电子现金券","awardNum":"200","startDate":"2014/3/1","endDate":"2014/3/31","estimatedNum":"1500"}
                  ,{"activeId":"HD007","activeTitle":"关注抽大奖201404","content":"活动期间新关注用户，关联银行卡，即可参与抽奖。","awardType":"礼品      ","awardNum":"100","startDate":"2014/4/1","endDate":"2014/4/30","estimatedNum":"1000"}
                  ,{"activeId":"HD008","activeTitle":"积分抽奖201404  ","content":"9积分抽大奖，奖品为合作商户电子现金券。       ","awardType":"电子现金券","awardNum":"200","startDate":"2014/4/1","endDate":"2014/4/30","estimatedNum":"1500"}
                  ,{"activeId":"HD009","activeTitle":"关注抽大奖201405","content":"活动期间新关注用户，关联银行卡，即可参与抽奖。","awardType":"礼品      ","awardNum":"100","startDate":"2014/5/1","endDate":"2014/5/31","estimatedNum":"1000"}
                  ,{"activeId":"DH010","activeTitle":"积分抽奖201405  ","content":"9积分抽大奖，奖品为合作商户电子现金券。       ","awardType":"电子现金券","awardNum":"200","startDate":"2014/5/1","endDate":"2014/5/31","estimatedNum":"1500"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"activeId"        ,              label:"<ju:txt value="wechatMarketActivityDefineInfo.activeId"           />",                     align:"center"}
	 		,{name:"activeTitle"     ,              label:"<ju:txt value="wechatMarketActivityDefineInfo.activeTitle"        />",                     align:"left"}
	 		,{name:"content"         ,              label:"<ju:txt value="wechatMarketActivityDefineInfo.content"            />",                     align:"left"}
	 		,{name:"awardType"       ,              label:"<ju:txt value="wechatMarketActivityDefineInfo.awardType"          />",                     align:"left"}
	 		,{name:"awardNum"        ,              label:"<ju:txt value="wechatMarketActivityDefineInfo.awardNum"           />",                     align:"right"}
	 		,{name:"startDate"       ,              label:"<ju:txt value="wechatMarketActivityDefineInfo.startDate"          />",                     align:"center"}
	 		,{name:"endDate"         ,              label:"<ju:txt value="wechatMarketActivityDefineInfo.endDate"            />",                     align:"center"}
	 		,{name:"estimatedNum"    ,               label:"<ju:txt value="wechatMarketActivityDefineInfo.estimatedNum"      />",                     align:"right"}
	 	]
	,
	caption:"<ju:txt value="wechatMarketActivityDefineInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridwechatMarketActivityDefineInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertwechatMarketActivityDefineInfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"getwechatMarketActivityDefineInfo",           label:"<ju:txt value="button.read"/>",       param:["activeId"],         resourceID:"300041"}
		,update:   {url:"updatewechatMarketActivityDefineInfo.json",   label:"<ju:txt value="button.update"/>",     param:["activeId"],         resourceID:"300041"}
		,"delete": {url:"deletewechatMarketActivityDefineInfo.json",   label:"<ju:txt value="button.del"/>",        param:["activeId"],         resourceID:"300041"}
	}	
	,
	controller:{
		end:["read","update","delete"],
		bottom:["create","delete"]
	}
});


</script>
