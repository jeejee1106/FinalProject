<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 올린 프로젝트 -->
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


/*  */
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
						<a href="/mypage">소개</a>
					</div>
				</span>
				<span class="tab">
					<div class="link-wrapper">
						<a href="/mypage/backed">후원한 프로젝트 </a>
					</div>
				</span>
				<span class="tab">
					<div class="link-wrapper">
						<a href="/mypage/created" style="color: #3D3D3D;">올린 프로젝트 </a>
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
	
	<!-- 리스트 -->
	<div class="created-wrapper">
		<div class="project-wrapper">
			<div class="project-count">
				<em style="color: red;">0</em>개의 프로젝트가 있습니다.
			</div>
			<div class="project-list">
				<!-- 리스트 0개 -->
				<div class="list-zero">
					<div name="search-bold" class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs CommonNoResult__StyledSVGIcon-ewkly0-0 gJbbma">
					</div>
					<span class="message-wrapper">올린 프로젝트가 없습니다.</span>
				</div>
				<!-- /리스트 0개 -->

				<div class="project-status">
					<div class="project-status-tag">작성 중</div>
				</div>
				<div class="project-card">
					<div class="project-image-wrapper">
						<img alt="" src="${root }/img/product-img/project-small.jpg">
					</div>
					<div class="project-container">
						<div class="project-content-wrapper">
							<div class="project-content">
								<div class="project-title">
									<span>긴 제목</span>
								</div>
								<div class="project-description">
									<span>프로젝트 요약 나오는곳</span>
								</div>
							</div>
							<div class="project-button-section">
								<a href="#"
									class="project-management">관리</a>
								<a 
									class="project-remove">삭제</a>
							</div>
						</div>
					</div>
				</div>
				<!--  -->
			</div>
		</div>
	</div>

</div>