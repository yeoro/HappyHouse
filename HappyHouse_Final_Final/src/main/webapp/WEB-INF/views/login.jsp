<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/menu/menu.css" />

</head>

<body>
<%-- 	<%@ include file="/WEB-INF/views/header.jsp"%> --%>
		<div class="container">
			<%@ include file="/resources/menu/header.jsp" %>
		</div>
<div>
<div id="body">
<form action="login" method="post">
	아이디 : <input type="text" name="id">
	<br>
	비밀번호 : <input type="password" name="password">
<!-- 	<input type="hidden" name="name" value=" "> -->
<!-- 	<input type="hidden" name="addressDefault" value=" "> -->
<!-- 	<input type="hidden" name="phonenum" value=" "> -->
<!-- 	<input type="hidden" name="addressDetail" value=" "> -->
<!-- 	<input type="hidden" name="postnum" value=" "> -->
<!-- 	<input type="hidden" name="homenum" value=" "> -->
	<button type="submit" id="loginBtn">로그인</button>
	</form>
</div>
</div>


<%@ include file="/WEB-INF/views/footer.jsp"%>
	
</body>
</html>