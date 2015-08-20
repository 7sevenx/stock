<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="customerSvrSummaryInfo.servType"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr><td><label><ju:txt value="customerSvrSummaryInfo.servType"                 />:</label></td><td><input type="text"  vui-name="servType"          vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="customerSvrSummaryInfo.clickNum"                 />:</label></td><td><input type="text"  vui-name="clickNum"          vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="customerSvrSummaryInfo.monthGrowth"              />:</label></td><td><input type="text"  vui-name="monthGrowth"       vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"servType":"银行卡业务","clickNum":"2098847","monthGrowth":"657"}
                  ,{"servType":"个人存款  ","clickNum":"290847 ","monthGrowth":"122"}
                  ,{"servType":"个人贷款  ","clickNum":"2893887","monthGrowth":"5  "}
                  ,{"servType":"个人理财  ","clickNum":"6632223","monthGrowth":"257"}
                  ,{"servType":"个人汇兑  ","clickNum":"874992 ","monthGrowth":"-12"}
                  ,{"servType":"个人银行  ","clickNum":"873948 ","monthGrowth":"89 "}
                  ,{"servType":"私人银行  ","clickNum":"12093  ","monthGrowth":"12 "}
                  ,{"servType":"出国金融  ","clickNum":"19384  ","monthGrowth":"35 "}
                  ,{"servType":"惠民金融  ","clickNum":"237462 ","monthGrowth":"-65"}
                  ,{"servType":"信用卡业务","clickNum":"1208832","monthGrowth":"-23"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"servType"           ,              label:"<ju:txt value="customerSvrSummaryInfo.servType"           />",                     align:"left"}
	 		,{name:"clickNum"           ,              label:"<ju:txt value="customerSvrSummaryInfo.clickNum"           />",                     align:"right"}
	 		,{name:"monthGrowth"        ,              label:"<ju:txt value="customerSvrSummaryInfo.monthGrowth"        />",                     align:"right"}
	 	]
	,
	caption:"<ju:txt value="customerSvrSummaryInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridcustomerSvrSummaryInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertcustomerSvrSummaryInfo.json",   label:"<ju:txt value="button.create"/>" ,                              resourceID:"300041"}
		,read:     {url:"getcustomerSvrSummaryInfo",           label:"<ju:txt value="button.read"/>",       param:["servType"],         resourceID:"300041"}
		,update:   {url:"updatecustomerSvrSummaryInfo.json",   label:"<ju:txt value="button.update"/>",     param:["servType"],         resourceID:"300041"}
		,"delete": {url:"deletecustomerSvrSummaryInfo.json",   label:"<ju:txt value="button.del"/>",        param:["servType"],         resourceID:"300041"}
	}	
	,
	controller:{
		end:["read"],
		bottom:[""]
	}
});


</script>
