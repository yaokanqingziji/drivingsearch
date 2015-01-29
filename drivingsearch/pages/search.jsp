<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, user-scalable=no" />
<script src="/drivingsearch/js/jquery-1.9.1.js"></script>
<script src="/drivingsearch/bootstrap3.3.0/dist/js/bootstrap.min.js"></script>

<script
	src="http://api.map.baidu.com/api?ak=2ca7lg3IXlvAckxYfuGdCKyk&v=2.0"></script>

<link rel="stylesheet"
	href="/drivingsearch/bootstrap3.3.0/dist/css/bootstrap.min.css" />
<title>来个代驾 </title>
<style type="text/css">
html,body { 
	height: 100%;
}

#l-map {
	height: 70%;
	width: 100%;
}
</style>

</head>
<body>
	<!-- 小提示 -->
	<!-- <div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<div class="alert alert-success" >
					<strong>警告!</strong> 请注意你的个人隐私安全.
				</div>
			</div>
		</div>
	</div> -->
	<!-- 百度极速地图 -->
	<div id="l-map"></div>
	<br>
	<!-- 地址输入 -->
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<form>
					<fieldset>
						<legend></legend>
						<br>
						<div id="r-result">
							<label>预约时间：</label><input type="text" /> <br> <label>出&nbsp;&nbsp;发&nbsp;&nbsp;地：</label><input
								type="text" id="suggestId" size="20" value="我的位置"
								style="width: 150px;" /> <br> <label>目&nbsp;&nbsp;的&nbsp;&nbsp;地：</label><input
								type="text" id="suggestId2" size="20" value=""
								style="width: 150px;" /> <br>
							<button class="btn" type="button">搜索</button>
						</div>
						<div id="searchResultPanel"
							style="border: 1px solid #C0C0C0; width: 150px; height: auto; display: none;"></div>

						<div id="searchResultPanel2"
							style="border: 1px solid #C0C0C0; width: 150px; height: auto; display: none;"></div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
    
	var map = new BMap.Map("l-map");
	//TODO 这里需要增加GPS定位
	map.centerAndZoom("济南", 19); // 初始化地图,设置城市和地图级别。

	
	var myValue; //
	var ac = new BMap.Autocomplete( //为出发地输入框建立一个自动完成的对象
	{
		"input" : "suggestId",
		"location" : map
	});
	var ac2 = new BMap.Autocomplete( //为目的地输入框建立一个自动完成的对象
	{
		"input" : "suggestId2",
		"location" : map
	});
	

	ac.addEventListener("onhighlight", function(e) { //鼠标放在下拉列表上的事件
		var str = "";
		var _value = e.fromitem.value;
		var value = "";
		if (e.fromitem.index > -1) {
			value = _value.province + _value.city + _value.district
					+ _value.street + _value.business;
		}
		str = "FromItem<br />index = " + e.fromitem.index + "<br />value = "
				+ value;

		value = "";
		if (e.toitem.index > -1) {
			_value = e.toitem.value;
			value = _value.province + _value.city + _value.district
					+ _value.street + _value.business;
		}
		str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = "
				+ value;
		G("searchResultPanel").innerHTML = str;
	});

	
	ac.addEventListener("onconfirm", function(e) { //鼠标点击下拉列表后的事件
		var _value = e.item.value;
		myValue = _value.province + _value.city + _value.district
				+ _value.street + _value.business;
		G("searchResultPanel").innerHTML = "onconfirm<br />index = "
				+ e.item.index + "<br />myValue = " + myValue;

		setPlace();
	});
	
	ac2.addEventListener("onhighlight", function(e) { //鼠标放在下拉列表上的事件
		var str = "";
		var _value = e.fromitem.value;
		var value = "";
		if (e.fromitem.index > -1) {
			value = _value.province + _value.city + _value.district
					+ _value.street + _value.business;
		}
		str = "FromItem<br />index = " + e.fromitem.index + "<br />value = "
				+ value;

		value = "";
		if (e.toitem.index > -1) {
			_value = e.toitem.value;
			value = _value.province + _value.city + _value.district
					+ _value.street + _value.business;
		}
		str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = "
				+ value;
		G("searchResultPanel2").innerHTML = str;
	});

	ac2.addEventListener("onconfirm", function(e) { //鼠标点击下拉列表后的事件
		var _value = e.item.value;
		myValue = _value.province + _value.city + _value.district
				+ _value.street + _value.business;
		G("searchResultPanel2").innerHTML = "onconfirm<br />index = "
				+ e.item.index + "<br />myValue = " + myValue;

		setPlace();
	});
	
	// 根据ID获取元素
	function G(id) {
		return document.getElementById(id);
	}

	function setPlace() {
		//map.clearOverlays(); //清除地图上所有覆盖物
		function myFun() {
			var pp = local.getResults().getPoi(0).point; //获取第一个智能搜索的结果
			map.centerAndZoom(pp, 18);
			map.addOverlay(new BMap.Marker(pp)); //添加标注
		}
		var local = new BMap.LocalSearch(map, { //智能搜索
			onSearchComplete : myFun
		});
		local.search(myValue);
	}
	
	//呃。。。计算耗时与距离
	function calcJlAHs(){
		
	}
</script>
