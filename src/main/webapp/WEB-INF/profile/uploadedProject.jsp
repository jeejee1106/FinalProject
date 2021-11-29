<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 올린 프로젝트 -->
<link rel="stylesheet" type="text/css" href="/css/profile.css">

<!--  -->
<style>

</style>

<script type="text/javascript">
 $(document).on("click",".project-remove", function() {
	 var idx = $(this).attr("idx");
	 var a = confirm("정말로 삭제하시겠습니까?");
	 if(a==true) {
		 var quary = {"idx":idx};
		 $.ajax ({
			type: "get",
			url: "created/delete",
			dtatType: "text",
			data: quary,
			success: function(data) {
				//alert("삭제성공");
				location.reload();
			},
	        error: function() {
				//alert(idx);
	            alert("error");
	        }
		 });
	 }
});
</script>

<div class="container">
<%@ include file="../profile/profileMenu.jsp" %>
	
	<!-- 리스트 -->
	<div class="title">
		<h1>내가 만든 프로젝트</h1>
	</div>
	<div class="created-wrapper">
		<div class="project-wrapper">
			<div class="project-count">
				<em style="color: red;">${creativeCont}</em> 개의 프로젝트가 있습니다.
			</div>
			<div class="top-btn style__Tabs-sc-3a505r-0 kTjmVr"
				style="margin: 20px auto 0px; padding: 0px 16px; max-width: 1080px;">
				<div class="style__Tab-sc-3a505r-1 dggvBV" value="전체">전체</div>
				<div class="style__Tab-sc-3a505r-1 gsEWlI" value="작성">작성 중</div>
				<div class="style__Tab-sc-3a505r-1 gsEWlI" value="심사">심사 중</div>
				<div class="style__Tab-sc-3a505r-1 gsEWlI" value="승인">승인됨</div>
				<div class="style__Tab-sc-3a505r-1 gsEWlI" value="반려">반려됨</div>
			</div>
			<div class="project-list">
				<c:if test="${empty creativeCont }">
					<div class="list-zero">
						<div name="search-bold" class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs CommonNoResult__StyledSVGIcon-ewkly0-0 gJbbma">
						</div>
						<span class="message-wrapper">올린 프로젝트가 없습니다.</span>
					</div>
				</c:if>
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
							<div class="project-container-content-btn">
								<div class="project-content-wrapper">
									<div class="project-content">
										<div class="project-title">
											<span>${c.title }</span>
										</div>
										<div class="project-description">
											<span>${c.category }</span>
										</div>
									</div>
								</div>
								<div class="project-button-section">
								<a class="project-management"
									href="created/management?idx=${c.idx}">관리
								</a>
									<a class="project-remove" idx="${c.idx }">삭제</a>
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