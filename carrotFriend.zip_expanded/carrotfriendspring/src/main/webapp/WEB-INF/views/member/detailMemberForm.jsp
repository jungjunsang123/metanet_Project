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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/87f055c024.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/home.css">

</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<div class="container shadow-sm p-4 mb-4 bg-white" style="width: 500px; float: center; margin-top:100px;">
	<h2>회원정보 수정</h2>
  	<hr style="width: 100%; float:left;"><br><br>

 <form method="post" action="${root}/member/updateMember" class="was-validated" id="updateUserForm">
	
	<div class="form-group">
      <label for="id">아이디 : </label>
      <input type="text" name="id" value="${sessionScope.memberDTO.id }" class="form-control" readonly>
    </div>
    
     <div class="form-group">
      <label for="passwordNow">새로운 비밀번호 : </label> 
      <input type="password" name="password" id="passwordNow" class="form-control" placeholder="새로운 비밀번호를 입력해주세요." required>
       <div class="valid-feedback"></div>
      
       <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
    </div>
   
   <hr style="width: 454px; float:left;"><br><br>
    
   <div class="form-group">
      <label for="userName"> 이름 : </label>
      <input type="text" name="name" id="userName" class="form-control" required
  			value="${sessionScope.memberDTO.name}" readonly="readonly">
    </div>
    
    <div class="form-group">
       <label for="memberNick"> 닉네임 : </label>
      <input type="text" name="nickName" id="memberNick" class="form-control"
     	 value="${sessionScope.memberDTO.nickName}"  required>
	      <div class="valid-feedback"><span id="nickCheckResult"></span></div>
	      <div class="invalid-feedback">  닉네임을 입력해주세요.</div>
    </div>
    
   <div class="form-group">
       <label for="pr"> 한줄 소개 : </label>
       <input type="text" name="pr"  id="pr" class="form-control" 
       	placeholder="자기소개 한줄" required
       	value="${sessionScope.memberDTO.pr}">
	      <div class="valid-feedback"><span id="prResult"></span></div>
	      <div class="invalid-feedback">  한줄소개를 입력해주세요</div>
    </div>
       도시 :
    
     <select name="cityNum" id="selectBox" >
    <option value="none">=== 선택 ===</option>
    <option value="서울특별시" selected>서울특별시</option>
    <option value="경기도">경기도</option>
    <option value="강원도">강원도</option>
    <option value="경상북도">경상북도</option>
    <option value="경상남도">경상남도</option>
    <option value="충청북도">충청북도</option>
    <option value="충청남도">충청남도</option>
    <option value="제주도">제주도</option>
    <option value="전라남도">전라남도</option>
    <option value="전라북도">전라북도</option>
    <option value="부산특별시">부산특별시</option>
    <option value="대구광역시">대구광역시</option>
    <option value="광주광역시">광주광역시</option>
    <option value="대전광역시">대전광역시</option>
    <option value="울산광역시">울산광역시</option>
    <option value="세종특별자치시">세종특별자치시</option>
  </select>
   
   <hr style="width: 454px; float:left;"><br>
   <div class="form-group" style="text-align:center;">
   <input type="submit" class="btn btn-success" value="회원정보수정" >
  </div>
</form>
</div><!-- container -->
</body>
</html>