<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HappyHouse</title>
 <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/menu/menu.css" />
</head>
<body>
	<div>
		<div class="container">
			<%@ include file="/resources/menu/header.jsp" %>
		</div>

		<section id="index_section">
			<div class="card col-sm-12 mt-1" style="min-height: 850px;">
				<div class="card-body">
					<div align="center">
						시도 : <select id="sido"> <option value="0">선택</option> </select> 
						구군 : <select id="gugun"> <option value="0">선택</option> </select>
						읍면동 : <select id="dong"> <option value="0">선택</option> 
						</select>
						<hr>
					</div>
					<div class="container">
					<table class="table mt-2">
						<thead>
							<tr>
								<th>번호</th>
								<th>법정동</th>
								<th>아파트이름</th>
								<th>지번</th>
								<th>지역코드</th>
								<th>위도</th>
								<th>경도</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					</div>
					<div id="map" style="width: 80%; height: 500px; margin: auto;"></div>

				</div>
			</div>
		</section>
	</div>
	
	
<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC7Se1og4I5GE7YoL0cvD96gQCZQXPZJR0&callback=initMap"></script>
<script>
let colorArr = ['table-primary','table-success','table-danger'];
$(document).ready(function(){
	$.get("${pageContext.request.contextPath}/SelectBoxController"
		,{command:"sido"}
		,function(data, status){
			$.each(data, function(index, vo) {
				$("#sido").append("<option value='"+vo.sido_code+"'>"+vo.sido_name+"</option>");
			});
		}
		, "json"
	);
});
$(document).ready(function(){
	$("#sido").change(function() {
		$.get("${pageContext.request.contextPath}/SelectBoxController"
				,{command:"gugun", sido:$("#sido").val()}
				,function(data, status){
					$("#gugun").empty();
					$("#gugun").append('<option value="0">선택</option>');
					$.each(data, function(index, vo) {
						$("#gugun").append("<option value='"+vo.gugun_code+"'>"+vo.gugun_name+"</option>");
					});
				}
				, "json"
		);
	});
	$("#gugun").change(function() {
		$.get("${pageContext.request.contextPath}/SelectBoxController"
				,{command:"dong", gugun:$("#gugun").val()}
				,function(data, status){
					$("#dong").empty();
					$("#dong").append('<option value="0">선택</option>');
					$.each(data, function(index, vo) {
						$("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
					});
				}
				, "json"
		);
	});
	$("#dong").change(function() {
		$.get("${pageContext.request.contextPath}/SelectBoxController"
				,{command:"apt", dong:$("#dong").val()}
				,function(data, status){
					$("#searchResult").empty();
						$("tbody").text("");
					$.each(data, function(index, vo) {
						$("#searchResult").append(vo.dong+" "+vo.AptName+" "+vo.jibun+"<br>");
// 						console.log(data);
						let str = "<tr class="+colorArr[index%3]+">"
						+ "<td>" + vo.no + "</td>"
						+ "<td>" + vo.dong + "</td>"
						+ "<td><a href=infosearch/"+vo.no+">" + vo.AptName + "</a></td>"
						+ "<td>" + vo.jibun + "</td>"
						+ "<td>" + vo.code
						+ "</td><td id='lat_"+index+"'></td><td id='lng_"+index+"'></td></tr>";
						$("tbody").append(str);
					});
					geocode(data);
					zoomDong(data);
				}
				, "json"
		);
	});
});
function geocode(jsonData) {
	let idx = 0;
	console.log(jsonData);
	$.each(jsonData, function(index, vo) {
		let tmpLat;
		let tmpLng;
		$.get("https://maps.googleapis.com/maps/api/geocode/json"
				,{	key:'AIzaSyC7Se1og4I5GE7YoL0cvD96gQCZQXPZJR0'
					, address:vo.dong+"+"+vo.AptName+"+"+vo.jibun
				}
				, function(data, status) {
					tmpLat = data.results[0].geometry.location.lat;
					tmpLng = data.results[0].geometry.location.lng;
					addMarker(tmpLat, tmpLng, vo.AptName, vo.no);
				}
				, "json"
		);	
	});
}

var multi = {lat: 37.5665734, lng: 126.978179};
var map;
function initMap() {
	map = new google.maps.Map(document.getElementById('map'), {
		center: multi, zoom: 12
	});
	var marker = new google.maps.Marker({position: multi, map: map});
	
}
function addMarker(tmpLat, tmpLng, aptName, no) {
	var marker = new google.maps.Marker({
		position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
		label: aptName,
		title: aptName
	});
	marker.addListener('click', function() {
		map.setZoom(17);
		map.setCenter(marker.getPosition());
		location.href = "${pageContext.request.contextPath}/infosearch/" + no;
	});
	marker.setMap(map);
}
function zoomDong(jsonData) {
	map.setZoom(17);
	let idx = 0;
	$.each(jsonData, function(index, vo) {
	let tmpLat;
	let tmpLng;
	$.get("https://maps.googleapis.com/maps/api/geocode/json"
			,{	key:'AIzaSyC7Se1og4I5GE7YoL0cvD96gQCZQXPZJR0'
				, address:vo.dong+"+"+vo.AptName+"+"+vo.jibun
			}
			, function(data, status) {
				tmpLat = data.results[0].geometry.location.lat;
				tmpLng = data.results[0].geometry.location.lng;
				var multi = {lat: tmpLat, lng: tmpLng};
				map.setCenter(multi);
			}
			, "json"
	);
});
}

</script>
</body>
</html>
