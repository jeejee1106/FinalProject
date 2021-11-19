<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<header class="header_area">
	<div
		class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
		<!-- Classy Menu -->
		<nav class="classy-navbar" id="essenceNav">
			<!-- Logo -->
			<a class="nav-brand" href="${root }/"><img
				src="${root }/img/core-img/logo.png" alt=""></a>
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
				<div class="classynav">
					<ul>
						<li><a href="#">Shop</a>
							<div class="megamenu">
								<ul class="single-mega cn-col-4">
									<li class="title">Women's Collection</li>
									<li><a href="#">Dresses</a></li>
									<li><a href="#">Blouses &amp; Shirts</a></li>
									<li><a href="#">T-shirts</a></li>
									<li><a href="#">Rompers</a></li>
									<li><a href="#">Bras &amp; Panties</a></li>
								</ul>
								<ul class="single-mega cn-col-4">
									<li class="title">Men's Collection</li>
									<li><a href="#">T-Shirts</a></li>
									<li><a href="#">Polo</a></li>
									<li><a href="#">Shirts</a></li>
									<li><a href="#">Jackets</a></li>
									<li><a href="#">Trench</a></li>
								</ul>
								<ul class="single-mega cn-col-4">
									<li class="title">Kid's Collection</li>
									<li><a href="#">Dresses</a></li>
									<li><a href="#">Shirts</a></li>
									<li><a href="#">T-shirts</a></li>
									<li><a href="#">Jackets</a></li>
									<li><a href="#">Trench</a></li>
								</ul>
								<div class="single-mega cn-col-4">
									<img src="img/bg-img/bg-6.jpg" alt="">
								</div>
							</div></li>
						<li><a href="#">Pages</a>
							<ul class="dropdown">
								<li><a href="${root }/">Home</a></li>
								<li><a href="#">Shop</a></li>
								<li><a href="#">Product
										Details</a></li>
								<li><a href="#">Checkout</a></li>
								<li><a href="#">Blog</a></li>
								<li><a href="#">Single Blog</a></li>
								<li><a href="#">Regular Page</a></li>
								<li><a href="#">Contact</a></li>
							</ul></li>
						<li><a href="#">Blog</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</div>
				<!-- Nav End -->
			</div>
		</nav>

		<!-- Header Meta Data -->
		<div class="header-meta d-flex clearfix justify-content-end">
			<!-- Search Area -->
			<div class="search-area">
				<form action="#" method="post">
					<input type="search" name="search" id="headerSearch"
						placeholder="Type for search">
					<button type="submit">
						<i class="fa fa-search" aria-hidden="true"></i>
					</button>
				</form>
			</div>
			<div class="favourite-area">
				<a href="#"><img src="${root }/img/core-img/heart.svg" alt=""></a>
			</div>
			<!-- User Login Info -->
			<div class="user-login-info">
				<a href="#"><img src="${root }/img/core-img/user.svg" alt=""></a>
			</div>
		</div>

	</div>
</header>