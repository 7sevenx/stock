<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="branchBusinessAppointmentInfo.branch"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
	  <tr><td><label><ju:txt value="branchBusinessAppointmentInfo.branch"                    			 />:</label></td><td><input type="text"  vui-name="branch"           vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="branchBusinessAppointmentInfo.busiType"                        />:</label></td><td><input type="text"  vui-name="busiType"         vui-validate="required:true"  maxlength="60"/></td></tr>                 
	  <tr><td><label><ju:txt value="branchBusinessAppointmentInfo.estimatedONum"                   />:</label></td><td><input type="text"  vui-name="estimatedONum"    vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="branchBusinessAppointmentInfo.orderNum"                       />:</label></td><td><input type="text"  vui-name="orderNum"        vui-validate="required:true"  maxlength="60"/></td></tr>                                  
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"branch":"100","busiType":"出国金融    ","estimatedONum":"20 ","orderNum":"12 "}
                  ,{"branch":"100","busiType":"金卡        ","estimatedONum":"30 ","orderNum":"30 "}
                  ,{"branch":"100","busiType":"普卡        ","estimatedONum":"50 ","orderNum":"50 "}
                  ,{"branch":"100","busiType":"对公业务    ","estimatedONum":"20 ","orderNum":"20 "}
                  ,{"branch":"100","busiType":"理财业务    ","estimatedONum":"20 ","orderNum":"18 "}
                  ,{"branch":"100","busiType":"对公现金客户","estimatedONum":"20 ","orderNum":"20 "}
                  ,{"branch":"100","busiType":"对公结算客户","estimatedONum":"20 ","orderNum":"17 "}
                  ,{"branch":"100","busiType":"公积金业务  ","estimatedONum":"50 ","orderNum":"35 "}
                  ,{"branch":"100","busiType":"对公外汇客户","estimatedONum":"30 ","orderNum":"28 "}
                  ,{"branch":"100","busiType":"出纳业务    ","estimatedONum":"20 ","orderNum":"14 "}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"branch"        ,              label:"<ju:txt value="branchBusinessAppointmentInfo.branch"             />",                     align:"center"}
	 		,{name:"busiType"	     ,              label:"<ju:txt value="branchBusinessAppointmentInfo.busiType"           />",                     align:"left"}
	 		,{name:"estimatedONum" ,              label:"<ju:txt value="branchBusinessAppointmentInfo.estimatedONum"      />",                     align:"right"}  
	 		,{name:"orderNum"	   ,              label:"<ju:txt value="branchBusinessAppointmentInfo.orderNum"          />",                     align:"right"}
	 	]
	,
	caption:"<ju:txt value="branchBusinessAppointmentInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridbranchBusinessAppointmentInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertbranchBusinessAppointmentInfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"getbranchBusinessAppointmentInfo",           label:"<ju:txt value="button.read"/>",       param:["activeId"],         resourceID:"300041"}
		,update:   {url:"updatebranchBusinessAppointmentInfo.json",   label:"<ju:txt value="button.update"/>",     param:["activeId"],         resourceID:"300041"}
		,"delete": {url:"deletebranchBusinessAppointmentInfo.json",   label:"<ju:txt value="button.del"/>",        param:["activeId"],         resourceID:"300041"}
	}	
	,
	controller:{
		end:["read"],
		bottom:[""]
	}
});


</script>
