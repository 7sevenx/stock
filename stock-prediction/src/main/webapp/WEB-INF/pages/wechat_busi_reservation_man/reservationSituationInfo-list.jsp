<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="reservationSituationInfo.branch"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
	  <tr><td><label><ju:txt value="reservationSituationInfo.branch"			       />:</label></td><td><input type="text"    vui-name="branch"       vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="reservationSituationInfo.openId"		         />:</label></td><td><input type="text"    vui-name="openId"       vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="reservationSituationInfo.busiName"		       />:</label></td><td><input type="text"    vui-name="busiName"     vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="reservationSituationInfo.orderTime"		     />:</label></td><td><input type="text"    vui-name="orderTime"    vui-validate="required:true"  maxlength="60"/></td></tr>			
	  <tr><td><label><ju:txt value="reservationSituationInfo.orderDate"		     />:</label></td><td><input type="text"    vui-name="orderDate"    vui-validate="required:true"  maxlength="60"/></td></tr>		
	  <tr><td><label><ju:txt value="reservationSituationInfo.status"		         />:</label></td><td><input type="text"    vui-name="busiType"     vui-validate="required:true"  maxlength="60"/></td></tr>				
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"branch":"101","openId":"uyshdjfhgffahsjdhhgg","busiName":"金卡      ","orderTime":"09:30-10:00","orderDate":"2014-3-1","status":"完成"}
                  ,{"branch":"101","openId":"rwefdstryuhdjfnbvcfs","busiName":"金卡      ","orderTime":"09:30-10:00","orderDate":"2014-3-1","status":"完成"}
				  ,{"branch":"101","openId":"oiujtkljhhgfsbcndjaz","busiName":"普卡      ","orderTime":"09:30-10:00","orderDate":"2014-3-1","status":"完成"}
                  ,{"branch":"101","openId":"kdcgfdqewgxavxhgzvgx","busiName":"普卡      ","orderTime":"09:30-10:00","orderDate":"2014-3-1","status":"完成"}
				  ,{"branch":"101","openId":"weuricmxzbxBFYSgwqru","busiName":"普卡      ","orderTime":"10:00-10:30","orderDate":"2014-3-1","status":"完成"}
                  ,{"branch":"101","openId":"iortrproejgklnkjbzhx","busiName":"普卡      ","orderTime":"10:00-10:30","orderDate":"2014-3-1","status":"完成"}
				  ,{"branch":"101","openId":"uqwdybzhyusdtchxzzgs","busiName":"普卡      ","orderTime":"10:00-10:30","orderDate":"2014-3-1","status":"完成"}
                  ,{"branch":"101","openId":"wirufgdpogfohgjpbnlb","busiName":"公积金业务","orderTime":"10:00-10:30","orderDate":"2014-3-1","status":"完成"}
				  ,{"branch":"101","openId":"oiewjdsknvmcxnxmvjdh","busiName":"金卡      ","orderTime":"10:00-10:30","orderDate":"2014-3-1","status":"完成"}
                  ,{"branch":"101","openId":"dsfiyquwhdjvxgzfdhsa","busiName":"普卡      ","orderTime":"10:00-10:30","orderDate":"2014-3-1","status":"完成"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"branch"				 ,              label:"<ju:txt value="reservationSituationInfo.branch"          />",                 align:"center"}
	 		,{name:"openId"	       ,	            label:"<ju:txt value="reservationSituationInfo.openId"          />",                 align:"left"}
	 		,{name:"busiName"		   ,              label:"<ju:txt value="reservationSituationInfo.busiName"        />",                 align:"left"}
	 		,{name:"orderTime"		 ,              label:"<ju:txt value="reservationSituationInfo.orderTime"       />", 	              align:"center"}
	 		,{name:"orderDate"		 ,              label:"<ju:txt value="reservationSituationInfo.orderDate"       />",                 align:"center"}
	 		,{name:"status"        ,              label:"<ju:txt value="reservationSituationInfo.status"          />",                 align:"center"}
	 	]
	,
	caption:"<ju:txt value="reservationSituationInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridreservationSituationInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertreservationSituationInfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"getreservationSituationInfo",           label:"<ju:txt value="button.read"/>",       param:["activeId"],         resourceID:"300041"}
		,update:   {url:"updatereservationSituationInfo.json",   label:"<ju:txt value="button.update"/>",     param:["activeId"],         resourceID:"300041"}
		,"delete": {url:"deletereservationSituationInfo.json",   label:"<ju:txt value="button.del"/>",        param:["activeId"],         resourceID:"300041"}
	}					
	,
	controller:{
		end:["read"],
		bottom:[""]
	}
});


</script>
