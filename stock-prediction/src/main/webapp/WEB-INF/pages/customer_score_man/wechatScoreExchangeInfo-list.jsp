<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="wechatScoreExchangeInfo.openId"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr><td><label><ju:txt value="wechatScoreExchangeInfo.openId"                        />:</label></td><td><input type="text"  vui-name="openId"                 vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatScoreExchangeInfo.exchangeDate"                  />:</label></td><td><input type="text"  vui-name="exchangeDate"           vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="wechatScoreExchangeInfo.exchangeScore"                 />:</label></td><td><input type="text"  vui-name="exchangeScore"          vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatScoreExchangeInfo.goodsId"                       />:</label></td><td><input type="text"  vui-name="goodsId"                vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"openId":"uyshdjfhgffahsjdhhgg","exchangeDate":"2014/1/1","exchangeScore":"9","goodsId":"S0001001"}
                  ,{"openId":"rwefdstryuhdjfnbvcfs","exchangeDate":"2014/1/1","exchangeScore":"9","goodsId":"S0001001"}
                  ,{"openId":"oiujtkljhhgfsbcndjaz","exchangeDate":"2014/1/1","exchangeScore":"9","goodsId":"S0001001"}
                  ,{"openId":"kdcgfdqewgxavxhgzvgx","exchangeDate":"2014/1/1","exchangeScore":"9","goodsId":"S0001001"}
                  ,{"openId":"weuricmxzbxBFYSgwqru","exchangeDate":"2014/1/1","exchangeScore":"9","goodsId":"S0001001"}
                  ,{"openId":"iortrproejgklnkjbzhx","exchangeDate":"2014/1/1","exchangeScore":"9","goodsId":"S0001001"}
                  ,{"openId":"uqwdybzhyusdtchxzzgs","exchangeDate":"2014/1/1","exchangeScore":"9","goodsId":"S0001001"}
                  ,{"openId":"wirufgdpogfohgjpbnlb","exchangeDate":"2014/1/1","exchangeScore":"9","goodsId":"S0001001"}
                  ,{"openId":"oiewjdsknvmcxnxmvjdh","exchangeDate":"2014/1/1","exchangeScore":"9","goodsId":"S0001001"}
                  ,{"openId":"dsfiyquwhdjvxgzfdhsa","exchangeDate":"2014/1/1","exchangeScore":"9","goodsId":"S0001001"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"openId"           ,              label:"<ju:txt value="wechatScoreExchangeInfo.openId"              />",                     align:"left"}
	 		,{name:"exchangeDate"     ,              label:"<ju:txt value="wechatScoreExchangeInfo.exchangeDate"        />",                     align:"center"}
	 		,{name:"exchangeScore"    ,              label:"<ju:txt value="wechatScoreExchangeInfo.exchangeScore"       />",                     align:"center"}
	 		,{name:"goodsId"          ,              label:"<ju:txt value="wechatScoreExchangeInfo.goodsId"             />",                     align:"center"}
	 	]
	,
	caption:"<ju:txt value="wechatScoreExchangeInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridwechatScoreExchangeInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertwechatScoreExchangeInfo.json",   label:"<ju:txt value="button.create"/>" ,                              resourceID:"300041"}
		,read:     {url:"getwechatScoreExchangeInfo",           label:"<ju:txt value="button.read"/>",       param:["openId"],         resourceID:"300041"}
		,update:   {url:"updatewechatScoreExchangeInfo.json",   label:"<ju:txt value="button.update"/>",     param:["openId"],         resourceID:"300041"}
		,"delete": {url:"deletewechatScoreExchangeInfo.json",   label:"<ju:txt value="button.del"/>",        param:["openId"],         resourceID:"300041"}
	}	
	,
	controller:{
		end:["read"],
		bottom:[""]
	}
});


</script>
