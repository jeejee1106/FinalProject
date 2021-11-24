<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 후원한 프로젝트 -->
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
						<a href="/mypage/backed" style="color: #3D3D3D;">후원한 프로젝트 </a>
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

	<!-- 리스트 -->
	<div class="backed-wrapper">
		<div class="project-wrapper">
			<div class="project-count">
				<em style="color: red;">0</em>건의 후원내역이 있습니다.
			</div>
			<div class="project-list">
				<!-- 리스트 0개 -->
				<div class="list-zero">
					<div name="search-bold" class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs CommonNoResult__StyledSVGIcon-ewkly0-0 gJbbma">
					</div>
					<span class="message-wrapper">후원한 프로젝트가 없습니다.</span>
				</div>
				<!-- /리스트 0개 -->

				<div class="result-wrapper">
					<!-- 후원 진행중 -->
					<div class="list-wrapper">
						<div class="section-title">
							후원 진행중<span>(1)</span>
						</div>
						<div class="rounded-wrapper">
							<div class="warranty-wrapper">
								<div class="warranty-card">
									<div class="warranty-image">
										<img alt="" src="${root }/img/product-img/project-small.jpg">
									</div>
									<div class="warranty-number">
										후원일 2021. 11. 21<span>|</span>후원번호 4515018
									</div>
									<div class="warranty-title">
										<a href="#">프로젝트 이름</a>
									</div>
									<div class="">배송비
										포함</div>
									<div class="warranty-items">
										<ul>
											<li>솔 키링(x 1)</li>
											<li>솔 리무버블 스티커(x 1)</li>
										</ul>
									</div>
									<div class="warranty-state">
										<p class="money">10,500원 결제 예약</p>
										<p class="date">결제 예정일 2021. 12. 21</p>
									</div>
									<div class="btn-wrap">
										<button type="button" class="button-remove">후원 취소</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 후원 취소 -->
					<div class="list-wrapper">
						<div class="section-title">
							후원 실패<span>(1)</span>
						</div>
						<div class="rounded-wrapper">
							<div class="warranty-wrapper">
								<div class="warranty-card">
									<div class="warranty-image"></div>
									<div
										class="warranty-number">
										후원일 2021. 11. 21<span>|</span>후원번호 4514977
									</div>
									<div class="warranty-title">
										<a href="#">프로젝트 이름</a>
									</div>
									<div class="">배송비
										포함</div>
									<div class="warranty-items">
										<ul>
											<li>엽서 (3종)set (x 1)</li>
											<li>아크릴 키링(x 1)<span>옵션 : 위시래빗, 비비</span></li>
										</ul>
									</div>
									<div class="warranty-state">
										<p>14,000원 결제 예약 취소</p>
										<p class="date">결제 예약 취소일 2021. 11. 21</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


				<!-- <div class="card-wrapper">
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
						<div class="percentage-bar"></div>선
						<div class="funding-status">
							<span class="funding-amount">
								<em>12,445,000</em>원
							</span>
							<span class="percentage">2489%</span>
							<span class="rest-day">
								<div name="time" class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs ProjectCard__StyledSVGIcon-opxl0a-0 jTfJfo">
									<svg viewBox="0 0 48 48">
								</div>
								9일 남음
							</span>
						</div>
					</div>
				</div> -->
				
			</div>
		</div>
	</div>

</div>