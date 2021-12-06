<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<title>Login V2</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/css/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/css/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/css/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/css/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/css/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/css/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/css/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/css/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/css/loginutil.css">
	<link rel="stylesheet" type="text/css" href="/css/login.css">
<!--===============================================================================================-->
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="loginprocess" method="post">
					<span class="login100-form-title p-b-26">
						<a href="https://kauth.kakao.com/oauth/authorize?client_id=1439861063a7d822757160ad213d4a33&redirect_uri=http://localhost:9002/login/kakao&response_type=code"><img src="../photo/kakao_login_medium.png"></a>
					</span>
					<span class="login100-form-title p-b-48">
						<i class="zmdi zmdi-font"></i>
					</span>

					<div class="wrap-input100 validate-input" data-validate="Valid email is:a@b.c">
						<input type="text" name="id" class = "input100"
						autofocus="autofocus" required="required" 
						style = "width: 120px" value="${sessionScope.saveok==null?"":sessionScope.id}">
						<span class="focus-input100" data-placeholder="Id"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<input type = "password" name="pass" class = "input100"
						required="required" style = "width: 120px">
						<span class="focus-input100" data-placeholder="Password"></span>
					</div>
					<div>
						<input type = "checkbox" name = "cbsave" ${sessionScope.saveok == null?"":"checked"}>아이디저장
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button type="submit" class="login100-form-btn">
								Login
							</button>
						</div>
					</div>
					
					<div class="text-center p-t-115">
						<span class="txt1">
							Don’t have an account?
						</span>

						<a class="txt2" href="../member/main">
							Sign Up
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="/css/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/css/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/css/vendor/bootstrap/js/popper.js"></script>
	<script src="/css/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/css/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/css/vendor/daterangepicker/moment.min.js"></script>
	<script src="/css/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/css/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="/css/js/main.js"></script>
