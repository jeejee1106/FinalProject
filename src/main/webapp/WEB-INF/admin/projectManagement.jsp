<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 프로젝트 승인 관리 페이지 -->

<link rel="stylesheet" type="text/css" href="/css/profile.css">
<style>
.title {
cursor: pointer;
}
.table-container {
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-weight: 400;
    color: #3d3d3d;
    font-size: 16px;
    line-height: 27px;
    letter-spacing: -0.02em;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    width: 1080px;
    margin: 0px auto;
    overflow-x: hidden;
    padding: 14px 24px 24px;
    display: flex;
    flex-wrap: wrap;
}
.wait {
	color: #FF523B;
}
</style>

<!-- 스크립트 -->
<script type="text/javascript">
$(function(){
	
	$(".aprvl").click(function() {
		var idx = $(this).attr("idx");
		//alert(idx);
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

	$(".refusal").click(function() {
		var idx = $(this).attr("idx");
		//alert(idx);
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

$(document).on("click", "td.title", function() {
	var idx = $(this).attr("idx");
	//alert(idx);
	$.ajax ({
		type: "get",
		dataType: "text",
		data: {"idx": idx},
		url: "audit_detail",
		success: function(data) {
			//alert(idx+" 디테일로 이동");
			location.href="/admin/audit_detail?idx="+idx;
		}
	});
});

</script>
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
			<c:if test="${sessionScope.id == 'admin' && sessionScope.loginok == 'yes'}">
				<div class="tab-warpper-in">
					<span class="tab current">
						<div class="link-wrapper">
							<a href="#">회원목록</a>
						</div>
					</span>
					<span class="tab">
						<div class="link-wrapper">
							<a href="/admin/project_management" class="select">프로젝트 </a>
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
<h1>프로젝트 승인 관리 페이지</h1>
<div class="table-container">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>카테고리</th>
				<th>프로젝트명</th>
				<th>창작자명</th>
				<th>시작일</th>
				<th colspan="2">심사여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="p" items="${list }">
				<c:if test="${p.audit > 0}">
				<tr>
					<td idx="${p.idx }">${p.idx }</td>
					<td>${p.category }</td>
					<td class="title" idx="${p.idx }">${p.title }</td>
					<td>${p.name }</td>
					<td>${p.start_date }</td>
					<td>
						<c:choose>
							<c:when test="${p.audit == 1}">
								<b class="wait">대기</b>
							</c:when>
							<c:when test="${p.audit == 2}">
								반려
							</c:when>
							<c:when test="${p.audit == 3}">
								승인
							</c:when>
						</c:choose>
					<td>
						<c:if test="${p.audit == 1}">
						<div class="btn-group">
							<button type="button" class="btn btn-success dropdown-toggle btn-xs" data-toggle="dropdown">
								승인/반려 <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu">
								<li class="aprvl" idx="${p.idx }">승인</li>
								<li class="refusal" idx="${p.idx }">반려</li>
							</ul>
						</div>
						</c:if>
					</td>
				</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
</div>