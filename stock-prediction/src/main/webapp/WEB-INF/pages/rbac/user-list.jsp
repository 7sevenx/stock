<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="user.login.name"/>：</label>
    <input type="text" vui-name="loginName" />
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr>
	 		<td id="required"><label><ju:txt value="user.name"/>：</label></td>
	    	<td><input type="text" vui-name="userName" vui-validate="required:true" style="width:150px" maxlength="10"/></td>
	    </tr>
	    <tr>
	    	<td id="required"><label><ju:txt value="user.login.name"/>：</label></td>
	    	<td><input type="text" vui-name="loginName" vui-editable="display" style="width:150px" vui-validate-group="userRequiredDigNum" maxlength="20"/></td>
	    </tr>
	    <tr>
	    	<td id="required"><label><ju:txt value="user.role"/>：</label></td>
	    	<td>
		    	<select vui-name="roleID" vui-data="role" vui-validate="required:true" >
		     	</select>
	     	</td>
	    </tr>
	    <tr>
	     	<td id="required"><label><ju:txt value="user.department"/>：</label></td>
	      	<td>
		      	<select vui-name="departmentID" vui-data="department" vui-validate="required:true" style="width:150px">
			    </select>
	     	</td>
	    </tr>
	    <tr>
	    	<td class="remark-lable"><label><ju:txt value="remark"/>：</label></td>
	    	<td><textarea vui-name="remark" maxlength="10" style="height:50px;width:150px"></textarea></td>
	    </tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>

<script type="text/javascript">

$("#gridContainer").vgrid({
	url:"userListProcess.json",
	resourceID:"100025",
	colModel:[
		{name:"userID", label:"<ju:txt value="user.id"/>",align:"center",hidden:true},
		{name:"userName", label:"<ju:txt value="user.name"/>",align:"center"},
		{name:"loginName", label:"<ju:txt value="user.login.name"/>",align:"center"},
		{name:"lastUpdateUserID", label:"<ju:txt value="last.update.user"/>",align:"center",data:"user"},
		{name:"lastUpdateTime", label:"<ju:txt value="last.update.time"/>",align:"center",type:"date"},
		{name:"remark", label:"<ju:txt value="remark"/>",align:"center"}
	],
	caption:"<ju:txt value="user.table"/>",
	cachePage:10,
	rowsPerPage:10,
	dataRoot:"gridUserList",
	selectable:false,
	searchContainer:"searchContainer",
	functions:{
		create:{url:"userCreateProcess.json", label:"<ju:txt value="button.create"/>" ,resourceID:"100021"},
		read:{url:"userViewProcess.json", label:"<ju:txt value="button.read"/>", param:["userID"],resourceID:"100024"},
		update:{url:"userUpdateProcess.json", label:"<ju:txt value="button.update"/>", param:["userID"],resourceID:"100022"},
		"delete":{url:"userDeleteProcess.json", label:"<ju:txt value="button.del"/>", param:["userID"],resourceID:"100023"}
	},
	controller:{
		front:["read","update","delete"],
		bottom:["create"]
	},
	options:{
		department:"departmentSelectProcess.json?resourceID=100035",
		role:"roleSelectProcess.json?resourceID=100045",
		user:"userSelectProcess.json?resourceID=100025"
	}
});


</script>
