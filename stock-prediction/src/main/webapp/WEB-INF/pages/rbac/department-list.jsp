<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="department.name"/>：</label>
    <input type="text" class="inputStyle" vui-name="departmentName" />
    <button vui-control="submit" class="btn primary"><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr>
	 		<td id="required"><label><ju:txt value="department.name"/>：</label></td>
	    	<td><input type="text" vui-name="departmentName" style="width:150px" vui-editable="display" maxlength="10" vui-validate-group="departmentNameRequiredDigNum"/></td>
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

$("#gridContainer").vgrid({
	url:"departmentListProcess.json",
	resourceID:"100035",
	colModel:[
		{name:"departmentID", label:"<ju:txt value="department.id"/>",align:"center",hidden:true},
		{name:"departmentName", label:"<ju:txt value="department.name"/>",align:"center"},
		{name:"remark", label:"<ju:txt value="remark"/>",align:"center"}
	],
	caption:"<ju:txt value="department.table"/>",
	cachePage:10,
	rowsPerPage:10,
	dataRoot:"gridDepartmentList",
	selectable:false,
	searchContainer:"searchContainer",
	functions:{
		create:{url:"departmentCreateProcess.json", label:"<ju:txt value="button.create"/>",resourceID:"100031"},
		read:{url:"departmentViewProcess.json", label:"<ju:txt value="button.read"/>", param:["departmentID"],resourceID:"100034"},
		update:{url:"departmentUpdateProcess.json", label:"<ju:txt value="button.update"/>", param:["departmentID"],resourceID:"100031"},
		"delete":{url:"departmentDeleteProcess.json", label:"<ju:txt value="button.del"/>", param:["departmentID"],resourceID:"100033"}
	},
	controller:{
		front:["read","update","delete"],
		bottom:["create"]
	}
});
</script>
