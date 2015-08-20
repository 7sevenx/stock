<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="customerWechatCardBindInfo.openId"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr><td><label><ju:txt value="customerWechatCardBindInfo.openId"              />:</label></td><td><input type="text"  vui-name="openId"      vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="customerWechatCardBindInfo.custName"            />:</label></td><td><input type="text"  vui-name="custName"    vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="customerWechatCardBindInfo.custNo"              />:</label></td><td><input type="text"  vui-name="custNo"      vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="customerWechatCardBindInfo.cardType"            />:</label></td><td><input type="text"  vui-name="cardType"    vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="customerWechatCardBindInfo.cardNo"              />:</label></td><td><input type="text"  vui-name="cardNo"      vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"openId":"uyshdjfhgffahsjdhhgg","custName":"马天舒","custNo":"1090987769","cardType":"借记卡","cardNo":"6223635810989871231"}
                  ,{"openId":"rwefdstryuhdjfnbvcfs","custName":"刘国栋","custNo":"2109288737","cardType":"借记卡","cardNo":"6223635898765640009"}
                  ,{"openId":"oiujtkljhhgfsbcndjaz","custName":"魏晓宁","custNo":"2098476578","cardType":"借记卡","cardNo":"6223635876544678909"}
                  ,{"openId":"kdcgfdqewgxavxhgzvgx","custName":"卢青萍","custNo":"1098374766","cardType":"借记卡","cardNo":"6223625876564839092"}
                  ,{"openId":"weuricmxzbxBFYSgwqru","custName":"钱志军","custNo":"2190973655","cardType":"借记卡","cardNo":"6223635872645276123"}
                  ,{"openId":"iortrproejgklnkjbzhx","custName":"陈思思","custNo":"1128766782","cardType":"借记卡","cardNo":"6223635898745362719"}
                  ,{"openId":"uqwdybzhyusdtchxzzgs","custName":"王晓阳","custNo":"1098654325","cardType":"借记卡","cardNo":"6223635876759098763"}
                  ,{"openId":"wirufgdpogfohgjpbnlb","custName":"周小天","custNo":"1098765733","cardType":"借记卡","cardNo":"6223635876879886543"}
                  ,{"openId":"oiewjdsknvmcxnxmvjdh","custName":"张大伟","custNo":"1093645353","cardType":"借记卡","cardNo":"6223635873456312940"}
                  ,{"openId":"dsfiyquwhdjvxgzfdhsa","custName":"李天阳","custNo":"1209878354","cardType":"借记卡","cardNo":"6223635890586746323"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"openId"           ,    label:"<ju:txt value="customerWechatCardBindInfo.openId"           />",                     align:"left"}
	 		,{name:"custName"         ,    label:"<ju:txt value="customerWechatCardBindInfo.custName"         />",                     align:"center"}
	 		,{name:"custNo"           ,    label:"<ju:txt value="customerWechatCardBindInfo.custNo"           />",                     align:"center"}
	 		,{name:"cardType"         ,    label:"<ju:txt value="customerWechatCardBindInfo.cardType"         />",                     align:"center"}
	 		,{name:"cardNo"           ,    label:"<ju:txt value="customerWechatCardBindInfo.cardNo"           />",                     align:"center"}
	 	]
	,
	caption:"<ju:txt value="customerWechatCardBindInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	dataRoot:"gridcustomerWechatCardBindInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create: {url:"insertcustomerWechatCardBindInfo.json",   label:"<ju:txt value="button.create"/>" ,                              resourceID:"300041"}
		,read:   {url:"getcustomerWechatCardBindInfo",           label:"<ju:txt value="button.read"/>",       param:["openId"],         resourceID:"300041"}
		,update: {url:"updatecustomerWechatCardBindInfo.json",   label:"<ju:txt value="button.update"/>",     param:["openId"],         resourceID:"300041"}
		,"delete": {url:"deletecustomerWechatCardBindInfo.json",   label:"<ju:txt value="button.del"/>",        param:["openId"],         resourceID:"300041"}
	}	
	,
	controller:{
		end:["read","update","delete"],
		bottom:["create","delete"]
	}
});


</script>
