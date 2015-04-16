<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="app" value="<%=request.getContextPath()%>" />

<table class="table" id="detailModalTable">
	<thead>
	</thead>
	<tbody>
		<c:forEach items="${searchResDetailModels}" var="res">
			<tr>
				<td>${res.xmmc}
				<c:if test="${res.xmfyms != null}">【${res.xmfyms}】</c:if></td>
				<td align="right">${res.xmfy}元</td>
			</tr>
		</c:forEach>

	</tbody>
</table>