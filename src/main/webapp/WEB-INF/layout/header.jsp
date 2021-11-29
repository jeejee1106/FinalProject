<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
 
$(function() {
	
	list();
	$(".list-gore-btn").change(function(){
		category=$("#list-gore").val();
		
		//alert(category);
	});
});
 
</script>
<!-- ##### Header Area Start ##### -->
<header class="header_area">
	<div
		class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
		<!-- Classy Menu -->
		<nav class="classy-navbar" id="essenceNav">
			<!-- Logo -->
			<a class="main-logo" href="/"><img
				src="${root }/img/core-img/bunddeuk-logo-black.png" alt=""></a>
			<!-- Navbar Toggler -->
			<div class="classy-navbar-toggler">
				<span class="navbarToggler"><span></span><span></span><span></span></span>
			</div>
			<!-- Menu -->
			<div class="classy-menu">
				<!-- close btn -->
				<div class="classycloseIcon">
					<div class="cross-wrap">
						<span class="top"></span><span class="bottom"></span>
					</div>
				</div>
				<!-- Nav Start -->
				<form name="paging">
    				<input type="hidden" name="category" id="category"/>
    				<input type="hidden" name="state" id="state"/>
    			</form>
				<div class="classynav">
					<ul>
						<li><a href="#">프로젝트 둘러보기</a>
							<div class="megamenu">
								<ul class="single-mega cn-col-4">
									<li class="title">프로젝트</li>
									<li><a href="/listchul/listChul?state=no&category=no">모든 프로젝트</a></li>
									<li><a href="/listchul/listChul?state=pop&category=no">인기 프로젝트</a></li>
									<li><a href="/listchul/listChul?state=endsoon&category=no">마감 임박프로젝트</a></li>
									<li><a href="/listchul/listChul?state=new&category=no">신규 프로젝트</a></li>
								</ul>
								<ul class="single-mega cn-col-4" style="cursor: pointer;">
									<li class="title">카테고리</li>
									<li><a href="/listchul/listChul?category=게임&state=no">게임</a></li>
									<li><a href="/listchul/listChul?category=공연&state=no">공연</a></li>
									<li><a href="/listchul/listChul?category=디자인&state=no">디자인</a></li>
									<li><a href="/listchul/listChul?category=사진&state=no">사진</a></li>
									<li><a href="/listchul/listChul?category=영화&state=no">영화</a></li>
									<li><a href="/listchul/listChul?category=푸드&state=no">푸드</a></li>
									<li><a href="/listchul/listChul?category=음악&state=no">음악</a></li>
									<li><a href="/listchul/listChul?category=게임&state=no">게임</a></li>
									<li><a href="/listchul/listChul?category=패션&state=no">패션</a></li>

								</ul>
							</div></li>
						<li><a href="/project/start">프로젝트올리기</a></li>
					</ul>
					
				</div>
				<!-- Nav End -->
			</div>
		</nav>
		<!-- Header Meta Data -->
		<div class="header-meta d-flex clearfix justify-content-end">
			<!-- Search Area -->
			<div class="search-area">
				<form action="/listchul/listChul" method="get">
					<input type="search" name="search" id="headerSearch"
						placeholder="프로젝트 검색">
					<button type="summit">
						<i class="fa fa-search" aria-hidden="true"></i>
					</button>
				</form>
			</div>
			<!-- User Login Info -->
         <div class="user-login-info">
            <c:if test="${sessionScope.loginok != null}">
               <b>${sessionScope.id}</b>
               <span style="cursor:pointer"
                  onclick="location.href='${root}/login/logoutprocess'">로그아웃</span>
            </c:if>
            <a href="/profile"><img src="${root }/img/core-img/user.svg" alt=""></a>
         </div>
         <!-- Cart Area -->
		</div>
	</div>
</header>