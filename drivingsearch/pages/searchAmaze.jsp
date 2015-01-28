<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Amaze UI Examples</title>

<!-- Set render engine for 360 browser -->
<meta name="renderer" content="webkit">

<!-- No Baidu Siteapp-->
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="icon" type="image/png"
	href="/drivingsearch/amazeUI2.1.0/assets/i/favicon.png">

<!-- Add to homescreen for Chrome on Android -->
<meta name="mobile-web-app-capable" content="yes">
<link rel="icon" sizes="192x192"
	href="/drivingsearch/amazeUI2.1.0/assets/i/app-icon72x72@2x.png">

<!-- Add to homescreen for Safari on iOS -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="apple-touch-icon-precomposed"
	href="/drivingsearch/amazeUI2.1.0/assets/i/app-icon72x72@2x.png">

<!-- Tile icon for Win8 (144x144 + tile color) -->
<meta name="msapplication-TileImage"
	content="/drivingsearch/amazeUI2.1.0/assets/i/app-icon72x72@2x.png">
<meta name="msapplication-TileColor" content="#0e90d2">


<link rel="stylesheet"
	href="/drivingsearch/amazeUI2.1.0/assets/css/amazeui.min.css">
<link rel="stylesheet"
	href="/drivingsearch/amazeUI2.1.0/assets/css/app.css">

<script src="/drivingsearch/js/jquery-1.9.1.js"></script>
<script src="/drivingsearch/amazeUI2.1.0/assets/js/amazeui.min.js"></script>
<script
	src="http://api.map.baidu.com/api?ak=2ca7lg3IXlvAckxYfuGdCKyk&v=2.0"></script>

</head>
<body>

	<div data-am-widget="map" class="am-map am-map-default" data-longitude=""
		data-latitude="" data-scaleControl="" data-zoomControl="true"
		data-setZoom="17">
		<div id="bd-map"></div>
	</div>


	<footer class="am-margin-top">
		<hr />
		<p class="am-text-center">
			<small>by The AmazeUI Team.</small>
		</p>
	</footer>

</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("bd-map"); // 创建Map实例
	console.log('a');
	map.centerAndZoom(new BMap.Point(116.404, 39.915), 11); // 初始化地图,设置中心点坐标和地图级别
	map.addControl(new BMap.MapTypeControl()); //添加地图类型控件
	map.setCurrentCity("济南"); // 设置地图显示的城市 此项是必须设置的
	map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
</script>
