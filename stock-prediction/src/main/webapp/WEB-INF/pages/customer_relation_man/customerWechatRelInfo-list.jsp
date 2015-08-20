<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="customerWechatRelInfo.openId"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr><td><label><ju:txt value="customerWechatRelInfo.openId"                 />:</label></td><td><input type="text"  vui-name="openId"         vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="customerWechatRelInfo.custName"               />:</label></td><td><input type="text"  vui-name="custName"       vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="customerWechatRelInfo.oppOpenId"              />:</label></td><td><input type="text"  vui-name="oppOpenId"      vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="customerWechatRelInfo.oppCustName"            />:</label></td><td><input type="text"  vui-name="oppCustName"    vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="customerWechatRelInfo.relation"               />:</label></td><td><input type="text"  vui-name="relation"       vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"openId":"iujhkjhsytgtwgsfdiok","custName":"马天舒","oppOpenId":"uyshdjfhgffahsjdhhgg","oppCustName":"胡宁  ","relation":"朋友"}
                  ,{"openId":"uytrfshdgsfxvcmakdod","custName":"刘国栋","oppOpenId":"rwefdstryuhdjfnbvcfs","oppCustName":"李俊清","relation":"同事"}
                  ,{"openId":"polgkiyumjjnhnkioyik","custName":"魏晓宁","oppOpenId":"oiujtkljhhgfsbcndjaz","oppCustName":"刘伟鹏","relation":"朋友"}
                  ,{"openId":"uqradsvxcnfklhzfzdwr","custName":"卢青萍","oppOpenId":"kdcgfdqewgxavxhgzvgx","oppCustName":"宋明  ","relation":"朋友"}
                  ,{"openId":"uqradsvxcnfklhzfzdwr","custName":"钱志军","oppOpenId":"weuricmxzbxBFYSgwqru","oppCustName":"林水琴","relation":"同事"}
                  ,{"openId":"iroypjlmnbcvsfgfgrgv","custName":"陈思思","oppOpenId":"iortrproejgklnkjbzhx","oppCustName":"张翰  ","relation":"同事"}
                  ,{"openId":"uuyiuojkhjuyyghfrgtr","custName":"王晓阳","oppOpenId":"uqwdybzhyusdtchxzzgs","oppCustName":"吴婷  ","relation":"同事"}
                  ,{"openId":"bcvxcsfdfjjsvjschjhf","custName":"周小天","oppOpenId":"wirufgdpogfohgjpbnlb","oppCustName":"王芳芳","relation":"同事"}
                  ,{"openId":"outryopinbkmbkcnvkhj","custName":"张大伟","oppOpenId":"oiewjdsknvmcxnxmvjdh","oppCustName":"周欧  ","relation":"朋友"}
                  ,{"openId":"tesradfwxqscasfzcwqz","custName":"李天阳","oppOpenId":"dsfiyquwhdjvxgzfdhsa","oppCustName":"宋文  ","relation":"朋友"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"openId"           ,    label:"<ju:txt value="customerWechatRelInfo.openId"           />",                     align:"left"}
	 		,{name:"custName"         ,    label:"<ju:txt value="customerWechatRelInfo.custName"         />",                     align:"center"}
	 		,{name:"oppOpenId"        ,    label:"<ju:txt value="customerWechatRelInfo.oppOpenId"        />",                     align:"left"}
	 		,{name:"oppCustName"      ,    label:"<ju:txt value="customerWechatRelInfo.oppCustName"      />",                     align:"left"}
	 		,{name:"relation"         ,    label:"<ju:txt value="customerWechatRelInfo.relation"         />",                     align:"center"}
	 	]
	,
	caption:"<ju:txt value="customerWechatRelInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	dataRoot:"gridcustomerWechatRelInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create: {url:"insertcustomerWechatRelInfo.json",   label:"<ju:txt value="button.create"/>" ,                              resourceID:"300041"}
		,read:   {url:"getcustomerWechatRelInfo",           label:"<ju:txt value="button.read"/>",       param:["openId"],         resourceID:"300041"}
		,update: {url:"updatecustomerWechatRelInfo.json",   label:"<ju:txt value="button.update"/>",     param:["openId"],         resourceID:"300041"}
		,"delete": {url:"deletecustomerWechatRelInfo.json",   label:"<ju:txt value="button.del"/>",        param:["openId"],         resourceID:"300041"}
	}	
	,
	controller:{
		end:["read","update","delete"],
		bottom:["create","delete"]
	}
});


</script>
