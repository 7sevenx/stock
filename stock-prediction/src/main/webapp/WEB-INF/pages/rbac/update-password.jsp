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
		<form id="updatePassword">
			<table>
				<tr>
					<td><label>原密码：</label>
					</td>
					<td><input type="password" id="oldPassword" name="oldPassword"  vui-validate="required:true" vui-name="oldPassword"
						style="width: 150px"></input>
					</td>
				</tr>
				<tr>
					<td><label>新密码：</label>
					</td>
					<td><input type="password" id="newPassword" vui-name="newPassword"
						name="newPassword" style="width: 150px"  vui-validate="required:true"></input>
					</td>
				</tr>
				<tr>
					<td><label>确认新密码：</label>
					</td>
					<td><input type="password" id="newPassword1" vui-name="newPassword1"
						name="newPassword1" style="width: 150px"  vui-validate="required:true"></input>
					</td>
					<span id="mess" style="color: red; font-weight: blod;"></span>
				</tr>
			</table>
		</form>

	</center>
	<br />
	<div class="vui-vgrid-controller">
		<button id="submitButton" class="btn primary" resourceID="100051">
			<ju:txt value="button.submit" />
		</button>
<!-- 		<button class="btn primary" onclick="closePopWindow()">重置</button> -->
	</div>
	<script type="text/javascript">
	$("#updatePassword").vvalidate({
		position:"right"
	});
	$("button").controlFunctionPrivilege();
		$(function() {
			$("#oldPassword").focus(function(){
				$("#mess").html("");
			});
			
			$("#newPassword1").blur(function() {
				var newPassword = $("#newPassword").val();
				var newPassword1 = jQuery("#newPassword1").val();
				if (newPassword != newPassword1) {
					var messageHtml = "两次输入密码不同";
					$("#mess").html(messageHtml);
				} else {
					$("#mess").html("");
				}

			});
			$("#submitButton").click(function() {
				if($("#updatePassword").vgetValidateStatus()){
				var oldPassword = jQuery("#oldPassword").val();
				var newPassword = $("#newPassword").val();
				var newPassword1 = jQuery("#newPassword1").val();
						if (newPassword != newPassword1) {
							var messageHtml = "两次输入密码不同";
							$("#mess").html(messageHtml);
						} else{
								$.vAjax({
									url : "updatePasswordProcess.json?resourceID="
											+ 100051 + "&oldPassword="
											+ oldPassword + "&newPassword="
											+ newPassword,
									success : function(data) {
										var result = data.result;
										if (result == 1) {
											alert("密码修改成功！");
											$("#oldPassword").val("");
											$("#newPassword").val("");
											$("#newPassword1").val("");
										} else if (result == 0) {
											alert("密码修改失败！");
										} else if (result =="password.error") {
											$("#mess").html("原密码错误！");
										}
									}
								});
							}
				}
					});
		});
	</script>