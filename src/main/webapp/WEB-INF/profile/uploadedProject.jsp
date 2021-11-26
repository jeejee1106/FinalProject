<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 올린 프로젝트 -->

<div class="container">
<%@ include file="../profile/profileMenu.jsp" %>
	
	<!-- 리스트 -->
	<div class="title">
		<h1>내가 만든 프로젝트</h1>
	</div>
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