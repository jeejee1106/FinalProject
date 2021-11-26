<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<em style="color: red;">${creativeCont}</em>개의 프로젝트가 있습니다.
			</div>
			<div class="project-list">
				<!-- 리스트 0개 -->
				<c:if test="${empty creativeCont }">
					<div class="list-zero">
						<div name="search-bold" class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs CommonNoResult__StyledSVGIcon-ewkly0-0 gJbbma">
						</div>
						<span class="message-wrapper">올린 프로젝트가 없습니다.</span>
					</div>
				</c:if>
				<!-- /리스트 0개 -->
				<c:if test="${creativeCont>0 }">
				<div class="project-status">
					<div class="project-status-tag">작성 중 ${creativeCont}</div>
				</div>
				<c:forEach var="c" items="${creativeList }">
					<div class="project-card">
						<div class="project-image-wrapper">
							<%-- <img alt="" src="${root }/img/product-img/project-small.jpg"> --%>
							<img alt="" src="${root }/img/product-img/${c.thumbnail}">
						</div>
						<div class="project-container">
							<div class="project-content-wrapper">
								<div class="project-content">
									<div class="project-title">
										<span>${c.title }</span>
									</div>
									<div class="project-description">
										<span>${c.category }</span>
									</div>
								</div>
								<div class="project-button-section">
								<button type="button" class="btn btn-info btn-sm project-management"
									onclick="location.href='created/management?idx=${c.idx}'">관리</button>
									<a 
										class="project-remove">삭제</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				</c:if>
				<!--  -->
			</div>
		</div>
	</div>

</div>