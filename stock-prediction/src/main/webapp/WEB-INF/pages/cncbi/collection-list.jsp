<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="gridContainer"></div>

<script type="text/javascript">
var collectQuestion = function(resourceID,id){
	$.vAjax({
		url:"toCollectQuestionProcess.do",
		data:{"resourceID":resourceID,"command":"collectQuestion","id":id},
		dataType:"html",
		success:function(data){
			setPopWindowContent({
				header:"問題學習",
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
	url:"collectQuestionListProcess.json",
	resourceID:"442",
	colModel:[
	    {name:"id",label:"<ju:txt value="ID"/>",align:"left",hidden:false},
		{name:"question", label:"<ju:txt value="question"/>",align:"left"},
		{name:"count", label:"<ju:txt value="question.count"/>",align:"center"}
	],
	caption:"<ju:txt value="collection.question.list"/>",
	cachePage:10,
	rowsPerPage:10,
	dataRoot:"list",
	selectable:false,
	searchContainer:"searchContainer",
	functions:{
		"collectQuestion":{url:collectQuestion, label:"<ju:txt value="button.collect"/>",param:["id"],resourceID:"100093"}
	},
	controller:{
		end:["collectQuestion"]
	},
	options:{
		questionType:"questionTypeSelectProcess.json?resourceID=100084"
	}
});

</script>
