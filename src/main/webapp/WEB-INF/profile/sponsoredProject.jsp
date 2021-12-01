<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			    			<img src="../photo/${photo }"/>
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
			<span>2</span>건의 후원 내역이 있습니다.
		</div>
		<!-- 검색 -->
<!-- 		<div class="styled__SearchWrapper-gi03vy-7 gfuXnu">
			<div class="styled__SearchWidgetContainer-sc-890lkc-0 iQnJNb">
				<div class="styled__SearchWidgetContent-sc-890lkc-1 fFotCY">
					<span class="Input__InputWrapper-j7moqy-0 fOjsfs styled__SearchInput-sc-890lkc-5 hJlxUD">
					<div name="search-bold" class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs styled__SearchIcon-sc-890lkc-3 UCSps head-icon">
							<svg viewBox="0 0 48 48">
								<path fill-rule="evenodd" clip-rule="evenodd" d="M21.8113 37.22C13.3064 37.22 6.4025 30.3161 6.4025 21.8113C6.4025 13.3064 13.3064 6.4025 21.8113 6.4025C30.3161 6.4025 37.22 13.3064 37.22 21.8113C37.22 30.3161 30.3161 37.22 21.8113 37.22ZM45.3246 42.2229L37.22 34.1172C44.0239 25.6124 42.6231 13.1063 34.1182 6.4025C30.9174 3.70097 26.714 2.20011 22.5117 2H21.8113H21.1109C10.805 2.40023 2.40023 10.7049 2 21.0108V21.7112V22.3115C2.30017 33.2177 11.4053 41.8226 22.3115 41.5225C26.614 41.4224 30.7163 39.9215 34.1182 37.22L42.2229 45.3246C43.1234 46.2251 44.4251 46.2251 45.3246 45.3246C46.2251 44.5242 46.2251 43.1224 45.3246 42.2229Z"></path>
							</svg>
					</div>
						<input type="text" inputmode="text" placeholder="프로젝트, 선물, 창작자를 검색하세요" autocomplete="off" autocapitalize="off" class="Input__InnerInput-j7moqy-1 hbYDra" value="">
					</span>
				</div>
			</div>
		</div> -->
	</div>
	<!-- 후원 성공 -->
	<div class="ResultWrapper">
		<div class="ListWrapper">
			<div class="SectionTitle">
				후원 진행중<span>(1)</span>
			</div>
			<div class="RoundedWrapper">
				<div class="WarrantyCard">
					<div class="DescWrapper">
						<div class="ImageWrapper"></div>
						<div class="DateWithWarrantyNumber">
							후원일 2021. 11. 21<span>|</span>후원번호 4515018
						</div>
						<div class="WarrantyCard-Title">
							<a href="/support/success">나의 친구가 되어줘 [친구를 찾아솔] 아트토이와 굿즈</a>
						</div>
						<div class="WarrantyCard-Desc">배송비 포함</div>
						<div class="WarrantyCard-Items">
							<ul>
								<li>솔 키링(x 1)</li>
								<li>솔 리무버블 스티커(x 1)</li>
							</ul>
						</div>
						<div class="WarrantyState">
							<p class="money">10,500원 결제 예약</p>
							<p class="point date">결제 예정일 2021. 12. 21</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 후원 실패 -->
			<div class="ResultWrapper">
		<div class="ListWrapper">
			<div class="SectionTitle">
				후원 실패<span>(1)</span>
			</div>
			<div class="RoundedWrapper">
				<div class="WarrantyCard">
					<div class="DescWrapper">
						<div class="ImageWrapper"></div>
						<div class="DateWithWarrantyNumber">
							후원일 2021. 11. 21<span>|</span>후원번호 4514977
						</div>
						<div class="WarrantyCard-Title">
							<a href="/support/failure">소원을 들어주는 달토끼 [위시래빗] 아트토이&amp;굿즈</a>
						</div>
						<div class="WarrantyCard-Desc">배송비 포함</div>
						<div class="WarrantyCard-Items">
							<ul>
								<li>엽서 (3종)set (x 1)</li>
								<li>아크릴 키링(x 1)<span>옵션 : 위시래빗, 비비</span></li>
							</ul>
						</div>
						<div class="WarrantyState">
							<p class="failure-money">14,000원 결제 예약 취소</p>
							<p class="failure date">결제 예약 취소일 2021. 11. 21</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
