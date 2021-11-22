<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta
      name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
    />
    <!-- Link Swiper's CSS -->
    <link
      rel="stylesheet"
      href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title  -->
<title>Bunddeuk</title>

<!-- Favicon  -->
<link rel="icon" href="img/core-img/bunddeuk-black.png">
<!-- Core Style CSS -->
<link rel="stylesheet" href="/css/core-style.css">
<link rel="stylesheet" href="/css/animate.css">
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/classy-nav.min.css">
<link rel="stylesheet" href="/css/core-style.css.map">
<link rel="stylesheet" href="/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/jquery-ui.min.css">
<link rel="stylesheet" href="/css/magnific-popup.css">
<link rel="stylesheet" href="/css/nice-select.css">
<link rel="stylesheet" href="/css/owl.carousel.css">
<link rel="stylesheet" href="/css/main.css">


</head>
<body>
<!-- jQuery (Necessary for All JavaScript Plugins) -->
<script src="/js/jquery/jquery-2.2.4.min.js"></script>


<div>
	<div class="">
		<tiles:insertAttribute name="header"/>
	</div>
	<div class="">
		<tiles:insertAttribute name="main"/>
	</div>
	<div class="">
		<tiles:insertAttribute name="footer"/>
	</div>
</div>
<!-- Popper js -->
<script src="/js/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="/js/bootstrap.min.js"></script>
<!-- Plugins js -->
<script src="/js/plugins.js"></script>
<!-- Classy Nav js -->
<script src="/js/classy-nav.min.js"></script>
<!-- Active js -->
<script src="/js/active.js"></script>
</body>
</html>