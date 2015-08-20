<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>

	<input type="text" name="roleID" id="roleId" style="display:none" value="${roleID}"></s:hidden>
	<input type="text" name="resourceID" id="resourceId" style="display:none" value="${resourceID}"></s:hidden>
	<input type="text" id="privilege" name="privilegeIds" style="display:none" ></s:hidden>
	<label><ju:txt value="role.name"/>：</label>
	<span>${roleName} </span>
	<br></br>
	<label><ju:txt value="menu.function.privilege"/>：</label>
	<ul id="menu_tree" class="ztree"></ul>
	<button class="btn primary" onclick="getCheckedValues()"><ju:txt value="button.submit"/></button>
	<button class="btn cancel" onclick="closePopWindow()"><ju:txt value="button.cancel"/></button>
<script type="text/javascript">
	var menuzTreeObj;// 树对象   
	var menuzNodes;// 树节点，
	var roleID = jQuery("#roleId").val();
	$(document).ready(
			function() {
				var setting = {
					check : {
						enable : true
					},
					data : {
						simpleData : {
							enable : true
						}
					}
				};

				$(function() {
					//页面加载时候发起ajax请求，获取树形菜单的数据   
					$.ajax({
						url : "roleTreeProcess.json?resourceID=100046",
						data:{"roleID":roleID},
						type : "post",
						dataType : "json",
						global : false,
						async : false,
						success : function(data) {
							menuzNodes = eval(data.menuNodes);
						}
					});
					menuzTreeObj = $.fn.zTree.init($("#menu_tree"), setting,
							menuzNodes);
				});
			});
	//获得选中的权限
	function getCheckedValues() {
		var values = "";
		for ( var i = 0, j = menuzNodes.length; i < j; i++) {
			var nodes = menuzTreeObj.getNodeByParam("id", menuzNodes[i].id,
					null);
			if (nodes.checked == true) {
				if (values == "") {
					values = nodes.id;
				} else {
					values = values + "," + nodes.id;
				}
			}
		}
		var valuesIds = encodeURI(values);
		$("#privilege").val(valuesIds);
		$.getJSON("roleAuthorizeProcess.json?roleID="+$("#roleId").val()+"&privilegeIds="+valuesIds+"&resourceID="+$("#resourceId").val(),function(data){
			if(data.result){
				alert("授权成功！");
				closePopWindow();
			}
		});
	}
</script>
