<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="tradeStatisticsAnalysisInfo.transaction"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
	  <tr><td><label><ju:txt value="tradeStatisticsAnalysisInfo.transaction"                />:</label></td><td><input type="text"  vui-name="transaction"     vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="tradeStatisticsAnalysisInfo.tnxNum"                     />:</label></td><td><input type="text"  vui-name="tnxNum"			     vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="tradeStatisticsAnalysisInfo.dayTnxNum"                  />:</label></td><td><input type="text"  vui-name="dayTnxNum"       vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="tradeStatisticsAnalysisInfo.monthTnxNum"                />:</label></td><td><input type="text"  vui-name="monthTnxNum"     vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"transaction":"关联银行卡        ","tnxNum":"10005","dayTnxNum":"207 ","monthTnxNum":"6210 "}
                  ,{"transaction":"信用卡申请        ","tnxNum":"2009 ","dayTnxNum":"12  ","monthTnxNum":"360  "}
                  ,{"transaction":"信用卡账单查询    ","tnxNum":"50123","dayTnxNum":"256 ","monthTnxNum":"7680 "}
                  ,{"transaction":"信用卡未出账单查询","tnxNum":"4076 ","dayTnxNum":"67  ","monthTnxNum":"2010 "}
                  ,{"transaction":"推荐他人办理信用卡","tnxNum":"2876 ","dayTnxNum":"56  ","monthTnxNum":"1680 "}
                  ,{"transaction":"最新理财产品查询  ","tnxNum":"52768","dayTnxNum":"456 ","monthTnxNum":"13680"}
                  ,{"transaction":"微信客服          ","tnxNum":"10927","dayTnxNum":"124 ","monthTnxNum":"3720 "}
                  ,{"transaction":"投诉建议          ","tnxNum":"8093 ","dayTnxNum":"233 ","monthTnxNum":"6990 "}
                  ,{"transaction":"预约              ","tnxNum":"1002 ","dayTnxNum":"23  ","monthTnxNum":"690  "}
                  ,{"transaction":"查询余额          ","tnxNum":"83476","dayTnxNum":"2345","monthTnxNum":"70350"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"transaction"       ,              label:"<ju:txt value="tradeStatisticsAnalysisInfo.transaction"        />",                     align:"left"}
	 		,{name:"tnxNum"			       ,              label:"<ju:txt value="tradeStatisticsAnalysisInfo.tnxNum"             />",                     align:"right"}
	 		,{name:"dayTnxNum"         ,              label:"<ju:txt value="tradeStatisticsAnalysisInfo.dayTnxNum"          />",                     align:"right"}
	 		,{name:"monthTnxNum"       ,              label:"<ju:txt value="tradeStatisticsAnalysisInfo.monthTnxNum"        />",                     align:"right"}
	 	]
	,
	caption:"<ju:txt value="tradeStatisticsAnalysisInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	 dataRoot:"gridtradeStatisticsAnalysisInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"inserttradeStatisticsAnalysisInfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"gettradeStatisticsAnalysisInfo",           label:"<ju:txt value="button.read"/>",       param:["activeId"],         resourceID:"300041"}
		,update:   {url:"updatetradeStatisticsAnalysisInfo.json",   label:"<ju:txt value="button.update"/>",     param:["activeId"],         resourceID:"300041"}
		,"delete": {url:"deletetradeStatisticsAnalysisInfo.json",   label:"<ju:txt value="button.del"/>",        param:["activeId"],         resourceID:"300041"}
	}			
	,
	controller:{
		end:["read"],
		bottom:[""]
	}
});


</script>
