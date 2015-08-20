<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="marketType.code"/>：</label>
    <input type="text" vui-name="typeCode" />&nbsp;&nbsp;
    <label><ju:txt value="marketType.name"/>：</label>
    <input type="text" vui-name="typeName" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
	 	<tr>
	    	<td id="required"><label><ju:txt value="marketType.code"/>：</label></td>
	    	<td><input type="text" vui-name="typeCode" vui-validate="required:true,reg:^[A-Za-z0-9]+$" maxlength="3"/></td>
	    </tr>
		<tr>
	 		<td><label><ju:txt value="marketType.name"/>：</label></td>
	    	<td><input type="text" vui-name="typeName" vui-validate="required:true"  maxlength="30"/></td>
	    </tr>
	    <tr>
	 		<td><label><ju:txt value="marketType.menuKey"/>：</label></td>
	    	<td><select vui-name="menuKey" vui-data="menuKeyData" vui-validate="required:true"/></td>
	    </tr>
	    <tr>
	 		<td><label><ju:txt value="marketType.menuFlag"/>：</label></td>
	    	<td><select vui-name="menuFlag" vui-data="menuFlag" vui-validate="required:true"/></td>
	    </tr>
	    <tr>
	    	<td><label><ju:txt value="marketType.remark"/>：</label></td>
	    	<td><textarea vui-name="remark"  onkeyup="checkInput(this,200)" onchange="checkInput(this,200)"></textarea></td>
	    </tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">


var readRule = function(){
	if(this.topicId !=1)
		return true;
	
	return false;
};

$("#gridContainer").vgrid({
	url:"queryMarketTypeInfo.json",
	resourceID:"200021",
	colModel:[
		{name:"seqNo", label:"Id",align:"center",hidden:true},
		{name:"typeCode", label:"<ju:txt value="marketType.code"/>",align:"center"},
		{name:"typeName", label:"<ju:txt value="marketType.name"/>",align:"left"},
		{name:"menuKey", label:"<ju:txt value="marketType.menuKey"/>",align:"left",data:"menuKeyData"},
		{name:"menuFlag", label:"<ju:txt value="marketType.menuFlag"/>",align:"center",data:"menuFlag"},
		{name:"remark", label:"<ju:txt value="marketType.remark"/>",align:"center",hidden:true}
	],
	caption:"<ju:txt value="marketType.list"/>",
	cachePage:5,
	rowsPerPage:10,
	dataRoot:"gridMarketTypeInfoList",
	searchContainer:"searchContainer",
	functions:{
		create:{url:"insertMarketTypeInfo.json", label:"<ju:txt value="button.create"/>" ,resourceID:"200022"},
		read:{url:"getMarketTypeInfo.json", label:"<ju:txt value="button.read"/>", param:["seqNo"],resourceID:"200021"},
//		read:{url:"getMarketTypeInfo.json", label:"<ju:txt value="button.read"/>", param:["seqNo"],resourceID:"200021",statusRule:readRule},
		update:{url:"updateMarketTypeInfo.json", label:"<ju:txt value="button.update"/>", param:["seqNo"],resourceID:"200023"},
		"delete":{url:"deleteMarketTypeInfo.json", label:"<ju:txt value="button.del"/>", param:["seqNo"],resourceID:"200024"}
		//batchDelete:{url:"deleteMarketTypeInfo.json",label:"<ju:txt value="button.batchDel"/>", param:["seqNo"],resourceId:"200024"}
	},
	controller:{
		end:["read","update","delete"],
		bottom:["create","delete"]
	},
	options:{
	    //此处目前注释掉，由于表未建放开会报错，上线会影响生产数据，待生产真正更新时，再放开~
		//menuKeyData:"menuKeySelect.json?resourceID=200021",
		menuKeyData:[
				        {"name":"手机银行下载","value":"3004"},
				        {"name":"优惠活动","value":"3003"},
				        {"name":"快乐金","value":"3002"}
				        ],
		menuKey:[
		        {"name":"手机银行下载","value":"3004"},
		        {"name":"优惠活动","value":"3003"},
		        {"name":"快乐金","value":"3002"}
		        ],
		menuFlag:[
		          {"name":"是","value":"Y"},
		          {"name":"否","value":"N"}
		          ]
		
	}
});


</script>
