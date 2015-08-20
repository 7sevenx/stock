<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="reservationBusinessDefinitioninfo.busiType"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
	  <tr><td><label><ju:txt value="reservationBusinessDefinitioninfo.busiType"                      />:</label></td><td><input type="text"  vui-name="busiType"     vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="reservationBusinessDefinitioninfo.remark"                        />:</label></td><td><input type="text"  vui-name="remark"         vui-validate="required:true"  maxlength="60"/></td></tr>                 
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"busiType":"出国金融    ","remark":""}
                  ,{"busiType":"金卡        ","remark":""}
                  ,{"busiType":"普卡        ","remark":""}
                  ,{"busiType":"对公业务    ","remark":""}
                  ,{"busiType":"理财业务    ","remark":""}
                  ,{"busiType":"对公现金客户","remark":""}
                  ,{"busiType":"对公结算客户","remark":""}
                  ,{"busiType":"公积金业务  ","remark":""}
                  ,{"busiType":"对公外汇客户","remark":""}
                  ,{"busiType":"出纳业务    ","remark":""}  
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"busiType"       ,                label:"<ju:txt value="reservationBusinessDefinitioninfo.busiType"        />",                     align:"left"}
	 		,{name:"remark"			    ,                label:"<ju:txt value="reservationBusinessDefinitioninfo.remark"          />",                     align:"center"}
	 	]
	,
	caption:"<ju:txt value="reservationBusinessDefinitioninfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridreservationBusinessDefinitioninfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertreservationBusinessDefinitioninfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"getreservationBusinessDefinitioninfo",           label:"<ju:txt value="button.read"/>",       param:["activeId"],         resourceID:"300041"}
		,update:   {url:"updatereservationBusinessDefinitioninfo.json",   label:"<ju:txt value="button.update"/>",     param:["activeId"],         resourceID:"300041"}
		,"delete": {url:"deletereservationBusinessDefinitioninfo.json",   label:"<ju:txt value="button.del"/>",        param:["activeId"],         resourceID:"300041"}
	}				
	,
	controller:{
		end:["read","update","delete"],
		bottom:["create","delete"]
	}
});


</script>
