<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 받은 메세지 리스트-->

<script type="text/javascript">
// 메세지 보기(다이얼로그)
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
			
			//alert(data.content+","+data.send_name+","+data.send_time+","+data.inquiry_type);
		}
	});
	$("#myModal").modal();
});

// 답장 버튼 클릭시
$(document).on("click","#replybtn",function(){
	var content = $("#reply").val();
	var inquiry_type = $("#inquiry_type").val();
	var recv_name= $("#send_name").val(); // 상대방 name
	var username = $("#name").val(); // 나의 name
	//var id = $("#id").val();
	//alert(content+","+recv_name+","+inquiry_type+","+username);
	
	$.ajax ({
		type: "post",
		dataType: "text",
		url: "messageReply",
		data: {"content":content,"inquiry_type":inquiry_type,"recv_name":recv_name}, // 수정
		success: function (data) {
			alert("답장성공! 보낸메세지로 이동~");
			//location.href="/sentMessage";
		}
	});
});



</script>

<div class="container">
<%@ include file="../mypage/mypageMenu.jsp" %>

	<div class="message-threads">
		<br>
		<div class="">
			<button type="button" onclick="location.href='receivedMessage?my_name=${my_name}'">받은 메시지</button>
			<button type="button" onclick="location.href='sentMessage?my_name=${my_name}'">보낸 메시지</button>
			<!-- <button type="button" onclick="location.href=''">안 읽은 메시지</button> -->
		</div>
		<br>
		
		<table>
			<caption>
				받은 메세지(<span style="font-size: bold;">${count }</span>)
			</caption>
			<tr>
				<th>보낸사람</th>
				<th>내용</th>
				<th>받은 날짜</th>
			</tr>
			<c:if test="${empty recvList}"><!-- totalCount==0 -->
			<tr>
				<td>받은 메세지가 없습니다</td>
			</tr>
			</c:if>
			<c:if test="${count>0}">
			<c:forEach var="a" items="${recvList}">
			<tr id="msg-view" num=${a.num }>
				<td>${a.send_name }</td>
				<td>${a.content }</td>
				<td>${a.send_time }</td>
				<td>${a.read_chk }</td>
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
				<h4 class="modal-title">받은 메세지</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<p><b>보낸 사람</b>&nbsp;&nbsp;<input type="text" id="send_name" readonly="readonly" class="form-control"></p>
				<p><b>받은 시간</b>&nbsp;&nbsp;<input type="text" id="send_time" readonly="readonly" class="form-control"></p>
				<p><b>문의 유형</b>&nbsp;&nbsp;<input type="text" id="inquiry_type" readonly="readonly" class="form-control"></p>
			</div>
			<div class="modal-footer">
				<input type="text" id="content" readonly="readonly" class="form-control">
			</div>
			<div class="modal-footer">
				<textarea class="form-control" rows="5" id="reply"></textarea>
				<button type="button" class="btn btn-default" data-dismiss="modal"
					id="replybtn">보내기</button>
			</div>
		</div>

	</div>
</div>
<!-- /Modal -->


