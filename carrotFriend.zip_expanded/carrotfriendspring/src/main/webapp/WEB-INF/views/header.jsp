<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<link href="${root}/resources/css/header.css" rel="stylesheet">
<title>Insert title here</title>
	<!-- 인터넷창 파비콘 이미지 -->
	<link rel="shortcut icon" type="image/x-icon"
		href="${root}/resources/img/carrotLogo.JPG"/>

	<section id="container">
		<header id="header">
			<section class="inner">
				<h1 class="logo">
					<a href="${root}/">
						<div class="sprite_logo_icon">
						<img align="middle"  src="${root}/resources/img/carrotLogo.JPG" width="50" height="50" />
						</div>
					</a>
				</h1>
				<div class="sprite_title">
				<a href="${root}/">당근친구</a>
				</div>
				<ul class="menu">
					
					<c:if test="${memberDTO!=null}">
					<li><a href="${root }/member/detailMember/${sessionScope.memberDTO.id}">내정보</a></li>
					</c:if>
				
					<c:if test="${memberDTO!=null}">
					<li><a href="${root}/member/goMemberFeed/${sessionScope.memberDTO.nickName}">내 피드 보러가기</a><br></li>
					</c:if>
					
					<li>
					<c:if test="${memberDTO==null }">
					<a href="${root }/member/registerMemberForm">회원가입</a>
					</c:if>
					</li>
					<li>
					<c:if test="${memberDTO==null }">
					<a href="${root }/member/loginForm">로그인하기</a>
					</c:if>
					</li>
					<li>
					<c:if test="${memberDTO!=null}">
					<a href="${root }/member/logout">로그아웃하기</a>
					</c:if>
					</li>
				</ul>
			</section>
		</header>
	</section>
