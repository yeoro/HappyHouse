<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아파트 실거래가 검색 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/menu/menu.css" />

<script type="text/javascript">
	function pageMove(pg) {
		document.getElementById("pg").value = pg;
		document.getElementById("pageform").submit();
	}
	
	$("#searchBtn").on("click", function(){
		
	});
</script>
</head>
<body>
	<div class="container">
			<%@ include file="/resources/menu/header.jsp" %>
	</div>
	<div style="text-align: center;">
		<form name="pageform" id="pageform" method="post" action="<c:url value="/search" />">
			<input type="hidden" name="act" value="list" />
			<input type="hidden" name="pg" id="pg" value="">
			<div>
				<input name="dealType" type="checkbox" value="1" checked /> 아파트 매매 
				<input name="dealType" type="checkbox" value="2" /> 아파트 전월세 
				<input name="dealType" type="checkbox" value="3" /> 다세대, 주택 매매 
				<input name="dealType" type="checkbox" value="4" /> 다세대, 주택 전월세
			</div>
			<div>
				<select name="searchType">
					<option value="all">전체</option>
					<option value="dong">동</option>
					<option value="AptName">아파트이름</option>
				</select>
				<input type="text" name="searchWord"/>
				<button id="searchBtn">검색</button>
			</div>
		</form>
	</div>
	<div class="container">
		<table class="table table-bordered">
			<tr>
				<th>번호</th>
				<th>동</th>
				<th>아파트이름</th>
				<th>거래금액</th>
				<th>거래종류</th>
			</tr>
			<c:forEach var="apt" items="${list}">
				<tr>
					<td>${apt.no}</td>
					<td>${apt.dong}</td>
					<td><a href="<c:url value="/search/${apt.no}" />">${apt.aptName}</a></td>
					<td>${apt.dealAmount}</td>
					<td>${apt.type}</td>
				</tr>
			</c:forEach>
		</table>
		<table style="margin: auto">
			<tbody>
				<tr>
					<td>${navigation.navigator}</td>
				</tr>
			</tbody>
		</table>
	</div>

</body>
</html>