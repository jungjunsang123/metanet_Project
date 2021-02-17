<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
	integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<div class="container shadow-sm p-4 mb-4 bg-white"
		style="width: 500px; float: center; margin-top: 100px;">

		<hr style="width: 100%; float: left;">
		<br>
		<br>
		<h1>내 지역 친구 보여주기</h1>
		<hr>
		<c:forEach var="m" items="${list}" varStatus="status">


			<div class="form-group">

				<a href="${root}/member/goMemberFeed/${m.nickName}">닉네임:
					${m.nickName}</a>

			</div>
			<div class="form-group">지역: ${m.cityNum}</div>
			<div class="form-group">한줄소개: ${m.pr}</div>
			<hr style="width: 100%; float: left;">
			<br>

		</c:forEach>
		<c:if test="${pg <= pageSize}">
	[ <span style="color: silver">◀◀</span> ]
	[ <span style="color: silver">◀</span> ]
</c:if>
		<c:if test="${pg > pageSize}">
	[ <a href="${root}/member/getMyLocMember/${cityNum}/1">◀◀</a> ]
	[ <a href="${root}/member/getMyLocMember/${cityNum}/${startPage-1}">◀</a> ]
</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<c:if test="${pg==i}">
		[ ${i} ]
	</c:if>
			<c:if test="${pg != i}">
		[ <a href="${root}/member/getMyLocMember/${cityNum}/${i}">${i}</a> ]
	</c:if>
		</c:forEach>
		<c:if test="${endPage >= totalPage}">
	[ <span style="color: silver">▶</span> ]
	[ <span style="color: silver">▶▶</span> ]
</c:if>
		<c:if test="${endPage < totalPage}">
	[ <a href="${root}/member/getMyLocMember/${cityNum}/${endPage+1}">▶</a> ]
	[ <a href="${root}/member/getMyLocMember/${cityNum}/${totalPage}">▶▶</a> ]
</c:if>

	</div>
	<!-- container -->

</body>
</html>