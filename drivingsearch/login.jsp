<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="app" value="<%=request.getContextPath()%>" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>${app_name}</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Pragma" content="no-cache" />
<script type="text/javascript" src="${app}/js/jquery-1.9.1.js"></script>
</head>
<body>
	<!-- <form id="submitForm">
		<table>
			<tr>
				<td>用户名:</td>
			</tr>
			<tr>
				<td><input type="text" name="userno" id="userno" tabindex="1" />
				</td>
			</tr>
			<tr>
				<td>密&nbsp;&nbsp;码:</td>
			</tr>
			<tr>
				<td><input type="password" name="password" id="password"
					tabindex="2" /></td>
			</tr>
			<tr>
				<td align="center"><a class="submitbtn" id="loginBtn" href="#"
					onclick="login()">登&nbsp;&nbsp;录</a></td>
			</tr>
		</table>
	</form> -->

	<script>
		$(document).ready(function() {
			window.location.href="${app}/pages/search.jsp?";
		});

		
	</script>
</body>
</html>
