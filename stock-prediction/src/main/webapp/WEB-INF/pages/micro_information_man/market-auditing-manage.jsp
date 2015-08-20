<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

.marketInfoForm{
	width:600px;
}

.marketInfoForm input{
width:400px;
}

.marketInfoForm textarea{
	width:450px;
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

</style>
<input id="topicIdField" type="hidden" value="<% out.print(request.getParameter("topicId")); %>" />
<input id="auditingField" type="hidden" value="<% out.print(request.getParameter("auditingStatus")); %>"/>
<input id="pubStatusField" type="hidden" value="<% out.print(request.getParameter("pubStatus")); %>" />
<div id="subInfoContainer"></div>
<br/>
<div id="subInfoForm" class="marketInfoForm" >
<c:forEach items="${result}" var="tw">
	<fieldset>
		<legend>子信息</legend>
		<table>
			<tr>
				<td width="100px"><label>标题：</label></td><td align="left">${tw.title}</td>
			</tr>
			<tr>
				<td><label>缩略图：</label></td>
				<td align="left">
					<input vui-name="imgName" value="thumbPic"  class="imgName" type="hidden"/>
					<input id="subId" vui-name="subId" value="${tw.subId}" class="imgUrl" type="hidden"/>
					<button type="button" class="btn primary preview">预览</button>
				</td>
			</tr>
			<tr>
				<td><label>介绍图片：</label></td>
				<td align="left">
					<input vui-name="imgName" value="descbPic" class="imgName" type="hidden"/>
					<input id="subId" vui-name="subId" value="${tw.subId}" class="imgUrl" type="hidden"/>
					<button type="button" class="btn primary preview">预览</button>
				</td>
			</tr>
			<tr>
				<td><label>介绍文字一：</label></td><td align="left">${tw.introOne}</td>
			</tr>
			<tr>
				<td><label>介绍文字二：</label></td><td align="left">${tw.introSed}</textarea></td>
			</tr>
			<tr>
				<td><label>引用链接：</label></td><td align="left">${tw.link}</td>
			</tr>
		</table>
	</fieldset>
</c:forEach>
</div>
<div id="makretRemark" class="marketInfoForm">
	<table id="table-market-remark">
		<tr>
			<td><label>审核意见：</label></td>
			<td><textarea id="marketAuditRemark" vui-name="remark" vui-validate="required:true"  onkeyup="checkInput(this,100)" onchange="checkInput(this,100)"><% out.print(request.getParameter("remark")); %></textarea></td>
		</tr>
	</table>
</div>
<br/>
<div id="previewForm" class="marketInfoForm">
		<table id="previewFormTable" style="display:none">
		<tr>
			<td><label >证件号码：</label>
			</td>
			<td><input id="certId" type="text" vui-validate="required:true"  maxlength="20"/>
			</td>
		</tr>
		</table>
</div>
<div class="vui-vgrid-controller">
	<table width="90%">
		<tr>
			<td align="right"><button id="previewButton" class="btn primary" type="button"><ju:txt value="发送至微信预览"/></button></td>
			<td align="center"><button id="auditingAdopt" vui-flag="2" class="btn primary"><ju:txt value="通过"/></button></td>
			<td align="center"><button id="auditingRefuse" vui-flag="3" class="btn primary"><ju:txt value="拒绝"/></button></td>
			<td align="left"><button class="btn cancel" onclick="closePopWindow()"><ju:txt value="关闭"/></button></td>
		</tr>
	</table>
</div>
<script>

(function($,window){
	
	var auditingStatus=$("#auditingField").val();
	var pubStatus = $("#pubStatusField").val();
	
	if(auditingStatus=="1"){
		$("#table-market-remark").css("display","table");
		$("#auditingAdopt").css("display","table");
		$("#auditingRefuse").css("display","table");
	}else{
		$("#table-market-remark").css("display","none");
		$("#auditingAdopt").css("display","none");
		$("#auditingRefuse").css("display","none");
		if(pubStatus == "1"){
			$("#previewButton").css("display","none");
		}
	}
	
	var previewFormTableStatus = false;
	$("#previewButton").click(function(e){
		if(!previewFormTableStatus){
			previewFormTableStatus = true;
			$("#previewFormTable").css("display","table");
			return;
		}
		$.vAjax({
			url:"dbPreviewMarket.json",
			data:{"topicId":$("#topicIdField").val(),"certId":$("#certId").val(),"resourceID":"300025"},
			success:function(data){
				var msg = data["MESSAGE"];
				if(data && data.result && !msg){
					if(data.result){
						alert("发送成功");
						$("#subInfoContainer").trigger("reloadGrid");
					}
				}
				else{
					if(msg)
						alert(msg);
					//alert("发送失败");
				}
			},
			error:function(){
				alert("发送失败");
			}
		});
   	});
	
	$("#auditingAdopt,#auditingRefuse").click(function(e){
		var status = $(this).attr("vui-flag");
		$.vAjax({
			url:"updateMarketInfo.json",
			data:{auditingStatus:status,topicId:$("#topicIdField").val(),remark:$("#marketAuditRemark").val(),resourceID:"200031"},
			success:function(data){
				if(data){
					if(data.result){
						if(status=="2"){
							alert("审核通过");
						}else{
							alert("审核拒绝");
						}
						$("#gridContainer").trigger("reloadGrid");
					}
					else
						alert("审核失败");
				}
				closePopWindow(function(){$("#gridContainer").trigger("reloadGrid");});
			},
			error:function(){
				alert("页面加载失败");
			}
		});
	});
	
	$(".preview").click(function(e){
		var $el = $(e.target),
		parent = $el.parent(),
		imgUrl = parent.find(".imgUrl").val();
		imgName = parent.find(".imgName").val();
		if(imgUrl){
			var img = new Image();
			img.onload = function(e){
				var div = $("<div>");
				div.css({
					width:"100%",
					height:"100%",
					position:"fixed",
					top:"0",
					left:"0"
				});
				var div2 = div.clone();
				div2.css({
					background:"#000",
					opacity:"0.6"
				});
			
				div.click(function(e){
					$(this).remove();
				});
				var top = -(img.height / 2),left = -(img.width /2);
				
				$(img).css({
					position:"absolute",
					left:"50%",
					top:"50%",
					marginTop:top,
					marginLeft:left
				});
				div.append(div2);
				div.append(img);
				$("body").append(div);
			};
			img.src = "getMarketSubInfoImg.do?subId=" + imgUrl+"&imgName="+imgName+"&resourceID="+200011;
		}else{
			parent.find(".file").click();
		}		
	});
})(jQuery,window);

</script>