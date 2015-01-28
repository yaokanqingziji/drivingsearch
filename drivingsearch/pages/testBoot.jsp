<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="app" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap 101 Template</title>

<!-- Bootstrap -->
<link href="/drivingsearch/bootstrap3.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<h1>你好，世界！</h1>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<div style="width: 1200px; height: 500px; border: 1px solid gray"
					id="container"></div>
				<a id="modal-850972" class="btn" role="button"
					href="#modal-container-850972" data-toggle="modal">触发遮罩窗体</a>

				<div aria-hidden="true" id="modal-container-850972"
					class="modal hide fade" role="dialog"
					aria-labelledby="myModalLabel">
					<div class="modal-header">
						<button aria-hidden="true" class="close" type="button"
							data-dismiss="modal">×</button>
						<h3 id="myModalLabel">标题栏</h3>
					</div>
					<div class="modal-body">
						<p>显示信息</p>
					</div>
					<div class="modal-footer">
						<button aria-hidden="true" class="btn" data-dismiss="modal">关闭</button>
						<button class="btn btn-primary">保存设置</button>
					</div>
				</div>
				<div class="alert">
					<button class="close" type="button" data-dismiss="alert">×</button>
					<h4>提示!</h4>
					<strong>警告!</strong> 请注意你的个人隐私安全.
				</div>
				<div class="hero-unit">
					<h1>Hello, world!</h1>
					<p>这是一个可视化布局模板, 你可以点击模板里的文字进行修改, 也可以通过点击弹出的编辑框进行富文本修改.
						拖动区块能实现排序.</p>
					<p>
						<a class="btn btn-primary btn-large" href="#">参看更多 »</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="/drivingsearch/bootstrap3.3.0/dist/js/bootstrap.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/drivingsearch/js/jquery-1.9.1.js"></script>
	<script type="text/javascript"
		src="http://api.map.baidu.com/api?v2.0&ak=2ca7lg3IXlvAckxYfuGdCKyk"></script>
	<script type="text/javascript">
		var map = new BMap.Map("container"); // 创建Map实例

		//var point1 = new BMap.Point(117.514611,37.495152);  
		map.centerAndZoom('济南', 19); // 初始化地图,设置中心点坐标和地图级别
		//map.centerAndZoom('北京', 11);
	</script>
</body>

</html>


