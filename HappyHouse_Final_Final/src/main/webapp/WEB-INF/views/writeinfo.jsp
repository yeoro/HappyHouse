<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
저장폴더 : ${saveFolder}<br>
원본파일 : ${originFilename}<br>
저장파일 : ${saveFilename}<br>
${root }<br>
${servletContext.getRealPath("")} <br>
${application.getRealPath("/")} <br>
<%-- ${pageContext.servletContext.getRealPath("/")} <br> --%>
<%=application.getRealPath("") %>
<br>
<%
   
%>
</body>
</html>