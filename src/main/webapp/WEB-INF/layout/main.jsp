<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="main-contain">
	<!-- Start Banner Hero -->
	<div class="banner-wrapper bg-light">

		<div id="demo" class="carousel slide" data-ride="carousel">

			<!-- Indicators -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
				<li data-target="#demo" data-slide-to="3"></li>
			</ul>

			<!-- The slideshow -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="banner-img" src="image/demo1.png" alt="">
				</div>
				<div class="carousel-item">
					<img class="banner-img" src="image/demo2.png" alt="">
				</div>
				<div class="carousel-item">
					<img class="banner-img" src="image/demo3.png" alt="">
				</div>
				<div class="carousel-item">
					<img class="banner-img" src="image/demo4.png" alt="">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>

		</div>

	</div>
	<!-- End Banner Hero -->
</div>
<div class="main-list">
<a title="공개예정 프로젝트" href="">공개예정 프로젝트 &nbsp;<i class="fa fa-angle-right" aria-hidden="true"></i></a>

<c:forEach var="dto" items="${list}">
<
	<div class="img-div">
	<h1>1</h1>
		<img src="${root}/image/${dto.Thumbnail}">
	</div>
	<div class="txt-div">
		<p class="tit">${dto.Title}</p>
	</div>
</c:forEach>
</div>