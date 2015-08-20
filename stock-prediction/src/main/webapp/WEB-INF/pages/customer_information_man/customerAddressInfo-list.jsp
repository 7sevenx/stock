<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="customerAddressInfo.openId"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr><td><label><ju:txt value="customerAddressInfo.openId"              />:</label></td><td><input type="text"  vui-name="openId"      vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="customerAddressInfo.name"                />:</label></td><td><input type="text"  vui-name="name"        vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="customerAddressInfo.city"                />:</label></td><td><input type="text"  vui-name="city"        vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="customerAddressInfo.province"            />:</label></td><td><input type="text"  vui-name="province"    vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="customerAddressInfo.country"             />:</label></td><td><input type="text"  vui-name="country"     vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="customerAddressInfo.addr"                />:</label></td><td><input type="text"  vui-name="addr"        vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"openId":"iujhkjhsytgtwgsfdiok","name":"马天舒","city":"深圳市","province":"广东省","country":"中国","addr":"南山区工业八路178号     "}
                  ,{"openId":"uytrfshdgsfxvcmakdod","name":"刘国栋","city":"深圳市","province":"广东省","country":"中国","addr":"福田区八卦三路123号5F   "}
                  ,{"openId":"polgkiyumjjnhnkioyik","name":"魏晓宁","city":"深圳市","province":"广东省","country":"中国","addr":"龙岗区泰达工业园区C栋709"}
                  ,{"openId":"uqradsvxcnfklhzfzdwr","name":"卢青萍","city":"深圳市","province":"广东省","country":"中国","addr":"福田区福田保税区        "}
                  ,{"openId":"uqradsvxcnfklhzfzdwr","name":"卢青萍","city":"深圳市","province":"广东省","country":"中国","addr":"福田区福保中心          "}
                  ,{"openId":"iroypjlmnbcvsfgfgrgv","name":"陈思思","city":"深圳市","province":"广东省","country":"中国","addr":"福田区福田保税区绒花路口"}
                  ,{"openId":"uuyiuojkhjuyyghfrgtr","name":"王晓阳","city":"深圳市","province":"广东省","country":"中国","addr":"光明新区电子产业园F-908 "}
                  ,{"openId":"bcvxcsfdfjjsvjschjhf","name":"周小天","city":"深圳市","province":"广东省","country":"中国","addr":"福田区福强路256号809    "}
                  ,{"openId":"outryopinbkmbkcnvkhj","name":"张大伟","city":"深圳市","province":"广东省","country":"中国","addr":"罗湖区莲塘医院          "}
                  ,{"openId":"tesradfwxqscasfzcwqz","name":"李天阳","city":"深圳市","province":"广东省","country":"中国","addr":"福田区福民路156号       "}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"openId",              label:"<ju:txt value="customerAddressInfo.openId"           />",                     align:"left"}
	 		,{name:"name",                label:"<ju:txt value="customerAddressInfo.name"             />",                     align:"center"}
	 		,{name:"city",                label:"<ju:txt value="customerAddressInfo.city"             />",                     align:"center"}
	 		,{name:"province",            label:"<ju:txt value="customerAddressInfo.province"         />",                     align:"center"}
	 		,{name:"country",             label:"<ju:txt value="customerAddressInfo.country"          />",                     align:"center"}
	 		,{name:"addr",                label:"<ju:txt value="customerAddressInfo.addr"             />",                     align:"left"}
	 	]
	,
	caption:"<ju:txt value="customerAddressInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
    dataRoot:"gridcustomerAddressInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create: {url:"insertcustomerAddressInfo.json",   label:"<ju:txt value="button.create"/>" ,                              resourceID:"300041"}
		,read:   {url:"getcustomerAddressInfo",           label:"<ju:txt value="button.read"/>",       param:["openId"],         resourceID:"300041"}
		,update: {url:"updatecustomerAddressInfo.json",   label:"<ju:txt value="button.update"/>",     param:["openId"],         resourceID:"300041"}
		,"delete": {url:"deletecustomerAddressInfo.json",   label:"<ju:txt value="button.del"/>",        param:["openId"],         resourceID:"300041"}
	}	
	,
	controller:{
		end:["read","update","delete"],
		bottom:["create","delete"]
	}
});


</script>
