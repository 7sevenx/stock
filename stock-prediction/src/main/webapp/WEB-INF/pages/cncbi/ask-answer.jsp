<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- <div id="searchContainer"> -->
<!--     <table> -->
<!-- 		<tr> -->
<%-- 			<td align="right"><label><ju:txt value="question"/>：</label></td><td><input type="text" vui-name="question"/></td> --%>
<%-- 			<td></td><td><button vui-control="submit" ><ju:txt value="button.query"/></button></td> --%>
<!-- 		</tr> -->
<!-- 		</table> -->
<!-- </div> -->
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
<table>
		<tr>
	 		<td id="required"><label><ju:txt value="question"/>：</label></td>
	    	<td><textarea type="text" vui-name="ask.question"  vui-editable="display" maxlength="10" vui-validate="required:true"/></td>
	    </tr>
	    <tr>
	 		<td id="required"><label><ju:txt value="question.answer"/>：</label></td>
	    	<td><textarea type="text" vui-name="ask.answer"  calss="answer"   vui-validate="required:true"/></td>
<!-- 	   		<div class="div"> -->
<!-- 	   		<ul> -->
<%-- 	   			<c:forEach var="on" items="${answerList}" varStatus="status"> --%>
	   				
<%-- 	   				<li>${on.answer}</li> --%>
<%-- 	   			</c:forEach> --%>
<!-- 	   		</ul> -->
<!-- 	   		</div> -->
	    </tr>
	    <tr>
	    	<td class="remark-lable"><label><ju:txt value="remark"/>：</label></td>
	    	<td><textarea vui-name="ask.remark" maxlength="200" style="height:50px"/></td>
	    </tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>

<script type="text/javascript">

$("#gridContainer").vgrid({
	url:"askAnswerListProcess.json",
	resourceID:"524",
	colModel:[
		{name:"id", label:"<ju:txt value="questionType.seq"/>",align:"center",hidden:true},
		{name:"question", label:"<ju:txt value="question"/>",align:"left"},
		{name:"answer", label:"<ju:txt value="question.answer"/>",align:"left"},
		{name:"askerId", label:"<ju:txt value="ask.asker.id"/>",align:"left"},
		{name:"askedTime", label:"<ju:txt value="ask.asked.time"/>",align:"center"}
	],
	caption:"<ju:txt value="question.list"/>",
	cachePage:10,
	rowsPerPage:10,
	dataRoot:"list",
	selectable:false,
	searchContainer:"searchContainer",
	functions:{
		update:{url:"askUpdateProcess.json", label:"<ju:txt value="button.answer"/>", param:["id"],resourceID:"100141"},
		read:{url:"askViewProcess.json", label:"<ju:txt value="button.update"/>", param:["id"],resourceID:"100141"}
	},
	controller:{
		end:["update"]
	},
	options:{
	}
});


</script>
