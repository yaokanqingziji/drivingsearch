<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<script src="/drivingsearch/js/jquery-1.9.1.js"></script>
<script src="/drivingsearch/bootstrap3.3.0/dist/js/bootstrap.min.js"></script>
	<script src="http://api.map.baidu.com/components?ak=2ca7lg3IXlvAckxYfuGdCKyk&v=1.0"></script>
	<title>来个代驾</title>
	<style type="text/css">
		body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;}
		#golist {display: none;}
		@media (max-device-width: 800px){#golist{display: block!important;}}
	</style>
</head>
<body>
	<lbs-map center="116.307854,40.055878" style="height:100%"></lbs-map>
</body>
</html>

