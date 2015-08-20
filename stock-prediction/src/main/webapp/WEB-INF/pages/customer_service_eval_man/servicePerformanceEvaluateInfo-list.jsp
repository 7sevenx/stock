<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="servicePerformanceEvaluateInfo.custServNo"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
	  <tr><td><label><ju:txt value="servicePerformanceEvaluateInfo.custServNo"                    />:</label></td><td><input type="text"    vui-name="custServNo"        vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="servicePerformanceEvaluateInfo.weekEvaluScores"               />:</label></td><td><input type="text"    vui-name="weekEvaluScores"   vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="servicePerformanceEvaluateInfo.weekBadScores"                 />:</label></td><td><input type="text"    vui-name="weekBadScores"     vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="servicePerformanceEvaluateInfo.monEvaluScores"                />:</label></td><td><input type="text"    vui-name="monEvaluScores"    vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="servicePerformanceEvaluateInfo.monBadScores"                  />:</label></td><td><input type="text"    vui-name="monBadScores"      vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"custServNo":"109098","weekEvaluScores":"309","weekBadScores":"2","monEvaluScores":"1090","monBadScores":"12"}
                  ,{"custServNo":"109376","weekEvaluScores":"287","weekBadScores":"1","monEvaluScores":"898 ","monBadScores":"6 "}
				  ,{"custServNo":"109834","weekEvaluScores":"276","weekBadScores":"4","monEvaluScores":"876 ","monBadScores":"45"}
                  ,{"custServNo":"109003","weekEvaluScores":"303","weekBadScores":"2","monEvaluScores":"1098","monBadScores":"13"}
				  ,{"custServNo":"109938","weekEvaluScores":"439","weekBadScores":"1","monEvaluScores":"1200","monBadScores":"18"}
                  ,{"custServNo":"109004","weekEvaluScores":"436","weekBadScores":"1","monEvaluScores":"1387","monBadScores":"9 "}
				  ,{"custServNo":"109005","weekEvaluScores":"321","weekBadScores":"1","monEvaluScores":"954 ","monBadScores":"7 "}
                  ,{"custServNo":"109006","weekEvaluScores":"299","weekBadScores":"0","monEvaluScores":"876 ","monBadScores":"2 "}
				  ,{"custServNo":"109007","weekEvaluScores":"198","weekBadScores":"0","monEvaluScores":"564 ","monBadScores":"9 "}
                  ,{"custServNo":"109009","weekEvaluScores":"176","weekBadScores":"2","monEvaluScores":"769 ","monBadScores":"23"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"custServNo"				 ,              label:"<ju:txt value="servicePerformanceEvaluateInfo.custServNo"            />",                     align:"center"}
	 		,{name:"weekEvaluScores"	 ,	            label:"<ju:txt value="servicePerformanceEvaluateInfo.weekEvaluScores"       />",                     align:"right"}
	 		,{name:"weekBadScores"		 ,              label:"<ju:txt value="servicePerformanceEvaluateInfo.weekBadScores"         />",                     align:"right"}
	 		,{name:"monEvaluScores"		 ,              label:"<ju:txt value="servicePerformanceEvaluateInfo.monEvaluScores"        />", 	                  align:"right"}
	 		,{name:"monBadScores"			 ,              label:"<ju:txt value="servicePerformanceEvaluateInfo.monBadScores"          />",                     align:"right"}
	 	]
    ,
	caption:"<ju:txt value="servicePerformanceEvaluateInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridservicePerformanceEvaluateInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertservicePerformanceEvaluateInfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"getservicePerformanceEvaluateInfo",           label:"<ju:txt value="button.read"/>",       param:["activeId"],         resourceID:"300041"}
		,update:   {url:"updateservicePerformanceEvaluateInfo.json",   label:"<ju:txt value="button.update"/>",     param:["activeId"],         resourceID:"300041"}
		,"delete": {url:"deleteservicePerformanceEvaluateInfo.json",   label:"<ju:txt value="button.del"/>",        param:["activeId"],         resourceID:"300041"}
	}						
	,
	controller:{
		end:["read","update","delete"],
		bottom:["create","delete"]
	}
});


</script>
