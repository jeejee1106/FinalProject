<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 소개 -->

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
							<a href="/profile" class="select">소개</a>
						</div>
					</span>
					<span class="tab">
						<div class="link-wrapper">
							<a href="/profile/backed">후원한 프로젝트 </a>
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

<!-- 소개 -->
<div class="container">

	<div class="title">
		<h1>소개</h1>
	</div>

	<div class="container-introduction">
	<c:if test="${dto.introduce == null}">
		<div class="introduction1">등록된 소개가 없습니다.</div>
	</c:if>
	<c:if test="${dto.introduce != null}">
		<div class="introduction2">${dto.introduce }</div>
	</c:if>
	</div>

</div>
