<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 심사중인 프로젝트 디테일 -->

<link rel="stylesheet" type="text/css" href="/css/admin.css">

<script type="text/javascript">
$(function(){
	$(".aprvlButton").click(function() {
		var idx = $(this).attr("idx");
		
		var a = confirm("승인 하시겠습니까?");
 		if (a == true) {
			var quary = {"idx": idx};
			
			$.ajax ({
				type: "get",
				url: "project_aprvl",
				data: quary,
				dataType: "text",
				success: function(data) {
					//alert("승인");
					location.reload();
				},
				error: function(){
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
			});
		}
	});
	
	$(".refusalButton").click(function() {
		var idx = $(this).attr("idx");
		
		var a = confirm("승인거부 하시겠습니까?");
 		if (a == true) {
			var quary = {"idx": idx};
			
			$.ajax ({
				type: "get",
				url: "project_refusal",
				data: quary,
				dataType: "text",
				success: function(data) {
					//alert("반려됨");
					location.reload();
				},
				error: function(){
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
			});
		}
	});
	
	
});
</script>

<!-- detail -->
	<div class="Header">
		<div class="HeaderWrap">
			<a class="HeaderLeft" href="/admin/project_management">
				<div name="arrow3-left" class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs style__icon-sc-1dvdb02-3 ggMYrs">
					<svg viewBox="0 0 48 48">
						<path fill-rule="evenodd" clip-rule="evenodd" d="M43.7014 21.7189L10.1221 21.7189L25.2128 7.06878C26.1112 6.15946 26.2122 4.64393 25.3127 3.73461C24.4133 2.82529 22.9142 2.72425 22.0148 3.63357L2.72663 22.4262C1.82719 23.3355 1.72725 24.75 2.62669 25.7604H2.72663L22.0148 44.4519C22.9142 45.2602 24.4133 45.1592 25.2128 44.2499C26.0123 43.3405 26.0123 41.926 25.1119 41.0167L10.0221 26.4676L43.7014 26.4676C45.0006 26.4676 46 25.4572 46 24.1438C46 22.8303 45.0006 21.7189 43.7014 21.7189Z"></path>
					</svg>
				</div>
				<span>목록</span>
			</a>
		</div>
	</div>

<div class="Container">
	<section class="ProjectIntroWrapper">
		<div class="inner" style="align-items: start;">
			<div class="ImgArea">
					<img src="../thumbnail_image/${pdto.thumbnail }">
			</div>
			<div class="ProjectInfo">
				<span class="intro">${pdto.category } | ${pdto.name }</span>
				<h3 class="title">${pdto.title }</h3>
				<c:if test="${pdto.audit == 1}">
					<button class="aprvlButton" idx="${pdto.idx }">
						<div class="text">승인</div>
					</button>
					<button class="refusalButton" idx="${pdto.idx }">
						<div class="text">반려</div>
					</button>
				</c:if>
				<div class="auditWrap">
					심사 여부&nbsp;&nbsp;:&nbsp;&nbsp;
					<c:choose>
						<c:when test="${pdto.audit == 1}">
							<b class="wait">대기</b>
						</c:when>
						<c:when test="${pdto.audit == 2}">
							반려됨
						</c:when>
						<c:when test="${pdto.audit == 3}">
							승인됨
						</c:when>
					</c:choose>
				</div>						
			</div>
		</div>
	</section>
	<div class="ProjectContents">
		<div class="StoryWrap">
			<div id="purpose" class="StorySection">
				<div class="StorySectionTitle">프로젝트 목적</div>
				<div class="storyContent">
					<p>${pdto.project_goal }</p>
				</div>
			</div>
			<div id="budget" class="StorySection">
				<div class="StorySectionTitle">프로젝트 예산</div>
				<div class="storyContent">
					<p>${pdto.project_budget }</p>
				</div>
			</div>
			<div id="schedule" class="StorySection">
				<div class="StorySectionTitle">프로젝트 일정</div>
				<div class="storyContent">
					<p>${pdto.project_schedule }</p>
				</div>
			</div>
			<div id="introducation" class="StorySection">
				<div class="StorySectionTitle">프로젝트 팀 소개</div>
				<div class="storyContent">
					<p>${pdto.project_team_intro }</p>
				</div>
			</div>
			<div id="rewardDescription" class="StorySection">
				<div class="StorySectionTitle">선물 설명</div>
				<div class="storyContent">
					<p>${pdto.project_present_intro }</p>
				</div>
			</div>
			<div id="refundExchangePolicy" class="StorySection">
				<div class="StorySectionTitle">신뢰와 안전</div>
				<div class="storyContent">
					<p>${pdto.anticipated_problem }</p>
				</div>
			</div>
		</div>
	</div>
</div>