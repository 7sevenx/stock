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
    <button vui-control="submit" ><ju:txt value="button.query"/></button>
</div>
<div id="gridContainer"></div>
<div class="vui-vgrid-inputForm">
	<table>
	 	<tr>
	    	<td id="required"><label><ju:txt value="market.topic"/>：</label></td>
	    	<td><input type="text" vui-name="topic"  maxlength="30"/></td>
	    </tr>
		<tr>
	 		<td><label><ju:txt value="market.type"/>：</label></td>
	    	<td><select vui-name="type" vui-data="marketType" /></td>
	    </tr>
	</table>
	<div class="vui-vgrid-controller">
	    <button vui-control="submit"><ju:txt value="button.submit"/></button>
	   	<button vui-control="cancel"><ju:txt value="button.cancel"/></button>
	</div>
</div>
<script type="text/javascript">
(function($,window){

	var auditingRule = function(){
		if(this.auditingStatus=="1")
			return true;
		return false;
	};
	var manageAud = function(resourceID,topicId,topic,remark,auditingStatus,pubStatus){
		$.vAjax({
			url:"getMarketSubInfo.do",
			data:{"resourceID":resourceID,"topicId":topicId,"remark":remark,"auditingStatus":auditingStatus,"pubStatus":pubStatus},
			dataType:"html",
			success:function(data){
				setPopWindowContent({
					header:topic + "营销资讯审核",
					content:data
				});
				showPopWindow();
			},
			error:function(jqXhr, textStatus, error) {
				alert("加载页面失败！");
			}
		});
	};
 
$("#gridContainer").vgrid({
	url:"queryMarketInfoAll.json?auditingFlag=Y",
	resourceID:"200031",
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
		{name:"remark", label:"<ju:txt value="审核意见"/>",align:"left"}
	],
	caption:"<ju:txt value="market.list"/>",
	cachePage:5,
	rowsPerPage:10,
	dataRoot:"gridMarketInfoList",
	searchContainer:"searchContainer",
	functions:{
		detail:{url:manageAud,label:"详情",param:["topicId","topic","remark","auditingStatus","pubStatus"],resourceID:"200011"},
		aud:{url:manageAud,label:"审核",param:["topicId","topic","remark","auditingStatus","pubStatus"],resourceID:"200013",statusRule:auditingRule}
	},
	controller:{
		end:["detail","aud"]
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
