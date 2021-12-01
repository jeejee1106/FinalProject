<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>프로젝트 승인 관리 페이지</h1>
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
			<tr>
				<td>${p.idx }</td>
				<td>${p.category }</td>
				<td>${p.title }</td>
				<td>${p.name }</td>
				<td>${p.start_date }</td>
				<c:if test="${p.audit > 0 }">
					<td>${p.audit  }</td>
				</c:if>
				<td>
					<div class="btn-group">
						<button type="button" class="btn btn-success dropdown-toggle btn-xs" data-toggle="dropdown">
							승인/반려 <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">승인</a></li>
							<li><a href="#">반려</a></li>
						</ul>
					</div>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
