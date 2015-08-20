<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="publicAccountSetInfo.publicNo"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
	  <tr><td><label><ju:txt value="publicAccountSetInfo.publicNo"                    />:</label></td><td><input type="text"  vui-name="publicNo"     vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="publicAccountSetInfo.attendNum"                   />:</label></td><td><input type="text"  vui-name="name"         vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="publicAccountSetInfo.weekIncrAtNo"                />:</label></td><td><input type="text"  vui-name="type"         vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="publicAccountSetInfo.monIncrAtNo"                 />:</label></td><td><input type="text"  vui-name="language"     vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="publicAccountSetInfo.monIncrAtNo"                 />:</label></td><td><input type="text"  vui-name="effectDate"   vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="publicAccountSetInfo.monIncrAtNo"                 />:</label></td><td><input type="text"  vui-name="url"          vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"publicNo":"95599abc1","name":"维恩贝特","type":"服务号","language":"简体中文","effectDate":"2014-5-31","url":"https://95599abc.weixin/vivest1…"}
                  ,{"publicNo":"95599abc2","name":"95599abc","type":"服务号","language":"简体中文","effectDate":"2014-8-12","url":"https://95599abc.weixin/vivest2…"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"publicNo"        ,              label:"<ju:txt value="publicAccountSetInfo.publicNo"        />",                     align:"center"}
	 		,{name:"name"			       ,              label:"<ju:txt value="publicAccountSetInfo.name"            />",                     align:"left"}
	 		,{name:"type"            ,              label:"<ju:txt value="publicAccountSetInfo.type"            />",                     align:"center"}
	 		,{name:"language"        ,              label:"<ju:txt value="publicAccountSetInfo.language"        />",                     align:"center"}
	 		,{name:"effectDate"      ,              label:"<ju:txt value="publicAccountSetInfo.effectDate"      />",                     align:"left"}
	 		,{name:"url"             ,              label:"<ju:txt value="publicAccountSetInfo.url"             />",                     align:"left"}
	 	]
	,
	caption:"<ju:txt value="publicAccountSetInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridpublicAccountSetInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertpublicAccountSetInfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"getpublicAccountSetInfo",           label:"<ju:txt value="button.read"/>",       param:["activeId"],         resourceID:"300041"}
		,update:   {url:"updatepublicAccountSetInfo.json",   label:"<ju:txt value="button.update"/>",     param:["activeId"],         resourceID:"300041"}
		,"delete": {url:"deletepublicAccountSetInfo.json",   label:"<ju:txt value="button.del"/>",        param:["activeId"],         resourceID:"300041"}
	}						
	,
	controller:{
		end:["read","update","delete"],
		bottom:["create","delete"]
	}
});


</script>
