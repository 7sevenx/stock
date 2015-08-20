<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="menuKey.code"/>：</label>
    <input type="text" vui-name="menuKey" />&nbsp;&nbsp;
    <label><ju:txt value="menuKey.name"/>：</label>
    <input type="text" vui-name="menuName" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
	 	<tr>
	    	<td id="required"><label><ju:txt value="menuKey.code"/>：</label></td>
	    	<td><input type="text" id="menuKey" vui-name="menuKey" vui-validate="len:4" vui-validate-group="requiredNum" maxlength="4" vui-editable="display"/></td>
	    </tr>
		<tr>
	 		<td><label><ju:txt value="menuKey.name"/>：</label></td>
	    	<td><input type="text" vui-name="menuName" vui-validate="required:true"  maxlength="30"/></td>
	    </tr>
	    <tr>
	    	<td><label><ju:txt value="remark"/>：</label></td>
	    	<td><textarea vui-name="remark" onkeyup="checkInput(this,200)" onchange="checkInput(this,200)"></textarea></td>
	    </tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">

$("#gridContainer").vgrid({
	url:"queryMenuKeyInfo.json",
	resourceID:"300041",
	colModel:[
		{name:"seqNo", label:"Id",align:"center",hidden:true},
		{name:"menuKey", label:"<ju:txt value="menuKey.code"/>",align:"center"},
		{name:"menuName", label:"<ju:txt value="menuKey.name"/>",align:"center"}
	],
	caption:"<ju:txt value="menuKey.list"/>",
	cachePage:5,
	rowsPerPage:10,
	dataRoot:"gridMenuKeyInfoList",
	searchContainer:"searchContainer",
	functions:{
		create:{url:"insertMenuKeyInfo.json", label:"<ju:txt value="button.create"/>" ,resourceID:"300042"},
		read:{url:"getMenuKeyInfo.json", label:"<ju:txt value="button.read"/>", param:["seqNo"],resourceID:"300041"},
		update:{url:"updateMenuKeyInfo.json", label:"<ju:txt value="button.update"/>", param:["seqNo"],resourceID:"300043"},
		"delete":{url:"deleteMenuKeyInfo.json", label:"<ju:txt value="button.del"/>", param:["seqNo"],resourceID:"300044"}
		//batchDelete:{url:"deleteMenuKeyInfo.json",label:"<ju:txt value="button.batchDel"/>", param:["seqNo"],resourceId:"300044"}
	},
	controller:{
		end:["read","update","delete"],
		bottom:["create","delete"]
	},
	options:{
		menuKeyData:"menuKeySelect.json?resourceID=300041"
	}
});
</script>
