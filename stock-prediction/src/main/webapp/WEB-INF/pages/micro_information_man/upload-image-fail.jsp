<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
</head>

<body>
<input id="msg" type="hidden" value="${msg }" />
<script>
parent.fileUploadCallback["fail"](document.getElementById("msg").value);
</script>
</body>
</html>