<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="customerWechatInfo.openId"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr><td><label><ju:txt value="customerWechatInfo.openId"                    />:</label></td><td><input type="text"  vui-name="openId"            vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="customerWechatInfo.subscribe_time"            />:</label></td><td><input type="text"  vui-name="subscribe_time"    vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="customerWechatInfo.nickname"                  />:</label></td><td><input type="text"  vui-name="nickname"          vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="customerWechatInfo.webChatId"                 />:</label></td><td><input type="text"  vui-name="webChatId"         vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="customerWechatInfo.custNo"                    />:</label></td><td><input type="text"  vui-name="custNo"            vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="customerWechatInfo.name"                      />:</label></td><td><input type="text"  vui-name="name"              vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="customerWechatInfo.sex"                       />:</label></td><td><input type="text"  vui-name="sex"               vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="customerWechatInfo.language"                  />:</label></td><td><input type="text"  vui-name="language"          vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="customerWechatInfo.birthday"                  />:</label></td><td><input type="text"  vui-name="birthday"          vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="customerWechatInfo.telephone"                 />:</label></td><td><input type="text"  vui-name="telephone"         vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="customerWechatInfo.phone_number"              />:</label></td><td><input type="text"  vui-name="phone_number"      vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="customerWechatInfo.addr"                      />:</label></td><td><input type="text"  vui-name="addr"              vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="customerWechatInfo.e_mail"                    />:</label></td><td><input type="text"  vui-name="e_mail"            vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="customerWechatInfo.job"                       />:</label></td><td><input type="text"  vui-name="job"               vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="customerWechatInfo.income"                    />:</label></td><td><input type="text"  vui-name="income"            vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"openId":"iujhkjhsytgtwgsfdiok","subscribe_time":"2014/1/2 9:32:01 ","nickname":"天舒    ","webChatId":"sykbook   ","custNo":"1090987769","name":"马天舒","sex":"男","language":"简体中文","birthday":"1980/9/2  ","telephone":"","phone_number":"16809876555","addr":"                            ","e_mail":"                  ","job":"    ","income":"           "}
                  ,{"openId":"uytrfshdgsfxvcmakdod","subscribe_time":"2014/1/2 9:43:19 ","nickname":"        ","webChatId":"          ","custNo":"          ","name":"      ","sex":"  ","language":"        ","birthday":"          ","telephone":"","phone_number":"           ","addr":"                            ","e_mail":"                  ","job":"    ","income":"           "}
                  ,{"openId":"polgkiyumjjnhnkioyik","subscribe_time":"2014/1/2 10:12:45","nickname":"微微    ","webChatId":"weiwei1989","custNo":"2098476578","name":"魏晓宁","sex":"女","language":"简体中文","birthday":"1989/2/10 ","telephone":"","phone_number":"           ","addr":"                            ","e_mail":"                  ","job":"    ","income":"           "}
                  ,{"openId":"uqradsvxcnfklhzfzdwr","subscribe_time":"2014/1/2 13:09:59","nickname":"Lucy1976","webChatId":"lucy1976  ","custNo":"1098374766","name":"卢青萍","sex":"女","language":"简体中文","birthday":"1976/12/31","telephone":"","phone_number":"18909876543","addr":"广东省深圳市福田区福田保税区","e_mail":"weiwei1989@163.com","job":"教师","income":"5000-7000元"}
                  ,{"openId":"twyeixfvaxxzzdawtfkl","subscribe_time":"2014/1/2 17:28:32","nickname":"        ","webChatId":"          ","custNo":"          ","name":"      ","sex":"  ","language":"        ","birthday":"          ","telephone":"","phone_number":"           ","addr":"                            ","e_mail":"                  ","job":"    ","income":"           "}
                  ,{"openId":"iroypjlmnbcvsfgfgrgv","subscribe_time":"2014/1/2 18:04:52","nickname":"        ","webChatId":"          ","custNo":"          ","name":"      ","sex":"  ","language":"        ","birthday":"          ","telephone":"","phone_number":"           ","addr":"                            ","e_mail":"                  ","job":"    ","income":"           "}
                  ,{"openId":"uuyiuojkhjuyyghfrgtr","subscribe_time":"2014/1/2 19:37:48","nickname":"洋      ","webChatId":"littleyang","custNo":"1098654325","name":"王晓阳","sex":"女","language":"简体中文","birthday":"1990/7/23 ","telephone":"","phone_number":"18654323567","addr":"                            ","e_mail":"                  ","job":"    ","income":"           "}
                  ,{"openId":"bcvxcsfdfjjsvjschjhf","subscribe_time":"2014/1/2 20:34:09","nickname":"        ","webChatId":"          ","custNo":"          ","name":"      ","sex":"  ","language":"        ","birthday":"          ","telephone":"","phone_number":"           ","addr":"                            ","e_mail":"                  ","job":"    ","income":"           "}
                  ,{"openId":"outryopinbkmbkcnvkhj","subscribe_time":"2014/1/2 21:23:36","nickname":"沙子    ","webChatId":"sandtang  ","custNo":"1093645353","name":"张大伟","sex":"男","language":"简体中文","birthday":"1985/12/12","telephone":"","phone_number":"18687739409","addr":"                            ","e_mail":"                  ","job":"    ","income":"           "}
                  ,{"openId":"tesradfwxqscasfzcwqz","subscribe_time":"2014/1/3 10:49:37","nickname":"        ","webChatId":"          ","custNo":"          ","name":"      ","sex":"  ","language":"        ","birthday":"          ","telephone":"","phone_number":"           ","addr":"                            ","e_mail":"                  ","job":"    ","income":"           "}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"openId",              label:"<ju:txt value="customerWechatInfo.openId"           />",                     align:"left"}
	 		,{name:"subscribe_time",      label:"<ju:txt value="customerWechatInfo.subscribe_time"   />",                     align:"left"}
	 		,{name:"nickname",            label:"<ju:txt value="customerWechatInfo.nickname"         />",                     align:"left"}
	 		,{name:"webChatId",           label:"<ju:txt value="customerWechatInfo.webChatId"        />",                     align:"left"}
	 		,{name:"custNo",              label:"<ju:txt value="customerWechatInfo.custNo"           />",                     align:"center"}
	 		,{name:"name",                label:"<ju:txt value="customerWechatInfo.name"             />",                     align:"center"}
	 		,{name:"sex",                 label:"<ju:txt value="customerWechatInfo.sex"              />",                     align:"center"}
	 		,{name:"language",            label:"<ju:txt value="customerWechatInfo.language"         />",                     align:"center"}
	 		,{name:"birthday",            label:"<ju:txt value="customerWechatInfo.birthday"         />",                     align:"left"}
	 		,{name:"telephone",           label:"<ju:txt value="customerWechatInfo.telephone"        />",                     align:"center"}
	 		,{name:"phone_number",        label:"<ju:txt value="customerWechatInfo.phone_number"     />",                     align:"center"}
	 		,{name:"addr",                label:"<ju:txt value="customerWechatInfo.addr"             />",                     align:"center"}
	 		,{name:"e_mail",              label:"<ju:txt value="customerWechatInfo.e_mail"           />",                     align:"center"}
	 		,{name:"job",                 label:"<ju:txt value="customerWechatInfo.job"              />",                     align:"center"}
	 		,{name:"income",              label:"<ju:txt value="customerWechatInfo.income"           />",                     align:"center"}
	 	]
	,
	caption:"<ju:txt value="customerWechatInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
  dataRoot:"gridCustomerWechatInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create: {url:"insertCustomerWechatInfo.json",   label:"<ju:txt value="button.create"/>" ,                              resourceID:"300041"}
		,read:   {url:"getCustomerWechatInfo",           label:"<ju:txt value="button.read"/>",       param:["openId"],         resourceID:"300041"}
		,update: {url:"updateCustomerWechatInfo.json",   label:"<ju:txt value="button.update"/>",     param:["openId"],         resourceID:"300041"}
		,"delete": {url:"deleteCustomerWechatInfo.json",   label:"<ju:txt value="button.del"/>",        param:["openId"],         resourceID:"300041"}
	}	
	,
	controller:{
		end:["read","update"],
		bottom:[""]
	}
});


</script>
