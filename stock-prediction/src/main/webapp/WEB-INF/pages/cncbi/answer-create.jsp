<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>

<input id="command" type="hidden" value="${command}" />
<form id="answerForm">
		<table>
			<tr>
		 		<td id="required"><label><ju:txt value="question"/>：</label></td>
		    	<td><textarea type="text" id="question" vui-name="answer.question"/></td>
	    	</tr>
	    	<tr id="typeLabel" style="display:none">
	    		<td><label><ju:txt value="questionType.type"/></label></td>
	    		<td><select id="questionType" vui-name="answer.typeId" vui-validate="required:true" style="width:200px"></select></td>
	    	</tr>
	    	<tr id="keywordLabel" style="display:none">
		 		<td><label><ju:txt value="question.key.word"/>：</label></td>
		    	<td><input type="text" id="keyword" vui-name="answer.keyword" style="width:400px" /></td>
	    	</tr>
	    	<tr>
	    		<td id="required"><label><ju:txt value="question.answer"/>：</label></td>
		    	<td><textarea type="text" id="answer" vui-name="answer.answer" vui-validate="required:true"/></td>
	    	</tr>
	    	<tr>
		    	<td class="remark-lable"><label><ju:txt value="remark"/>：</label></td>
		    	<td><textarea id="remark" name="remark" vui-name="remark" style="height:50px" maxlength="200"/></td>
	    	</tr>
		</table>
	</form>
	<div class="vui-vgrid-controller">
	      <button id="submitButton" class="btn primary"><ju:txt value="button.submit"/></button>
   		  <button class="btn cancel" onclick="closePopWindow()"><ju:txt value="button.cancel"/></button>
	</div>

<script type="text/javascript">
(function($){
	var getQuestionType=function(){
		$.vAjax({
			url:"questionTypeSelectProcess.json?resourceID=100084",
			success:function(data){
				var questionTypes = data.result || [];
				
				var questionTypesHTML = "<option value=''>请选择</option>";
				
				for(var i = 0; i < questionTypes.length; i++){
					questionTypesHTML += "<option value='" + questionTypes[i].value + "'>" + questionTypes[i].name + "</option>";
				}
				
				$("#questionType").html(questionTypesHTML);
			}
		});
	};
	var command=$("#command").val();
	if(command=="createAnswer"){
		$("#question").blur(function(){
			var question = $(this).val();
			if(question&&question!=""&&question!=null){
				getQuestionType();
				$("#typeLabel").show();
				$("#questionType").attr("vui-validate","");
				$("#keywordLabel").show();
			}else{
				$("#typeLabel").hide();
				$("#keywordLabel").hide();
			}
		});
	}
	
	if(command=="createAnswer"){
		$("#submitButton").click(function(){
			if($("#answerForm").vgetValidateStatus()){
				var createParams = {};
				var question =$("#question").val();
				if(question){
					createParams[$("#question").attr("vui-name")]=question;
					createParams[$("#questionType").attr("vui-name")]=$("#questionType").val();
					createParams[$("#keyword").attr("vui-name")]=$("#keyword").val()||"";
				};
				createParams[$("#answer").attr("vui-name")]=$("#answer").val();
				createParams[$("#remark").attr("vui-name")]=$("#remark").val()||"";
				$.vAjax({
					url:"answerCreateProcess.json?resourceID=100101",
					data:createParams,
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
