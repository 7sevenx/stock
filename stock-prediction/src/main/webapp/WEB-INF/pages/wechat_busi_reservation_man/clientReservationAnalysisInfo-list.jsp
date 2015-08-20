<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="clientReservationAnalysisInfo.branch"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
	  <tr><td><label><ju:txt value="clientReservationAnalysisInfo.openId"				         />:</label></td><td><input type="text"    vui-name="openId"       vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="clientReservationAnalysisInfo.branch"	               />:</label></td><td><input type="text"    vui-name="branch"       vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="clientReservationAnalysisInfo.busiName"		           />:</label></td><td><input type="text"    vui-name="busiName"     vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="clientReservationAnalysisInfo.orderTime"			       />:</label></td><td><input type="text"    vui-name="orderTime"    vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="clientReservationAnalysisInfo.orderDate"		         />:</label></td><td><input type="text"    vui-name="orderDate"    vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="clientReservationAnalysisInfo.status"		             />:</label></td><td><input type="text"    vui-name="status"       vui-validate="required:true"  maxlength="60"/></td></tr>		
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"openId":"uyshdjfhgffahsjdhhgg","branch":"101","busiName":"金卡      ","orderTime":"09:30-10:00","orderDate":"2014-3-1","status":"完成"}
                  ,{"openId":"rwefdstryuhdjfnbvcfs","branch":"102","busiName":"金卡      ","orderTime":"09:30-10:00","orderDate":"2014-3-1","status":"完成"}
				  ,{"openId":"oiujtkljhhgfsbcndjaz","branch":"108","busiName":"普卡      ","orderTime":"09:30-10:00","orderDate":"2014-3-1","status":"完成"}
                  ,{"openId":"kdcgfdqewgxavxhgzvgx","branch":"103","busiName":"普卡      ","orderTime":"09:30-10:00","orderDate":"2014-3-1","status":"完成"}
				  ,{"openId":"weuricmxzbxBFYSgwqru","branch":"101","busiName":"普卡      ","orderTime":"10:00-10:30","orderDate":"2014-3-1","status":"完成"}
                  ,{"openId":"iortrproejgklnkjbzhx","branch":"108","busiName":"普卡      ","orderTime":"10:00-10:30","orderDate":"2014-3-1","status":"完成"}
				  ,{"openId":"uqwdybzhyusdtchxzzgs","branch":"107","busiName":"普卡      ","orderTime":"10:00-10:30","orderDate":"2014-3-1","status":"完成"}
                  ,{"openId":"wirufgdpogfohgjpbnlb","branch":"102","busiName":"公积金业务","orderTime":"10:00-10:30","orderDate":"2014-3-1","status":"完成"}
				  ,{"openId":"oiewjdsknvmcxnxmvjdh","branch":"101","busiName":"金卡      ","orderTime":"10:00-10:30","orderDate":"2014-3-1","status":"完成"}
                  ,{"openId":"dsfiyquwhdjvxgzfdhsa","branch":"101","busiName":"普卡      ","orderTime":"10:00-10:30","orderDate":"2014-3-1","status":"完成"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"openId"				 ,              label:"<ju:txt value="clientReservationAnalysisInfo.openId"           />",                 align:"left"}
	 		,{name:"branch"	       ,	            label:"<ju:txt value="clientReservationAnalysisInfo.branch"           />",                 align:"center"}
	 		,{name:"busiName"		   ,              label:"<ju:txt value="clientReservationAnalysisInfo.busiName"         />",                 align:"left"}
	 		,{name:"orderTime"		 ,              label:"<ju:txt value="clientReservationAnalysisInfo.orderTime"        />", 	               align:"left"}
	 		,{name:"orderDate"		 ,              label:"<ju:txt value="clientReservationAnalysisInfo.orderDate"        />",                 align:"center"}
	 		,{name:"status"		     ,              label:"<ju:txt value="clientReservationAnalysisInfo.status"           />",                 align:"center"}
	 	]
	,
	caption:"<ju:txt value="clientReservationAnalysisInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridclientReservationAnalysisInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertclientReservationAnalysisInfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"getclientReservationAnalysisInfo",           label:"<ju:txt value="button.read"/>",       param:["activeId"],         resourceID:"300041"}
		,update:   {url:"updateclientReservationAnalysisInfo.json",   label:"<ju:txt value="button.update"/>",     param:["activeId"],         resourceID:"300041"}
		,"delete": {url:"deleteclientReservationAnalysisInfo.json",   label:"<ju:txt value="button.del"/>",        param:["activeId"],         resourceID:"300041"}
	}				
	,
	controller:{
		end:["read"],
		bottom:[""]
	}
});


</script>
