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

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	/* 길이 체크 공간 */
	$(document).ready(
			function() {

				var checkInfo = "";

				// 본문 길이 체크
				$("#contentInfo").keyup(
						function() {
							checkInfo = "";
							var infoValue = $(this).val().trim();

							//본문 길이 200자 넘어가면 빨갛게
							if (infoValue.length > 200) {
								$("#infoCheckResult").html(infoValue.length)
										.css("color", "red");
								return;
								//본문 길이 평소에는 grey로
							} else {
								$("#infoCheckResult").html(infoValue.length)
										.css("color", "grey");
								checkInfo = infoValue;
							}
						});// end registCafeName keyup

				/* 길이 넘었을 때 submit 안 되도록 막기 */
				$("#writePostForm").submit(function() {
					// 본문 길이 체크
					if (checkInfo == "") {
						alert("내용은 200자 이내로 작성해주세요.");
						return false;
					}

					if (confirm("잘못된 정보를 입력할 경우 그대로 입력되니 주의하시길 바랍니다. 하지만 수정은 가능해요!")) {
						return true;
					} else {
						return false;
					}
				});//sumit

			});//ready
</script>
</head>
<body>
<div class="header">
<jsp:include page="../header.jsp"></jsp:include>
</div>
 <form action="${root }/updatePost" enctype="multipart/form-data" method="post" >
 
  <div class="container"  style="width: 500px; float: center; ">
		<div class="row">
			
				<div class="panel panel-primary" >
					<div class="panel-heading"><strong>글번호:${postDTO.postNo}</strong></div>
					<table class="table">
							<tr>
								<td colspan=3 align="center">
								<img src="${root}/resources/img/${postDTO.image}" width='200' height='200'><br>
								<input type="file" name="file" size=40 required="required"></td>
							</tr>

							<tr>
								
								<td colspan="1" align="right"><span
									class="glyphicon glyphicon-time"></span> 작성일 : ${postDTO.writeDate }</td>
							</tr>
												
							<tr>
								<td colspan="3"><textarea rows="7" cols="60"
									placeholder="내용을 입력해주세요!" id="contentInfo" name="content" required>${postDTO.content }</textarea><br>
								<span id="infoCheckResultSpan"><span id="infoCheckResult"></span>/200</span>
							</td>
							</tr>
											
								<tr>
								
								<td colspan="4" style="text-align:center;">
										<form method="POST"
											action="${root}/post/updatePostForm/${postDTO.postNo}">
											<input type="hidden" name="postNo" value="${postDTO.postNo}">
											<input type="submit" class="btn btn-info" value="수정하기">
										</form> &nbsp;
								</td>
								
								
								</tr>
							

					</table>
				</div>
			</div>
		</div>
 </form>
</body>



</html>