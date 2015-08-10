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
<script src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script>


<script src="/drivingsearch/js/util/DateUtil.js"></script>

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
							<label>请输入并选择您要去的地方：</label><input type="text" id="suggestId2"
								onchange="mddChange()"  size="20" value="" style="width: 240px;" />
								<img class="img-rounded" onclick="clearMddAndFocus()" alt="" width="25" height="25" src="../images/clear.png" />
							<br> <label><font id="yg" color="red"></font></label>
						</div>
						<legend></legend>
						<button class="btn btn-lg btn-block btn-warning" type="button"
							onclick="search()" id="searchBtn">点击此处查看代驾排名</button>
						<div id="searchResultPanel"
							style="border: 1px solid #C0C0C0; width: 150px; height: auto; display: none;"></div>

						<div id="searchResultPanel2"
							style="border: 1px solid #C0C0C0; width: 150px; height: auto; display: none;"></div>
						<br>
						<div class="form-group">
							<label>您可以设置出发时间与出发地，进行搜索呦</label> <br> <label>出发时间：</label>
							<input id="yysjStr" size="20" type="text" value="" readonly
								class="form_datetime" style="width: 180px;"> <br /> <label>出&nbsp;&nbsp;发&nbsp;&nbsp;地：&nbsp;</label><input
								type="text" id="suggestId" onchange="cfdChange()"  size="20"
								style="width: 180px;" /> 
								<img class="img-rounded" onclick="clearCfdAndFocus()" alt="" width="25" height="25" src="../images/clear.png" />
								<br> <br> <br> <br>
							<br> <br> <br> <br>
						</div>
			</div>
			</fieldset>
			</form>
		</div>
	</div>
	</div>
</body>
</html>
<script>
	var dsCity = "济南市";
	var currTime;
	var cfycsj = 15; //出发延长时间（15分钟）
	var cfsjms = "";

	var mapJb = 18;
	var cfdStr = "cfd";
	var mddStr = "mdd";
	var cfdPoint; //出发地Point （point.lng--经度；  point.lat--纬度）
	var cfdPosition;
	var cfdName;

	var cfdGpsPoint;

	var mddPoint;
	var mddPosition;
	var mddName;

	var ygjl;//预估距离
	var yghs;//预估耗时

	var driving = null;//驾车路线对象

	var locationFlag = "0"; //自动定位标志，0代表无法自动定位，1代表可以自动定位
	var locationErrMsg = "";//自动定位失败原因

	var map;

	//时间插件初始化
	function initDatePicker() {
		$(".form_datetime").datetimepicker({
			//format : 'hh:ii',
			todayBtn : false,
			autoclose : 1,
			todayHighlight : true,
			startView : 0,
			minView : 0,
			maxView : 1
		});

		$('.datetimepicker-minutes .prev i').addClass(
				'glyphicon glyphicon-arrow-left');
		$('.datetimepicker-minutes .next i').addClass(
				'glyphicon glyphicon-arrow-right');
	}

	//初始化地址输入框
	function initAutocomplete() {
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
			str = "FromItem<br />index = " + e.fromitem.index
					+ "<br />value = " + value;

			value = "";
			if (e.toitem.index > -1) {
				_value = e.toitem.value;
				value = _value.province + _value.city + _value.district
						+ _value.street + _value.business;
			}
			str += "<br />ToItem<br />index = " + e.toitem.index
					+ "<br />value = " + value;
			$("#searchResultPanel").innerHTML = str;
		});

		ac.addEventListener("onconfirm", function(e) { //鼠标点击下拉列表后的事件
			var _value = e.item.value;
			cfdName = _value.business;
			cfdPosition = _value.province + _value.city + _value.district
					+ _value.street + _value.business;

			$("#searchResultPanel").innerHTML = "onconfirm<br />index = "
					+ e.item.index + "<br />myValue = " + cfdName;

			cfdGpsPoint = null;
			dsCity = _value.city;
			setPlace(cfdStr);
		});

		ac2.addEventListener("onhighlight", function(e) { //鼠标放在下拉列表上的事件
			var str = "";
			var _value = e.fromitem.value;
			var value = "";
			if (e.fromitem.index > -1) {
				value = _value.province + _value.city + _value.district
						+ _value.street + _value.business;
			}
			str = "FromItem<br />index = " + e.fromitem.index
					+ "<br />value = " + value;

			value = "";
			if (e.toitem.index > -1) {
				_value = e.toitem.value;
				value = _value.province + _value.city + _value.district
						+ _value.street + _value.business;
			}
			str += "<br />ToItem<br />index = " + e.toitem.index
					+ "<br />value = " + value;

			$("#searchResultPanel2").innerHTML = str;
		});

		ac2.addEventListener("onconfirm", function(e) { //鼠标点击下拉列表后的事件
			var _value = e.item.value;
			mddName = _value.business;
			mddPosition = _value.province + _value.city + _value.district
					+ _value.street + _value.business;
			$("#searchResultPanel2").innerHTML = "onconfirm<br />index = "
					+ e.item.index + "<br />myValue = " + mddName;

			setPlace(mddStr);
		});
	}
	$(document).ready(function() {

		cfdGpsPoint = null;
		
		//时间插件设置
		initDatePicker();

		//设置出发时间默认值
		var currDateObj = new Date();
		currTime = DateUtil.toString(currDateObj);
		$("#yysjStr").val(currTime);

		//初始化地图
		map = new BMap.Map("l-map");

		//初始化地址输入框
		initAutocomplete();

		//定位方式一GPS定位，如果定位不成功之后再进行其他方式定位
		getLocation();
		//排除GPS定位
		//createOtherPosition();

	});

	//GPS定位  首先采用百度定位，百度定位失败采用Gps定位
	function getLocation() {
		baiduGps();
	}
	//百度地图api定位
	function baiduGps() {
		var geolocation = new BMap.Geolocation();
		geolocation.getCurrentPosition(function(r) {
			if (this.getStatus() == BMAP_STATUS_SUCCESS) {
				//定位成功
				//alert('256L,百度定位成功,lng='+r.point.lng+',lat='+r.point.lat);
				setGpsPosition(r.point);
			} else {
				//定位失败，使用html定位
				//alert('260L,地图定位失败,开始html定位');
				htmlGps();
			}
		});

	}
	//	htmlGPS定位失败，采用其他方式
	function htmlGps() {
		if (navigator.geolocation) { //支持GPS定位
			navigator.geolocation.getCurrentPosition(translatePoint,
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

	//html定位后，需要进行坐标转换
	function translatePoint(position) {
		var currentLat = position.coords.latitude;
		var currentLon = position.coords.longitude;
		var gpsPoint = new BMap.Point(currentLon, currentLat);
		BMap.Convertor.translate(gpsPoint, 0, setGpsPosition); //转换坐标 后，调用setGpsPosition
	}

	//定位成功回调。定位中心点 同时设置起始位置
	function setGpsPosition(point) {
		//alert('291L,setGpsPosition开始，lng='+point.lng+',lat='+point.lat);
		cfdGpsPoint = point;

		var geoc = new BMap.Geocoder();
		//根据坐标创建地图中心
		map.centerAndZoom(point, mapJb);
		//根据坐标获取cfdName,cfdPosition 类似实现ac的onconfirm
		geoc.getLocation(point, function(rs) {
			var addComp = rs.addressComponents;
			dsCity = addComp.city;
			cfdName = rs.business;
			cfdPosition = addComp.province + addComp.city + addComp.district
					+ addComp.street + cfdName;
			//alert('304L,根据point获取信息结果：dsCity='+dsCity+',cfgName='+cfdName+',cfgPosition='+cfdPosition);
			if (cfdName == null || cfdName == '') {
				cfdName = cfdPosition;
			}
			
			//设置出发地名称
			//$("#suggestId").val('我的位置');
			$("#suggestId").val(cfdName);
			//设置起始位置标记
			try {
				setPlace(cfdStr);
			} catch (e) {
				baiduGps();
			}
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
		map.centerAndZoom(dsCity, mapJb); // 初始化地图,设置城市和地图级别。

		//定位方式三，根据经纬度定位。 经纬度通过参数配置。 该方式相比方式二有一个好处是：可以自定义城市中心展示
		//var point = new BMap.Point(116.331212, 322.897445);//济南泉城广场 
		//map.centerAndZoom(point, mapJb);

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

	//在地图上标记地理位置
	function setPlace(flag) {
		//alert('362L,setPlace开始，flag='+flag);
		//解决有下拉列表的情况出现
		$("#searchBtn").focus();

		var myValue = '';
		if (flag == cfdStr) {
			myValue = cfdPosition;
		} else if (flag = mddStr) {
			myValue = mddPosition;
		}
		//alert('372L,作为显示信息myValue='+myValue);
		map.clearOverlays(); //清除地图上所有覆盖物
		if (driving != null) {//清除推荐路线
			driving.clearResults();
		}
		function markAndCalc() {
			var pp;
			if (flag == cfdStr
					&& (cfdGpsPoint != undefined || cfdGpsPoint != null)) {
				//alert('381L,hoho~,这才是正确的哦~');
				pp = cfdGpsPoint;
			} else {
				try {
					pp = local.getResults().getPoi(0).point;
				} catch (e) {
					baiduGps();
				}
			}
			//alert('389L,pp为定位点，lng='+pp.lng+',lat='+pp.lat+'。啊啊啊，是否与之前的坐标一样呢？');
			/* try{
				pp = local.getResults().getPoi(0).point;//获取第一个智能搜索的结果
			}catch(e){
				baiduGps();
			} */

			if (flag == cfdStr) {
				/* 				if (cfdGpsPoint != undefined || cfdGpsPoint != null) {
				 pp = cfdGpsPoint;
				 }
				 */
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
		if (flag == cfdStr
				&& (cfdGpsPoint != undefined || cfdGpsPoint != null)) {
			//alert('431L,唉，我不搜索啦');
			markAndCalc();
		}else{
			var local = new BMap.LocalSearch(map, { //智能搜索
				onSearchComplete : markAndCalc
			});
			//alert('437L,智能搜索开始。为什么搜索开始后才执行定位呢呢呢呢？那还搜索什么呢呢呢，myValue='+myValue);
			local.search(myValue);
		}
		
	}

	//地图起始与终止坐标定位后，计算导航信息
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

	//在页面中显示耗时与距离
	function getJlAHs() {
		$("#yg").text("距离：" + ygjl + "，预计耗时：" + yghs);
	}

	//点击搜索按钮进行代驾搜索
	function search() {

		var searchUrl;
		var yysjStr = $("#yysjStr").val();
		cfsjms = "";
		if (yysjStr == null || yysjStr == '') {
			alert("请选择预约时间");
			$("#yysjStr").focus();
			return;
		}

		//处理出发时间
		yysjStr = dealCfsj(yysjStr);

		//因为格式为： 2015-05-15 22:35，仅取22:35
		yysjStr = yysjStr.split(' ')[1];

		if (cfdPoint == null) {
			alert("请输入出发地");
			$("#suggestId").focus();
			return;
		}
		if (mddPoint == null) {
			alert("请输入目的地");
			$("#suggestId2").focus();
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
		var ygjlValue = dealYgjl(ygjl);
		
		if(dsCity == null || dsCity == ''){
			dsCity = "济南市";
		}
		//TODO 如果非会员用户使用搜索，那么需要先通过post方法保存临时用户。

		//TODO 用户保存成功后进行搜索跳转。

		searchUrl = "${app}/search/searchForPersonDrive.do?";
		searchUrl = searchUrl + "yysjStr=" + yysjStr + "&cfdmc=" + cfdmc
				+ "&cfdjd=" + cfdjd + "&cfdwd=" + cfdwd + "&mddmc=" + mddmc
				+ "&mddjd=" + mddjd + "&mddwd=" + mddwd + "&yghs=" + yghsValue
				+ "&ygjl=" + ygjlValue + "&ygms=" + ygms + "&cfsjms=" + cfsjms
				+ "&djCity=" + dsCity;
		window.location.href = searchUrl;
	}

	//处理预估耗时，转换为分钟表示
	function dealYghs(yghs) {
		var yghsVal = 0;
		var tempYghs = yghs;
		var hsArray;

		var index = tempYghs.indexOf("天");
		if (index > 0) {
			hsArray = tempYghs.split("天");
			tempYghs = hsArray[1];
			if (tempYghs == null) {
				tempYghs = '';
			}
			yghsVal = yghsVal + parseInt(hsArray[0]) * 24 * 60;
		}

		index = tempYghs.indexOf("小时");
		if (index > 0) {
			hsArray = tempYghs.split("小时");
			tempYghs = hsArray[1];
			if (tempYghs == null) {
				tempYghs = '';
			}
			yghsVal = yghsVal + parseInt(hsArray[0]) * 60;
		}

		index = tempYghs.indexOf("分钟");
		if (index > 0) {
			hsArray = tempYghs.split("分钟");
			yghsVal = yghsVal + parseInt(hsArray[0]);
		}

		return yghsVal;
	}

	//处理距离，转换为公里表示
	function dealYgjl(ygjl) {
		var ygjlVal = 0;
		var tempYgjl = ygjl;
		var hsArray;

		var index = tempYgjl.indexOf("公里");
		if (index > 0) {
			hsArray = tempYgjl.split("公里");
			tempYgjl = hsArray[1];
			ygjlVal = ygjlVal + parseInt(hsArray[0]);
		}
		if (tempYgjl == null || tempYgjl == 0) {
			return ygjlVal;
		}

		index = tempYgjl.indexOf("米");
		if (index > 0) {
			hsArray = tempYgjl.split("米");
			ygjlVal = ygjlVal + parseInt(hsArray[0]) / 1000;
		}

		return ygjlVal;
	}

	//出发地变换时，清空出发地相关全局参数。
	function cfdChange() {
		var cfd = $("#suggestId").val();
		if (cfd == null || cfd == '') {
			clearCfd();
		} else {
			return;
		}
	}
	
	function clearCfd(){
		$("#suggestId").val("");
		cfdPoint = null;
		cfdPosition = null;
		cfdName = null;

		cfdGpsPoint = null;
	}
	
	function clearCfdAndFocus(){
		clearCfd();
		$("#suggestId").focus();
	}

	//目的地变换时，清空目的地相关全局参数
	function mddChange() {
		var mdd = $("#suggestId2").val();
		if (mdd == null || mdd == '') {
			clearMdd();
		} else {
			return;
		}
	}
	
	function clearMdd(){
		$("#suggestId2").val("");
		mddPoint = null;
		mddPosition = null;
		mddName = null;
	}
	
	function clearMddAndFocus(){
		clearMdd();
		$("#suggestId2").focus();
	}

	//处理出发时间， 如果出发时间不超过当前时间15分钟，按照当前时间15分钟为出发时间
	function dealCfsj(yysjStr) {
		var currDate = DateUtil.toDate(currTime);
		var yysjDate = DateUtil.toDate(yysjStr);
		//比较当前时间与出发时间的大小
		if (yysjDate < currDate) {//如果出发时间少于当前时间，那么不考虑此处理。
			return yysjStr;
		} else {//如果出发时间不少于当前时间，比较出发时间与当前时间+15分钟后的大小
			currDate.setMinutes(currDate.getMinutes() + cfycsj);
			if (currDate > yysjDate) {

				cfsjms = "(为了估算的更为准确，考虑到代驾人员到达需要时间，将您选择的出发时间稍微向后延长)";

				return DateUtil.toString(currDate);
			} else {
				return yysjStr;
			}
		}
	}
</script>
