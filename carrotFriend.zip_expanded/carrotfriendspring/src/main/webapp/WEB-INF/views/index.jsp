<%@page import="com.mycompany.myapp.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link href="${root}/resources/css/body.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Index</title>

</head>
<body>
<div class="header">
<jsp:include page="header.jsp"></jsp:include>
</div>

<!-- 메인시작 -->
   <section id="main_container">
      <div class="inner">
         <div class="contents_box">
         
         <!-- 포스트 -->
            <article class="contents">
            <c:forEach items="${list}" var="val" >
               <header class="top">
                  <div class="user_container">
                     <div class="user_name">
                        <div class="nick_name m_text">
                        <a href="${root }/member/goMemberFeed/${val.memberDTO.nickName}">${val.memberDTO.nickName}</a>
                        </div>
                     </div>
                  </div>
               </header>
               <div class="img_section">
                  <div class="trans_inner">
                        <img src="${root}/resources/img/${val.image}" ><br>
        				${val.content}<br><br><br><hr>
                  </div>
               </div>
               </c:forEach>
            </article>
         </div>
         
         
         <!-- 사이드 친구추천 -->
         <div class="side_box">
            <article class="recommend">
               <header class="reco_header">
                  <div>친구 추천</div>
               </header>
               
               <!-- 내 정보 -->
               <c:if test="${memberDTO!=null }">
					${memberDTO.nickName } 
					${memberDTO.cityNum } - 로그인상태
				</c:if>
				<hr>
               <!-- 친구프로필 시작 -->
               <c:forEach items="${mList}" var="mList" >
               <div class="thumb_user">
                  <div class="detail_left">
                     <div class="id">
                     <a href="${root}/member/goMemberFeed/${mList.nickName}">${mList.nickName}</a>
                     </div>
                     <div class="ko_name"></div>
                     <div class="age"></div>
                  </div>
                  <div class="detail_right">
                     <div class="introduce">
                     ${mList.cityNum}<br>
					 ${mList.pr}<br>
                     </div>
                  </div>
               </div>
               </c:forEach>
               <!-- 친구프로필 끝 -->
               <hr>
                <footer class="reco_footer">
               <c:if test="${memberDTO==null}">
				<a href="${root}/member/getAllLocMember">모든친구 보기</a>
				</c:if>
				<c:if test="${memberDTO!=null}">
				<a href="${root}/member/getMyLocMember/${memberDTO.cityNum}">${memberDTO.cityNum} 친구 보기</a>
				</c:if>
				</footer>
            </article>
            <article class="recommend_bottom">
            <div class="write">
            <c:if test="${sessionScope.memberDTO!=null }">
       			<a href="writePostForm">
       			<img src="${root}/resources/img/plusbutton.jpg" width="50px" height="50px;">
       			</a>
			</c:if>
            </div>
            </article>
         </div>
      </div>
   </section>
   
</body>
</html>