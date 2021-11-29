<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- profile menu --> 
<link rel="stylesheet" type="text/css" href="/css/profile.css">

<!--  -->
<div class="container">

	<div class="header-profile">
	
		<div class="container-user">
				<div class="user-photo" style="width: 100px; height: 100%;">
					<img src="${root }/img/core-img/user.svg">
				</div>
				<div class="a">
					<div class="user-name">
						<span>${name }</span>
						<a class="user-info" href="/setting/main">
							<div name="setting">
								<img src="${root }/img/core-img/settings.png">
							</div>
						</a>
					</div>
				</div>
		</div>
		
		<div class="container-tab">
			<div class="tab-warpper">
			<c:if test="${ sessionScope.id != 'admin'}">
				<div class="tab-warpper-in">
					<span class="tab current">
						<div class="link-wrapper">
							<a href="/mypage">소개</a>
						</div>
					</span>
					<span class="tab">
						<div class="link-wrapper">
							<a href="/profile/backed">후원한 프로젝트 </a>
						</div>
					</span>
					<span class="tab">
						<div class="link-wrapper">
							<a href="/profile/created">올린 프로젝트
<%-- 							<c:if test="${creativeCont>0}">${creativeCont}</c:if>
							<c:if test="${empty creativeCont}"></c:if> --%>
							</a>
						</div>
					</span>
					<span class="tab">
						<div class="link-wrapper">
							<a href="/profile/liked">관심프로젝트 </a>
						</div>
					</span>
					<span class="tab">
						<div class="link-wrapper">
							<a href="/receivedMessage">메세지 </a>
						</div>
					</span>
					<span class="tab">
						<div class="link-wrapper">
							<a href="#">채팅 </a>
						</div>
					</span>
				</div>
			</c:if>
			<!-- 관리자 -->
			<c:if test="${sessionScope.id == 'admin'}">
				<div class="tab-warpper-in">
					<span class="tab current">
						<div class="link-wrapper">
							<a href="#">회원목록</a>
						</div>
					</span>
					<span class="tab">
						<div class="link-wrapper">
							<a href="#">프로젝트 </a>
						</div>
					</span>
				</div>
			</c:if>
			</div>
		</div>
		
	</div>


</div>