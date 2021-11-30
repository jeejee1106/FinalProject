<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- 배송지 -->
<div class="profileemail">
	<span><b>등록된 배송지</b></span> <span class="updateEmail">
	<span class="updatespan">+추가</span>
	</span><br>
	<c:if test="${list == null }">
		
	</c:if>
	<c:forEach var="a" items="${list}" varStatus="i">
			<tr>
				<td>${i.count}</td>
				<td>${a.name}</td>
				<td>${a.id}</td>
				<td>${a.hp}</td>
				<td>${a.addr}</td>
				<td>${a.email}</td>
				<td>
					<button type = "button" class = "btn btn-default btn-xs"
					onclick="location.href='updatepassform?num=${a.num}'">수정</button>
					<button type = "button" class = "btn btn-default btn-xs del"
					num=${a.num}>삭제</button>
				</td>
			</tr>
		</c:forEach>
	<hr>
</div>