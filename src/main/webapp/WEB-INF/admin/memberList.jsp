<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 회원관리 리스트 페이지 -->
<!-- 메뉴스타일 -->
<link rel="stylesheet" type="text/css" href="/css/profile.css">
<!-- /메뉴스타일 -->

<style>
.resultCounter1 {
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-weight: 400;
    color: #3d3d3d;
    font-size: 16px;
    letter-spacing: -0.02em;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    -webkit-box-flex: 1;
    flex-grow: 1;
    line-height: 44px;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    order: 1;
    width: 57%;
    margin-top: 25px;
    margin-left: 28px;
}
.resultCounter1>span {
	-webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-weight: 400;
    font-size: 16px;
    letter-spacing: -0.02em;
    word-break: break-all;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    line-height: 44px;
    box-sizing: inherit;
    color: rgb(255, 87, 87);
}
.meminfo {
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
							<a href="/admin/member_management" class="select">회원목록</a>
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

<!-- 회원리스트 -->
<div class="WarrantyFilterHeader">
	<div class="resultCounter1">
		<span>${totalCount }</span>&nbsp;명의 회원이 있습니다.
	</div>
</div>
<div class="table-container">
	<table class="table table-hover table-bordered">
		<thead>
			<tr>
				<th>아이디</th>
				<th>닉네임</th>
				<th>가입일</th>
				<th>편집</th>
			</tr>
		</thead>
		<tbody>
 			<c:if test="${totalCount == 0}">
				<tr>
				<td colspan="4">회원이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${totalCount > 0}">
				<c:forEach var="m" items="${mlist }">
						<tr>
							<td class="meminfo" num="${m.id }">${m.id }</td>
							<td class="meminfo" num="${m.id }">${m.name }</td>
							<td><fmt:formatDate value="${m.join_date }" pattern="yyyy-MM-dd"/> </td>
							<td><button type="button" class="btn btn-danger remove" num="${m.num }" myid="${m.id }">삭제</button></td>
						</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
			<!-- 페이징 -->
		<c:if test="${totalCount>0 }">
			<div style="width: 800px; text-align: center;">
				<ul class="pagination">
					<!-- 이전 -->
					<c:if test="${startPage>1 }">
						<li><a href="member_management?currentPage=${startPage-1}">이전</a></li>
					</c:if>

					<c:forEach var="pp" begin="${startPage}" end="${endPage}">
						<c:if test="${currentPage==pp}">
							<li class="active"><a href="notice?currentPage=${pp}">${pp}</a></li>
						</c:if>
						<c:if test="${currentPage!=pp}">
							<li><a href="member_management?currentPage=${pp}">${pp}</a></li>
						</c:if>
					</c:forEach>

					<!-- 다음 -->
					<c:if test="${endPage<totalPage }">
						<li><a href="member_management?currentPage=${endPage+1}">다음</a></li>
					</c:if>

				</ul>
			</div>
		</c:if>
		<!-- /페이징 -->
</div>

<script type="text/javascript">
$(".meminfo").click(function() {
	var id = $(this).attr("num");
	location.href="/admin/member_info?id=?"+id+"&currentPage="+${currentPage}+"&key=memberList";
});

	$(".remove").click(function() {
		var num = $(this).attr("num");
		var myid = $(this).attr("myid");
		//alert(num);
		if(myid == 'admin'){
			alert("관리자는 삭제할수 없습니다.")
		} else {
			var a = confirm("회원을 삭제하시겠습니까?");
			if(a == true) {
				var quary = {"num" : num};
				
	 			$.ajax ({
					type: "get",
					url: "member_info_delete",
					data: quary,
					dataType: "text",
					success: function(data) {
						//alert("회원삭제 성공!");
						location.href="/admin/member_management?currentPage="+${currentPage}+"&key=memberList";
					},
					error: function(){
						alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					}
				});
			}
		}
	});
</script>
