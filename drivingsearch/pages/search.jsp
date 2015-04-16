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
	content="width=device-width,initial-scale=1.0, user-scalable=no" />
<script src="/drivingsearch/js/jquery-1.9.1.js"></script>
<script src="/drivingsearch/bootstrap3.3.0/dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="/drivingsearch/datetimepicker/js/bootstrap-datetimepicker.js"
	charset="UTF-8"></script>
<script type="text/javascript"
	src="/drivingsearch/datetimepicker/js/locales/bootstrap-datetimepicker.fr.js"
	charset="UTF-8"></script>

<script
	src="http://api.map.baidu.com/api?ak=2ca7lg3IXlvAckxYfuGdCKyk&v=2.0"></script>

<link rel="stylesheet"
	href="/drivingsearch/bootstrap3.3.0/dist/css/bootstrap.min.css" />
<link
	href="/drivingsearch/datetimepicker/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<title>来个代驾</title>
<style>
html,body {
	height: 100%;
}

#l-map {
	height: 50%;
	width: 100%;
}
</style>

</head>
<body>
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
						<div class="form-group">
							<label for="yysjStr" class="col-md-2 control-label">预约时间：</label>
							<div class="input-group date form_time col-md-2" data-date=""
								data-date-format="hh:ii" data-link-field="yysjStr"
								data-link-format="hh:ii">
								<input class="form-control" size="16" type="text" value=""
									readonly> <span class="input-group-addon"><span
									class="glyphicon glyphicon-time"></span></span>
							</div>
							<input type="hidden" id="yysjStr" value="" /><br /> <label>出&nbsp;&nbsp;发&nbsp;&nbsp;地：</label><input
								type="text" id="suggestId" onchange="cfdChange()" size="20"
								style="width: 150px;" /> <br> <label>目&nbsp;&nbsp;的&nbsp;&nbsp;地：</label><input
								type="text" id="suggestId2" onchange="mddChange()" size="20"
								value="" style="width: 150px;" /> <br> <label><font
								id="yg" color="red"></font></label>
						</div>
						<legend></legend>
						<button class="btn btn-warning" type="button" onclick="search()"
							id="searchBtn">搜索</button>
						<div id="searchResultPanel"
							style="border: 1px solid #C0C0C0; width: 150px; height: auto; display: none;"></div>

						<div id="searchResultPanel2"
							style="border: 1px solid #C0C0C0; width: 150px; height: auto; display: none;"></div>
			</div>
			</fieldset>
			</form>
		</div>
	</div>
	</div>
</body>
</html>
<script>

	var mapJb = 18;
	var cfdStr = "cfd";
	var mddStr = "mdd";
	var cfdPoint; //出发地Point （point.lng--经度；  point.lat--纬度）
	var cfdPosition;
	var cfdName;

	var mddPoint;
	var mddPosition;
	var mddName;

	var ygjl;//预估距离
	var yghs;//预估耗时

	var driving = null;//驾车路线对象

	var locationFlag = "0"; //自动定位标志，0代表无法自动定位，1代表可以自动定位
	var locationErrMsg = "";//自动定位失败原因

	var map;
	$(document)
			.ready(
					function() {
						$('.form_time').datetimepicker({
							language : 'fr',
							weekStart : 1,
							todayBtn : true,
							autoclose : 1,
							todayHighlight : true,
							startView : 0,
							minView : 0,
							maxView : 1
						});
						
						
						map = new BMap.Map("l-map");

						//定位方式一GPS定位，如果定位不成功之后再进行其他方式定位
						//getLocation();
						//排除GPS定位
						createOtherPosition();

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
											setPlace(cfdStr);
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

											setPlace(mddStr);
										});

					});

	//GPS定位
	function getLocation() {
		if (navigator.geolocation) { //支持GPS定位
			navigator.geolocation.getCurrentPosition(setGpsPosition,
					locationError, {
						enableHighAccuracy : true,
						maximumAge : 1000
					});
		} else {//不支持GPS定位
			locationFlag = "0";
			locationErrMsg = "浏览器不支持使用HTML5来获取地理位置服务";
			createOtherPosition();
		}
	}

	//GPS定位成功回调。定位中心点 同时设置起始位置
	function setGpsPosition(value) {
		var geoc = new BMap.Geocoder();
		//获取经纬度
		var longitude = value.coords.longitude;
		var latitude = value.coords.latitude;
		// 创建点坐标
		var point = new BMap.Point(longitude, latitude);
		//根据坐标创建地图中心
		map.centerAndZoom(point, mapJb);
		//根据坐标获取cfdName,cfdPosition 类似实现ac的onconfirm
		geoc.getLocation(point, function(rs) {
			var addComp = rs.addressComponents;
			cfdName = rs.business;
			cfdPosition = addComp.province + addComp.city + addComp.district
					+ addComp.street + cfdName;
			if (cfdName == null || cfdName == '') {
				cfdName = cfdPosition;
			}
			//设置出发地名称
			$("#suggestId").val('我的位置');
			//设置起始位置标记
			setPlace(cfdStr);

		});
	}
	//GPS定位失败，采用其他方式进行定位（其他方式仅初始化地图展示中心，无法定位当前位置）
	function locationError(value) {
		locationFlag = "0";
		switch (value.code) {
		case 1:
			locationErrMsg = "位置服务被拒绝";
			break;
		case 2:
			locationErrMsg = "暂时获取不到位置信息";
			break;
		case 3:
			locationErrMsg = "获取信息超时";
			break;
		case 4:
			locationErrMsg = "未知错误";
			break;
		}
		createOtherPosition();
	}

	//排除GPS定位的其他定位。仅设置地图中心点
	function createOtherPosition() {
		//定位方式二，根据城市名称定位。 其中城市名称可以通过参数配置
		map.centerAndZoom("济南", mapJb); // 初始化地图,设置城市和地图级别。

		//定位方式三，根据经纬度定位。 经纬度通过参数配置。 该方式相比方式二有一个好处是：可以自定义城市中心展示
		//var point = new BMap.Point(116.331212,322.897445);//济南泉城广场 
		//map.centerAndZoom(point,mapJb);

		//定位方式四，根据ip自动定位,不确定手机是否可用,还未验证
		/* var point = new BMap.Point(1161.331212, 3222.897445);//经纬度随便写的。。
		map.centerAndZoom(point, mapJb);
		function setMapCenterByip(result) {
			var cityName = result.name;
			map.setCenter(cityName);
		}
		var myCity = new BMap.LocalCity();
		myCity.get(setMapCenterByip); */
	}

	function setPlace(flag) {
		//解决有下拉列表的情况出现
		$("#searchBtn").focus();

		var myValue = '';
		if (flag == cfdStr) {
			myValue = cfdPosition;
		} else if (flag = mddStr) {
			myValue = mddPosition;
		}
		map.clearOverlays(); //清除地图上所有覆盖物
		if (driving != null) {//清楚推荐路线
			driving.clearResults();
		}
		function markAndCalc() {
			var pp = local.getResults().getPoi(0).point; //获取第一个智能搜索的结果
			if (flag == cfdStr) {
				cfdPoint = pp;
			} else if (flag == mddStr) {
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
		if(yysjStr == null || yysjStr == ''){
			alert("请选择预约时间");
			return ;
		}
		if(cfdPoint == null){
			alert("请输入出发地");
			return;
		}
		if(mddPoint == null){
			alert("请输入目的地");
			return;
		}
		var cfdmc = cfdName;
		var cfdjd = cfdPoint.lng;
		var cfdwd = cfdPoint.lat;
		var mddmc = mddName;
		var mddjd = mddPoint.lng;
		var mddwd = mddPoint.lat;
		var ygms = $("#yg").html();
		
		var yghsValue = dealYghs(yghs);
		var ygjlValue = ygjl.replace("公里", "");
		//TODO 如果非会员用户使用搜索，那么需要先通过post方法保存临时用户。

		//TODO 用户保存成功后进行搜索跳转。
		
		searchUrl = "${app}/search/searchForPersonDrive.do?";
		searchUrl = searchUrl + "yysjStr=" + yysjStr + "&cfdmc=" + cfdmc
				+ "&cfdjd=" + cfdjd + "&cfdwd=" + cfdwd + "&mddmc=" + mddmc
				+ "&mddjd=" + mddjd + "&mddwd=" + mddwd + "&yghs=" + yghsValue
				+ "&ygjl=" + ygjlValue +"&ygms="+ ygms;
		window.location.href = searchUrl;
	}
	
	function dealYghs(yghs){
		var yghsVal = 0;
		var tempYghs = yghs;
		var hsArray;
		
		var index = tempYghs.indexOf("天");
		if(index > 0){
			hsArray = tempYghs.split("天");
			tempYghs = hsArray[1];
			yghsVal = yghsVal + parseInt(hsArray[0]) * 24 * 60;
		}
		
		index = tempYghs.indexOf("小时");
		if(index > 0){
			hsArray = tempYghs.split("小时");
			tempYghs = hsArray[1];
			yghsVal = yghsVal + parseInt(hsArray[0]) * 60;
		}
		
		yghsVal = yghsVal + parseInt(tempYghs.replace("分钟", ""));
		return yghsVal;
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
