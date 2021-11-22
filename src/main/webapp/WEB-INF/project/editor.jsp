<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
ul>li{
	width: 120px;
	text-align: center;
	margin-top: 35px;
}
.menu{
`	pointer-events:none;
	font-size: 13px;
	cursor: pointer;
	font-weight: bold;
	color: #696969;
}
ul{
    margin: 0px auto;
    margin-left: 100px;
    height: 60px;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    white-space: nowrap;
}
</style>
<script type="text/javascript">
$(function() {
	$(".menu").click(function() {
		alert("dd");
		$(".menu").css({"color" : "#696969"});
		$(this).css({"color" : "black"});
		
	})
});
</script>
	<div style="height: 80px;">
	</div>
<div class="header_area">
	<div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
		<!-- Classy Menu -->
		<nav class="classy-navbar" id="essenceNav">
			<!-- Logo -->
			<a class="main-logo" href="/"><img
				src="${root }/img/core-img/bunddeuk-logo-black.png" alt=""></a>
				
			<!-- Menu -->
			<div class="classy-menu">
				<!-- close btn -->
				<div class="classycloseIcon">
					<div class="cross-wrap">
						<span class="top"></span><span class="bottom"></span>
					</div>
				</div>
				<div style="width: 30px;"></div>
				<!-- Nav Start -->
				<div class="classynav" style="padding-left: 150px; width: 500px;">
					<ul>
						<li><span class="menu" style="color: black;">기본정보</span></li>
						<li><span class="menu">펀딩계획</span></li>
						<li><span class="menu">선물구성</span></li>
						<li><span class="menu">프로젝트계획</span></li>
						<li><span class="menu">신뢰와 안전</span></li>
					</ul>
				</div>
				<!-- Nav End -->
			</div>
		</nav>
	</div>
</div>   
<div>
<jsp:include page="default.jsp?idx=${idx }"></jsp:include>
</div>

<input type="text" value=${idx }>
