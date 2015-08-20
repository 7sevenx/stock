<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="reservationBusinessProcessInfo.branch"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
	  <tr><td><label><ju:txt value="reservationBusinessProcessInfo.branch"			       />:</label></td><td><input type="text"    vui-name="branch"       vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="reservationBusinessProcessInfo.Date"		           />:</label></td><td><input type="text"    vui-name="Date"         vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="reservationBusinessProcessInfo.busiType"		       />:</label></td><td><input type="text"    vui-name="busiType"     vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="reservationBusinessProcessInfo.orderNum"		       />:</label></td><td><input type="text"    vui-name="orderNum"     vui-validate="required:true"  maxlength="60"/></td></tr>			
	  <tr><td><label><ju:txt value="reservationBusinessProcessInfo.successNum"		     />:</label></td><td><input type="text"    vui-name="successNum"   vui-validate="required:true"  maxlength="60"/></td></tr>		
	  <tr><td><label><ju:txt value="reservationBusinessProcessInfo.invalidateNum"		 />:</label></td><td><input type="text"    vui-name="busiType"     vui-validate="required:true"  maxlength="60"/></td></tr>				
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"branch":"101","Date":"2014-3-1","busiType":"出国金融    ","orderNum":"12 ","successNum":"12 ","invalidateNum":"0  "}
                  ,{"branch":"101","Date":"2014-3-1","busiType":"金卡        ","orderNum":"30 ","successNum":"28 ","invalidateNum":"2  "}
				  ,{"branch":"101","Date":"2014-3-1","busiType":"普卡        ","orderNum":"50 ","successNum":"40 ","invalidateNum":"10 "}
                  ,{"branch":"101","Date":"2014-3-1","busiType":"对公业务    ","orderNum":"20 ","successNum":"17 ","invalidateNum":"3  "}
				  ,{"branch":"101","Date":"2014-3-1","busiType":"理财业务    ","orderNum":"18 ","successNum":"18 ","invalidateNum":"0  "}
                  ,{"branch":"101","Date":"2014-3-1","busiType":"对公现金客户","orderNum":"20 ","successNum":"18 ","invalidateNum":"2  "}
				  ,{"branch":"101","Date":"2014-3-1","busiType":"对公结算客户","orderNum":"17 ","successNum":"15 ","invalidateNum":"2  "}
                  ,{"branch":"101","Date":"2014-3-1","busiType":"公积金业务  ","orderNum":"35 ","successNum":"30 ","invalidateNum":"5  "}
				  ,{"branch":"101","Date":"2014-3-1","busiType":"对公外汇客户","orderNum":"28 ","successNum":"22 ","invalidateNum":"6  "}
                  ,{"branch":"101","Date":"2014-3-1","busiType":"出纳业务    ","orderNum":"14 ","successNum":"13 ","invalidateNum":"1  "}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"branch"				 ,              label:"<ju:txt value="reservationBusinessProcessInfo.branch"           />",                 align:"center"}
	 		,{name:"Date"	         ,	            label:"<ju:txt value="reservationBusinessProcessInfo.Date"              />",                 align:"center"}
	 		,{name:"busiType"		   ,              label:"<ju:txt value="reservationBusinessProcessInfo.busiType"         />",                 align:"left"}
	 		,{name:"orderNum"		   ,              label:"<ju:txt value="reservationBusinessProcessInfo.orderNum"         />", 	               align:"right"}
	 		,{name:"successNum"		 ,              label:"<ju:txt value="reservationBusinessProcessInfo.successNum"       />",                 align:"right"}
	 		,{name:"invalidateNum" ,              label:"<ju:txt value="reservationBusinessProcessInfo.invalidateNum"    />",                 align:"right"}
	 	]
	,
	caption:"<ju:txt value="reservationBusinessProcessInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridreservationBusinessProcessInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertreservationBusinessProcessInfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"getreservationBusinessProcessInfo",           label:"<ju:txt value="button.read"/>",       param:["activeId"],         resourceID:"300041"}
		,update:   {url:"updatereservationBusinessProcessInfo.json",   label:"<ju:txt value="button.update"/>",     param:["activeId"],         resourceID:"300041"}
		,"delete": {url:"deletereservationBusinessProcessInfo.json",   label:"<ju:txt value="button.del"/>",        param:["activeId"],         resourceID:"300041"}
	}					
	,
	controller:{
		end:["read"],
		bottom:[""]
	}
});


</script>
