<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="customerAnalysisInfo.openId"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr><td><label><ju:txt value="customerAnalysisInfo.openId"                />:</label></td><td><input type="text"  vui-name="openId"         vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="customerAnalysisInfo.busiType"              />:</label></td><td><input type="text"  vui-name="busiType"       vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="customerAnalysisInfo.interest"              />:</label></td><td><input type="text"  vui-name="interest"       vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"openId":"uyshdjfhgffahsjdhhgg","busiType":"理财产品","interest":"高","count":"170"}
                   ,{"openId":"rwefdstryuhdjfnbvcfs","busiType":"理财产品","interest":"高","count":"120"}
                   ,{"openId":"oiujtkljhhgfsbcndjaz","busiType":"贵金属","interest":"高","count":"110"}
                   ,{"openId":"kdcgfdqewgxavxhgzvgx","busiType":"理财产品","interest":"中","count":"74"}
                   ,{"openId":"weuricmxzbxBFYSgwqru","busiType":"贵金属  ","interest":"中","count":"70"}
                   ,{"openId":"iortrproejgklnkjbzhx","busiType":"贵金属  ","interest":"中","count":"64"}
                   ,{"openId":"uqwdybzhyusdtchxzzgs","busiType":"贵金属  ","interest":"中","count":"45"}
                   ,{"openId":"wirufgdpogfohgjpbnlb","busiType":"贵金属  ","interest":"中","count":"40"}
                   ,{"openId":"oiewjdsknvmcxnxmvjdh","busiType":"贵金属  ","interest":"低","count":"11"}
                   ,{"openId":"dsfiyquwhdjvxgzfdhsa","busiType":"贵金属  ","interest":"低","count":"5"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"openId"           ,              label:"<ju:txt value="customerAnalysisInfo.openId"           />",                     align:"left"}
	 		,{name:"busiType"         ,              label:"<ju:txt value="customerAnalysisInfo.busiType"         />",                     align:"left"}
	 		,{name:"interest"         ,              label:"<ju:txt value="customerAnalysisInfo.interest"         />",                     align:"center"}
	 		,{name:"count"         ,              label:"<ju:txt value="customerAnalysisInfo.count"         />",                     align:"right"}
	 		]
	,
	caption:"<ju:txt value="customerAnalysisInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridcustomerAnalysisInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertcustomerAnalysisInfo.json",   label:"<ju:txt value="button.create"/>" ,                              resourceID:"300041"}
		,read:     {url:"getcustomerAnalysisInfo",           label:"<ju:txt value="button.read"/>",       param:["openId"],         resourceID:"300041"}
		,update:   {url:"updatecustomerAnalysisInfo.json",   label:"<ju:txt value="button.update"/>",     param:["openId"],         resourceID:"300041"}
		,"delete": {url:"deletecustomerAnalysisInfo.json",   label:"<ju:txt value="button.del"/>",        param:["openId"],         resourceID:"300041"}
	}		
	,
	controller:{
		end:["read"],
		bottom:[""]
	}
});


</script>
