<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="tradeTrendAnalysisInfo.transaction"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
	  <tr><td><label><ju:txt value="tradeTrendAnalysisInfo.transaction"                    		/>:</label></td><td><input type="text"  vui-name="transaction"            vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="tradeTrendAnalysisInfo.year_on_year_growth"                />:</label></td><td><input type="text"  vui-name="year_on_year_growth"    vui-validate="required:true"  maxlength="60"/></td></tr>                 
	  <tr><td><label><ju:txt value="tradeTrendAnalysisInfo.annulus_growth"                     />:</label></td><td><input type="text"  vui-name="annulus_growth"         vui-validate="required:true"  maxlength="60"/></td></tr>                 
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"transaction":"关联银行卡        ","year_on_year_growth":"65 ","annulus_growth":"12"}
                  ,{"transaction":"信用卡申请        ","year_on_year_growth":"875","annulus_growth":"56"}
                  ,{"transaction":"信用卡账单查询    ","year_on_year_growth":"34 ","annulus_growth":"12"}
                  ,{"transaction":"信用卡未出账单查询","year_on_year_growth":"65 ","annulus_growth":"23"}
                  ,{"transaction":"推荐他人办理信用卡","year_on_year_growth":"127","annulus_growth":"34"}
                  ,{"transaction":"最新理财产品查询  ","year_on_year_growth":"209","annulus_growth":"46"}
                  ,{"transaction":"微信客服          ","year_on_year_growth":"12 ","annulus_growth":"5 "}
                  ,{"transaction":"投诉建议          ","year_on_year_growth":"-23","annulus_growth":"-2"}
                  ,{"transaction":"预约              ","year_on_year_growth":"-12","annulus_growth":"-4"}
                  ,{"transaction":"查询余额          ","year_on_year_growth":"109","annulus_growth":"75"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"transaction"         ,              label:"<ju:txt value="tradeTrendAnalysisInfo.transaction"             />",                     align:"left"}
	 		,{name:"year_on_year_growth" ,              label:"<ju:txt value="tradeTrendAnalysisInfo.year_on_year_growth"     />",                     align:"right"}
	 		,{name:"annulus_growth"	     ,              label:"<ju:txt value="tradeTrendAnalysisInfo.annulus_growth"          />",                     align:"right"}
	 	]
	,
	caption:"<ju:txt value="tradeTrendAnalysisInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridtradeTrendAnalysisInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"inserttradeTrendAnalysisInfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"gettradeTrendAnalysisInfo",           label:"<ju:txt value="button.read"/>",       param:["activeId"],         resourceID:"300041"}
		,update:   {url:"updatetradeTrendAnalysisInfo.json",   label:"<ju:txt value="button.update"/>",     param:["activeId"],         resourceID:"300041"}
		,"delete": {url:"deletetradeTrendAnalysisInfo.json",   label:"<ju:txt value="button.del"/>",        param:["activeId"],         resourceID:"300041"}
	}				
	,
	controller:{
		end:["read"],
		bottom:[""]
	}
});


</script>
