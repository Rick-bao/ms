<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
body, html, #allmap {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0;
	font-family: "微软雅黑";
}
</style>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=NVjCAyXc6cEvrA7UibxS2wFo"></script>
<title>首页-地图</title>
</head>

<body>
	<h1>地图应用中心</h1>
	<div style="height: 380px; width: 80%; margin: 0 auto;">
		<div id="allmap"></div>
	</div>
</body>
<%-- 百度地图 - 初始化 --%>
<script type="text/javascript">
	//------------基本功能
	// 百度地图API功能
	var map = new BMap.Map("allmap"); // 创建Map实例
	var point = new BMap.Point(116.404, 39.915);//设置中心点坐标【经度，纬度】
	map.centerAndZoom(point, 16); // 初始化地图,地图级别[级别：1-20]
	map.addControl(new BMap.MapTypeControl()); //添加地图类型控件
	map.setCurrentCity("北京"); // 设置地图显示的城市 此项是必须设置的
	map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
	
	//------------自动定位&缩放功能
	// 添加带有定位的导航控件
	var navigationControl = new BMap.NavigationControl({
		// LARGE类型
		type : BMAP_NAVIGATION_CONTROL_LARGE,
		// 靠左上角位置
		anchor : BMAP_ANCHOR_TOP_LEFT,
		// 启用显示定位
		enableGeolocation : true
	});
	map.addControl(navigationControl);
	
	//------------- 动画标注
	var marker = new BMap.Marker(point);  // 创建标注
	marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
    marker.enableDragging(); //marker可拖拽    
	map.addOverlay(marker);  // 将标注添加到地图中 */
	
	//------------- 单点标注信息
	var opt = {
	  width : 210,     // 信息窗口宽度
	  height: 100,     // 信息窗口高度
	  title : "海底捞王府井店" , // 信息窗口标题
	  enableMessage:true,//设置允许信息窗发送短息
	  message:"信息内容 。。。"
	}
	var infoWindow = new BMap.InfoWindow("地址：北京市东城区王府井大街88号乐天银泰百货八层", opt);  // 创建信息窗口对象 
	marker.addEventListener("click", function(){          
		map.openInfoWindow(infoWindow,point); //开启信息窗口
	});
	
	//---------------- 多点标注信息
	var data_info = [[116.417854,39.921988,"地址：北京市东城区王府井大街88号乐天银泰百货八层"],
					 [116.406605,39.921585,"地址：北京市东城区东华门大街"],
					 [116.412222,39.912345,"地址：北京市东城区正义路甲5号"]
					];
	var opts = {
				width : 250,     // 信息窗口宽度
				height: 80,     // 信息窗口高度
				title : "信息窗口" , // 信息窗口标题
				enableMessage:true//设置允许信息窗发送短息
			   };
	for(var i=0;i<data_info.length;i++){
		var markers = new BMap.Marker(new BMap.Point(data_info[i][0],data_info[i][1]));  // 创建标注
		var content = data_info[i][2];
		map.addOverlay(markers);               // 将标注添加到地图中
		addClickHandler(content,markers);
	}
	function addClickHandler(content,markers){
		markers.addEventListener("click",function(e){
			openInfo(content,e)}
		);
	}
	function openInfo(content,e){
		var p = e.target;
		var points = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
		var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
		map.openInfoWindow(infoWindow,points); //开启信息窗口
	}
	
	//------------ 单机获取经纬度
	map.addEventListener("click",function(e){
		alert("该地标经纬度分别是 ：经度 ["+e.point.lng + "] , 纬度  [" + e.point.lat+"]");
	});
	
	//------------- 判断图块加载完毕事件
	map.addEventListener("tilesloaded",function(){
		//alert(" 地图加载完毕 ");
	});
</script>
</html>