<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="searchContainer">
    <label><ju:txt value="market.topic"/>：</label>
    <input type="text" vui-name="topic" />&nbsp;&nbsp;
    <label><ju:txt value="market.type"/>：</label>
    <select vui-name="type" vui-data="marketType" />&nbsp;&nbsp;
    <label><ju:txt value="market.create.date"/>：</label>
    <label><ju:txt value="market.start.date"/></label>
    <input id="d4311" type="text" vui-name="startDate" class="Wdate" onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'d4312\')}'})"/>&nbsp;&nbsp;
    <label><ju:txt value="market.end.date"/></label>
    <input id="d4312" type="text" vui-name="endDate" class="Wdate" onFocus="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}'})"/>&nbsp;&nbsp;
    <label><ju:txt value="market.pub.status"/>：</label>
    <select vui-name="pubStatus" vui-data="pubStatus"/>&nbsp;
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div class="vui-vgrid-inputForm">
	<table>
	 	<tr>
	    	<td id="required"><label><ju:txt value="market.topic"/>：</label></td>
	    	<td><input type="text" vui-name="topic" vui-validate="required:true"  maxlength="30"/></td>
	    </tr>
		<tr>
	 		<td><label><ju:txt value="market.type"/>：</label></td>
	    	<td><select vui-name="type" vui-data="marketType" vui-validate="required:true"/></td>
	    </tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>

<div id="gridContainer"></div>

<script type="text/javascript">
(function($,window){
var manageSubInfo = function(resourceID,topicId,topic,auditingStatus,pubStatus){
	$.vAjax({
		url:"marketingSubinfoManageProcess.do",
		data:{"resourceID":resourceID,"topicId":topicId,"auditingStatus":auditingStatus,"pubStatus":pubStatus},
		dataType:"html",
		success:function(data){
			setPopWindowContent({
				header:topic + " - 子信息管理",
				content:data
			});
			showPopWindow();
		},
		error:function(jqXhr, textStatus, error) {
			alert("加载页面失败！");
		}
	});
};

var managePubInfo = function(resourceID,topicId,type){
	$.vAjax({
		url:"updateMarketInfo.json?pubStatus=1",
		data:{"resourceID":resourceID,"topicId":topicId,"type":type},
		dataType:"json",
		success:function(data){
			if(data){
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

var manageAudInfo = function(resourceID,topicId){
	$.vAjax({
		url:"updateMarketInfo.json?auditingStatus=1",
		data:{"resourceID":resourceID,"topicId":topicId},
		dataType:"json",
		success:function(data){
			if(data){
				if(data.errorMsg){
					alert(data.errorMsg);
					return;
				}
				if(data.result){
					alert("提交审核成功");
					$("#gridContainer").trigger("reloadGrid");
				}
				else
					alert("提交审核失败");
			}
		},
		error:function(jqXhr, textStatus, error) {
			alert("加载页面失败！");
		}
	});
};

var manageCleInfo = function(resourceID,topicId){
	$.vAjax({
		url:"updateMarketInfo.json?pubStatus=2",
		data:{"resourceID":resourceID,"topicId":topicId},
		dataType:"json",
		success:function(data){
			if(data){
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
/*修改权限*/
var updateRule = function(){
	if(this.pubStatus =="0" && this.auditingStatus=="0")
		return true;
	return false;
};
/*审核权限*/
var auditingRule = function(){
	//发布状态等于未发布，审核状态等于未提交待审核
	if(this.pubStatus =="0" && this.auditingStatus=="0")
		return true;
	return false;
};
/*删除权限*/
var deleteRule = function(){
	//发布状态不等于发布中，审核状态不等于待审核
	if(this.pubStatus !="1" && this.auditingStatus!="1")
		return true;
	return false;
};
/*撤销权限*/
var clearRule = function(){
	//发布状态等于展示中 ，审核状态等于已通过
	if(this.pubStatus =="1" && this.auditingStatus=="2")
		return true;
	return false;
};
/*发布权限*/
var pubRule = function(){
	//发布状态不等于展示中，审核状态等于审核通过
	if(this.pubStatus !="1" && this.auditingStatus=="2")
		return true;
	return false;
};
/*子信息管理*/
var subInfoManage = function(){
	//发布状态不等于展示中，审核状态不等于待审核
	if(this.pubStatus !="1" && this.auditingStatus!="1")
		return true;
	return false;
};


$("#gridContainer").vgrid({
	url:"queryMarketInfoAll.json",
	resourceID:"200011",
	colModel:[
		{name:"topicId", label:"<ju:txt value="market.topicId"/>",align:"center",hidden:true},
		{name:"topic", label:"<ju:txt value="market.topic"/>",align:"left"},
		{name:"type", label:"<ju:txt value="market.type"/>",align:"left",data:"marketType"},
		{name:"subInfoCounts", label:"子信息个数",align:"center"},
		{name:"creatDate", label:"<ju:txt value="market.create.date"/>",align:"center"},
		{name:"pubDate", label:"<ju:txt value="market.pub.date"/>",align:"center"},
		{name:"cleanDate", label:"<ju:txt value="market.clean.date"/>",align:"center"},
		{name:"auditingStatus", label:"<ju:txt value="market.auditing.status"/>",align:"left",data:"aduitingStatus"},
		{name:"pubStatus", label:"<ju:txt value="market.pub.status"/>",align:"center",data:"pubStatus"},
		{name:"remark", label:"审核意见",align:"left"}
	],
	caption:"<ju:txt value="market.list"/>",
	cachePage:5,
	rowsPerPage:10,
	dataRoot:"gridMarketInfoList",
	searchContainer:"searchContainer",
	functions:{
		create:{url:"insertMarketInfo.json", label:"<ju:txt value="button.create"/>" ,resourceID:"200012"},
		read:{url:"getMarketInfo.json", label:"<ju:txt value="button.read"/>", param:["topicId"],resourceID:"200011"},
		update:{url:"updateMarketInfo.json", label:"<ju:txt value="button.update"/>", param:["topicId"],resourceID:"200013",statusRule:updateRule},
		"delete":{url:"deleteMarketInfo.json", label:"<ju:txt value="button.del"/>", param:["topicId"],resourceID:"200014",statusRule:deleteRule},
		subInfo:{url:manageSubInfo,label:"管理子信息",param:["topicId","topic","auditingStatus","pubStatus"],resourceID:"200012"},
		pub:{url:managePubInfo,label:"发布",param:["topicId","type","pub"],resourceID:"200013",statusRule:pubRule},
		aud:{url:manageAudInfo,label:"提交审核",param:["topicId","aud"],resourceID:"200013",statusRule:auditingRule},
		clear:{url:manageCleInfo,label:"撤销",param:["topicId","cle"],resourceID:"200013",statusRule:clearRule}
	},
	controller:{
		end:["read","subInfo","delete","update","pub","aud","clear"],
		bottom:["create","delete"]
	},
	options:{
		marketType:"marketTypeSelect.json?resourceID=200011",
		aduitingStatus:[
		        {"name":"未提交审核","value":"0"},
		        {"name":"待审核","value":"1"},
		        {"name":"审核通过","value":"2"},
		        {"name":"审核未通过","value":"3"}
		        ],
		pubStatus:[
		           {"name":"未发布","value":"0"},
		           {"name":"展示中","value":"1"},
		           {"name":"已撤销","value":"2"}
		           ]
	}
});

})(jQuery,window);
</script>
