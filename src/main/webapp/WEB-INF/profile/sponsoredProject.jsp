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
		<h1>후원 현황</h1>
	</div>
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