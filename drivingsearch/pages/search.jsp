<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="app" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset=utf-8" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, user-scalable=no" />
<script src="/drivingsearch/js/jquery-1.9.1.js"></script>
<script src="/drivingsearch/bootstrap3.3.0/dist/js/bootstrap.min.js"></script>

<script
	src="http://api.map.baidu.com/api?ak=2ca7lg3IXlvAckxYfuGdCKyk&v=2.0"></script>

<link rel="stylesheet"
	href="/drivingsearch/bootstrap3.3.0/dist/css/bootstrap.min.css" />
<title>来个代驾</title>
<style >
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
							<label>预约时间：</label><input id="yysjStr" type="text" /> <br>
							<label>出&nbsp;&nbsp;发&nbsp;&nbsp;地：</label><input type="text"
								id="suggestId" onchange="cfdChange()" size="20" value="我的位置"
								style="width: 150px;" /> <br> <label>目&nbsp;&nbsp;的&nbsp;&nbsp;地：</label><input
								type="text" id="suggestId2" onchange="mddChange()" size="20"
								value="" style="width: 150px;" />
						</div>
						<br>
						<legend id="yg"></legend>
						<button class="btn" type="button" onclick="search()">搜索</button>
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
<script>
	var mapJb = 19;
	var cfdPoint; //出发地Point （point.lng--经度；  point.lat--纬度）
	var cfdPosition;
	var cfdName;

	var mddPoint;
	var mddPosition;
	var mddName;

	var ygjl;//预估距离
	var yghs;//预估耗时

	var driving = null;//驾车路线对象

	var map;
	$(document)
			.ready(
					function() {
						map = new BMap.Map("l-map");
						//TODO 这里需要增加GPS定位
						map.centerAndZoom("济南", mapJb); // 初始化地图,设置城市和地图级别。

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

						ac.addEventListener("onhighlight",
								function(e) { //鼠标放在下拉列表上的事件
									var str = "";
									var _value = e.fromitem.value;
									var value = "";
									if (e.fromitem.index > -1) {
										value = _value.province + _value.city
												+ _value.district
												+ _value.street
												+ _value.business;
									}
									str = "FromItem<br />index = "
											+ e.fromitem.index
											+ "<br />value = " + value;

									value = "";
									if (e.toitem.index > -1) {
										_value = e.toitem.value;
										value = _value.province + _value.city
												+ _value.district
												+ _value.street
												+ _value.business;
									}
									str += "<br />ToItem<br />index = "
											+ e.toitem.index + "<br />value = "
											+ value;
									$("#searchResultPanel").innerHTML = str;
								});

						ac
								.addEventListener(
										"onconfirm",
										function(e) { //鼠标点击下拉列表后的事件
											var _value = e.item.value;
											cfdName = _value.business;
											cfdPosition = _value.province
													+ _value.city
													+ _value.district
													+ _value.street
													+ _value.business;

											$("#searchResultPanel").innerHTML = "onconfirm<br />index = "
													+ e.item.index
													+ "<br />myValue = "
													+ cfdName;
											setPlace("cfd");
										});

						ac2.addEventListener("onhighlight",
								function(e) { //鼠标放在下拉列表上的事件
									var str = "";
									var _value = e.fromitem.value;
									var value = "";
									if (e.fromitem.index > -1) {
										value = _value.province + _value.city
												+ _value.district
												+ _value.street
												+ _value.business;
									}
									str = "FromItem<br />index = "
											+ e.fromitem.index
											+ "<br />value = " + value;

									value = "";
									if (e.toitem.index > -1) {
										_value = e.toitem.value;
										value = _value.province + _value.city
												+ _value.district
												+ _value.street
												+ _value.business;
									}
									str += "<br />ToItem<br />index = "
											+ e.toitem.index + "<br />value = "
											+ value;

									$("#searchResultPanel2").innerHTML = str;
								});

						ac2
								.addEventListener(
										"onconfirm",
										function(e) { //鼠标点击下拉列表后的事件
											var _value = e.item.value;
											mddName = _value.business;
											mddPosition = _value.province
													+ _value.city
													+ _value.district
													+ _value.street
													+ _value.business;
											$("#searchResultPanel2").innerHTML = "onconfirm<br />index = "
													+ e.item.index
													+ "<br />myValue = "
													+ mddName;

											setPlace("mdd");
										});

					});

	function setPlace(flag) {
		var myValue = '';
		if (flag == "cfd") {
			myValue = cfdPosition;
		} else if (flag = "mdd") {
			myValue = mddPosition;
		}
		map.clearOverlays(); //清除地图上所有覆盖物
		if (driving != null) {//清楚推荐路线
			driving.clearResults();
		}
		function markAndCalc() {
			var pp = local.getResults().getPoi(0).point; //获取第一个智能搜索的结果
			if (flag == "cfd") {
				cfdPoint = pp;
			} else if (flag == "mdd") {
				mddPoint = pp;
			}
			map.centerAndZoom(pp, mapJb);
			map.addOverlay(new BMap.Marker(pp)); //添加标注

			if (cfdPoint != undefined && mddPoint != undefined) {
				//标记推荐路线并计算耗时与距离
				driving = new BMap.DrivingRoute(map, {
					renderOptions : {
						map : map,
						autoViewport : true
					},
					onSearchComplete : searchComplete,
					onPolylinesSet : getJlAHs
				});
				driving.search(cfdPoint, mddPoint);

			} else {
				//清空预估信息
				ygjl = 0;
				yghs = 0;
				$("#yg").text('');
			}
		}
		var local = new BMap.LocalSearch(map, { //智能搜索
			onSearchComplete : markAndCalc
		});
		local.search(myValue);
	}

	//在页面中显示耗时与距离
	function getJlAHs() {
		$("#yg").text("距离：" + ygjl + "，预计耗时：" + yghs);
	}

	function searchComplete(results) {
		if (driving == null || driving == undefined) {
			return;
		}
		if (driving.getStatus() != BMAP_STATUS_SUCCESS) {
			return;
		}
		var plan = results.getPlan(0);
		yghs = plan.getDuration(true); //获取时间
		ygjl = plan.getDistance(true); //获取距离
	};

	function search() {
		var searchUrl;
		var yysjStr = $("#yysjStr").val();
		var cfdmc = cfdName;
		var cfdjd = cfdPoint.lng;
		var cfdwd = cfdPoint.lat;
		var mddmc = mddName;
		var mddjd = mddPoint.lng;
		var mddwd = mddPoint.lat;
		var yghsValue = yghs.replace("分钟", "");
		var ygjlValue = ygjl.replace("公里", "");
		//TODO 如果非会员用户使用搜索，那么需要先通过post方法保存临时用户。

		//TODO 用户保存成功后进行搜索跳转。
		searchUrl = "${app}/search/searchForPersonDrive.do?";
		searchUrl = searchUrl + "yysjStr=" + yysjStr + "&cfdmc=" + cfdmc
				+ "&cfdjd=" + cfdjd + "&cfdwd=" + cfdwd + "&mddmc=" + mddmc
				+ "&mddjd=" + mddjd + "&mddwd=" + mddwd + "&yghs=" + yghsValue
				+ "&ygjl=" + ygjlValue;
		window.location.href = searchUrl;
	}

	function cfdChange() {
		var cfd = $("#suggestId").val();
		if (cfd == null || cfd == '') {
			cfdPoint = null;
			cfdPosition = null;
			cfdName = null;
		} else {
			return;
		}
	}

	function mddChange() {
		var mdd = $("#suggestId2").val();
		if (mdd == null || mdd == '') {
			mddPoint = null;
			mddPosition = null;
			mddName = null;
		} else {
			return;
		}
	}
</script>
