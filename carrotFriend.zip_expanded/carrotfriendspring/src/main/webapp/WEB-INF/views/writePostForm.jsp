<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js"
integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9"
crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
	integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/87f055c024.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="${root}/resources/css/home.css">
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
<jsp:include page="header.jsp"></jsp:include>
</div>

<form method="post" action="${root}/writePost" id="writePostForm" enctype="multipart/form-data">
		<div class="shadow-sm p-4 mb-4 bg-white" style= "margin-top:100px;">
			<div class="container" style="width: 100%; float: center;">
				
				<input type="hidden" name="id" value="${sessionScope.memberDTO.id }">
				<table class="table table-sm">
					<thead></thead>
					<tbody>
						<tr>
							
							<td colspan=1>		
									<input type="file" class="form-control" name="file"
										 size=50 required="required">		
							</td>
						</tr>
						<tr>
							<td colspan="3"><textarea rows="7" cols="80"
									placeholder="내용을 입력해주세요!" id="contentInfo" name="content" required></textarea><br>
								<span id="infoCheckResultSpan"><span id="infoCheckResult"></span>/200</span>
							</td>
						</tr>
						<tr>
							<td colspan="3" align="center"><input type="submit"
								class="btn btn-success" value="등록하기"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- container -->
		</div>
	</form>


<br>
</body>
</html>