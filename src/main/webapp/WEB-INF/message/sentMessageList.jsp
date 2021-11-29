<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 보낸 메세지 리스트-->

<script type="text/javascript">
//메세지 보기(다이얼로그)
$(document).on("click","#msg-view",function(){
	
	num = $(this).attr("num");
	$.ajax({
		type: "get",
		dataType: "json",
		url: "messagedata",
		data: {"num":num},
		success: function(data){
			$("#content").val(data.content);
			$("#send_name").val(data.send_name);
			$("#send_time").val(data.send_time);
			$("#inquiry_type").val(data.inquiry_type);
		}
	});
	$("#myModal").modal();
});

</script>

<div class="container">
<%@ include file="../profile/profileMenu.jsp" %>

	<div class="title">
		<h1>보낸 메세지</h1>
	</div>
	<div class="message-threads">
		<br>
		<div class="">
			<button type="button" onclick="location.href='receivedMessage?name=${name}'">받은 메시지</button>
			<button type="button" onclick="location.href='sentMessage?name=${name}'">보낸 메시지</button>
			<!-- <button type="button" onclick="location.href=''">안 읽은 메시지</button> -->
		</div>
		<br><br>
		
		<caption>
			보낸 메세지(<b>${count }</b>)
		</caption>
		<br><br>
		<table class="table table-striped table-hover">
			<tr>
				<th>받는사람</th>
				<th>내용</th>
				<th>보낸 날짜</th>
				<th>수신여부</th>
			</tr>
			<c:if test="${empty sendList}"><!-- totalCount==0 -->
			<tr>
				<td>보낸 메세지가 없습니다</td>
			</tr>
			</c:if>
			<c:if test="${count>0}">
			<c:forEach var="a" items="${sendList}">
				<tr id="msg-view" num=${a.num }>
					<td>${a.send_name }</td>
					<td>${a.content }</td>
					<td>${a.send_time }</td>
					<c:if test="${a.read_chk > 0 }">
						<td>읽음</td>
					</c:if>
					<c:if test="${a.read_chk == 0 }">
						<td>읽지않음</td>
					</c:if>
				</tr>
			</c:forEach>
			</c:if>
		
		</table>

	</div>

</div>

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">보낸 메세지</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<p><b>받는 사람</b>&nbsp;&nbsp;<input type="text" id="send_name" readonly="readonly" class="form-control"></p>
				<p><b>보낸 시간</b>&nbsp;&nbsp;<input type="text" id="send_time" readonly="readonly" class="form-control"></p>
				<p><b>문의 유형</b>&nbsp;&nbsp;<input type="text" id="inquiry_type" readonly="readonly" class="form-control"></p>
			</div>
			<div class="modal-footer">
				<input type="text" id="content" readonly="readonly" class="form-control">
			</div>
		</div>

	</div>
</div>
<!-- /Modal -->