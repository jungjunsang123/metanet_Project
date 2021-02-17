<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/87f055c024.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${root}/resources/css/home.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script type="text/javascript">

   $(document).ready(function() {
      var checkId="";
      var checkNick="";
      var checkPassword = "";
      var checkTel="";
      
      /* 길이 체크 공간 */
      
      // 1. 아이디 길이 체크
      $("#memberId").keyup(function() {
         checkId="";
         var id= $(this).val().trim();
         //alert(id);
         // 아이디 길이 체크
         if(id.length<4||id.length>10){
            $("#idCheckResult").html("아이디는 4~10자 이내로 작성해주세요").css("color","red");
            return;
         }   
         // 아이디 중복 체크
           $.ajax({
            type : "get",
            url : "/myapp/member/idcheckAjax/{id}",
            data : {"id":id},
            success : function(result) {
            	
               // 아이디가 사용가능하면 = 중복이 아니면
               if (result == "ok"){
                  $("#idCheckResult").html("사용가능한 아이디입니다.").css(
                        "color", "green");
                  checkId = id; 
               } else { // 아이디가 사용불가하면 = 중복이면
                  $("#idCheckResult").html("중복된 아이디입니다.").css(
                        "color", "red");
               }
            }//success
         });//ajax 
        
         
      });// end memberId keyup
      
      // 2. 닉네임 길이 체크
        $("#memberNick").keyup(function() {
         checkNick="";
         var nickValue= $(this).val().trim();
         // 닉네임 길이 체크
         if(nickValue.length<2||nickValue.length>10){
            $("#nickCheckResult").html("닉네임은 2~10자 이내로 작성해주세요").css("color","red");
            return;
         }
         
         // 닉네임 중복 체크
         $.ajax({
            type : "get",
            url :"/myapp/member/nickcheckAjax/{nickName}",
            data : {"nickName":nickValue},
            success : function(result) {
               // 닉네임이 사용가능하면 = 중복이 아니면
               if (result == "ok"){
                  $("#nickCheckResult").html("사용가능한 닉네임입니다.").css(
                        "color", "green");
                  checkNick = nickValue; 
                  //alert($(this).text());
               } else { // 닉네임 사용불가하면 = 중복이면
                  $("#nickCheckResult").html("중복된 닉네임입니다.").css(
                        "color", "red");
               }
            }
         });
         
      });// end memberNick keyup    
      // 비밀번호 길이 체크
      $("#passwordC").keyup(function() {
         var passValue=$(this).val();  //기존 기입 비밀번호
         //$("#passwordResult").html($(this).val());
         if(passValue.length<4||passValue.length>12){
            $("#passwordResult").html("비밀번호는 4~12자 이내로 작성해주세요").css("color","red");
            checkPassword="";
            return;
         } else {
            $("#passwordResult").html("적합한 비밀번호입니다.").css("color","green");
            checkPassword=passValue;
         }
        
         //비밀번호 일치 여부 체크 (기존 기입 비밀번호 변경 시)
       	 checkPassword="";
         $("#passwordCheckResult").html("");
         var passChecked = $("#passwordChecked").val(); // 비밀번호 확인 기입 비밀번호
         if(passChecked === passValue){
            $("#passwordCheckResult").html("비밀번호가 일치합니다.").css("color","green");
            checkPassword = passChecked;
         } else if (checkPassword == "" || passChecked !=passValue){
            $("#passwordCheckResult").html("비밀번호가 불일치합니다.").css("color","red");
            checkPassword="";
         }
      
      });// end passwordC
      //비밀번호 일치 여부 체크 (비밀번호 확인 기입 비밀번호)
      $("#passwordChecked").keyup(function() {
    	 checkPassword="";
         var passValue =$("#passwordC").val(); //기존 기입 비밀번호
         var passChecked = $(this).val(); // 비밀번호 확인 기입 비밀번호
         if(passChecked===passValue){
            $("#passwordCheckResult").html("비밀번호가 일치합니다.").css("color","green");
            checkPassword = passChecked;
         }else{
            $("#passwordCheckResult").html("비밀번호가 불일치합니다.").css("color","red");
            checkPassword="";
            //$(".pass valid-feedback").attr('class', ".pass invalid-feedback");
            
         }
      });// end passwordChecked
    
    /* 중복 확인 공간 */   
    $("#registerForm").submit(function() {
  	  // 아이디 중복확인해서 사용가능 상태일때만 가입되도록 한다.
        if(checkId==""){
          alert("아이디를 확인해주세요!");
          return false;
       } 
  	  
       // 닉네임 중복확인해서 사용가능 상태일때만 가입되도록 한다.
        if(checkNick==""){
           alert("닉네임을 확인해주세요!");
           return false;
        } 
       
       // 비밀번호 일치 여부 체크해서 사용가능 상태일때만 가입되도록 한다.
       if(checkPassword==""){
           alert("비밀번호를 확인해주세요!");
           return false;
        }
       
      
    }); // end registerForm submit
    
});//ready
</script>
</head>

<body>
<jsp:include page="../header.jsp"></jsp:include>


  <div class="container shadow-sm p-4 mb-4 bg-white" style="width: 500px; float: center; margin-top:100px">
  <h2>회원가입</h2>
  <hr style="width: 100%; float:left;"><br><br>
  <form method="post" action="${root}/member/registerMember" class="was-validated" id="registerForm" enctype="multipart/form-data">
    <div class="form-group">
      <label for="memberId">아이디 : </label>
      <input type="text" name="id" id="memberId" class="form-control" placeholder="Enter Id" required>
      <div class="valid-feedback"><span id="idCheckResult"></span></div>
      <div class="invalid-feedback">  아이디를 입력해주세요.</div>
    </div>
    <div class="form-group">
      <label for="passwordC">비밀번호 : </label>
      <input type="password" name="password" id="passwordC" class="form-control" placeholder="Enter password" required>
      <div class="valid-feedback"><span id="passwordResult"></span></div>
      <div class="invalid-feedback">  비밀번호를 입력해주세요.</div>
    </div>
    <div class="form-group">
      <label for="passwordChecked">비밀번호 확인 : </label>
      <input type="password" id="passwordChecked" class="form-control"placeholder="Enter password for checking" required>
	      <div class="valid-feedback"><span id="passwordCheckResult"></span></div>
	      <div class="invalid-feedback">  비밀번호를 입력해주세요.</div>
    </div>
    
    <hr style="width: 454px; float:left;"><br><br>
    
    <div class="form-group">
      <label for="userName"> 이름 : </label>
      <input type="text" name="name" id="userName" class="form-control" placeholder="Enter your name" required>
	      <div class="valid-feedback"></div>
	      <div class="invalid-feedback">  이름을 입력해주세요.</div>
    </div>
    
    <div class="form-group">
       <label for="memberNick"> 닉네임 : </label>
      <input type="text" name="nickName" id="memberNick" class="form-control" placeholder="Enter your nickname" required>
	      <div class="valid-feedback"><span id="nickCheckResult"></span></div>
	      <div class="invalid-feedback">  닉네임을 입력해주세요.</div>
    </div>
    
    <div class="form-group">
       <label for="pr"> 한줄소개 : </label>
       <input type="text" name="pr"  id="pr" class="form-control" placeholder="(자신을 한줄로 표현해 보세요!)" required>
	      <div class="valid-feedback"><span id="telResult"></span></div>
	      <div class="invalid-feedback"> 한줄소개 해주세요</div>
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
	    <option value="부산광역시">부산광역시</option>
	    <option value="대구광역시">대구광역시</option>
	    <option value="광주광역시">광주광역시</option>
	    <option value="대전광역시">대전광역시</option>
	    <option value="울산광역시">울산광역시</option>
	    <option value="세종특별자치시">세종특별자치시</option>
 
  </select>
    <hr style="width: 454px; float:left;"><br>
 	<div style="text-align:center;">
		<input type="submit" value="회원가입" class="btn btn-primary">
	</div>
  </form>
</div>
  <a href="${root}">홈으로</a>
</body>
</html>