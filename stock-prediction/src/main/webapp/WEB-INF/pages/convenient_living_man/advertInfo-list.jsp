<?xml version="1.0" encoding="UTF-8" ?>
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
<div id="searchContainer">
 	<label><ju:txt value="标题"/>：</label>
    <input type="text" vui-name="title" />&nbsp;&nbsp;
    <label><ju:txt value="发布状态"/>：</label>
    <select vui-name="isPub" vui-data="isPub" />&nbsp;&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div id="subInfoForm" class="vui-vgrid-inputForm">
<table>
	<tr>
		<td><label><ju:txt value="标题"/>：</label></td>
	    <td><input id="infoTitle" type="text" vui-name="title" class="title" vui-validate="required:true" maxlength="30"/></td>
	</tr>
	<tr>
		<td><label>缩略图：</label></td>
		<td>
			<div class="vui-file-upload">
						<form action="advertImageTempProcess.do" method="post" enctype="multipart/form-data" target="frameFile">
						    <input id="thumbPicDisplay" type="text" vui-name="thumbPic" vui-readable="hide" class="txt" vui-validate="required:true"/>  
						    <button type="button" class="btn normal" vui-name="button" vui-readable="hide">导入</button>
						    <input type="file" name="fileField"  vui-name="button" vui-readable="hide" class="file" />
						    <input type="hidden" name="returnField" value="thumbPicInput" />
						    <input type="hidden" name="resourceID" value="400011" />
						    <input type="hidden" name="imgFlag"  class="imgFlag" value="BRVY_IMAGE" />
						    <input id="thumbPicInput" vui-name="thumbPicId" class="imgUrl" type="hidden" vui-readable="hide"/>
						    <input vui-name="imgName" value="thumbPic"  class="imgName" type="hidden" vui-readable="hide"/>
						    <input id="isBig" vui-name="isBig" type="hidden" vui-readable="hide"/>
						    <button type="button" class="btn primary preview">预览</button>
						    <button type="button" class="btn primary readpreview" style="display:none">预览</button>
						    <input type="hidden" vui-name="seqNo" style="display:none" />
						    <iframe id='frameFile' name='frameFile' style='display:none;'></iframe>
						</form>
						<iframe name="targetFrame1" ></iframe>
					</div>
				</td>
			</tr>
			<tr>
				<td><label>介绍图片：</label></td>
				<td>
					<div class="vui-file-upload">
						<form action="advertImageTempProcess.do" method="post" enctype="multipart/form-data" target="targetFrame2">
						    <input id="descPicDisplay" type="text" vui-name="descPic" vui-readable="hide" class="txt" vui-validate="required:true"/>  
						    <button type="button" class="btn normal"  vui-name="button" vui-readable="hide" >导入</button>
						    <input type="file" name="fileField" class="file"  vui-name="button" vui-readable="hide" />
						    <input type="hidden" name="returnField" value="descPicInput" />
						    <input type="hidden" name="resourceID" value="400011" />
						    <input type="hidden" name="imgFlag" class="imgFlag" value="INTRO_IMAGE"/>
						    <input id="descPicInput" vui-name="descPicId" class="imgUrl" type="hidden" vui-readable="hide"/>
						    <input vui-name="imgName" value="descbPic" class="imgName" type="hidden" vui-readable="hide"/>
						   	<button type="button" class="btn primary preview">预览</button>
						    <button type="button" class="btn primary readpreview" style="display:none">预览</button>						    
						    <input type="hidden" vui-name="seqNo" style="display:none" />
						</form>
						<iframe name="targetFrame2"></iframe>
					</div>
		</td>
	</tr>
	<tr>
		<td><label>介绍文字一：</label></td>
		<td><input id="infoDesc1" type="text" class="introOne" vui-name="introOne" vui-validate="required:true" maxlength="1000"/></td>
	</tr>
	<tr>
		<td><label>介绍文字二：</label></td>
		<td><textarea id="infoDesc2" vui-name="introSed" class="introSed" vui-validate="required:true" onkeyup="checkInput(this,4000)" onchange="checkInput(this,4000)"></textarea></td>
	</tr>
</table>
<div class="vui-vgrid-controller">
   	<%-- <button vui-control="submit"><ju:txt value="button.submit"/></button>
   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button> --%>  
   	<button id="saveButton" class="btn primary" type="button" vui-name="button" vui-readable="hide" vui-createable="show" vui-editable="hide"><ju:txt value="保存"/></button>
   	<button id="updateButton" class="btn primary" type="button" vui-name="button" vui-readable="hide" vui-createable="hide" vui-editable="show"><ju:txt value="修改"/></button>
	<button id="subInfoManageCloseBtn" type="button" class="btn cancel"><ju:txt value="关闭"/></button>
</div>
</div>
<script>

(function($,window){
$title = $("#infoTitle");
$thumbPicDisplay = $("#thumbPicDisplay");
$thumbPicInput = $("#thumbPicInput");
$descPicDisplay = $("#descPicDisplay");
$descbPicInput = $("#descPicInput");
$introOne = $("#infoDesc1");
$introSed = $("#infoDesc2");
$isBig = $("#isBig"); 
curStatus = "create";

var pubAdvertInfo = function(resourceID,seqNo){
	$.vAjax({
		url:"updateAdvertInfo.json",
		data:{"resourceID":resourceID,"seqNo":seqNo,"isPub":"Y"},
		dataType:"json",
		success:function(data){
			if(data){
				if(data.errorMsg){
					alert(data.errorMsg);
					return;
				}
				if(data.result){
					alert("发布成功");
					$("#gridContainer").trigger("reloadGrid");
				}
				else
					alert("发布失败");
			}
		},
		error:function(jqXhr, textStatus, error) {
			alert("加载页面失败！");
		}
	});
};

var clePubAdvertInfo = function(resourceID,seqNo){
	$.vAjax({
		url:"updateAdvertInfo.json",
		data:{"resourceID":resourceID,"seqNo":seqNo,"isPub":"N"},
		dataType:"json",
		success:function(data){
			if(data){
				if(data.errorMsg){
					alert(data.errorMsg);
					return;
				}
				if(data.result){
					alert("撤销成功");
					$("#gridContainer").trigger("reloadGrid");
				}
				else
					alert("撤销失败");
			}
		},
		error:function(jqXhr, textStatus, error) {
			alert("加载页面失败！");
		}
	});
};

var pubRule = function(){
	if(this.isPub =="N")
		return true;
	return false;
};
var cleanPubRule = function(){
	if(this.isPub =="Y"&&this.isBigImgFlag=="N")
		return true;
	return false;
};
var delPubRul = function(){
	if(this.isPub=="Y" || (this.isPub =="Y"&&this.isBigImgFlag=="Y"))
		return false;
	return true;
};
var updatePubRul = function(){
	if(this.isPub =="N")
		return true;
	return false;
};

var createAdvertInfo = function(){
	curStatus = "create";
};

var updateAdvertInfo = function(){
	curStatus = "edit";
};

$("#gridContainer").vgrid({
	url:"getAdvertInfos.json",
	resourceID:"400010",
	colModel:[
		{name:"seqNo", label:"Id",align:"center",hidden:true},
		{name:"title", label:"标题",align:"center"},
		{name:"introOne", label:"介绍文字一",align:"center",hidden:true},
		{name:"introSed", label:"介绍文字二",align:"center",hidden:true},
		{name:"isBigImgFlag", label:"是否是大图",align:"center",data:"isPub"},
		{name:"isPub", label:"是否发布",align:"center",data:"isPub"}
	],
	caption:"易生活信息列表",
	cachePage:5,
	rowsPerPage:10,
	dataRoot:"gridAdvertInfoList",
	searchContainer:"searchContainer",
	functions:{
		create:{url:createAdvertInfo, label:"<ju:txt value="button.create"/>" ,resourceID:"400011"},
		read:{url:"getAdvertInfo.json", label:"<ju:txt value="button.read"/>", param:["seqNo"],resourceID:"400010"},
		update:{url:updateAdvertInfo, label:"<ju:txt value="button.update"/>", param:["seqNo"],resourceID:"400012",statusRule:updatePubRul},
		"delete":{url:"delAdvertInfo.json", label:"<ju:txt value="button.del"/>", param:["seqNo"],resourceID:"400013",statusRule:delPubRul},
		publish:{url:pubAdvertInfo,label:"发布",param:["seqNo"],resourceID:"400012",statusRule:pubRule},
		cleanPub:{url:clePubAdvertInfo,label:"撤销",param:["seqNo"],resourceID:"400012",statusRule:cleanPubRule}
	},
	controller:{
		end:["read","update","delete","publish","cleanPub"],
		bottom:["create","delete"]
	},
	options:{
		isPub:[
	          {"name":"是","value":"Y"},
	          {"name":"否","value":"N"}
	          ]
	}
});

window.fileUploadCallback = {
		success:function(id,img,isBig){
			if(id=="thumbPicInput")
				$($("#popWindowContent").find("[vui-name]")[4]).val(img);
			else{
				$($("#popWindowContent").find("[vui-name]")[13]).val(img);
			}
			if(isBig){
				$("#isBig").val(isBig);
			}
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
	imgFlag=parent.find(".imgFlag").val();
	if(imgUrl){
		var img = new Image();
		img.src = "advertGetImageProcess.do?id=" + imgUrl+"&resourceID="+200016;
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
	}else{
		//parent.find(".file").click();
		alert("您还没有导入图片，不能预览，请先导入图片");
	}		
});

$(".readpreview").click(function(e){
	var $el = $(e.target),
	parent = $el.parent(),
	seqNo = $($("#popWindowContent").find("[vui-name]")[8]).val();
	imgFlag=parent.find(".imgFlag").val();
	if(seqNo){
		var img = new Image();
		img.src = "getAdvertInfoImg.do?seqNo=" + seqNo+"&imgFlag="+imgFlag+"&resourceID="+200011;
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
	}
});


$("#saveButton").click(function(e){
	var title = $($("#popWindowContent").find("[vui-name]")[0]).val();
	var thumbPic=$($("#popWindowContent").find("[vui-name]")[4]).val();
	var descbPic=$($("#popWindowContent").find("[vui-name]")[13]).val();
	var introOne=$($("#popWindowContent").find("[vui-name]")[18]).val();
	var introSed=$($("#popWindowContent").find("[vui-name]")[19]).val();
	var isBigImgFlag=$isBig.val();
	$.vAjax({
		url:"insertAdvertInfo.json",
		data:{"title":title,"thumbPic":thumbPic,"descbPic":descbPic,"introOne":introOne,"introSed":introSed,"isBigImgFlag":isBigImgFlag,"resourceID":"400011"},
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
					$("#gridContainer").trigger("reloadGrid");
					closePopWindow();
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
});


$("#updateButton").click(function(e){
	var title = $($("#popWindowContent").find("[vui-name]")[0]).val();
	var thumbPic=$($("#popWindowContent").find("[vui-name]")[4]).val();
	var seqNo = $($("#popWindowContent").find("[vui-name]")[8]).val();
	var descbPic=$($("#popWindowContent").find("[vui-name]")[13]).val();
	var introOne=$($("#popWindowContent").find("[vui-name]")[18]).val();
	var introSed=$($("#popWindowContent").find("[vui-name]")[19]).val();
	var isBigImgFlag=$isBig.val();
	$.vAjax({
		url:"updateAdvertInfo.json",
		data:{"seqNo":seqNo,"title":title,"thumbPic":thumbPic,"descbPic":descbPic,"introOne":introOne,"introSed":introSed,"isBigImgFlag":isBigImgFlag,"resourceID":"400012"},
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
					alert("修改成功");
					$("#gridContainer").trigger("reloadGrid");
					closePopWindow();
				}
			}
			else{
				alert("修改失败");
			}
		},
		error:function(){
			alert("修改失败!");
		}
	});
});

$("#subInfoManageCloseBtn").click(function(e){
	$("#gridContainer").trigger("reloadGrid");
	closePopWindow(function(){$("#gridContainer").trigger("reloadGrid");});
});
})(jQuery,window);

function callback(msg,imgFlag){
	if(imgFlag){
		if(imgFlag=="BRVY_IMAGE"){
			$($("#popWindowContent").find("[vui-name]")[1]).val("");
		}else if(imgFlag=="INTRO_IMAGE"){
			$($("#popWindowContent").find("[vui-name]")[10]).val("");
		}
	}
	alert(msg);//action中put的message。
}
</script>
