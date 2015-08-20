<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="customerBusiCirclesInfo.openId"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr><td><label><ju:txt value="customerBusiCirclesInfo.openId"                />:</label></td><td><input type="text"  vui-name="openId"        vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="customerBusiCirclesInfo.custNo"                />:</label></td><td><input type="text"  vui-name="custNo"        vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="customerBusiCirclesInfo.busiType"              />:</label></td><td><input type="text"  vui-name="busiType"      vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"openId":"uyshdjfhgffahsjdhhgg","custNo":"1092883771","busiType":"理财产品"}
                  ,{"openId":"rwefdstryuhdjfnbvcfs","custNo":"2102344354","busiType":"理财产品"}
                  ,{"openId":"oiujtkljhhgfsbcndjaz","custNo":"2088744387","busiType":"理财产品"}
                  ,{"openId":"kdcgfdqewgxavxhgzvgx","custNo":"1098764337","busiType":"理财产品"}
                  ,{"openId":"weuricmxzbxBFYSgwqru","custNo":"1073548253","busiType":"贵金属  "}
                  ,{"openId":"iortrproejgklnkjbzhx","custNo":"1098745433","busiType":"贵金属  "}
                  ,{"openId":"uqwdybzhyusdtchxzzgs","custNo":"2012879087","busiType":"贵金属  "}
                  ,{"openId":"wirufgdpogfohgjpbnlb","custNo":"2054863297","busiType":"贵金属  "}
                  ,{"openId":"oiewjdsknvmcxnxmvjdh","custNo":"2015384927","busiType":"贵金属  "}
                  ,{"openId":"dsfiyquwhdjvxgzfdhsa","custNo":"2082956384","busiType":"贵金属  "}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"openId"           ,    label:"<ju:txt value="customerBusiCirclesInfo.openId"           />",                     align:"left"}
	 		,{name:"custNo"           ,    label:"<ju:txt value="customerBusiCirclesInfo.custNo"           />",                     align:"center"}
	 		,{name:"busiType"         ,    label:"<ju:txt value="customerBusiCirclesInfo.busiType"         />",                     align:"left"}
	 	]
	,
	caption:"<ju:txt value="customerBusiCirclesInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridcustomerBusiCirclesInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create: {url:"insertcustomerBusiCirclesInfo.json",   label:"<ju:txt value="button.create"/>" ,                              resourceID:"300041"}
		,read:   {url:"getcustomerBusiCirclesInfo",           label:"<ju:txt value="button.read"/>",       param:["openId"],         resourceID:"300041"}
		,update: {url:"updatecustomerBusiCirclesInfo.json",   label:"<ju:txt value="button.update"/>",     param:["openId"],         resourceID:"300041"}
		,"delete": {url:"deletecustomerBusiCirclesInfo.json",   label:"<ju:txt value="button.del"/>",        param:["openId"],         resourceID:"300041"}
	}	
	,
	controller:{
		end:["read","update","delete"],
		bottom:["create","delete"]
	}
});


</script>
