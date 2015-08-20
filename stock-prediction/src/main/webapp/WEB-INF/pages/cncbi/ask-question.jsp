<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
<table>
		<tr>
	 		<td id="required"><label><ju:txt value="question"/>：</label></td>
	    	<td><textarea  vui-name="ask.question"  vui-validate="required:true"/></td>
	    </tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>

<script type="text/javascript">

$("#gridContainer").vgrid({
	url:"askListProcess.json",
	resourceID:"526",
	colModel:[
		{name:"id", label:"<ju:txt value="questionType.seq"/>",align:"center",hidden:true},
		{name:"question", label:"<ju:txt value="question"/>",align:"left"},
		{name:"answer", label:"<ju:txt value="question.answer"/>",align:"left"}
	],
	caption:"<ju:txt value="question.list"/>",
	cachePage:10,
	rowsPerPage:10,
	dataRoot:"list",
	selectable:false,
	searchContainer:"searchContainer",
	functions:{
		create:{url:"askCreateProcess.json", label:"<ju:txt value="button.ask"/>",resourceID:"100121"}
	},
	controller:{
		bottom:["create"]
	},
	options:{
	}
});


</script>
