


<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset=utf-8 " />
<meta http-equiv="Pragma" content="no-cache" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, user-scalable=no" />
<script src="/drivingsearch/js/jquery-1.9.1.js"></script>
<script src="/drivingsearch/bootstrap3.3.0/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="/drivingsearch/bootstrap3.3.0/dist/css/bootstrap.min.css" />
<title>出错啦</title>

</head>
<body>

	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<h3 class="text-center text-danger">${requestScope.msg}</h3>
			</div>
		</div>
	</div>
</body>
</html>
