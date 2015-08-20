<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="publicCustomerRelInfo.publicNo"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr><td><label><ju:txt value="publicCustomerRelInfo.publicNo"            />:</label></td><td><input type="text"  vui-name="publicNo"    vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="publicCustomerRelInfo.openId"              />:</label></td><td><input type="text"  vui-name="openId"      vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="publicCustomerRelInfo.custNo"              />:</label></td><td><input type="text"  vui-name="custNo"      vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="publicCustomerRelInfo.custName"            />:</label></td><td><input type="text"  vui-name="custName"    vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"publicNo":"95599abc1","openId":"iujhkjhsytgtwgsfdiok","custNo":"1090987769","custName":"马天舒"}
                  ,{"publicNo":"95599abc1","openId":"uytrfshdgsfxvcmakdod","custNo":"2109288737","custName":"刘国栋"}
                  ,{"publicNo":"95599abc1","openId":"polgkiyumjjnhnkioyik","custNo":"2098476578","custName":"魏晓宁"}
                  ,{"publicNo":"95599abc1","openId":"uqradsvxcnfklhzfzdwr","custNo":"1098374766","custName":"卢青萍"}
                  ,{"publicNo":"95599abc1","openId":"uqradsvxcnfklhzfzdwr","custNo":"2190973655","custName":"钱志军"}
                  ,{"publicNo":"95599abc1","openId":"iroypjlmnbcvsfgfgrgv","custNo":"1128766782","custName":"陈思思"}
                  ,{"publicNo":"95599abc1","openId":"uuyiuojkhjuyyghfrgtr","custNo":"1098654325","custName":"王晓阳"}
                  ,{"publicNo":"95599abc1","openId":"bcvxcsfdfjjsvjschjhf","custNo":"1098765733","custName":"周小天"}
                  ,{"publicNo":"95599abc2","openId":"outryopinbkmbkcnvkhj","custNo":"1093645353","custName":"张大伟"}
                  ,{"publicNo":"95599abc2","openId":"tesradfwxqscasfzcwqz","custNo":"1209878354","custName":"李天阳"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"publicNo"           ,    label:"<ju:txt value="publicCustomerRelInfo.publicNo"           />",                     align:"center"}
	 		,{name:"openId"             ,    label:"<ju:txt value="publicCustomerRelInfo.openId"             />",                     align:"left"}
	 		,{name:"custNo"             ,    label:"<ju:txt value="publicCustomerRelInfo.custNo"             />",                     align:"center"}
	 		,{name:"custName"           ,    label:"<ju:txt value="publicCustomerRelInfo.custName"           />",                     align:"center"}
	 	]
	,
	caption:"<ju:txt value="publicCustomerRelInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	dataRoot:"gridpublicCustomerRelInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create: {url:"insertpublicCustomerRelInfo.json",   label:"<ju:txt value="button.create"/>" ,                              resourceID:"300041"}
		,read:   {url:"getpublicCustomerRelInfo",           label:"<ju:txt value="button.read"/>",       param:["publicNo"],         resourceID:"300041"}
		,update: {url:"updatepublicCustomerRelInfo.json",   label:"<ju:txt value="button.update"/>",     param:["publicNo"],         resourceID:"300041"}
		,"delete": {url:"deletepublicCustomerRelInfo.json",   label:"<ju:txt value="button.del"/>",        param:["publicNo"],         resourceID:"300041"}
	}	
	,
	controller:{
		end:["read","update","delete"],
		bottom:["create","delete"]
	}
});


</script>
