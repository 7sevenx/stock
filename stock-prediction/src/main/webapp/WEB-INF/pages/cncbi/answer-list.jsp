<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- <div id="searchContainer"> -->
<!--     <table> -->
<!-- 		<tr> -->
<%-- 			<td align="right"><label><ju:txt value="question.key.word"/>：</label></td><td><input type="text" vui-name="tellerId"/></td> --%>
<%-- 			<td align="right"><label><ju:txt value="question.answer"/>：</label></td><td><input type="text" vui-name="tellerId"/></td> --%>
<%-- 			<td></td><td><button vui-control="submit" ><ju:txt value="button.query"/></button></td> --%>
<!-- 		</tr> -->
<!-- 		</table> -->
<!-- </div> -->
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
<table>
		<tr>
	 		<td id="required"><label><ju:txt value="question.answer"/>：</label></td>
	    	<td><textarea type="text" vui-name="answer.answer" vui-validate="required:true"/></td>
	    </tr>
	    <tr>
	    	<td class="remark-lable"><label><ju:txt value="remark"/>：</label></td>
	    	<td><textarea vui-name="answer.remark" /></td>
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
		data:{"resourceID":resourceID,"command":"createQuestion","id":id},
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

var createAnswer = function(resourceID,id){
	$.vAjax({
		url:"toAnswerCreateProcess.do",
		data:{"resourceID":resourceID,"command":"createAnswer"},
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
	url:"answerListProcess.json",
	resourceID:"426",
	colModel:[
		{name:"id", label:"<ju:txt value="question.answer"/>",align:"center",hidden:true},      
		{name:"answer", label:"<ju:txt value="question.answer"/>",align:"left"},
		{name:"remark", label:"<ju:txt value="remark"/>",align:"left"}
	],
	caption:"<ju:txt value="answer.list"/>",
	cachePage:10,
	rowsPerPage:10,
	dataRoot:"list",
	selectable:false,
	searchContainer:"searchContainer",
	functions:{
		"createAnswer":{url:createAnswer, label:"<ju:txt value="button.create"/>" ,resourceID:"100101"},
		read:{url:"answerViewProcess.json", label:"<ju:txt value="button.read"/>", param:["id"],resourceID:"100102"},
		update:{url:"answerUpdateProcess.json", label:"<ju:txt value="button.update"/>", param:["id"],resourceID:"100103"},
		"delete":{url:"answerDeleteProcess.json", label:"<ju:txt value="button.del"/>", param:["id"],resourceID:"100104"},
		"createQuestion":{url:createQuestion, label:"<ju:txt value="button.create.question"/>", param:["id"],resourceID:"100105"}
	},
	controller:{
		end:["read","update","delete","createQuestion"],
		bottom:["createAnswer"]
	},
	options:{
	}
});


</script>
