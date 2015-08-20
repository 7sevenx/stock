<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="publicAccountAttentionInfo.publicNo"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
	  <tr><td><label><ju:txt value="publicAccountAttentionInfo.publicNo"                    />:</label></td><td><input type="text"  vui-name="publicNo"            vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="publicAccountAttentionInfo.attendNum"                   />:</label></td><td><input type="text"  vui-name="attendNum"           vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="publicAccountAttentionInfo.weekIncrAtNo"                />:</label></td><td><input type="text"  vui-name="weekIncrAtNo"        vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="publicAccountAttentionInfo.monIncrAtNo"                 />:</label></td><td><input type="text"  vui-name="monIncrAtNo"         vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"publicNo":"95599abc1","attendNum":"67544 ","weekIncrAtNo":"24","monIncrAtNo":"625 "}
                  ,{"publicNo":"95599abc2","attendNum":"125346","weekIncrAtNo":"76","monIncrAtNo":"1298"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"publicNo"        ,              label:"<ju:txt value="publicAccountAttentionInfo.publicNo"        />",                     align:"center"}
	 		,{name:"attendNum"			 ,              label:"<ju:txt value="publicAccountAttentionInfo.attendNum"       />",                     align:"right"}
	 		,{name:"weekIncrAtNo"    ,              label:"<ju:txt value="publicAccountAttentionInfo.weekIncrAtNo"    />",                     align:"right"}
	 		,{name:"monIncrAtNo"     ,              label:"<ju:txt value="publicAccountAttentionInfo.monIncrAtNo"     />",                     align:"right"}
	 	]
	,
	caption:"<ju:txt value="publicAccountAttentionInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridpublicAccountAttentionInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertpublicAccountAttentionInfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"getpublicAccountAttentionInfo",           label:"<ju:txt value="button.read"/>",       param:["activeId"],         resourceID:"300041"}
		,update:   {url:"updatepublicAccountAttentionInfo.json",   label:"<ju:txt value="button.update"/>",     param:["activeId"],         resourceID:"300041"}
		,"delete": {url:"deletepublicAccountAttentionInfo.json",   label:"<ju:txt value="button.del"/>",        param:["activeId"],         resourceID:"300041"}
	}						
	,
	controller:{
		end:["read"],
		bottom:[""]
	}
});


</script>
