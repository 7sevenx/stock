<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib"%>
<style>
.password {
	background: #fff;
	box-shadow: 0 0 8px #666;
	border-radius: 6px;
	padding: 60px;
	font-size: 14px;
	font-weight: blod;
	/*ie7*/
	*z-index: 1;
}
</style>

<div class="password">
	<center>
		<form id="resetPassword">
			<table>
				<tr>
					<td><label>登陆名称：</label>
					</td>
					<td><input type="text" id="loginName" vui-name="loginName" name="loginName" vui-validate="required:true" style="width: 150px"></input>
					</td>
				</tr>
			</table>
		</form>

	</center>
	<br />
	<div class="vui-vgrid-controller">
		<button class="btn primary" id="submitButton" onclick="closePopWindow()">重置</button>
	</div>
<script type="text/javascript">
	$("#resetPassword").vvalidate({
		position:"right"
	});
	
	$(function(){
		$("#submitButton").click(function() {
			if($("#resetPassword").vgetValidateStatus()){
				var loginName = $("#loginName").val();
				$.vAjax({
					url : "resetPasswordProcess.json?resourceID="
							+ 100061 + "&loginName="
							+ loginName,
					success : function(data) {
						var result = data.result;
						if (result == 1) {
							alert("密码重置成功！");
							$("#loginName").val("");
						} else if (result == 0) {
							alert("密码重置失败！");
						} 
					}
				});
			}
		});
	});
</script>