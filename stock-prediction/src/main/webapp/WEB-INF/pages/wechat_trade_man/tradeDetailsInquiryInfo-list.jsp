<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="tradeDetailsInquiryInfo.transaction"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
	  <tr><td><label><ju:txt value="tradeDetailsInquiryInfo.transaction"               />:</label></td><td><input type="text"  vui-name="transaction"     vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="tradeDetailsInquiryInfo.tnx_Seq"                   />:</label></td><td><input type="text"  vui-name="tnx_Seq"         vui-validate="required:true"  maxlength="60"/></td></tr>                 
	  <tr><td><label><ju:txt value="tradeDetailsInquiryInfo.openId"                    />:</label></td><td><input type="text"  vui-name="openId"          vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="tradeDetailsInquiryInfo.customerNo"                />:</label></td><td><input type="text"  vui-name="customerNo"      vui-validate="required:true"  maxlength="60"/></td></tr>    
	  <tr><td><label><ju:txt value="tradeDetailsInquiryInfo.accNo"                     />:</label></td><td><input type="text"  vui-name="accNo"           vui-validate="required:true"  maxlength="60"/></td></tr>  
	  <tr><td><label><ju:txt value="tradeDetailsInquiryInfo.tnx_Date"                  />:</label></td><td><input type="text"  vui-name="tnx_Date"        vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="tradeDetailsInquiryInfo.tnx_Time"                  />:</label></td><td><input type="text"  vui-name="tnx_Time"        vui-validate="required:true"  maxlength="60"/></td></tr>        
	  <tr><td><label><ju:txt value="tradeDetailsInquiryInfo.tnx_Amount"                />:</label></td><td><input type="text"  vui-name="tnx_Amount"      vui-validate="required:true"  maxlength="60"/></td></tr>    
	  <tr><td><label><ju:txt value="tradeDetailsInquiryInfo.tnxCcy"                    />:</label></td><td><input type="text"  vui-name="tnxCcy"          vui-validate="required:true"  maxlength="60"/></td></tr>  
	  <tr><td><label><ju:txt value="tradeDetailsInquiryInfo.tnx_Status"                />:</label></td><td><input type="text"  vui-name="tnx_Status"      vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="tradeDetailsInquiryInfo.remark"                    />:</label></td><td><input type="text"  vui-name="remark"          vui-validate="required:true"  maxlength="60"/></td></tr>        	  	                              
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"transaction":"积分兑换      ","tnx_Seq":"201403010000000001","openId":"uyshdjfhgffahsjdhhgg","customerNo":"1092883771","accNo":"                ","tnx_Date":"2014-1-12","tnx_Time":"","tnx_Amount":"9 ","tnxCcy":"积分","tnx_Status":"0","remark":"V0001002"}
                  ,{"transaction":"最新产品查询  ","tnx_Seq":"201403010000000002","openId":"rwefdstryuhdjfnbvcfs","customerNo":"2102344354","accNo":"                ","tnx_Date":"2014-1-13","tnx_Time":"","tnx_Amount":"  ","tnxCcy":"    ","tnx_Status":"0","remark":"        "}
                  ,{"transaction":"最新产品查询  ","tnx_Seq":"201403010000000003","openId":"oiujtkljhhgfsbcndjaz","customerNo":"2088744387","accNo":"                ","tnx_Date":"2014-1-14","tnx_Time":"","tnx_Amount":"  ","tnxCcy":"    ","tnx_Status":"0","remark":"        "}
                  ,{"transaction":"最新产品查询  ","tnx_Seq":"201403010000000004","openId":"kdcgfdqewgxavxhgzvgx","customerNo":"1098764337","accNo":"                ","tnx_Date":"2014-1-15","tnx_Time":"","tnx_Amount":"  ","tnxCcy":"    ","tnx_Status":"0","remark":"        "}
                  ,{"transaction":"信用卡账单查询","tnx_Seq":"201403010000000005","openId":"weuricmxzbxBFYSgwqru","customerNo":"1073548253","accNo":"6282708889878760","tnx_Date":"2014-1-16","tnx_Time":"","tnx_Amount":"  ","tnxCcy":"    ","tnx_Status":"0","remark":"        "}
                  ,{"transaction":"最新产品查询  ","tnx_Seq":"201403010000000006","openId":"iortrproejgklnkjbzhx","customerNo":"1098745433","accNo":"                ","tnx_Date":"2014-1-17","tnx_Time":"","tnx_Amount":"  ","tnxCcy":"    ","tnx_Status":"0","remark":"        "}
                  ,{"transaction":"最新产品查询  ","tnx_Seq":"201403010000000007","openId":"uqwdybzhyusdtchxzzgs","customerNo":"2012879087","accNo":"                ","tnx_Date":"2014-1-18","tnx_Time":"","tnx_Amount":"  ","tnxCcy":"    ","tnx_Status":"0","remark":"        "}
                  ,{"transaction":"最新产品查询  ","tnx_Seq":"201403010000000008","openId":"wirufgdpogfohgjpbnlb","customerNo":"2054863297","accNo":"                ","tnx_Date":"2014-1-19","tnx_Time":"","tnx_Amount":"  ","tnxCcy":"    ","tnx_Status":"0","remark":"        "}
                  ,{"transaction":"积分兑换      ","tnx_Seq":"201403010000000009","openId":"oiewjdsknvmcxnxmvjdh","customerNo":"2015384927","accNo":"                ","tnx_Date":"2014-1-20","tnx_Time":"","tnx_Amount":"19","tnxCcy":"积分","tnx_Status":"0","remark":"V0001001"}
                  ,{"transaction":"积分兑换      ","tnx_Seq":"201403010000000010","openId":"dsfiyquwhdjvxgzfdhsa","customerNo":"2082956384","accNo":"                ","tnx_Date":"2014-1-21","tnx_Time":"","tnx_Amount":"9 ","tnxCcy":"积分","tnx_Status":"0","remark":"V0001002"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"transaction"    ,              label:"<ju:txt value="tradeDetailsInquiryInfo.transaction"     />",                     align:"left"}
	 		,{name:"tnx_Seq"	      ,              label:"<ju:txt value="tradeDetailsInquiryInfo.tnx_Seq"         />",                     align:"center"}
	 		,{name:"openId"         ,              label:"<ju:txt value="tradeDetailsInquiryInfo.openId"          />",                     align:"left"}  
	 		,{name:"customerNo"     ,              label:"<ju:txt value="tradeDetailsInquiryInfo.customerNo"      />",                     align:"center"}     
	 		,{name:"accNo"	        ,              label:"<ju:txt value="tradeDetailsInquiryInfo.accNo"           />",                     align:"center"}
	 		,{name:"tnx_Date"       ,              label:"<ju:txt value="tradeDetailsInquiryInfo.tnx_Date"        />",                     align:"center"}         
	 		,{name:"tnx_Time"       ,              label:"<ju:txt value="tradeDetailsInquiryInfo.tnx_Time"        />",                     align:"center"}     
	 		,{name:"tnx_Amount"	    ,              label:"<ju:txt value="tradeDetailsInquiryInfo.tnx_Amount"      />",                     align:"right"}
	 		,{name:"tnxCcy"         ,              label:"<ju:txt value="tradeDetailsInquiryInfo.tnxCcy"          />",                     align:"center"}         
	 		,{name:"tnx_Status"     ,              label:"<ju:txt value="tradeDetailsInquiryInfo.tnx_Status"      />",                     align:"center"}     
	 		,{name:"remark"         ,              label:"<ju:txt value="tradeDetailsInquiryInfo.remark"          />",                     align:"left"}	
	 	]
	,
	caption:"<ju:txt value="tradeDetailsInquiryInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridtradeDetailsInquiryInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"inserttradeDetailsInquiryInfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"gettradeDetailsInquiryInfo",           label:"<ju:txt value="button.read"/>",       param:["activeId"],         resourceID:"300041"}
		,update:   {url:"updatetradeDetailsInquiryInfo.json",   label:"<ju:txt value="button.update"/>",     param:["activeId"],         resourceID:"300041"}
		,"delete": {url:"deletetradeDetailsInquiryInfo.json",   label:"<ju:txt value="button.del"/>",        param:["activeId"],         resourceID:"300041"}
	}				
	,
	controller:{
		end:["read","update","delete"],
		bottom:["create","delete"]
	}
});


</script>
