<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="customerSocialRelInfo.custNo"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr><td><label><ju:txt value="customerSocialRelInfo.custNo"                 />:</label></td><td><input type="text"  vui-name="custNo"         vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="customerSocialRelInfo.custName"               />:</label></td><td><input type="text"  vui-name="custName"       vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="customerSocialRelInfo.oppCustNo"              />:</label></td><td><input type="text"  vui-name="oppCustNo"      vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="customerSocialRelInfo.oppCustName"            />:</label></td><td><input type="text"  vui-name="oppCustName"    vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="customerSocialRelInfo.relation"               />:</label></td><td><input type="text"  vui-name="relation"       vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"custNo":"1090987769","custName":"马天舒","oppCustNo":"1092883771","oppCustName":"胡宁  ","relation":"同事"}
                  ,{"custNo":"2109288737","custName":"刘国栋","oppCustNo":"2102344354","oppCustName":"李俊清","relation":"亲属"}
                  ,{"custNo":"2098476578","custName":"魏晓宁","oppCustNo":"2088744387","oppCustName":"刘伟鹏","relation":"朋友"}
                  ,{"custNo":"1098374766","custName":"卢青萍","oppCustNo":"1098764337","oppCustName":"宋明  ","relation":"同事"}
                  ,{"custNo":"2190973655","custName":"钱志军","oppCustNo":"1073548253","oppCustName":"林水琴","relation":"同学"}
                  ,{"custNo":"1128766782","custName":"陈思思","oppCustNo":"1098745433","oppCustName":"张翰  ","relation":"朋友"}
                  ,{"custNo":"1098654325","custName":"王晓阳","oppCustNo":"2012879087","oppCustName":"吴婷  ","relation":"同事"}
                  ,{"custNo":"1098765733","custName":"周小天","oppCustNo":"2054863297","oppCustName":"王芳芳","relation":"同事"}
                  ,{"custNo":"1093645353","custName":"张大伟","oppCustNo":"2015384927","oppCustName":"周欧  ","relation":"朋友"}
                  ,{"custNo":"1209878354","custName":"李天阳","oppCustNo":"2082956384","oppCustName":"宋文  ","relation":"同学"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"custNo"           ,    label:"<ju:txt value="customerSocialRelInfo.custNo"           />",                     align:"center"}
	 		,{name:"custName"         ,    label:"<ju:txt value="customerSocialRelInfo.custName"         />",                     align:"center"}
	 		,{name:"oppCustNo"        ,    label:"<ju:txt value="customerSocialRelInfo.oppCustNo"        />",                     align:"center"}
	 		,{name:"oppCustName"      ,    label:"<ju:txt value="customerSocialRelInfo.oppCustName"      />",                     align:"left"}
	 		,{name:"relation"         ,    label:"<ju:txt value="customerSocialRelInfo.relation"         />",                     align:"center"}
	 	]
	,
	caption:"<ju:txt value="customerSocialRelInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridcustomerSocialRelInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create: {url:"insertcustomerSocialRelInfo.json",   label:"<ju:txt value="button.create"/>" ,                              resourceID:"300041"}
		,read:   {url:"getcustomerSocialRelInfo",           label:"<ju:txt value="button.read"/>",       param:["custNo"],         resourceID:"300041"}
		,update: {url:"updatecustomerSocialRelInfo.json",   label:"<ju:txt value="button.update"/>",     param:["custNo"],         resourceID:"300041"}
		,"delete": {url:"deletecustomerSocialRelInfo.json",   label:"<ju:txt value="button.del"/>",        param:["custNo"],         resourceID:"300041"}
	}	
	,
	controller:{
		end:["read","update","delete"],
		bottom:["create","delete"]
	}
});


</script>
