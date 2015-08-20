<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="branchIdleInfo.branch"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
	  <tr><td><label><ju:txt value="branchIdleInfo.branch"                   		/>:</label></td><td><input type="text"  vui-name="branch"            vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="branchIdleInfo.estimatedONum"                />:</label></td><td><input type="text"  vui-name="estimatedONum"     vui-validate="required:true"  maxlength="60"/></td></tr>                 
	  <tr><td><label><ju:txt value="branchIdleInfo.orderNum"                     />:</label></td><td><input type="text"  vui-name="orderNum"	         vui-validate="required:true"  maxlength="60"/></td></tr>                 
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"branch":"100","estimatedONum":"200","orderNum":"244"}
                  ,{"branch":"101","estimatedONum":"150","orderNum":"148"}
                  ,{"branch":"102","estimatedONum":"150","orderNum":"160"}
                  ,{"branch":"103","estimatedONum":"200","orderNum":"187"}
                  ,{"branch":"104","estimatedONum":"200","orderNum":"190"}
                  ,{"branch":"105","estimatedONum":"200","orderNum":"176"}
                  ,{"branch":"106","estimatedONum":"150","orderNum":"167"}
                  ,{"branch":"107","estimatedONum":"150","orderNum":"154"}
                  ,{"branch":"108","estimatedONum":"150","orderNum":"159"}
                  ,{"branch":"109","estimatedONum":"200","orderNum":"209"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"branch"         ,              label:"<ju:txt value="branchIdleInfo.branch"             />",                     align:"center"}
	 		,{name:"estimatedONum"  ,              label:"<ju:txt value="branchIdleInfo.estimatedONum"      />",                     align:"right"}
	 		,{name:"orderNum"	      ,              label:"<ju:txt value="branchIdleInfo.orderNum"           />",                     align:"right"}
	 	]
	,
	caption:"<ju:txt value="branchIdleInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridbranchIdleInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertbranchIdleInfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"getbranchIdleInfo",           label:"<ju:txt value="button.read"/>",       param:["activeId"],         resourceID:"300041"}
		,update:   {url:"updatebranchIdleInfo.json",   label:"<ju:txt value="button.update"/>",     param:["activeId"],         resourceID:"300041"}
		,"delete": {url:"deletebranchIdleInfo.json",   label:"<ju:txt value="button.del"/>",        param:["activeId"],         resourceID:"300041"}
	}		
	,
	controller:{
		end:["read"],
		bottom:[""]
	}
});


</script>
