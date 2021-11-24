<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- mypage menu -->

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
.user-info>div>img {
	width: 15px;
}

/* 소개 */
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

/* 후원 */
.backed-wrapper {
	padding: 14px 24px 24px 24px;
}
.project-list {
	padding-top: 48px;
}
.section-title {
	margin-bottom: 16px;
	height: 27px;
	font-size: 18px;
	font-weight: bold;
}
.rounded-wrapper {
	border: 0.5px solid #9E9E9E;
	width: 990px;
	border-radius: 5px;
	padding: 20px;
	display: flex;
}
.warranty-image {
	max-width: 154px;
	height: 116px;
}

/* 올린 프로젝트 */
.created-wrapper {
	padding: 14px 24px 24px 24px;
}
.project-status {
	height: 24px;
	margin-top: 40px;
}

.project-card {
	border: 0.5px solid #9E9E9E;
	height: 200px;
	width: 990px;
	border-radius: 5px;
	padding: 20px 26px;
	display: flex;
}
.project-image-wrapper>img {
	max-width: 154px;
	height: 116px;
}
.project-content {
	width: 580px;
	height: 130px;
}

/* 메세지 */
#msg-view:hover {
	cursor: pointer;
}
</style>

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


</div>