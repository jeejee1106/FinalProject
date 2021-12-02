<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 후원 성공 세부내역 -->

<link rel="stylesheet" type="text/css" href="/css/support.css">

<script type="text/javascript">
$(function(){
	$("button.WarrantyCancelButton").click(function() {
		var num = $(this).attr("num");
		//alert(num);
		var a = confirm("후원을 취소하시겠습니까?");
		if (a == true) {
			var quary = {"num":num};
			$.ajax ({
				type : "get",
				data : quary,
				url : "support_cancel",
				dataType: "text",
				success : function(data) {
					//alert("취소 성공");
					location.href="backed";
				},
				error: function(){
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
			});
		}
	});
});	
</script>

<!-- 후원 내역 -->
<div class="Page">
	<section class="ProjectIntroWrapper">
		<div class="inner" style="align-items: start;">
			<div class="ImgArea">
				<a href="/project/detail?idx=${sdto.idx }">
					<img src="../thumbnail_image/${sdto.thumbnail }">
				</a>
			</div>
			<div class="ProjectInfo">
				<span class="intro">${sdto.category } | ${sdto.name }</span>
				<h3 class="title">
					<a href="/project/detail?idx=${sdto.idx }">${sdto.title }</a>
				</h3>
				<div class="flex">
					<strong class="account"><fmt:formatNumber value="${sdto.total_amount }"/>원</strong>
					<!-- <span class="achivement">110%</span> -->
					<!-- <span class="state">18일 남음</span> -->
				</div>
				<a class="AskCreatorButton">
					<div name="letter" class="AskCreatorButtonIcon">
						<svg viewBox="0 0 48 48">
							<path fill-rule="evenodd" clip-rule="evenodd" d="M41.9 37.8966H6.1C5.1 37.8966 4.2 37.0958 4.2 35.997V34.5964L15.7 26.3993L19 29.0977C21.9 31.4981 26.099 31.4981 29.099 29.0977L32.4 26.3993L43.9 34.5964V35.997C43.799 37.0958 43 37.8966 41.9 37.8966ZM13.9 24.9996L4.2 31.898V17.0015L13.9 24.9996ZM43.799 17.0015V31.898L34.099 24.9996L43.799 17.0015ZM6.1 9.20333H41.9C42.9 9.20333 43.799 10.0031 43.799 11.1029V14.2022L27.7 27.499C25.599 29.1986 22.5 29.1986 20.4 27.499L4.2 14.2022V11.0029C4.2 10.0031 5.1 9.10336 6.1 9.20333ZM41.9 7.00385H6.1C3.9 6.90287 2 8.80243 2 11.0029V35.997C2 38.2955 3.9 40.0951 6.1 39.9961H41.9C44.2 39.9961 46 38.1965 46 35.997V11.0029C46 8.80243 44.2 6.90287 41.9 7.00385Z"></path>
						</svg>
					</div>
					창작자에게 문의
				</a>
			</div>
		</div>
	</section>
	<div class="Container_WarrantyDetailWrapper">
		<div class="CardWrapper">
			<div class="SettingForm">
				<div class="FormHeader">
					<p class="FormTitle">후원 정보</p>
				</div>
				<div class="RoundedWrapper">
					<table>
						<tbody>
							<tr>
								<th>후원 날짜</th>
								<td>${sdto.support_date }</td>
							</tr>
							<tr>
								<th>후원 번호</th>
								<td>${sdto.num }</td>
							</tr>
							<tr>
								<th>펀딩 마감일</th>
								<td>${sdto.end_date }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="CardWrapper">
			<div class="SettingForm">
				<div class="FormHeader">
					<p class="FormTitle">선물 정보</p>
					<!-- <button class="PlainLink" color="sub0180" type="button">변경</button> -->
				</div>
				<div class="RoundedWrapper">
					<table>
						<tbody>
							<tr>
								<th>선물 구성</th>
								<td>${sdto.present_name }</td>
							</tr>
							<tr>
								<th>후원 금액</th>
								<td><fmt:formatNumber value="${sdto.price }"/>원</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="CardWrapper">
			<div class="SettingForm">
				<div class="FormHeader">
					<p class="FormTitle">결제 정보</p>
					<!-- <button class="PlainLink" color="sub0180" type="button">변경</button> -->
				</div>
				<div class="RoundedWrapper">
					<table>
						<tbody>
							<tr>
								<th>결제 수단</th>
								<td>${sdto.payment_method }</td>
							</tr>
							<tr>
								<th>결제 금액</th>
								<td><fmt:formatNumber value="${sdto.price }"/>원</td>
							</tr>
							<tr>
								<th>결제 상태</th>
								<td>${sdto.payment_status }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="CardWrapper">
			<div class="SettingForm">
				<div class="FormHeader">
					<p class="FormTitle">배송 정보</p>
					<!-- <button class="PlainLink" color="sub0180" type="button">변경</button> -->
				</div>
				<div class="RoundedWrapper">
					<table>
						<tbody>
							<tr>
								<th>받는 사람</th>
								<td>${sdto.id }</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>${sdto.hp }</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>${sdto.addr }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="btn-wrap">
			<button type="button" class="WarrantyCancelButton" num="${sdto.num }">
				후원 취소</button>
			<button type="button" class="GoToWarrantyListButton"
				onclick="location.href='/profile/backed'">
				후원목록 보기</button>
		</div>
	</div>
</div>
