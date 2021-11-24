<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<!-- 소개 -->
<style type="text/css">

.container {
	font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
}
.container-user {
	padding: 40px 24px 50px 24px;
}
.user-name {
	margin-left: 130px;
	margin-top: -60px;
}
.user-name {
	font-size: 30px;
	color: rgb(61, 61, 61);
	font-weight: bold;
	font-size: 30px;
	line-height: 45px;
	letter-spacing: -0.03em;
	display: flex;
}
.user-info {
	margin-left: 15px;
}

/* .container-tab {
    font-weight: 400;
    color: #3d3d3d;
    line-height: 27px;
    display: inline-flex;
    word-break: keep-all;
    padding: 0px 28px;
    font-size: 18px;
    height: 60px;
} */
.tab-warpper{
	
}
.link-wrapper {
	box-sizing: inherit;
}
.link-wrapper>a {
	color: #9E9E9E;
    font-size: 18px;
}
.link-wrapper>a:hover {
    font-size: 18px;
    color: #3d3d3d;
}
.tab {
    font-size: 18px;
	margin: 0px 24px 0px 0px;
    align-items: center;
    height: 100%;
}
.container-introduction {
	height: 150px;
	padding: 0 24px;
}
.introduction {
	height: 120px;
	width: 700px;
	padding-bottom: 32px;
	font-size: 18px;
	color: #9E9E9E;
}
.user-info>div>img {
	width: 15px;
}
/*  */

</style>
<!--  -->

<!--  -->
<div class="container">

	<div class="header-profile">
	
		<div class="container-user">
			<div>
				<div class="user-photo" style="width: 100px; height: 100%;">
					<img src="${root }/img/core-img/user.svg">
				</div>
				<div class="user-name">
					<span>${name }</span>
					<a class="user-info" href="#">
						<div name="setting">
							<img src="${root }/img/core-img/settings.png">
						</div>
					</a>
				</div>
			</div>
		</div>
		
		<div class="container-tab">
			<div class="tab-warpper">
				<span class="tab">
					<div class="link-wrapper">
						<a href="/mypage" style="color: #3D3D3D;">소개</a>
					</div>
				</span>
				<span class="tab">
					<div class="link-wrapper">
						<a href="/mypage/backed">후원한 프로젝트 </a>
					</div>
				</span>
				<span class="tab">
					<div class="link-wrapper">
						<a href="/mypage/created">올린 프로젝트 </a>
					</div>
				</span>
				<span class="tab">
					<div class="link-wrapper">
						<a href="/mypage/liked">관심프로젝트 </a>
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
		</div>
		
	</div>

	<div class="container-introduction">
		<div class="introduction">등록된 소개가 없습니다.</div>
	<button type="button">로그인</button>
			<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=44e402d223344a99585dda8442c481de&redirect_uri=http://localhost:9002/auth/kakao/callback"><img src="${root }/img/core-img/kakao-login.png"></a>
		
	</div>

</div>