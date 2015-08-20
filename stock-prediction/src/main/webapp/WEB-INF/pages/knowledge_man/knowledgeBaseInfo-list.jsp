<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="knowledgeBaseInfo.type"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
	  <tr><td><label><ju:txt value="knowledgeBaseInfo.type"				                 />:</label></td><td><input type="text"    vui-name="type"         vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="knowledgeBaseInfo.knowledgeId"	               />:</label></td><td><input type="text"    vui-name="knowledgeId" vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="knowledgeBaseInfo.desc"		                     />:</label></td><td><input type="text"    vui-name="desc"         vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="knowledgeBaseInfo.knowledge"		               />:</label></td><td><input type="text"    vui-name="knowledge"    vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="knowledgeBaseInfo.keyWord"			               />:</label></td><td><input type="text"    vui-name="keyWord"      vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="knowledgeBaseInfo.creatDate"		               />:</label></td><td><input type="text"    vui-name="creatDate"    vui-validate="required:true"  maxlength="60"/></td></tr>	
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"type":"理财产品业务","knowledgeId":"KG000001","desc":"快乐金2号14期人民币理财计划","knowledge":"产品具有收益稳健、期限灵活的特点，可为客户打理闲置资金提供新选择。","keyWord":"快乐金 2号 14期","creatDate":"2014-1-1 "}
                  ,{"type":"理财产品业务","knowledgeId":"KG000002","desc":"快乐金2号15期人民币理财计划","knowledge":"产品具有收益稳健、期限灵活的特点，可为客户打理闲置资金提供新选择。","keyWord":"快乐金 2号 15期","creatDate":"2014-1-8 "}
				  ,{"type":"理财产品业务","knowledgeId":"KG000003","desc":"快乐金2号16期人民币理财计划","knowledge":"产品具有收益稳健、期限灵活的特点，可为客户打理闲置资金提供新选择。","keyWord":"快乐金 2号 16期","creatDate":"2014-1-15"}
                  ,{"type":"理财产品业务","knowledgeId":"KG000004","desc":"快乐金2号17期人民币理财计划","knowledge":"产品具有收益稳健、期限灵活的特点，可为客户打理闲置资金提供新选择。","keyWord":"快乐金 2号 17期","creatDate":"2014-1-22"}
				  ,{"type":"理财产品业务","knowledgeId":"KG000005","desc":"快乐金2号18期人民币理财计划","knowledge":"产品具有收益稳健、期限灵活的特点，可为客户打理闲置资金提供新选择。","keyWord":"快乐金 2号 18期","creatDate":"2014-1-29"}
                  ,{"type":"理财产品业务","knowledgeId":"KG000006","desc":"快乐金2号19期人民币理财计划","knowledge":"产品具有收益稳健、期限灵活的特点，可为客户打理闲置资金提供新选择。","keyWord":"快乐金 2号 19期","creatDate":"2014-1-6 "}
				  ,{"type":"理财产品业务","knowledgeId":"KG000007","desc":"快乐金2号20期人民币理财计划","knowledge":"产品具有收益稳健、期限灵活的特点，可为客户打理闲置资金提供新选择。","keyWord":"快乐金 2号 20期","creatDate":"2014-1-13"}
                  ,{"type":"理财产品业务","knowledgeId":"KG000008","desc":"快乐金2号21期人民币理财计划","knowledge":"产品具有收益稳健、期限灵活的特点，可为客户打理闲置资金提供新选择。","keyWord":"快乐金 2号 21期","creatDate":"2014-1-20"}
				  ,{"type":"理财产品业务","knowledgeId":"KG000009","desc":"快乐金2号22期人民币理财计划","knowledge":"产品具有收益稳健、期限灵活的特点，可为客户打理闲置资金提供新选择。","keyWord":"快乐金 2号 22期","creatDate":"2014-1-27"}
                  ,{"type":"理财产品业务","knowledgeId":"KG000010","desc":"快乐金2号23期人民币理财计划","knowledge":"产品具有收益稳健、期限灵活的特点，可为客户打理闲置资金提供新选择。","keyWord":"快乐金 2号 23期","creatDate":"2014-2-6 "}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"type"				   ,              label:"<ju:txt value="knowledgeBaseInfo.type"             />",                     align:"center"}
	 		,{name:"knowledgeId"	 ,	            label:"<ju:txt value="knowledgeBaseInfo.knowledgeId"     />",                     align:"center"}
	 		,{name:"desc"		       ,              label:"<ju:txt value="knowledgeBaseInfo.desc"             />",                     align:"left"}
	 		,{name:"knowledge"		 ,              label:"<ju:txt value="knowledgeBaseInfo.knowledge"        />", 	                   align:"left"}
	 		,{name:"keyWord"			 ,              label:"<ju:txt value="knowledgeBaseInfo.keyWord"          />",                     align:"left"}
	 		,{name:"creatDate"		 ,              label:"<ju:txt value="knowledgeBaseInfo.creatDate"        />",                     align:"left"}
	 	]
    ,
	caption:"<ju:txt value="knowledgeBaseInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridknowledgeBaseInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertknowledgeBaseInfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"getknowledgeBaseInfo",           label:"<ju:txt value="button.read"/>",       param:["activeId"],         resourceID:"300041"}
		,update:   {url:"updateknowledgeBaseInfo.json",   label:"<ju:txt value="button.update"/>",     param:["activeId"],         resourceID:"300041"}
		,"delete": {url:"deleteknowledgeBaseInfo.json",   label:"<ju:txt value="button.del"/>",        param:["activeId"],         resourceID:"300041"}
	}					
	,
	controller:{
		end:["read","update","delete"],
		bottom:["create","delete"]
	}
});


</script>
