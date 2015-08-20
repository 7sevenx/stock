<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="wechatGoodsInfo.goodsName"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr><td><label><ju:txt value="wechatGoodsInfo.goodsId"                   />:</label></td><td><input type="text"  vui-name="goodsId"            vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatGoodsInfo.goodsName"                 />:</label></td><td><input type="text"  vui-name="goodsName"          vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="wechatGoodsInfo.goodsType"                 />:</label></td><td><input type="text"  vui-name="goodsType"          vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatGoodsInfo.num"                       />:</label></td><td><input type="text"  vui-name="num"                vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatGoodsInfo.spec"                      />:</label></td><td><input type="text"  vui-name="spec"               vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"goodsId":"V0001001","goodsName":"小肥羊19元现金券  ","goodsType":"虚拟电子券","num":"1000","spec":"张"}
                  ,{"goodsId":"V0001002","goodsName":"小肥羊29元现金券  ","goodsType":"虚拟电子券","num":"1000","spec":"张"}
                  ,{"goodsId":"V0002001","goodsName":"许留山9元现金券   ","goodsType":"虚拟电子券","num":"1000","spec":"张"}
                  ,{"goodsId":"V0002002","goodsName":"许留山饮品兑换券  ","goodsType":"虚拟电子券","num":"1000","spec":"张"}
                  ,{"goodsId":"V0002003","goodsName":"许留山甜品兑换券  ","goodsType":"虚拟电子券","num":"1000","spec":"张"}
                  ,{"goodsId":"S0002001","goodsName":"纪念版购物袋（小）","goodsType":"实物      ","num":"2000","spec":"个"}
                  ,{"goodsId":"S0002002","goodsName":"纪念版购物袋（大）","goodsType":"实物      ","num":"2000","spec":"个"}
                  ,{"goodsId":"S0003001","goodsName":"纪念版笔记本      ","goodsType":"实物      ","num":"1000","spec":"个"}
                  ,{"goodsId":"S0004001","goodsName":"纪念版雨伞        ","goodsType":"实物      ","num":"1000","spec":"个"}
                  ,{"goodsId":"S0005001","goodsName":"纪念版钥匙扣      ","goodsType":"实物      ","num":"1000","spec":"个"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"goodsId"        ,              label:"<ju:txt value="wechatGoodsInfo.goodsId"           />",                     align:"center"}
	 		,{name:"goodsName"      ,              label:"<ju:txt value="wechatGoodsInfo.goodsName"         />",                     align:"left"}
	 		,{name:"goodsType"      ,              label:"<ju:txt value="wechatGoodsInfo.goodsType"         />",                     align:"left"}
	 		,{name:"num"            ,              label:"<ju:txt value="wechatGoodsInfo.num"               />",                     align:"center"}
	 		,{name:"spec"           ,              label:"<ju:txt value="wechatGoodsInfo.spec"              />",                     align:"center"}
	 	]
	,
	caption:"<ju:txt value="wechatGoodsInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridwechatGoodsInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertwechatGoodsInfo.json",   label:"<ju:txt value="button.create"/>" ,                                resourceID:"300041"}
		,read:     {url:"getwechatGoodsInfo",           label:"<ju:txt value="button.read"/>",       param:["busiType"],         resourceID:"300041"}
		,update:   {url:"updatewechatGoodsInfo.json",   label:"<ju:txt value="button.update"/>",     param:["busiType"],         resourceID:"300041"}
		,"delete": {url:"deletewechatGoodsInfo.json",   label:"<ju:txt value="button.del"/>",        param:["busiType"],         resourceID:"300041"}
	}		
	,
	controller:{
		end:["read","update","delete"],
		bottom:["create","delete"]
	}
});


</script>
