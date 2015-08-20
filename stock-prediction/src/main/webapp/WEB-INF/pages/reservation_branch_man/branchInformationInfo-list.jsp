<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="branchInformationInfo.branch"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
	  <tr><td><label><ju:txt value="branchInformationInfo.id"       			         />:</label></td><td><input type="text"    vui-name="id"			      vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="branchInformationInfo.branch"   	             />:</label></td><td><input type="text"    vui-name="branch"	      vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="branchInformationInfo.addr"     		           />:</label></td><td><input type="text"    vui-name="addr"		      vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="branchInformationInfo.telephone"               />:</label></td><td><input type="text"    vui-name="telephone"     vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"id":"100","branch":"珠海华润银行总行营业部 ","addr":"珠海市吉大九洲大道东段1346华润银行大厦首层","telephone":"0756-8121156"}
                  ,{"id":"101","branch":"珠海华润银行香洲支行   ","addr":"珠海市香洲梅华东路182、186号商铺          ","telephone":"0756-2252382"}
				  ,{"id":"102","branch":"珠海华润银行富华支行   ","addr":"珠海市香洲区心华路1号                     ","telephone":"0756-2210484"}
                  ,{"id":"103","branch":"珠海华润银行翠香支行   ","addr":"珠海市香洲翠香路189号                     ","telephone":"0756-2111337"}
				  ,{"id":"104","branch":"珠海华润银行唐家支行   ","addr":"珠海市香洲区唐淇路3399号3栋115-118号      ","telephone":"0756-3312304"}
                  ,{"id":"105","branch":"珠海华润银行碧涛支行   ","addr":"珠海市香洲区香洲翠香路33号1栋一层商场F03  ","telephone":"0756-2231140"}
				  ,{"id":"106","branch":"珠海华润银行紫荆支行   ","addr":"珠海市香洲银香路21号                      ","telephone":"0756-2214940"}
                  ,{"id":"107","branch":"珠海华润银行凤凰支行   ","addr":"珠海香洲凤凰北路2023号                    ","telephone":"0756-2255979"}
				  ,{"id":"108","branch":"珠海华润银行星河支行   ","addr":"珠海市人民西路1024号                      ","telephone":"0756-8620077"}
                  ,{"id":"109","branch":"珠海华润银行明珠支行   ","addr":"珠海市前山明珠南路2029号一层之一、之二    ","telephone":"0756-8585680"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"id"			    	,              label:"<ju:txt value="branchInformationInfo.id"           />",                     align:"center"}
	 		,{name:"branch"	      ,              label:"<ju:txt value="branchInformationInfo.branch"       />",                     align:"left"}
	 		,{name:"addr"		      ,              label:"<ju:txt value="branchInformationInfo.addr"         />",                     align:"left"}
	 		,{name:"telephone"		,              label:"<ju:txt value="branchInformationInfo.telephone"    />", 	                  align:"left"}
	 	]
	,
	caption:"<ju:txt value="branchInformationInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridbranchInformationInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertbranchInformationInfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"getbranchInformationInfo",           label:"<ju:txt value="button.read"/>",       param:["activeId"],         resourceID:"300041"}
		,update:   {url:"updatebranchInformationInfo.json",   label:"<ju:txt value="button.update"/>",     param:["activeId"],         resourceID:"300041"}
		,"delete": {url:"deletebranchInformationInfo.json",   label:"<ju:txt value="button.del"/>",        param:["activeId"],         resourceID:"300041"}
	}		
	,
	controller:{
		end:["read","update","delete"],
		bottom:["create","delete"]
	}
});


</script>
