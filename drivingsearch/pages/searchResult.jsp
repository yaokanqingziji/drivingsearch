<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="app" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />

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
					<strong>友情提醒!</strong> <br>信息仅供参考，实际价格请以代驾公司为准。 <br>
					<font color="red">出发时间：${yysj}， 到达时间：${ddsj}</font> <br>
					<font color="red">${ygms}</font> <br>
					<c:if test="${cfsjms != null && cfsjms != ''}">
						<font color="red">${cfsjms}</font> <br>
					</c:if>
				</div>
				<table class="table">
					<thead>
						<tr>
							<th>排名</th>
							<th>价格（元）</th>
							<th>公司名称</th>
							<!-- <th>联系人</th> -->
							<th>提醒</th>
							<th>电话预约</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${searchOrderResultModels}" var="res">
							<tr>
								<td>${res.sspm}</td>
								<td><a class="btn" role="button"
									onclick="detailView('${res.ssjlid}','${res.gsid}','${res.gsmc}','${res.gsjg}','${ygms}')">${res.gsjg}</button></td>
								<td>${res.gsmc}</td>
								<%-- <td>${res.yylxr}</td> --%>
								<td>${res.qtjfms}</td>
								<td><button class="btn" type="button"
										onclick="saveLog('${res.gsid}','${res.ssjlid}','${res.yydh}','${res.yylxr}')">
										<a href="tel:${res.yydh} ">预约</a>
									</button></td>
							</tr>
						</c:forEach>
						<!-- <tr class="info">
							<td>1</td>
							<td>39.0(50.0)</td>
							<td>E代驾 <br>(4星)
							</td>
							<td><button class="btn" type="button">预约</button></td>
							<td>
								<button type="button" class="btn btn-xs btn-primary"
									role="button" onclick="test('E代驾  总费用39.0')">详情</button>
							</td>
						</tr> -->

					</tbody>
				</table>
				<!-- <div class="alert">
					<strong>友情提醒!</strong> <br>括号内的价格为延长一定耗时后的参考价格。
				</div> -->

				<div class="modal fade" id="detailModal" role="dialog"
					aria-labelledby="detailModalTitle" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="modal-title" id="detailModalTitle"></h4>
							</div>
							<div class="modal-body" id="detailModalContain"></div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
							</div>
						</div>
					</div>

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

	function saveLog(gsid, ssjlid, yydh, yylxr) {
		$.post("${app}/appoint/addAppoint.do?gsid=" + gsid + "&yyly=01&yylydx="
				+ ssjlid + "&yylxrdh=" + yydh + "&djlx=01&yylxr=" + yylxr);
	}

	function detailView(ssjlid, gsid, gsmc, gsjg, ygms) {
		$.post(
				"${app}/search/detailView.do?ssjlid=" + ssjlid + "&gsid="
						+ gsid, function(data) {
					$("#detailModalTitle").html(
							gsmc + "【费用：" + gsjg + "元】<br>" + ygms);
					$("#detailModalContain").html(data);

					$("#detailModalContain table tbody > tr:even").addClass(
							"info");
					$("#detailModalContain table tbody > tr:odd").addClass(
							"warning");

					$('#detailModal').modal('show');
				});
		/* $('#detailModal').on('shown.bs.modal', function() {
			$("#detailModalContain").html('ldw test ma le ge bi');

		}); */
		/* $('#detailModal').modal({
			keyboard : false,
			backdrop : false
		}); 
		$('#detailModal').modal('show');*/
	}
</script>
