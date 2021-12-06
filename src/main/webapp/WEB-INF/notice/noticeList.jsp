<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 공지사항 리스트 -->
<link rel="stylesheet" type="text/css" href="/css/notice.css">

<!-- 공지사항 타이틀 -->
<div class="Notices_SettingTitle">
	<div class="Container__ContainerComponent">
		<span class="fnt-lt">공지사항</span>
	</div>
	<div class="Container__TabContainerComponent">
		<div class="TabContainer">
		</div>
	</div>
</div>
<!-- /공지사항 타이틀 -->
<!-- 리스트 -->
<div class="Container_list">
	<div class="list-wrapper">
		<ul class="List_StyledList">
			<c:forEach var="n" items="${noticeList }">
			<li class="">
				<a href="/notice/detail?num=${n.num }&currentPage=${currentPage}&key=noticeList">
					<span class="title-box">
						<span class="group">
							공지사항<em class="empty"></em>
						</span>
						<span class="title">
							${n.subject }
						</span>
						<span class="date">
							<fmt:formatDate value="${n.writeday }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</span>
					<div class="img-box">
						<img src="https://tumblbug-assets.imgix.net/notices/cover_images/000/000/210/original/tbb_logo_1240.png?w=620">
					</div>
				</a>
			</li>
			</c:forEach>
		</ul>
	</div>
	<div>
		<c:if test="${sessionScope.loginok == 'yes' and sessionScope.id == 'admin' }">
			<button type="button" onclick="location.href='/notice/wrtieform'">글쓰기</button>
		</c:if>
	</div>
		<!-- 페이징 -->
		<c:if test="${totalCount>0 }">
			<div style="width: 800px; text-align: center;">
				<ul class="pagination">
					<!-- 이전 -->
					<c:if test="${startPage>1 }">
						<li><a href="notice?currentPage=${startPage-1}">이전</a></li>
					</c:if>

					<c:forEach var="pp" begin="${startPage}" end="${endPage}">
						<c:if test="${currentPage==pp}">
							<li class="active"><a href="notice?currentPage=${pp}">${pp}</a></li>
						</c:if>
						<c:if test="${currentPage!=pp}">
							<li><a href="notice?currentPage=${pp}">${pp}</a></li>
						</c:if>
					</c:forEach>

					<!-- 다음 -->
					<c:if test="${endPage<totalPage }">
						<li><a href="notice?currentPage=${endPage+1}">다음</a></li>
					</c:if>

				</ul>
			</div>
		</c:if>
		<!-- /페이징 -->

</div>
<!-- /리스트 -->
