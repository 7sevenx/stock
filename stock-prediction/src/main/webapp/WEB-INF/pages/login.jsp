<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>微信後台管理系統(預覽版)</title>
<link rel="icon" href="img/favicon2.gif" type="image" />
<link type="text/css" rel="stylesheet" href="css/home.css" />
</head>
<body>
<div class="bgContainer container">
	<img src="img/wg_frosted_glass_1_1280.jpg" width="100%" height="100%" />
</div>
<div id="mainContentContainer" class="container contentContainer">
	<div id="loginContainer" class="base">
    	<div style="font-family: 'Microsoft YaHei','Apple LiGothic',Tahoma,sans-serif;font-size:23px;margin-top:40px;font-weight:900">微信銀行後台管理系統</div>
<%-- 		<input type="hidden" id="test1" value="${errorCode}"/> --%>
        <form id="loginForm" action="loginProcess.do" method="post" target="_self">
        	<table>
        		<tr>
        		<span style="color: red; display: inline-block;"><ju:txt value="${errorCode}" /></span>
        		</tr>
        		<tr>
        		<input class="loginInput username" name="loginuser" type="text" vui-name="loginuser" vui-validate="required:true" /><br/>
            	</tr>
        		<tr>
            	<input class="loginInput password" name="loginpassword" type="password" vui-name="loginpassword" vui-validate="required:true" /><br/><br/>
            	</tr>
        		<tr>
            	<input type="hidden" name="lang" value="zh_TW" /><br/>
            	</tr>
            </table>
            <button class="btn primary" type="submit">登&nbsp;&nbsp;錄</button>
        </form>
        <label>&copy; 預覽版</label>
    </div>
</div>
<input id="fcsiErrorCode" type="hidden" value="${errorCode}"/>
<script type="text/javascript" src="js/jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="js/vui/vui-v0.1.js"></script>
<script type="text/javascript" src="js/vui/vui-validatesetting.js"></script>
</body>
</html>