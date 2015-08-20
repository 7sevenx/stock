<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="knowledgeClassificationInfo.type"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
	  <tr><td><label><ju:txt value="knowledgeClassificationInfo.type"                    			 />:</label></td><td><input type="text"  vui-name="type"     vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="knowledgeClassificationInfo.remark"                        />:</label></td><td><input type="text"  vui-name="remark"         vui-validate="required:true"  maxlength="60"/></td></tr>                 
	  <tr><td><label><ju:txt value="knowledgeClassificationInfo.creatDate"                     />:</label></td><td><input type="text"  vui-name="creatDate"         vui-validate="required:true"  maxlength="60"/></td></tr>                 
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"type":"法律法规    ","remark":"","creatDate":"2014-1-1"}
                  ,{"type":"最新产品    ","remark":"","creatDate":"2014-1-1"}
                  ,{"type":"直销银行业务","remark":"","creatDate":"2014-1-1"}
                  ,{"type":"银行卡业务  ","remark":"","creatDate":"2014-1-1"}
                  ,{"type":"理财产品业务","remark":"","creatDate":"2014-1-1"}
                  ,{"type":"存款业务    ","remark":"","creatDate":"2014-1-1"}
                  ,{"type":"贷款业务    ","remark":"","creatDate":"2014-1-1"}
                  ,{"type":"出国金融    ","remark":"","creatDate":"2014-1-1"}
                  ,{"type":"外汇        ","remark":"","creatDate":"2014-1-1"}
                  ,{"type":"贵金属      ","remark":"","creatDate":"2014-1-1"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"type"        ,              label:"<ju:txt value="knowledgeClassificationInfo.type"               />",                     align:"left"}
	 		,{name:"remark"	     ,              label:"<ju:txt value="knowledgeClassificationInfo.remark"             />",                     align:"center"}
	 		,{name:"creatDate"	 ,              label:"<ju:txt value="knowledgeClassificationInfo.creatDate"          />",                     align:"center"}
	 	]
	,
	caption:"<ju:txt value="knowledgeClassificationInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridknowledgeClassificationInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertknowledgeClassificationInfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"getknowledgeClassificationInfo",           label:"<ju:txt value="button.read"/>",       param:["activeId"],         resourceID:"300041"}
		,update:   {url:"updateknowledgeClassificationInfo.json",   label:"<ju:txt value="button.update"/>",     param:["activeId"],         resourceID:"300041"}
		,"delete": {url:"deleteknowledgeClassificationInfo.json",   label:"<ju:txt value="button.del"/>",        param:["activeId"],         resourceID:"300041"}
	}					
	,
	controller:{
		end:["read","update","delete"],
		bottom:["create","delete"]
	}
});


</script>
