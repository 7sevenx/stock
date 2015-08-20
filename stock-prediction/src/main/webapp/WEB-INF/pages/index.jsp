<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>微信後台管理系統(預覽版)</title>
<link rel="icon" href="${pageContext.request.contextPath}/img/logo.png" type="image" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css" />
</head>
<body onkeydown="resetTime()" onclick="resetTime()">
<div class="bgContainer container">
	<img src="${pageContext.request.contextPath}/img/wg_frosted_glass_1_1280.jpg" width="100%" height="100%" />
</div>
<div id="mainContentContainer" class="container contentContainer">
	<div id="mainContent">
    	<div id="header" class="base nopadding">
<!--            <SPAN >终端管理系统</SPAN> -->
			<div id="logo"></div>
            <ul>
            	
            	<c:forEach var="on" items="${menuDtos}" varStatus="status">
            		<c:if test="${ on.parentId ==0||on.parentId==null}">
            			<li class="firstMenu"><ju:txt value="menu${on.id }"/>
            				<c:if test="${fn:length(on.menus) >0}">
            					<ul>
            						<c:forEach items="${on.menus }" var="tw">
            							<c:if test="${fn:length(tw.menus) >0}">
            								<li class="sMenu have-third-menu" vui-menu="" vui-resource="${tw.id }" ><ju:txt value="menu${tw.id }" />
            							</c:if>
            							<c:if test="${fn:length(tw.menus) ==0}">
            								<li class="sMenu"  vui-link="${tw.url}" vui-resource="${tw.id }" ><ju:txt value="menu${tw.id }" />
            							</c:if>
            								<c:if test="${fn:length(tw.menus) >0}">
            									<ul>
	            									<c:forEach items="${tw.menus }" var="fw">
	            										<li class="tMenu"  vui-link="${fw.url}" vui-resource="${fw.id }" ><ju:txt value="menu${fw.id }" /></li>
	            									</c:forEach>
            									</ul>
            								</c:if>
            							</li>
            						</c:forEach>
            					</ul>
            				</c:if>
            				</li>
            			</c:if>
            	</c:forEach>
            	
			</ul>
            <div id="logout"><img src="img/logout.png" alt="logout" /></div>
    	</div>
        <div id="container">
        <span style="display:none" id="userSpan">${userName}</span>
        <span id="roleSpan" style="display:none">${roleName}</span>
            <div id="sidebar">
                <div id="userInfo" class="base">
                    <img src="img/user.png" alt="user" />
                    <span id="userName" name="userName">用户名：<span id="user" style="display:inline-block"></span></span>
                    <span id="roleName" name="roleName">岗位名：<span id="role" style="display:inline-block"></span></span>
<!--                     <div id="message">10</div> -->
                </div>
                <div id="subMenu" class="base nopadding">
                    <div class="grayHead head-s"></div>
                    <div id="subMenuContent"></div>
                    <div class="grayFooter head-s"></div>
<!--                     <div class="whiteFooter head-s"></div> -->
                </div>
<!--                <div id="language" class="base">
                    <select><option value="cn-ZH">中文</option><option value="en">English</option></select>
                </div>-->
            </div>
            <div id="content">
                <div id="nav" class="base nopadding">
                    <div class="grayHead head-s"></div>
                    <div id="navContent"><img src="img/home.png" alt="home" />&nbsp;&nbsp;首页&nbsp;&nbsp;<span id="navMenu"></span>&nbsp;&nbsp;<span id="navSubMenu"></span>&nbsp;&nbsp;<span id="navThirdMenu"></span></div>
                </div>
                <div id="changeContent">
                	<div class="base" style="text-align:center">
                		<br/><br/>
                		<h1>欢迎使用</h1>
                		<br/><br/>
                	</div>
                </div>
            </div>
    	</div>
        <div id="footer">&copy; 2013 Vivebest</div>
    </div>
</div>

<div id="popWindowContainer" class="container">
	<div id="popWindowBg" class="bgContainer"><img src="img/wg_frosted_glass_1_1280.jpg" width="100%" height="100%" /></div>
    <div class="container contentContainer">
        <div id="popWindowContentContainer" class="base nopadding">
        	<div id="closeButton" onclick="closePopWindow()"></div>
            <div id="popWindowHeader" class="grayHead head-b headerFont"> </div>
            <div id="popWindowContent">
            	 
            </div>
            <div class="grayFooter head-s"></div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/vui/jquery.i18n.properties-min-1.0.9.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/vui/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/vui/vui-v0.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/vui/vui-validatesetting.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
<link 	type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/zTree/zTreeStyle.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.ztree.all-3.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-ui-1.8.23.custom.min.js"></script>
</body>
<script type="text/javascript">
	var myTime = setTimeout('Timeout()', 6000000);
	function resetTime(){
		clearTimeout(myTime);
		myTime = setTimeout('Timeout()', 6000000);
	}
	
	function Timeout(){
		alert("超时！请点确定后重新登录！");
		window.location.href = "logoutProcess.do";
	}
// 	document.documentElement.onkeydown=resetTime;  
// 	document.doocumentElement.onclick=resetTime; 
	var userName = $("#userSpan").text();
	var roleName = $("#roleSpan").text();
	if(userName.length>4){
		var user=userName.substring(0, 3)+"...";
		$("#user").text(user);
	}else{
		$("#user").text(userName);
	}
	if(roleName.length>4){
		var role=roleName.substring(0, 3)+"...";
		$("#role").text(role);
	}else{
		$("#role").text(roleName);
	}
	</script>
</html>
