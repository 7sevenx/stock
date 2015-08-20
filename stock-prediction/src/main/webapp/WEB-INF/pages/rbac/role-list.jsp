<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="role.name"/>：</label>
    <input type="text" class="inputStyle" vui-name="roleName" />
    <button vui-control="submit" class="btn primary" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr>
	 		<td id="required"><label><ju:txt value="role.name"/>：</label></td>
	    	<td><input type="text" vui-name="roleName" style="width:150px" maxlength="10" vui-editable="display" vui-validate-group="roleNameRequiredDigNum"/></td>
	    </tr>
	    <tr>
	    	<td class="remark-lable"><label><ju:txt value="remark"/>：</label></td>
	    	<td><textarea vui-name="remark" maxlength="200"/></td>
	    </tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>

<script type="text/javascript">
$("button").controlFunctionPrivilege();
var authorizeFunc = function(resourceID,roleID){
	$.ajax({
		url:"toRoleAuthorizeProcess.do",
		data:{"roleID":roleID,resourceID:resourceID},
		dataType:"html",
		success:function(data){
			setPopWindowContent({
				header:"<ju:txt value="button.authorize"/>",
				content:data
			});
			showPopWindow();
		},
		error:function(jqXhr, textStatus, error) {
			alert("加载页面失败！");
			if(console && console.log){
				console.log("Ajax Error - " + textStatus + ", " + error);
			}
		}
	});
};

$("#gridContainer").vgrid({
	url:"roleListProcess.json",
	resourceID:"100045",
	colModel:[
		{name:"roleID", label:"<ju:txt value="role.id"/>",align:"center",hidden:true},
		{name:"roleName", label:"<ju:txt value="role.name"/>",align:"center"},
		{name:"lastUpdateUserID", label:"<ju:txt value="last.update.user"/>",align:"center",data:"user"},
		{name:"lastUpdateTime", label:"<ju:txt value="last.update.time"/>",align:"center",type:"date"}
	],
	caption:"<ju:txt value="role.table"/>",
	cachePage:10,
	rowsPerPage:10,
	dataRoot:"gridRoleList",
	selectable:false,
	searchContainer:"searchContainer",
	functions:{
		create:{url:"roleCreateProcess.json", label:"<ju:txt value="button.create"/>",resourceID:"100041"},
		read:{url:"roleViewProcess.json", label:"<ju:txt value="button.read"/>", param:["roleID"],resourceID:"100044"},
		update:{url:"roleUpdateProcess.json", label:"<ju:txt value="button.update"/>", param:["roleID"],resourceID:"100042"},
		"delete":{url:"roleDeleteProcess.json", label:"<ju:txt value="button.del"/>", param:["roleID"],resourceID:"100043"},
		"authorize":{url:authorizeFunc,label:"<ju:txt value="button.authorize"/>",param:["roleID"],resourceID:"100046"}
	},
	controller:{
		front:["read","update","delete","authorize"],
		bottom:["create"]
	},
	options:{
		user:"userSelectProcess.json?resourceID=100025"
	}
});
</script>
