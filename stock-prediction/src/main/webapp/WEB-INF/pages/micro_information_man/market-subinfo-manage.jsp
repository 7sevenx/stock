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
<input id="topicIdField" type="hidden" name="topicId" value="<% out.print(request.getParameter("topicId")); %>" />
<input id="auditingStatusField" type=hidden value="<% out.print(request.getParameter("auditingStatus")); %>" />
<input id="pubStatusField" type=hidden value="<% out.print(request.getParameter("pubStatus")); %>" />
<div id="subInfoContainer"></div>
<br/>
<div id="subInfoForm" class="marketInfoForm">
	<fieldset>
		<legend>子信息</legend>
		<table>
			<tr>
				<td id="required"><label>标题：</label></td><td><input id="infoTitle" type="text" vui-name="subTitle" maxlength="30" vui-validate="required:true"/></td>
			</tr>
			<tr>
				<td><label>缩略图：</label></td>
				<td>
					<div class="vui-file-upload">
						<form action="upload.do" method="post" enctype="multipart/form-data" target="frameFile">
						    <input id="thumbPicDisplay" type="text" vui-name="thumbPic" class="txt" vui-validate="required:true"/>  
						    <button type="button" class="btn normal">导入</button>
						    <input type="file" name="fileField" class="file" />
						    <input type="hidden" name="returnField" value="thumbPicInput" />
						    <input type="hidden" name="resourceID" value="200015" />
						     <input type="hidden" name="imgFlag" value="BRVY_IMAGE" />
						    <input id="thumbPicInput" vui-name="thumbPicId" class="imgUrl" type="hidden" />
						    <input  type="hidden" name="topicId" value="<% out.print(request.getParameter("topicId")); %>" />
						    <input vui-name="imgName" value="thumbPic"  class="imgName" type="hidden"/>
						    <button type="button" class="btn primary preview">预览</button>
						    <button type="button" class="btn primary readpreview" style="display:none">预览</button>
						    <iframe id='frameFile' name='frameFile' style='display:none;'></iframe>
						    <input type="hidden" id="subId1" name="subId" class="subId"/>
						</form>
						<iframe name="targetFrame1" ></iframe>
					</div>
				</td>
			</tr>
			<tr>
				<td><label>介绍图片：</label></td>
				<td>
					<div class="vui-file-upload">
						<form action="upload.do" method="post" enctype="multipart/form-data" target="targetFrame2">
						    <input id="descPicDisplay" type="text" vui-name="descPic" class="txt" vui-validate="required:true"/>  
						    <button type="button" class="btn normal">导入</button>
						    <input type="file" name="fileField" class="file" />
						    <input type="hidden" name="returnField" value="descPicInput" />
						    <input type="hidden" name="resourceID" value="200015" />
						    <input type="hidden" name="imgFlag" value="INTRO_IMAGE" />
						    <input id="descPicInput" vui-name="descPicId" class="imgUrl" type="hidden" />
						    <input  type="hidden" name="topicId" value="<% out.print(request.getParameter("topicId")); %>" />
						    <input vui-name="imgName" value="descbPic" class="imgName" type="hidden"/>
						    <button type="button" class="btn primary preview">预览</button>
						    <button type="button" class="btn primary readpreview" style="display:none">预览</button>
						    <input  type="hidden" id="subId2" name="subId" class="subId"/>
						</form>
						<iframe name="targetFrame2"></iframe>
					</div>
				</td>
			</tr>
			<tr>
				<td><label>介绍文字一：</label></td><td><input id="infoDesc1" type="text" vui-name="description1" vui-validate="required:true" maxlength="1000"/></td>
			</tr>
			<tr>
				<td><label>介绍文字二：</label></td><td><textarea id="infoDesc2" vui-name="description2" vui-validate="required:true" onkeyup="checkInput(this,4000)" onchange="checkInput(this,4000)"></textarea></td>
			</tr>
			<tr>
				<td><label>引用链接：</label></td><td><input id="infoLink" type="text" vui-name="link"  maxlength="100" value="http://" vui-validate="required:true,reg:http(s)?:\/\/([\w-]+\.)+[\w-]+(\/[\w- .\/?%&=]*)?"  /></td>
			</tr>
		</table>
		<div class="vui-vgrid-controller">
			<table id="vui-vgrid-table" style="display:none">
				<tr>
					<td>
			    		<button id="submitButton" class="btn primary" type="button"><ju:txt value="保存"/></button>
					   	<button id="closeBtn" class="btn cancel" type="reset"><ju:txt value="button.cancel"/></button>
					</td>
				</tr>
			</table>
		</div>
	</fieldset>
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
	<button id="previewButton" class="btn primary" type="button"><ju:txt value="发送至微信预览"/></button>
   	<button id="subInfoManageCloseBtn" type="button" class="btn cancel"><ju:txt value="关闭"/></button>
</div>

<script>

(function($,window){
	var topicId = $("#topicIdField").val();
	var auditingStatus = $("#auditingStatusField").val();
	var pubStatus = $("#pubStatusField").val();
	curStatus = "create",
	curId = "",
	$subId1 = $("#subId1"),
	$subId2 = $("#subId2"),
	$title = $("#infoTitle"),
	$thumbPicDisplay = $("#thumbPicDisplay");
	$thumbPicInput = $("#thumbPicInput");
	$descPicDisplay = $("#descPicDisplay");
	$descbPicInput = $("#descPicInput");
	$introOne = $("#infoDesc1"),
	$introSed = $("#infoDesc2"),
	$link = $("#infoLink");
	
	var previewFormTableStatus = false;
	
	var auditing = function(){
		if(auditingStatus=="0"){
			return true;
		}
		return false;
	};
	
	var deleteSub = function(){
		if(auditingStatus=="0" && this.isBigImgFlag=="N"){
			return true;
		}
		return false;
	};
	
	var readSub = function(){
		if(auditingStatus!="0"){
			return true;
		}
		return false;
	};
	
	if(auditingStatus!="0"&&auditingStatus!="3"){
		$("#vui-vgrid-table").css("display","none");
		$('input').attr("disabled","disabled");
		$('textarea').attr("disabled","disabled");
		
	}else{
		$("#vui-vgrid-table").css("display","table");
	}
	
	$("#previewButton").click(function(e){
		 
		if(!previewFormTableStatus){
			previewFormTableStatus = true;
			$("#previewFormTable").css("display","table");
			$("#certId").removeAttr("disabled");
			return;
		}
		$.vAjax({
			url:"previewMarket.json",
			data:{"topicId":topicId,"certId":$("#certId").val(),"resourceID":"200016"},
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
	
	var generateParams = function(){
		return {
			"subId":curId,
			"topicId":topicId,
			"title":$title.val(),
			"thumbPic":$thumbPicInput.val(),
			"descbPic":$descbPicInput.val(),
			"introOne":$introOne.val(),
			"introSed":$introSed.val(),
			"link":$link.val()
		};
	};
	
	var createSubInfo = function(){
		$(".normal").show();
		$(".preview").show();
		$(".readpreview").hide();
		$(".txt").show();
		$(".file").show();
		$("#closeBtn").show();
		$("#submitButton").show();
		curStatus = "create",
		$title.val("");
		$(".subId").val("");
		$thumbPicDisplay.val("");
		$thumbPicInput.val("");
		$descPicDisplay.val("");
		$descbPicInput.val("");
		$introOne.val("");
		$introSed.val("");
		$link.val("http://");
		$('input').removeAttr("disabled");
		$('textarea').removeAttr("disabled");
	};
	
	var updateSubInfo = function(resourceID,subId,title,introOne,introSed,link){
		$(".normal").show();
		$(".preview").show();
		$(".readpreview").hide();
		$(".txt").show();
		$(".file").show();
		$("#closeBtn").show();
		$("#submitButton").show();
		curStatus = "edit";
		curId = subId;
		$title.val(title);
		$subId1.val(subId);
		$subId2.val(subId);
		$thumbPicDisplay.val("");
		$thumbPicInput.val("");
		$descPicDisplay.val("");
		$descbPicInput.val("");
		$introOne.val(introOne);
		$introSed.val(introSed);
		$link.val(link);
		$('input').removeAttr("disabled");
		$('textarea').removeAttr("disabled");
	};
	
	var readSubInfo = function(resourceID,subId,title,introOne,introSed,link){
		$(".normal").hide();
		$(".preview").hide();
		$(".readpreview").show();
		$(".txt").hide();
		$(".file").hide();
		$("#closeBtn").hide();
		$("#submitButton").hide();
		$('input').attr("disabled","disabled");
		$('textarea').attr("disabled","disabled");
		curStatus = "edit";
		curId = subId;
		$title.val(title);
		$subId1.val(subId);
		$subId2.val(subId);
		$thumbPicDisplay.val("");
		$thumbPicInput.val("");
		$descPicDisplay.val("");
		$descbPicInput.val("");
		$introOne.val(introOne);
		$introSed.val(introSed);
		$link.val(link);
		$("#certId").removeAttr("disabled");
	};
	
	if(topicId){
		if(auditingStatus=="0"){
			$("#subInfoContainer").vgrid({
				url:"getMarketSubInfo.json?topicId="+topicId,
				resourceID:"200011",
				colModel:[
					{name:"subId", label:"<ju:txt value="market.topicId"/>",hidden:true},
					{name:"title", label:"标题"},
					{name:"introOne", label:"介绍文字一",hidden:true},
					{name:"introSed", label:"介绍文字二",hidden:true},
					{name:"link", label:"引用链接",hidden:true},
					{name:"isBigImgFlag", label:"是否是大图片",hidden:true}
				],
				functions:{
					readSubInfo:{url:readSubInfo, label:"<ju:txt value="button.read"/>", param:["subId","title","introOne","introSed","link"],resourceID:"200011"},
					createInfo:{url:createSubInfo, label:"<ju:txt value="button.create"/>" , resourceID:"200012",statusRule:auditing},
					updateInfo:{url:updateSubInfo, label:"<ju:txt value="button.update"/>", param:["subId","title","introOne","introSed","link"],resourceID:"200013",statusRule:auditing},
					"delete":{url:"delMarketSubInfo.json", label:"<ju:txt value="button.del"/>", param:["subId","topicId"],resourceID:"200014",statusRule:deleteSub}
				},
				controller:{
					end:["readSubInfo","updateInfo","delete"],
					bottom:["createInfo"]
				},
				caption:"子信息列表",
				cachePage:"all",
				rowsPerPage:10,
				dataRoot:"result",
				selectable:false,
				disablePager:true
			});
		}else{
		    if(pubStatus == "1"){
				$("#previewButton").css("display","none");
			}
			$("#subInfoContainer").vgrid({
				url:"getMarketSubInfo.json?topicId="+topicId,
				resourceID:"200011",
				colModel:[
					{name:"subId", label:"<ju:txt value="market.topicId"/>",hidden:true},
					{name:"title", label:"标题"},
					{name:"introOne", label:"介绍文字一",hidden:true},
					{name:"introSed", label:"<ju:txt value="market.create.date"/>",hidden:true},
					{name:"link", label:"引用链接",hidden:true},
					{name:"isBigImgFlag", label:"<ju:txt value="是否是大图片"/>",hidden:true}
				],
				functions:{
					readSubInfo:{url:readSubInfo, label:"<ju:txt value="button.read"/>", param:["subId","title","introOne","introSed","link"],resourceID:"200011",statusRule:readSub},
					createInfo:{url:createSubInfo, label:"<ju:txt value="button.create"/>" , resourceID:"200012",statusRule:auditing},
					updateInfo:{url:updateSubInfo, label:"<ju:txt value="button.update"/>", param:["subId","title","introOne","introSed","link"],resourceID:"200013",statusRule:auditing},
					//"delete":{url:"delMarketSubInfo.json", label:"<ju:txt value="button.del"/>", param:["subId","topicId"],resourceID:"200014",statusRule:deleteSub}
				},
				controller:{
					end:["readSubInfo","updateInfo","delete"]
				},
				caption:"子信息列表",
				cachePage:"all",
				rowsPerPage:10,
				dataRoot:"result",
				selectable:false,
				disablePager:true
			});
		}
	}
	
	$("#subInfoForm").vvalidate();
	
	$("#submitButton").click(function(e){
		var saveUrl;
		
		if($("#subInfoForm").vgetValidateStatus()){
			switch(curStatus){
				case "create":
					saveUrl = "insertMarketSubInfo.json?resourceID=200012";
					break;
				case "edit":
					saveUrl = "updateMarketSubInfo.json?resourceID=200013";
					break;
			}
			
			$.vAjax({
				url:saveUrl,
				data:generateParams(),
				success:function(data){
					if(data.errorMsg){
						alert(data.errorMsg);
						return;
					}
					if(data && data.result){
						if(data.errorMsg){
							alert(data.errorMsg);
							return;
						}
						if(data.result){
							alert("保存成功");
							$("#descPicDisplay").val("");
							$("#thumbPicDisplay").val("");
							$("#infoTitle").val("");
							$("#infoDesc1").val("");
							$("#infoDesc2").val("");
							$("#infoLink").val("http://");
							$("#subInfoContainer").trigger("reloadGrid");
						}
					}
					else{
						alert("保存失败");
					}
				},
				error:function(){
					alert("保存失败!");
				}
			});
		}
	});
	
	$("#closeButton").click(function(e){
		$("#gridContainer").trigger("reloadGrid");
		$(this).unbind("click");
		$('input').removeAttr("disabled");
	});

	
	window.fileUploadCallback = {
		success:function(id,img){
			$("#" + id).val(img);
		},
		fail:function(msg){
			if(msg)
				alert(mgs);
		}
	};
	
	$(".file").change(function(e){
		var $el = $(e.target),
		parent = $el.parent();
		parent.find(".txt").val($el.val()).focus();
		parent.submit();
	});
	
	$(".preview").click(function(e){
		var $el = $(e.target),
		parent = $el.parent(),
		imgUrl = parent.find(".imgUrl").val();
		subId = parent.find(".subId").val();
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
			img.src = "getImage.do?id=" + imgUrl+"&resourceID="+200016;
		}else{
			//parent.find(".file").click();
			alert("您还没有导入图片，不能预览，请先导入图片");
		}		
	});
	
	$(".readpreview").click(function(e){
		var $el = $(e.target),
		parent = $el.parent(),
		subId = parent.find(".subId").val();
		imgName = parent.find(".imgName").val();
		if(subId){
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
			img.src = "getMarketSubInfoImg.do?subId=" + subId +"&imgName="+imgName+"&resourceID="+200011;
		}
	});
	
	$("#subInfoManageCloseBtn").click(function(e){
		$("#gridContainer").trigger("reloadGrid");
		closePopWindow(function(){$("#gridContainer").trigger("reloadGrid");});
		$('input').removeAttr("disabled");
	});
})(jQuery,window);

function callback(msg,imgFlag){
	if(imgFlag){
		if(imgFlag=="BRVY_IMAGE"){
			$("#thumbPicDisplay").val("");
		}else if(imgFlag=="INTRO_IMAGE"){
			$("#descPicDisplay").val("");
		}
	}
	alert(msg);//action中put的message。
}   

</script>