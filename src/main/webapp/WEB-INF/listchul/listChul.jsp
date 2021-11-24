<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="list-select">
	<div class="wrap">
		<span class="list-gore"> <select class="list-gore-btn">
				<option value="">카테고리</option>
				<option value="공연">공연</option>
				<option value="디자인">디자인</option>
				<option value="사진">사진</option>
				<option value="영화">영화</option>
				<option value="푸드">푸드</option>
				<option value="음악">음악</option>
				<option value="출판">출판</option>
				<option value="패션">패션</option>
		</select>
		</span> <span class="list-gore"> <select class="list-gore-btn">
				<option value="모든">상태</option>
				<option value="인기">인기 프로젝트</option>
				<option value="성공">성공 임박프로젝트</option>
				<option value="신규">신규 프로젝트</option>
				<option value="공개">공개 예정프로젝트</option>
		</select>
		</span> <span class="list-gore"> <select class="list-gore-btn">
				<option value="">달성률</option>
				<option value="75down">75% 이하</option>
				<option value="75to100">75%~100%</option>
				<option value="100up">100% 이상</option>
		</select>
		</span>
	</div>
</div>
<div class="list-chul">
	<div class="second-select">
		<b>총 ${totalCount}개의 프로젝트가 있습니다</b>
	</div>
	<div class="list-lists">
		<c:forEach var="dto" items="${list}">
			<div class="contain-list">
				<a href="/project/detail?idx=${dto.idx}" class="list-thumbnail">
					<div class="img-div">
						<img src="${root}/image/${dto.thumbnail}">
					</div>
				</a> <a href="/project/detail?idx=${dto.idx}" class="list-thumbnail">
					<div class="txt-div">
						<p class="tit">${dto.title}</p>
					</div>
				</a>
			</div>
		</c:forEach>
	</div>
</div>