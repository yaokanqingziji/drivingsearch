<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="app" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset=utf-8 " />

<meta name="viewport"
	content="width=device-width,initial-scale=1.0,maximum-scale=0.8 ,minimum-scale=0.2, user-scalable=no" />
<script src="/drivingsearch/js/jquery-1.9.1.js"></script>
<script src="/drivingsearch/bootstrap3.3.0/dist/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="/drivingsearch/bootstrap3.3.0/dist/css/bootstrap.min.css" />
<title>搜索结果</title>
</head>
<body>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<div class="alert">
					<strong>友情提醒!</strong> <br>信息仅供参考，实际价格请以代驾公司为准。
				</div>
				<table class="table">
					<thead>
						<tr>
							<th>排名</th>
							<th>价格（元）</th>
							<th>公司名称</th>
							<th>电话预约</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${searchOrderResultModels}" var="res">
							<tr>
								<td>${res.sspm}</td>
								<td>${res.gsjg}</td>
								<td>${res.gsmc}(${res.pjjb })</td>
								<td><button class="btn" type="button" onclick="saveLog()">
										<a href="tel:${res.yydh} ">预约</a>
									</button></td>
							</tr>
						</c:forEach>

						<!-- 							<tr class="info">
								<td>1</td>
								<td>39.0(50.0)</td>
								<td>E代驾 <br>(4星)
								</td>
								<td><button class="btn" type="button">预约</button></td>

							</tr>
							<tr class="warning">
								<td>2</td>
								<td>45.0(48.5)</td>
								<td>途顺代驾<br>(3星)
								</td>
								<td><button class="btn" type="button">预约</button></td>
							</tr>
							<tr class="info">
								<td>3</td>
								<td>50.0(55.5)</td>
								<td>V代驾<br>(4星)
								</td>
								<td><button class="btn" type="button">预约</button></td>
							</tr>
							<tr class="warning">
								<td>4</td>
								<td>50.5(52.0)</td>
								<td>易代驾<br>(5星)
								</td>
								<td><button class="btn" type="button">预约</button></td>
							</tr>
							<tr class="info">
								<td>5</td>
								<td>50.5(51.0)</td>
								<td>来个代驾啦啦啦啦啦啦<br>(4星)
								</td>
								<td><button class="btn" type="button">预约</button></td>
							</tr>
 -->
					</tbody>
				</table>
				<div class="alert">
					<strong>友情提醒!</strong> <br>括号内的价格为延长一定耗时后的参考价格。
				</div>
			</div>
		</div>
	</div>

</body>
</html>
<script>
	$(document).ready(function() {
		$(".table tbody > tr:even").addClass("info");
		$(".table tbody > tr:odd").addClass("warning");
	});

	function saveLog() {
		alert('a');
	}
</script>
