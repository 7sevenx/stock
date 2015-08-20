<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- <div id="searchContainer"> -->
<%--     <label><ju:txt value="question.type"/>：</label> --%>
<!--     <input type="text" class="inputStyle" vui-name="departmentName" /> -->
<%--     <button vui-control="submit" class="btn primary"><ju:txt value="button.query"/></button> --%>
<!-- </div> -->
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr>
	 		<td id="required"><label><ju:txt value="questionType.type"/>：</label></td>
	    	<td><input type="text" vui-name="questionType.type" style="width:150px"  maxlength="10" vui-validate="required:true"/></td>
	    </tr>
	    <tr>
	 		<td id="required"><label><ju:txt value="questionType.seq"/>：</label></td>
	    	<td><input type="text" vui-name="questionType.seq" style="width:150px"  maxlength="10" vui-validate="required:true"/></td>
	    </tr>
	    <tr>
	    	<td class="remark-lable"><label><ju:txt value="remark"/>：</label></td>
	    	<td><textarea vui-name="questionType.remark" maxlength="200"/></td>
	    </tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>

<script type="text/javascript">

$("#gridContainer").vgrid({
	url:"questionTypeListProcess.json",
	resourceID:"423",
	colModel:[
		{name:"id", label:"<ju:txt value="questionType.id"/>",align:"center",hidden:true},     
		{name:"seq", label:"<ju:txt value="questionType.seq"/>",align:"center"},
		{name:"type", label:"<ju:txt value="questionType.type"/>",align:"center"},
		{name:"remark", label:"<ju:txt value="remark"/>",align:"left"}
	],
	caption:"<ju:txt value="questionType.list"/>",
	cachePage:10,
	rowsPerPage:10,
	dataRoot:"list",
	selectable:false,
	searchContainer:"searchContainer",
	functions:{
		create:{url:"questionTypeCreateProcess.json", label:"<ju:txt value="button.create"/>",resourceID:"100081"},
		read:{url:"questionTypeViewProcess.json", label:"<ju:txt value="button.read"/>", param:["id"],resourceID:"100084"},
		update:{url:"questionTypeUpdateProcess.json", label:"<ju:txt value="button.update"/>", param:["id"],resourceID:"100082"},
		"delete":{url:"questionTypeDeleteProcess.json", label:"<ju:txt value="button.del"/>", param:["id"],resourceID:"100083"}
	},
	controller:{
		end:["read","update","delete"],
		bottom:["create"]
	}
});
</script>
