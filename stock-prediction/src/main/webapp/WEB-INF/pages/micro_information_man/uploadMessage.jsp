<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ju" uri="http://www.vivebest.com/finchas/i/taglib"%>
<input type="text" id=errorMsg value="${errorMsg}"></input>
<input type="text" id=imgFlag value="${imgFlag}"></input>
<script type="text/javascript"> 
var errorMsg = document.getElementById("errorMsg").value;
var imgName = document.getElementById("imgFlag").value;
window.parent.callback(errorMsg,imgName);  
</script>
