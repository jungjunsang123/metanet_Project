<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert("사진 업로드 성공!");
	location.href="${root}/";
</script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>

<div style="margin-top: 100px">
<h1>사진업로드성공</h1>
</div>


<a href="${root}">홈으로</a>
</body>
</html>