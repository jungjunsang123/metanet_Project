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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="header">
<jsp:include page="../header.jsp"></jsp:include>
</div>
	<div class="container"  style="width: 500px; float: center; margin-top:100px;">
		<div class="row">
			
				<div class="panel panel-primary" >
					<div class="panel-heading">${ nickName}</div>
					<table class="table">
						
						<c:forEach var="list" items="${list}" varStatus="status">
							
							<tr>
								<td colspan=3 align="center">
								<img src="${root}/resources/img/${list.image}" width='200' height='200'></td>
							</tr>

							<tr>
								<td colspan="1"><strong>글번호:${list.postNo}</strong></td>
								<td colspan="1" align="right"><span
									class="glyphicon glyphicon-time"></span> 작성일 : ${list.writeDate }</td>
							</tr>
												
							<tr>
								<td colspan="3"><pre> ${list.content}</pre></td>
							</tr>
							
							<c:if test="${sessionScope.memberDTO.nickName==nickName }">
								
								<tr>
								
								<td colspan="1" style="text-align:left;">
										<form method="POST"
											action="${root}/post/updatePostForm/${list.postNo}">
											<input type="hidden" name="postNo" value="${list.postNo}">
											<input type="submit" class="btn btn-info" value="수정하기">
										</form> &nbsp;
								</td>
								<td colspan="1" style="text-align:right;">
										<form method="POST" action="${root}/deletePost/${list.postNo}">
											<input type="hidden" name="postNo" value="${list.postNo}">
											<input type="submit" class="btn btn-danger" value="삭제하기">
										</form>

								</td>
								
								</tr>
							
							</c:if>
								
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
</body>
</html>