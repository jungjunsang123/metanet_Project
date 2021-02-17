 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인하기</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">

<!-- <script type="text/javascript">
	function findPassPopup(){
		var options='width=470, height=450, top=150, left=500'; //팝업창 옵션
		window.open("${pageContext.request.contextPath}/find-password-form.do", "findPassPopup", options);
	}
</script> -->
</head>
<jsp:include page="../header.jsp"></jsp:include>

<body>

	<br>
	<div class="container shadow-sm p-4 mb-4 bg-white" style="width: 500px; float: center; margin-top:100px;">
  <h2>로그인</h2>
  <hr style="width: 100%; float:left;"><br><br>
  <form method="post" action="${root}/member/login" class="was-validated" id="loginForm" enctype="multipart/form-data">
    <div class="form-group">
       아이디 : 
      <input type="text" name="id"  class="form-control" placeholder="Enter Id" required>
      <div class="valid-feedback"></div>
      <div class="invalid-feedback">  아이디를 입력해주세요.</div>
    </div>
    <div class="form-group">
     비밀번호 :
      <input type="password" name="password" class="form-control" placeholder="Enter password" required>
      <div class="valid-feedback"></div>
      <div class="invalid-feedback">  비밀번호를 입력해주세요.</div>
    </div>

    <hr style="width: 100%; float:left;"><br>

 <div class="form-group" style="text-align:center;">
	<input type="submit" value="로그인" class="btn btn-primary" >
	 </div>
  </form>
  
</div><!-- container -->
</body>
</html>