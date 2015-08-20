<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <table>
		<tr>
			<td align="right"><label><ju:txt value="questionType.type"/>：</label></td><td><select id="questionType" vui-name="typeId" vui-data="questionType"  style="width:130px"><option value=''>请选择</option></select></td>
			<td align="right"><label><ju:txt value="question"/>：</label></td><td><input type="text" vui-name="question"/></td>
			<td></td><td><button vui-control="submit" ><ju:txt value="button.query"/></button></td>
		</tr>
		</table>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
		<tr>
	 		<td id="required"><label><ju:txt value="question"/>：</label></td>
	    	<td><textarea type="text" vui-name="question.question"  vui-validate="required:true"/></td>
	    </tr>
		<tr>
	 		<td id="required"><label><ju:txt value="questionType.type"/>：</label></td>
	    	<td><select id="questionType" vui-name="question.typeId" vui-data="questionType"  style="width:200px"><option value=''>请选择</option></select></td>
	    </tr>
	    <tr>
	 		<td id="required"><label><ju:txt value="question.key.word"/>：</label></td>
	    	<td><input type="text" vui-name="question.keyword"  style="width:200px" vui-validate="required:true"/></td>
	    </tr>
	    <tr>
	 		<td id="required"><label><ju:txt value="question.answer"/>：</label></td>
	    	<td><textarea vui-name="question.answer"  vui-editable="disable" /></td>
	    </tr>
	    <tr>
	    <div id="gridContainer"></div>
	    </tr>
	    <tr>
	    	<td class="remark-lable"><label><ju:txt value="remark"/>：</label></td>
	    	<td><textarea vui-name="question.remark" maxlength="200" style="height:50px"/></td>
	    </tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>

<script type="text/javascript">
var createQuestion = function(resourceID,id){
	$.vAjax({
		url:"toQuestionCreateProcess.do",
		data:{"resourceID":resourceID,"command":"createQuestionAnswer"},
		dataType:"html",
		success:function(data){
			setPopWindowContent({
				header:"新建問題",
				content:data
			});
			showPopWindow();
		},
		error:function(jqXhr, textStatus, error) {
			alert("加載頁面失敗！");
		}
	});
};

$("#gridContainer").vgrid({
	url:"questionListProcess.json",
	resourceID:"424",
	colModel:[
		{name:"id", label:"<ju:txt value="questionType.seq"/>",align:"center",hidden:true},
		{name:"type", label:"<ju:txt value="questionType.type"/>",align:"center"},
		{name:"question", label:"<ju:txt value="question"/>",align:"left"},
		{name:"answer", label:"<ju:txt value="question.answer"/>",align:"left"},
		{name:"keyword", label:"<ju:txt value="question.key.word"/>",align:"left"}
	],
	caption:"<ju:txt value="question.list"/>",
	cachePage:10,
	rowsPerPage:10,
	dataRoot:"list",
	selectable:false,
	searchContainer:"searchContainer",
	functions:{
		createQuestion:{url:createQuestion, label:"<ju:txt value="button.create"/>",resourceID:"100093"},
		read:{url:"questionViewProcess.json", label:"<ju:txt value="button.read"/>", param:["id"],resourceID:"100093"},
		update:{url:"questionUpdateProcess.json", label:"<ju:txt value="button.update"/>", param:["id"],resourceID:"100091"},
		"delete":{url:"questionDeleteProcess.json", label:"<ju:txt value="button.del"/>", param:["id"],resourceID:"100092"}
	},
	controller:{
		end:["read","update","delete"],
		bottom:["createQuestion"]
	},
	options:{
		questionType:"questionTypeSelectProcess.json?resourceID=100084"
	}
});

</script>
