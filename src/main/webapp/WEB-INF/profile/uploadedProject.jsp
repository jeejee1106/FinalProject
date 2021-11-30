<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 올린 프로젝트 -->

<link rel="stylesheet" type="text/css" href="/css/profile.css">

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

<!-- 메뉴 -->
<div class="container">

	<div class="header-profile">
	
		<div class="container-user">
 				<div class="user-photo" style="width: 100px; height: 100px;">
					<c:if test="${dto.photo == null}">
		    			<img src="../photo/basic.jpg"/>
		    		</c:if>
		    		<c:if test="${dto.photo != null}">
		    				<img src="../photo/${photo }"/>
		    		</c:if>
	    		</div>
				<div class="a">
					<div class="user-name">
						<span>${name }</span>
						<c:if test="${sessionScope.id == id }">
							<a class="user-info" href="/setting/main">
								<div name="setting">
									<img src="${root }/img/core-img/settings.png">
								</div>
							</a>
						</c:if>
					</div>
				</div>
		</div>
		
		<div class="container-tab">
			<div class="tab-warpper">
			<c:if test="${ sessionScope.id != 'admin'}">
				<div class="tab-warpper-in">
					<span class="tab current">
						<div class="link-wrapper">
							<a href="/profile">소개</a>
						</div>
					</span>
					<span class="tab">
						<div class="link-wrapper">
							<a href="/profile/backed">후원한 프로젝트 </a>
						</div>
					</span>
					<span class="tab">
						<div class="link-wrapper">
							<a href="/profile/created" class="select">올린 프로젝트
							</a>
						</div>
					</span>
					<span class="tab">
						<div class="link-wrapper">
							<a href="/profile/liked">관심프로젝트 </a>
						</div>
					</span>
					<c:if test="${sessionScope.id == id }">
						<span class="tab">
							<div class="link-wrapper">
								<a href="/message/receivedMessage">메세지 </a>
							</div>
						</span>
							<c:if test="${id != sessionScope.id}">
								<span class="tab">
									<div class="link-wrapper">
										<a class='personal-chat'>채팅 </a>
									</div>
								</span>
							</c:if>
						</c:if>
					</div>
			</c:if>
			<!-- 관리자 -->
			<c:if test="${sessionScope.id == 'admin'}">
				<div class="tab-warpper-in">
					<span class="tab current">
						<div class="link-wrapper">
							<a href="#">회원목록</a>
						</div>
					</span>
					<span class="tab">
						<div class="link-wrapper">
							<a href="#">프로젝트 </a>
						</div>
					</span>
				</div>
			</c:if>
			</div>
		</div>
	</div>
							<form name="popForm">
							<input type="hidden" name="id" value="${id}" />
						</form>

</div>

<!-- 스크립트 -->
<script type="text/javascript">
$(function () {
   $(".personal-chat").click(function() {
      /* let num = ${num}; */
      /* var win = window.open("../chat/personalChat?num="+num, "PopupWin", "width=480,height=765 , left = 400px, top = 100px");  */
      onSubmit()
   })
})   

function onSubmit(){
 var myForm = document.popForm;
 var url = "/chat/personalChat";
 window.open("" ,"popForm","width=480,height=765 , left = 400px, top = 100px");
 myForm.action =url;
 myForm.method="post";
 myForm.target="popForm";
 myForm.submit();
}
</script>

	<!-- 리스트 -->
<div class="container">
	
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
					<c:if test="${c.thumbnail == null}">
						<div class="ProjectImageWrapper">
							<svg class="style__ProjectDefaultImage-sc-16sdzr6-3 kcoQXj" width="34" height="30" viewBox="0 0 34 30" fill="none" xmlns="http://www.w3.org/2000/svg">
								<path d="M10.9581 4.6448C10.9581 7.21002 8.90441 9.28954 6.37101 9.28954C3.83761 9.28954 1.78388 7.21002 1.78388 4.6448C1.78388 2.07958 3.83761 6.10352e-05 6.37101 6.10352e-05C8.90441 6.10352e-05 10.9581 2.07958 10.9581 4.6448Z" fill="white"></path>
								<path d="M33.9149 30.0001C33.9805 30.0001 34.0213 29.928 33.9883 29.8707L21.7443 8.62478C21.7114 8.56771 21.6299 8.56795 21.5973 8.62522L13.6619 22.5815C13.6324 22.6335 13.5606 22.6397 13.5229 22.5934L8.57785 16.5436C8.54116 16.4988 8.47194 16.503 8.44089 16.5521L0.0135644 29.8676C-0.0226682 29.9249 0.0179337 30.0001 0.0850861 30.0001H33.9149Z" fill="white"></path>
							</svg>
						</div>
					</c:if>
					<c:if test="${c.thumbnail != null}">
						<div class="project-image-wrapper">
							<%-- <img src="${root }/img/product-img/${c.thumbnail}"> --%>
							<img src="../thumbnail_image/${c.thumbnail}" class="thumbnail"/>
						</div>
					</c:if>
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