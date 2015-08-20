<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<style>
.vui-vgrid-table table th{
	height:29px;
	border-bottom:1px solid #2b2b2b;
	padding:0 10px;
}
</style>
<input id="command" type="hidden" value="${command}" />
<input id="id" type="hidden" value="${id}" />
<input id="collectQuest" type="hidden" value="${question}"/>
<div id="questionForm">
		<table>
			<tr>
		 		<td id="required"><label><ju:txt value="question"/>：</label></td>
		    	<td><textarea  id="questionCreate" vui-name="question"  width="400px" height="100px" vui-validate="required:true"/></td>
	    	</tr>
	    	<tr>
	    		<td><label><ju:txt value="questionType.type"/></label></td>
	    		<td ><select id="typeId" vui-name="typeId" name="typeId" style="width:200px" vui-validate="required:true" width="200px"></select></td>
	    	</tr>
	    	<tr id="answerLabel" style="display:none">
		    	<td><label><ju:txt value="question.answer.keyword"/>：</label></td>
		    	<td style="width:400px"><input type="text" id="answerQuery" vui-name="answerQuery" style="width:280px"/><button id="query"  class="btn primary"><ju:txt value="button.query"/></button></td>
	    	</tr>
	    	<tr id="answerList" style="display:none">
	    		<td id="required"><label><ju:txt value="question.answer"/>：</label></td>
		    	<td><select id="answer" vui-name="answer" style="width:400px" vui-validate="required:true"/></td>
	    	</tr>
	    	<tr>
		 		<td><label><ju:txt value="question.key.word"/>：</label></td>
		    	<td><input type="text" id="keywordCreate" vui-name="keyword" name="keyword" style="width:400px"   vui-validate="required:true"/></td>
	    	</tr>
	    	<tr>
		    	<td class="remark-lable"><label><ju:txt value="remark"/>：</label></td>
		    	<td><textarea id="remark" name="remark" vui-name="remark" style="height:50px" maxlength="200"/></td>
	    	</tr>
		</table>
	</div>
	<div class="vui-vgrid-controller">
	      <button id="submitButton" class="btn primary"><ju:txt value="button.submit"/></button>
   		  <button class="btn cancel" onclick="closePopWindow()"><ju:txt value="button.cancel"/></button>
	</div>

<script type="text/javascript">
(function($){
	$("#questionForm").vvalidate({
		position:"right"
	});
	var getQuestionType=function(){
		$.vAjax({
			url:"questionTypeSelectProcess.json?resourceID=100084",
			success:function(data){
				var questionTypes = data.result || [];
				
				var questionTypesHTML = "<option value=''>请选择</option>";
				
				for(var i = 0; i < questionTypes.length; i++){
					questionTypesHTML += "<option value='" + questionTypes[i].value + "'>" + questionTypes[i].name + "</option>";
				}
				$("#typeId").html(questionTypesHTML);
			}
		});
	};
	
	var getAnswer=function(answer){
		$.vAjax({
			url:"getAnswerSelectProcess.json?resourceID=100093",
			data:{"answer":answer},
			success:function(data){
				var answers = data.result || [];
				
				var answerTypesHTML = "<option value=''>请选择</option>";
				
				for(var i = 0; i < answers.length; i++){
					if(answers[i].name.length>40){
						answerTypesHTML += "<option value='" + answers[i].value + "'>" + (answers[i].name).substring(0, 40)+"..." + "</option>";
					}else{
						answerTypesHTML += "<option value='" + answers[i].value + "'>" + answers[i].name + "</option>";
					}
				}
				$("#answer").html(answerTypesHTML);
			}
		});
	};
	
	var command=$("#command").val();
	if(command=="createQuestion"){
		$("#answer").removeAttr("vui-validate");
		getQuestionType();
	}
	
	if(command=="createQuestionAnswer"){
		$("#answerLabel").show();
		getQuestionType();
		$("#query").click(function(){
			var answer=$("#answerQuery").val();
			$("#answerList").show();
			getAnswer(answer);
		});
		
	}
	
	if(command=="collectQuestion"){
		var question=$("#collectQuest").val();
		var questionHTML="<div class='remark-input'><span class='remark-input' id='questionSpan'>" + question + "</span></div>";
		$("#questionCreate").after(questionHTML).remove();
		$("#answerLabel").show();
		getQuestionType();
		$("#query").click(function(){
			$("#answer").attr("vui-validate","required:true");
			var answer=$("#answerQuery").val();
			$("#answerList").show();
			getAnswer(answer);
		});
	}
	
	if(command=="createQuestion"||command=="createQuestionAnswer"||command=="collectQuestion"){
		$("#submitButton").click(function(){
			if($("#questionForm").vgetValidateStatus()){
				var id= $("#id").val();
				var question="";
				if(command=="collectQuestion"){
					question=$("#questionSpan").text();
				}else{
					question=$("#questionCreate").val();
				}
				var typeId=$("#typeId").val();
				var keyword=$("#keywordCreate").val();
				var remark=$("#remark").val();
				var answer=$("#answer").val();
				var data="";
				if(!answer||answer==""||answer==null){
				   data={"id":id,"question":question,"typeId":typeId,"keyword":keyword,"remark":remark};
				}else{
					data={"id":answer,"question":question,"typeId":typeId,"keyword":keyword,"remark":remark};
				}
				$.vAjax({
					url:"questionCreateProcess.json?resourceID=100093",
					data:data,
					success:function(data){
						var result = data.result || false;
						if(result && result != "false"){
							alert("保存成功。");
							$("#gridContainer").trigger("reloadGrid");
							closePopWindow();
						}else{
							alert("保存失败！");
						}
					}
				});
			};
		});
	}
})(jQuery);
</script>
