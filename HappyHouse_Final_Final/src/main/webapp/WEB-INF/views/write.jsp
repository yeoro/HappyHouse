<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>SSAFY</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$('#writeBtn').click(function() {
			$('#writeform').attr('action', '${root}/write').submit();
		//}
	});
	
});
</script>
</head>
<body>
	<div class="container" align="center">
		<div class="col-lg-6" align="center">
			<h4>글쓰기</h4>
			<form id="writeform" method="post" class="form-horizontal" enctype="multipart/form-data" action="#">
				<div class="form-group" align="left">
					<label for="content">파일:</label>
					<input type="file" id="filename" name="filename" class="form-control-file border">
				</div>
				<button type="button" id="writeBtn" class="btn btn-primary">글작성</button>
				<button type="reset" class="btn btn-warning">초기화</button>
			</form>
		</div>
	</div>
</body>
</html>