<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="contain-contain">
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
						<img class="banner-img" src="${root }/image/demo1.png" alt="">
					</div>
					<div class="carousel-item">
						<img class="banner-img" src="${root }/image/demo2.png" alt="">
					</div>
					<div class="carousel-item">
						<img class="banner-img" src="${root }/image/demo3.png" alt="">
					</div>
					<div class="carousel-item">
						<img class="banner-img" src="${root }/image/demo4.png" alt="">
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<i class="fa fa-arrow-left" aria-hidden="true"
					style="font-color: black"></i>
				</a> <a class="carousel-control-next" href="#demo" data-slide="next">
					<i class="fa fa-arrow-right" aria-hidden="true"
					style="font-color: black"></i>
				</a>

			</div>

		</div>
		<!-- End Banner Hero -->
	</div>
	<div class="div-title">
		<a class="list-titles" title="공개예정 프로젝트" href="/listchul/listChul?state=no&category=no">모든 프로젝트 &nbsp;<i class="fa fa-angle-right"></i>
		</a>
	</div>
	<div class="main-lists">
		<c:forEach var="dto" items="${alist}">
			<a href="/project/detail?idx=${dto.idx}&key=detail"class="list-thumbnail">
				<div class="img-div">
					<img src="${root}/thumbnail_image/${dto.thumbnail}">
				</div>
				<div class="txt-div">
					<p class="tit">${dto.title}</p>
				</div>
			</a>
		</c:forEach>
	</div>
	<div class="div-title">
		<a class="list-titles" title="인기 프로젝트" href="/listchul/listChul?state=pop&category=no">인기
			프로젝트 &nbsp;<i class="fa fa-angle-right"></i>
		</a>
	</div>
	<div class="main-lists">

		<c:forEach var="dto" items="${plist}">
			<a href="/project/detail?idx=${dto.idx}&key=detail" class="list-thumbnail">
				<div class="img-div">
					<img src="${root}/thumbnail_image/${dto.thumbnail}">
				</div>
				<div class="txt-div">
					<p class="tit">${dto.title}</p>
				</div>
			</a>
		</c:forEach>
	</div>
	<div class="div-title">
		<a class="list-titles" title="성공임박 프로젝트" href="/listchul/listChul?state=endsoon&category=no">마감임박
			프로젝트 &nbsp;<i class="fa fa-angle-right"></i>
		</a>
	</div>
	<div class="main-lists">

		<c:forEach var="dto" items="${elist}">
			<a href="/project/detail?idx=${dto.idx}&key=detail" class="list-thumbnail">
				<div class="img-div">
					<img src="${root}/thumbnail_image/${dto.thumbnail}">
				</div>
				<div class="txt-div">
					<p class="tit">${dto.title}</p>
				</div>
			</a>
		</c:forEach>
	</div>
	<div class="div-title">
		<a class="list-titles" title="신규 프로젝트" href="/listchul/listChul?state=new&category=no">최신
			프로젝트 &nbsp;<i class="fa fa-angle-right"></i>
		</a>
	</div>
	<div class="main-lists">

		<c:forEach var="dto" items="${nlist}">
			<a href="/project/detail?idx=${dto.idx}&key=detail" class="list-thumbnail">
				<div class="img-div">
					<img src="${root}/thumbnail_image/${dto.thumbnail}">
				</div>
				<div class="txt-div">
					<p class="tit">${dto.title}</p>
				</div>
			</a>
		</c:forEach>
	</div>
	<div class="bottom-img-div">
		<img src="${root}/image/bottom-logo-img.png">
	</div>
</div>