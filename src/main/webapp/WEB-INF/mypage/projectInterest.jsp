<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 관심 프로젝트 -->

<div class="container">
<%@ include file="../mypage/mypageMenu.jsp" %>

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
