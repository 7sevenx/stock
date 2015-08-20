<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="wechatScoreStatisticsInfo.openId"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr><td><label><ju:txt value="wechatScoreStatisticsInfo.openId"                   />:</label></td><td><input type="text"  vui-name="openId"             vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatScoreStatisticsInfo.month"                    />:</label></td><td><input type="text"  vui-name="month"              vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="wechatScoreStatisticsInfo.scoreNum"                 />:</label></td><td><input type="text"  vui-name="scoreNum"           vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"openId":"uyshdjfhgffahsjdhhgg","month":"2014-01","scoreNum":"100"}
                  ,{"openId":"uyshdjfhgffahsjdhhgg","month":"2014-02","scoreNum":"100"}
                  ,{"openId":"uyshdjfhgffahsjdhhgg","month":"2014-03","scoreNum":"1  "}
                  ,{"openId":"kdcgfdqewgxavxhgzvgx","month":"2014-01","scoreNum":"100"}
                  ,{"openId":"kdcgfdqewgxavxhgzvgx","month":"2014-02","scoreNum":"200"}
                  ,{"openId":"kdcgfdqewgxavxhgzvgx","month":"2014-03","scoreNum":"200"}
                  ,{"openId":"wirufgdpogfohgjpbnlb","month":"2014-01","scoreNum":"50 "}
                  ,{"openId":"wirufgdpogfohgjpbnlb","month":"2014-02","scoreNum":"21 "}
                  ,{"openId":"wirufgdpogfohgjpbnlb","month":"2014-03","scoreNum":"16 "}
                  ,{"openId":"dsfiyquwhdjvxgzfdhsa","month":"2014-01","scoreNum":"205"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"openId"    ,              label:"<ju:txt value="wechatScoreStatisticsInfo.openId"              />",                     align:"left"}
	 		,{name:"month"     ,              label:"<ju:txt value="wechatScoreStatisticsInfo.month"               />",                     align:"center"}
	 		,{name:"scoreNum"  ,              label:"<ju:txt value="wechatScoreStatisticsInfo.scoreNum"            />",                     align:"right"}
	 	]
	,
	caption:"<ju:txt value="wechatScoreStatisticsInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridwechatScoreStatisticsInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertwechatScoreStatisticsInfo.json",   label:"<ju:txt value="button.create"/>" ,                              resourceID:"300041"}
		,read:     {url:"getwechatScoreStatisticsInfo",           label:"<ju:txt value="button.read"/>",       param:["openId"],         resourceID:"300041"}
		,update:   {url:"updatewechatScoreStatisticsInfo.json",   label:"<ju:txt value="button.update"/>",     param:["openId"],         resourceID:"300041"}
		,"delete": {url:"deletewechatScoreStatisticsInfo.json",   label:"<ju:txt value="button.del"/>",        param:["openId"],         resourceID:"300041"}
	}	
	,
	controller:{
		end:["read"],
		bottom:[""]
	}
});


</script>
