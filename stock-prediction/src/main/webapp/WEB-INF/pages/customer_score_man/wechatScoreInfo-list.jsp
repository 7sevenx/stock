<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="wechatScoreInfo.openId"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr><td><label><ju:txt value="wechatScoreInfo.openId"                        />:</label></td><td><input type="text"  vui-name="openId"                 vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatScoreInfo.currentScore"                  />:</label></td><td><input type="text"  vui-name="currentScore"           vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="wechatScoreInfo.willLoseScore"                 />:</label></td><td><input type="text"  vui-name="willLoseScore"          vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatScoreInfo.expiryDate"                    />:</label></td><td><input type="text"  vui-name="expiryDate"             vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"openId":"uyshdjfhgffahsjdhhgg","currentScore":"201 ","willLoseScore":"0","expiryDate":""}
                  ,{"openId":"rwefdstryuhdjfnbvcfs","currentScore":"1002","willLoseScore":"0","expiryDate":""}
                  ,{"openId":"oiujtkljhhgfsbcndjaz","currentScore":"200 ","willLoseScore":"0","expiryDate":""}
                  ,{"openId":"kdcgfdqewgxavxhgzvgx","currentScore":"500 ","willLoseScore":"0","expiryDate":""}
                  ,{"openId":"weuricmxzbxBFYSgwqru","currentScore":"809 ","willLoseScore":"0","expiryDate":""}
                  ,{"openId":"iortrproejgklnkjbzhx","currentScore":"1092","willLoseScore":"0","expiryDate":""}
                  ,{"openId":"uqwdybzhyusdtchxzzgs","currentScore":"909 ","willLoseScore":"0","expiryDate":""}
                  ,{"openId":"wirufgdpogfohgjpbnlb","currentScore":"87  ","willLoseScore":"0","expiryDate":""}
                  ,{"openId":"oiewjdsknvmcxnxmvjdh","currentScore":"502 ","willLoseScore":"0","expiryDate":""}
                  ,{"openId":"dsfiyquwhdjvxgzfdhsa","currentScore":"477 ","willLoseScore":"0","expiryDate":""}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"openId"           ,              label:"<ju:txt value="wechatScoreInfo.openId"              />",                     align:"left"}
	 		,{name:"currentScore"     ,              label:"<ju:txt value="wechatScoreInfo.currentScore"        />",                     align:"right"}
	 		,{name:"willLoseScore"    ,              label:"<ju:txt value="wechatScoreInfo.willLoseScore"       />",                     align:"right"}
	 		,{name:"expiryDate"       ,              label:"<ju:txt value="wechatScoreInfo.expiryDate"          />",                     align:"center"}
	 	]
	,
	caption:"<ju:txt value="wechatScoreInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridwechatScoreInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertwechatScoreInfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"getwechatScoreInfo",           label:"<ju:txt value="button.read"/>",       param:["openId"],         resourceID:"300041"}
		,update:   {url:"updatewechatScoreInfo.json",   label:"<ju:txt value="button.update"/>",     param:["openId"],         resourceID:"300041"}
		,"delete": {url:"deletewechatScoreInfo.json",   label:"<ju:txt value="button.del"/>",        param:["openId"],         resourceID:"300041"}
	}	
	,
	controller:{
		end:["read","update","delete"],
		bottom:["create","delete"]
	}
});


</script>
