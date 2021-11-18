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
    <link rel="icon" href="img/core-img/favicon.ico">
    <!-- Core Style CSS -->
    <link rel="stylesheet" href="/css/core-style.css">
    <link rel="stylesheet" href="/style.css">
</head>
<body>
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


<!-- jQuery (Necessary for All JavaScript Plugins) -->
<script src="/js/jquery/jquery-2.2.4.min.js"></script>
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