<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="servicePerformanceInfo.custServNo"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
	  <tr><td><label><ju:txt value="servicePerformanceInfo.custServNo"                  />:</label></td><td><input type="text"  vui-name="custServNo"          vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="servicePerformanceInfo.performance"                 />:</label></td><td><input type="text"  vui-name="performance"         vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="servicePerformanceInfo.month"              				 />:</label></td><td><input type="text"  vui-name="month"               vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"custServNo":"109098","performance":"85","month":"2014-01"}
                  ,{"custServNo":"109098","performance":"78","month":"2014-02"}
				  ,{"custServNo":"109098","performance":"76","month":"2014-03"}
                  ,{"custServNo":"109376","performance":"84","month":"2014-01"}
				  ,{"custServNo":"109376","performance":"88","month":"2014-02"}
                  ,{"custServNo":"109376","performance":"95","month":"2014-03"}
				  ,{"custServNo":"109834","performance":"75","month":"2014-01"}
                  ,{"custServNo":"109834","performance":"73","month":"2014-02"}
				  ,{"custServNo":"109834","performance":"54","month":"2014-03"}
                  ,{"custServNo":"109003","performance":"61","month":"2014-01"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"custServNo"				 ,              label:"<ju:txt value="servicePerformanceInfo.custServNo"         />",                     align:"center"}
	 		,{name:"performance"			 ,              label:"<ju:txt value="servicePerformanceInfo.performance"        />",                     align:"center"}
	 		,{name:"month"					   ,              label:"<ju:txt value="servicePerformanceInfo.month"              />",                     align:"center"}
	 	]
    ,
	caption:"<ju:txt value="servicePerformanceInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridservicePerformanceInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertservicePerformanceInfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"getservicePerformanceInfo",           label:"<ju:txt value="button.read"/>",       param:["activeId"],         resourceID:"300041"}
		,update:   {url:"updateservicePerformanceInfo.json",   label:"<ju:txt value="button.update"/>",     param:["activeId"],         resourceID:"300041"}
		,"delete": {url:"deleteservicePerformanceInfo.json",   label:"<ju:txt value="button.del"/>",        param:["activeId"],         resourceID:"300041"}
	}						
	,
	controller:{
		end:["read","update","delete"],
		bottom:["create","delete"]
	}
});


</script>
