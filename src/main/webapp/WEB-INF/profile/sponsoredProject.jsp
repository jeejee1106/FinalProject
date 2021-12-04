<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 후원한 프로젝트 -->

<link rel="stylesheet" type="text/css" href="/css/profile.css">

<!-- 메뉴 -->
<div class="container">

	<div class="header-profile">
	
		<div class="container-user">
 				<div class="user-photo" style="width: 100px; height: 100px;">
					<c:choose>
						<c:when test="${sessionScope.id == id and dto.photo == null}">
				    		<img src="../photo/basic.jpg"/>
						</c:when>
						<c:when test="${sessionScope.id == id and dto.photo != null}">
			    			<img src="../photo/${dto.photo }"/>
						</c:when>
						<c:otherwise>
			    			<img src="../photo/${movedto.photo }"/>
						</c:otherwise>
					</c:choose>
	    		</div>
				<div class="a">
					<div class="user-name">
						<c:if test="${sessionScope.id == id }">
							<span>${dto.name }</span>
						</c:if>
						<c:if test="${sessionScope.id != id }">
							<span>${movedto.name }</span>
						</c:if>
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
							<a href="/profile/backed" class="select">후원한 프로젝트 </a>
						</div>
					</span>
					<span class="tab">
						<div class="link-wrapper">
							<a href="/profile/created">올린 프로젝트
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
						</c:if>
						<c:if test="${id != sessionScope.id}">
							<span class="tab">
								<div class="link-wrapper">
									<a class='personal-chat'>채팅 </a>
								</div>
							</span>
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
							<a href="/admin/project_management">프로젝트 </a>
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

	<!-- 리스트 -->
<div class="ContainerComponent">
	<div class="WarrantyFilterHeader">
		<div class="resultCounter">
			<span>${count }</span>건의 후원 내역이 있습니다.
		</div>
	</div>
	<!-- 후원 성공 -->
	<div class="ResultWrapper">
		<div class="ListWrapper">
<%-- 			<div class="SectionTitle">
				후원 진행중<span>(${count })</span>
			</div> --%>
			<div class="RoundedWrapper">
		<c:forEach var="s" items="${supportLsit }">
				<div class="WarrantyCard">
					<div class="DescWrapper">
						<div class="ImageWrapper">
							<a href="/profile/support_success?num=${s.num }">
								<img src="../thumbnail_image/${s.thumbnail }">
							</a>
						</div>
						<div class="DateWithWarrantyNumber">
							후원일 ${s.support_date }<span>|</span>후원번호 ${s.num }
						</div>
						<div class="WarrantyCard-Title">
							<a href="/profile/support_success?num=${s.num }">${s.title }</a>
						</div>
						<div class="WarrantyCard-Desc">${s.present_name }</div>
<%-- 						<div class="WarrantyCard-Items">
							<ul>
								<li>${s.present_name }</li>
							</ul>
						</div> --%>
						<div class="WarrantyState">
							<p class="money"><fmt:formatNumber value="${s.price }"/> 원</p>
							<p class="point date">
								<c:if test="${s.payment_status == 0}">
									결제예약
								</c:if>
								<c:if test="${s.payment_status == 1}">
									결제완료
								</c:if>
							</p> 
						</div>
					</div>
				</div>
		</c:forEach>
			</div>
		</div>
</div>
