<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 관심 프로젝트 -->
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
						<a href="/mypage/created">올린 프로젝트 </a>
					</div>
				</span>
				<span class="tab">
					<div class="link-wrapper">
						<a href="/mypage/liked" style="color: #3D3D3D;">관심프로젝트 </a>
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
				<em>0</em>개의 프로젝트를 좋아합니다.
			</div>
			<div class="project-list">
				<!-- 리스트 0개 -->
				<div class="list-zero">
					<div name="like-line" class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs Liked__StyledSVGIcon-sc-1ie8qjp-6 fUVLV">
					</div>
					<span class="message-wrapper">좋아한 프로젝트가 없습니다.</span>
				</div>
				<!-- /리스트 0개 -->

				<div class="card-wrapper">
					<div class="link-wrapper">
						<div class="like-button-wrapper">
							<button type="button" class="like-button">
								<span>좋아요</span>
							</button>
						</div>
						<div class="image-wrapper">
							<a href="#">
								<img src="#"></a>
						</div>
						<dl>
							<dt>
								<a href="#">프로젝트 이름</a>
							</dt>
							<dd class="project-sub-info">
								<span><a href="#">카테고리</a></span>
								<span><a href="#">창작자 이름</a></span>
							</dd>
							<dd class="project-desc">작은 제목</dd>
						</dl>
						<div class="percentage-bar"></div><!-- 선 -->
						<div class="funding-status">
							<span class="funding-amount">
								<em>12,445,000</em>원
							</span>
							<span class="percentage">2489%</span>
							<span class="rest-day">
								<div name="time" class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs ProjectCard__StyledSVGIcon-opxl0a-0 jTfJfo">
								</div>
								9일 남음
							</span>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	
</div>
