<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아파트 상세 정보 페이지</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/menu/menu.css" />

<style type="text/css">

</style>
</head>
<body>

	
	<div class="container">
			<%@ include file="/resources/menu/header.jsp" %>
		</div>
	<div>
		<h1 style="text-align: center">아파트 거래 정보</h1>
	</div>
	<div style="text-align: center;">
		<a href="<c:url value="/search"/>">전체 매매 목록</a>
		<a href="<c:url value="/isafe"/>">아이지킴이 정보</a>
	</div>
	<div>
			<div class="container">
				<table class="table table-bordered">
					<tr>
						<th>주택명</th>
						<td>${apt.aptName}</td>
					</tr>
					<tr>
						<th>거래금액</th>
						<td>${apt.dealAmount}</td>
					</tr>
					<tr>
						<th>월세금액</th>
						<c:if test="${empty rentMoney}">
							<td>없음</td>
						</c:if>
					</tr>
					<tr>
						<th>건축연도</th>
						<td>${apt.buildYear}</td>
					</tr>
					<tr>
						<th>전용면적</th>
						<td>${apt.area}</td>
					</tr>
					<tr>
						<th>거래일</th>
						<td>${apt.dealYear}년${apt.dealMonth}월 ${apt.dealDay}일</td>
					</tr>
					<tr>
						<th>법정동</th>
						<td>${apt.dong}</td>
					</tr>
					<tr>
						<th>지번</th>
						<td>${apt.jibun}</td>
					</tr>
				</table>
			</div>
	</div>
</body>
</html>