<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="app" value="<%=request.getContextPath()%>" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%
	String uid = null;
	uid = request.getParameter("uid");
%>
<head>
<title>${app_name}</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Pragma" content="no-cache" />
<script type="text/javascript" src="${app}/js/jquery-1.9.1.js"></script>
</head>
<body>

	<script>
		$(document).ready(function() {
			//获取用户相关信息，根据参数，获取用户ID，（两种方式：1.用户名+密码。 2.uid，uid示例=用户来源：微信ID）
			/*
				入参： 1. yhbh，password 或者 2.uid uid标识法为用户来源：微信ID
				暂时仅实现uid方式
		     */
		     var uid ="<%=uid%>";
			 var tempDate = new Date();
			 window.location.href = "${app}/search/enterSearch.do?uid="
									+ uid + "&tempDate=" + tempDate;
			//window.location.href = "${app}/pages/search.jsp?";
						});
	</script>
</body>
</html>
