<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/menu/menu.css" />

</head>
<body>
	<div class="container">
		<%@ include file="/resources/menu/header.jsp"%>
	</div>
	<div class="container"">
		<div style="text-align: center">
			<h2>내정보 수정</h2>
		</div>
		<div style="text-align: center">
			<form method="post" action="<c:url value="/update.do"/>">
				<input type="hidden" name="id" value="${user.id }">
				<div>
					<table  class="table table-bordered">
						<tr>
							<td><label>아이디 : ${user.id}</label></td>
						</tr>
						<tr>
							<td><label>비밀번호</label> <input type="password"
								name="password" /></td>
						</tr>
						<tr>
							<td><label>이름 </label> <input type="text" name="name" /></td>
						</tr>
						<tr>
							<td><label>전화번호</label> <input type="text" name="phoneNum" />
							</td>
						</tr>
						<tr>
							<td><label>우편번호</label> <input type="text" name="postNum" />
							</td>
						</tr>
						<tr>
							<td><label>주소 </label> <input type="text"
								name="address_default" /></td>
						</tr>
						<tr>
							<td><label>상세주소</label> <input type="text"
								name="address_detail" /></td>
						</tr>
						<tr>
							<td><label>집 전화</label> <input type="text" name="homeNum" />
							</td>
						</tr>
					</table>
				</div>
				<button>등록</button>
			</form>
		</div>
	</div>
</body>
</html>