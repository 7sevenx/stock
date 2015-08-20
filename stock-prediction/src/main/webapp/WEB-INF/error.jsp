<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="jsp-head.jsp"%>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	<body>
		<table width="70%" border="0" style="margin-top: 20px;" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="3">
					<table cellpadding="0" cellspacing="0" width="100%" height="62">
						<tr>
							<td width="309" valign="top">
							</td>
							<td valign="bottom">
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="100%" valign="top" align="right" style='padding: 2px 0 0 0px;'>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td width="100%">
						<table width="98%" bgcolor="#55acfc" border="0" style="margin: 10px 0;" cellspacing="1" cellpadding="10" align="center">
							<tr>
								<td align="center" colspan="2">
									<font size="3">错误</font>
								</td>
							</tr>
							
							<c:forEach var="errorMap" items="${EXCEPTION_MESSAGES}">
								<c:if test='${errorMap.key=="errorCode"}'>
									<c:set var="errorCode" value="${errorMap.value}"></c:set>
								</c:if>
								<c:if test='${errorMap.key=="errorMsg"}'>
									<c:set var="errorMsg" value="${errorMap.value}"></c:set>
								</c:if>
							</c:forEach>
							<tr>
								<td bgcolor="#eeeeee" align="center" width="20%">错误码</td>
								<td bgcolor="#ffffff" class="fontblue">${errorCode}</td>
							</tr>
							<tr>
								<td bgcolor="#eeeeee" align="center" width="20%">错误消息</td>
								<td bgcolor="#ffffff" class="fontblue">${errorMsg}</td>
							</tr>
							
						</table>
				</td>
			</tr>
		</table>
	</body>
</html>