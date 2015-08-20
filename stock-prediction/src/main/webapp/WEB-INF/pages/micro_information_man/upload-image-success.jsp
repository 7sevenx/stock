<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
</head>

<body>
<input id="container" type="hidden" value="${container }" />
<input id="imgName" type="hidden" value="${imgName }" />
<script>
parent.fileUploadCallback["success"](document.getElementById("container").value, document.getElementById("imgName").value);
</script>
</body>
</html>