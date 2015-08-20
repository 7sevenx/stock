<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="wechatGoodsStocksInfo.goodsName"/>:</label>
    <input type="text" vui-name="openId" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr><td><label><ju:txt value="wechatGoodsStocksInfo.goodsId"                      />:</label></td><td><input type="text"  vui-name="goodsId"                vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatGoodsStocksInfo.goodsName"                    />:</label></td><td><input type="text"  vui-name="goodsName"              vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="wechatGoodsStocksInfo.stockNum"                     />:</label></td><td><input type="text"  vui-name="stockNum"               vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatGoodsStocksInfo.stockInNum "                  />:</label></td><td><input type="text"  vui-name="stockInNum"             vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="wechatGoodsStocksInfo.stockInDate"                  />:</label></td><td><input type="text"  vui-name="stockInDate"            vui-validate="required:true"  maxlength="60"/></td></tr>
	  <tr><td><label><ju:txt value="wechatGoodsStocksInfo.stockOutNum "                 />:</label></td><td><input type="text"  vui-name="stockOutNum"            vui-validate="required:true"  maxlength="60"/></td></tr>
		<tr><td><label><ju:txt value="wechatGoodsStocksInfo.stockOutDate"                 />:</label></td><td><input type="text"  vui-name="stockOutDate"           vui-validate="required:true"  maxlength="60"/></td></tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
var dataSingleSet=[
                   {"goodsId":"V0001001","goodsName":"小肥羊19元现金券  ","stockNum":"0  ","stockInNum":"1000","stockInDate":"2014/1/1","stockOutNum":"1000","stockOutDate":"2014/2/18"}
                  ,{"goodsId":"V0001002","goodsName":"小肥羊29元现金券  ","stockNum":"0  ","stockInNum":"1000","stockInDate":"2014/1/1","stockOutNum":"1000","stockOutDate":"2014/1/31"}
                  ,{"goodsId":"V0002001","goodsName":"许留山9元现金券   ","stockNum":"0  ","stockInNum":"1000","stockInDate":"2014/1/1","stockOutNum":"1000","stockOutDate":"2014/2/12"}
                  ,{"goodsId":"V0002002","goodsName":"许留山饮品兑换券  ","stockNum":"0  ","stockInNum":"1000","stockInDate":"2014/1/1","stockOutNum":"1000","stockOutDate":"2014/1/28"}
                  ,{"goodsId":"V0002003","goodsName":"许留山甜品兑换券  ","stockNum":"0  ","stockInNum":"1000","stockInDate":"2014/1/1","stockOutNum":"1000","stockOutDate":"2014/1/15"}
                  ,{"goodsId":"S0002001","goodsName":"纪念版购物袋（小）","stockNum":"0  ","stockInNum":"2000","stockInDate":"2014/1/1","stockOutNum":"1000","stockOutDate":"2014/2/7 "}
                  ,{"goodsId":"S0002002","goodsName":"纪念版购物袋（大）","stockNum":"0  ","stockInNum":"2000","stockInDate":"2014/1/1","stockOutNum":"1000","stockOutDate":"2014/1/28"}
                  ,{"goodsId":"S0003001","goodsName":"纪念版笔记本      ","stockNum":"0  ","stockInNum":"1000","stockInDate":"2014/1/1","stockOutNum":"1000","stockOutDate":"2014/1/28"}
                  ,{"goodsId":"S0004001","goodsName":"纪念版雨伞        ","stockNum":"0  ","stockInNum":"1000","stockInDate":"2014/1/1","stockOutNum":"1000","stockOutDate":"2014/1/14"}
                  ,{"goodsId":"S0005001","goodsName":"纪念版钥匙扣      ","stockNum":"106","stockInNum":"1000","stockInDate":"2014/1/1","stockOutNum":"894 ","stockOutDate":"2014/3/20"}
                 ];
$("#gridContainer").vgrid({
	url:dataSingleSet,
	resourceID:"300041",
	colModel:[
	 		 {name:"goodsId"       ,              label:"<ju:txt value="wechatGoodsStocksInfo.goodsId"          />",                     align:"center"}
	 		,{name:"goodsName"     ,              label:"<ju:txt value="wechatGoodsStocksInfo.goodsName"        />",                     align:"left"}
	 		,{name:"stockNum"      ,              label:"<ju:txt value="wechatGoodsStocksInfo.stockNum"         />",                     align:"right"}
	 		,{name:"stockInNum"    ,              label:"<ju:txt value="wechatGoodsStocksInfo.stockInNum "      />",                     align:"right"}
	 		,{name:"stockInDate"   ,              label:"<ju:txt value="wechatGoodsStocksInfo.stockInDate"      />",                     align:"center"}
	 		,{name:"stockOutNum"   ,              label:"<ju:txt value="wechatGoodsStocksInfo.stockOutNum "     />",                     align:"right"}
	 		,{name:"stockOutDate"  ,              label:"<ju:txt value="wechatGoodsStocksInfo.stockOutDate"     />",                     align:"left"}
	 	]
	,
	caption:"<ju:txt value="wechatGoodsStocksInfo.list"/>",
	cachePage:5,
	rowsPerPage:10,
	  dataRoot:"gridwechatGoodsStocksInfoList",
	searchContainer:"searchContainer",
	functions:{
		 create:   {url:"insertwechatGoodsStocksInfo.json",   label:"<ju:txt value="button.create"/>" ,                              resourceID:"300041"}
		,read:     {url:"getwechatGoodsStocksInfo",           label:"<ju:txt value="button.read"/>",       param:["openId"],         resourceID:"300041"}
		,update:   {url:"updatewechatGoodsStocksInfo.json",   label:"<ju:txt value="button.update"/>",     param:["openId"],         resourceID:"300041"}
		,"delete": {url:"deletewechatGoodsStocksInfo.json",   label:"<ju:txt value="button.del"/>",        param:["openId"],         resourceID:"300041"}
	}			
	,
	controller:{
		end:["read","update","delete"],
		bottom:["create","delete"]
	}
});


</script>
