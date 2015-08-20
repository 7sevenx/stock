<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="serviceQueueInfo.custServType"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
	  <tr><td><label><ju:txt value="serviceQueueInfo.custServType"                    />:</label></td><td><input type="text"  vui-name="custServType"     vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="serviceQueueInfo.queueNum"                        />:</label></td><td><input type="text"  vui-name="queueNum"         vui-validate="required:true"  maxlength="60"/></td></tr>                 
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"custServType":"投诉建议    ","queueNum":"12"}
                  ,{"custServType":"个人业务咨询","queueNum":"8 "}
                  ,{"custServType":"公司业务咨询","queueNum":"2 "}  
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"custServType"     ,              label:"<ju:txt value="serviceQueueInfo.custServType"        />",                     align:"left"}
	 		,{name:"queueNum"			    ,              label:"<ju:txt value="serviceQueueInfo.queueNum"            />",                     align:"right"}
	 	]
	,
	caption:"<ju:txt value="serviceQueueInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridserviceQueueInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertserviceQueueInfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"getserviceQueueInfo",           label:"<ju:txt value="button.read"/>",       param:["activeId"],         resourceID:"300041"}
		,update:   {url:"updateserviceQueueInfo.json",   label:"<ju:txt value="button.update"/>",     param:["activeId"],         resourceID:"300041"}
		,"delete": {url:"deleteserviceQueueInfo.json",   label:"<ju:txt value="button.del"/>",        param:["activeId"],         resourceID:"300041"}
	}						
	,
	controller:{
		end:["read","update","delete"],
		bottom:["create","delete"]
	}
});


</script>
