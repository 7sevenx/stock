<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<style>
<!--
.marketInfoForm input,.marketInfoForm textarea{
width:400px;
}
.vui-file-upload{ 
	width:400px;
}

.vui-file-upload .txt{ 
	width:245px;
}

.vui-file-upload .file{ 
	right:85px; 
	width:315px;
}
-->
</style>
<div id="marketInfoForm" class="marketInfoForm">
	<fieldset>
		<table>
			<tr>
				<td><label>资讯主题：</label></td><td><input type="text" vui-name="title"  maxlength="30"/></td>
			</tr>
			<tr>
				<td><label>资讯类型：</label></td><td><select id="infoTypeSelect" vui-name="infoType"></select></td>
			</tr>
		</table>
	</fieldset>
	<fieldset id="firstSubInfo">
		<legend>子信息</legend>
		<table>
			<tr>
				<td><label>标题：</label></td><td><input type="text" vui-name="subTitle" vui-validate="required:true"  maxlength="30"/></td>
			</tr>
			<tr>
				<td><label>缩略图：</label></td>
				<td>
					<div class="vui-file-upload">
						<form action="" method="post" enctype="multipart/form-data" target="targetFrame1-1">
						    <input type="text" vui-name="thumbPic" class="txt" />  
						    <button type="button" class="btn normal">导入</button>
						    <input type="file" name="fileField" class="file" />
						    <button type="submit" class="btn primary">预览</button>
						</form>
						<iframe name="targetFrame1-1"></iframe>
					</div>
				</td>
			</tr>
			<tr>
				<td><label>介绍图片：</label></td>
				<td>
					<div class="vui-file-upload">
						<form action="" method="post" enctype="multipart/form-data" target="targetFrame1-2">
						    <input type="text" vui-name="descPic" class="txt" />  
						    <button type="button" class="btn normal">导入</button>
						    <input type="file" name="fileField" class="file" />
						    <button type="submit" class="btn primary">预览</button>
						</form>
						<iframe name="targetFrame1-2"></iframe>
					</div>
				</td>
			</tr>
			<tr>
				<td><label>介绍文字一：</label></td><td><input type="text" vui-name="description1"  maxlength="100"/></td>
			</tr>
			<tr>
				<td><label>介绍文字二：</label></td><td><textarea vui-name="description2"  onkeyup="checkInput(this,4000)" onchange="checkInput(this,4000)"></textarea></td>
			</tr>
			<tr>
				<td><label>引用链接：</label></td><td><input type="text" vui-name="link"  maxlength="100"/></td>
			</tr>
		</table>
	</fieldset>
</div>
<div class="vui-vgrid-controller">
	<button id="addButton" class="btn normal"><ju:txt value="添加子信息"/></button>
    <button id="submitButton" class="btn primary"><ju:txt value="保存"/></button>
   	<button class="btn cancel" onclick="closePopWindow()"><ju:txt value="button.cancel"/></button>
</div>
<script>

(function($,window){
	$.vAjax({
		url:"marketTypeSelect.json?resourceID=200011",
		type:"GET",
		success:function(data){
			if(data.result)
				data = data.result;
			if(data.length > 0){
				var html = "";
				
				for(var d = 0,dLen = data.length;d < dLen;d++){
					html += "<option value='" + data[d].value + "'>" + data[d].name + "</option>";
				}

				$("#infoTypeSelect").html(html);								
			}else{
				$.vLog("资讯类型没有数据!");
			}
		}
	});
	
	var newForm = 0;

	$("#addButton").click(function(e){
		if(newForm < 9){
			var delBtn = $("<button class='btn cancel' type='button'>删除</button>");
			delBtn.click(function(e){
				$(this).parent().remove();
				newForm--;
			});
			
			var child = $("#firstSubInfo").clone(true).removeAttr("id");
			child.find("input,textarea").val("").removeAttr("checked");
			
			$("#marketInfoForm").append(child.append(delBtn));
			$("#marketInfoForm").vvalidate();
			newForm++;
		}
	});
	
	$("#marketInfoForm").vvalidate();
	
	$("#submitButton").click(function(e){
		if($("#marketInfoForm").vgetValidateStatus()){
			$.vLog($("#marketInfoForm").serialize());
		}
	});
	
	$(".file").change(function(e){
		var $el = $(e.target);
		
		$el.prev().prev().val($el.val());
	});
})(jQuery,window);

</script>