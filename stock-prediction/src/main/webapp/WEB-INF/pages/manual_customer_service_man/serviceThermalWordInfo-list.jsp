<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="serviceThermalWordInfo.keyWord"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
	  <tr><td><label><ju:txt value="serviceThermalWordInfo.keyWord"                    			 />:</label></td><td><input type="text"  vui-name="keyWord"            vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="serviceThermalWordInfo.effectDate"                        />:</label></td><td><input type="text"  vui-name="effectDate"         vui-validate="required:true"  maxlength="60"/></td></tr>                 
	  <tr><td><label><ju:txt value="serviceThermalWordInfo.expiryDate"                        />:</label></td><td><input type="text"  vui-name="expiryDate"         vui-validate="required:true"  maxlength="60"/></td></tr>                 
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"keyWord":"不满意  ","effectDate":"2014-1-1","expiryDate":""}
                  ,{"keyWord":"投诉    ","effectDate":"2014-1-1","expiryDate":""}
                  ,{"keyWord":"太差    ","effectDate":"2014-1-1","expiryDate":""}
                  ,{"keyWord":"不好    ","effectDate":"2014-1-1","expiryDate":""}
                  ,{"keyWord":"润日增  ","effectDate":"2014-1-1","expiryDate":""}
                  ,{"keyWord":"理财日历","effectDate":"2014-1-1","expiryDate":""}
                  ,{"keyWord":"理财产品","effectDate":"2014-1-1","expiryDate":""}
                  ,{"keyWord":"推荐    ","effectDate":"2014-1-1","expiryDate":""}
                  ,{"keyWord":"直销银行","effectDate":"2014-1-1","expiryDate":""}
                  ,{"keyWord":"快乐享  ","effectDate":"2014-1-1","expiryDate":""}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"keyWord"     ,              label:"<ju:txt value="serviceThermalWordInfo.keyWord"               />",                     align:"left"}
	 		,{name:"effectDate"	 ,              label:"<ju:txt value="serviceThermalWordInfo.effectDate"            />",                     align:"center"}
	 		,{name:"expiryDate"	 ,              label:"<ju:txt value="serviceThermalWordInfo.expiryDate"            />",                     align:"center"}
	 	]
	,
	caption:"<ju:txt value="serviceThermalWordInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridserviceThermalWordInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertserviceThermalWordInfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"getserviceThermalWordInfo",           label:"<ju:txt value="button.read"/>",       param:["activeId"],         resourceID:"300041"}
		,update:   {url:"updateserviceThermalWordInfo.json",   label:"<ju:txt value="button.update"/>",     param:["activeId"],         resourceID:"300041"}
		,"delete": {url:"deleteserviceThermalWordInfo.json",   label:"<ju:txt value="button.del"/>",        param:["activeId"],         resourceID:"300041"}
	}						
	,
	controller:{
		end:["read","update","delete"],
		bottom:["create","delete"]
	}
});


</script>
