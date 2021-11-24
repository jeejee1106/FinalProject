<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 보낸 메세지 리스트-->
<style type="text/css">

.container {
	font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
}
.container-user {
	padding: 40px 24px 50px 24px;
}
.user-name {
	margin-left: 130px;
	margin-top: -60px;
}
.user-name {
	font-size: 30px;
	color: rgb(61, 61, 61);
	font-weight: bold;
	font-size: 30px;
	line-height: 45px;
	letter-spacing: -0.03em;
	display: flex;
}
.user-info {
	margin-left: 15px;
}

/* .container-tab {
    font-weight: 400;
    color: #3d3d3d;
    line-height: 27px;
    display: inline-flex;
    word-break: keep-all;
    padding: 0px 28px;
    font-size: 18px;
    height: 60px;
} */
.tab-warpper{
	
}
.link-wrapper {
	box-sizing: inherit;
}
.link-wrapper>a {
	color: #9E9E9E;
    font-size: 18px;
}
.link-wrapper>a:hover {
    font-size: 18px;
    color: #3d3d3d;
}
.tab {
    font-size: 18px;
	margin: 0px 24px 0px 0px;
    align-items: center;
    height: 100%;
}
.container-introduction {
	height: 150px;
	padding: 0 24px;
}
.introduction {
	height: 120px;
	width: 700px;
	padding-bottom: 32px;
	font-size: 18px;
	color: #9E9E9E;
}
.user-info>div>img {
	width: 15px;
}
#msg-view:hover {
	cursor: pointer;
}

</style>
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
			
			//alert(data.content+","+data.send_name+","+data.send_time+","+data.inquiry_type);
		}
	});
	$("#myModal").modal();
});

</script>


<div class="container">

	<div class="header-profile">
	
		<div class="container-user">
			<div>
				<div class="user-photo" style="width: 100px; height: 100%;">
					<img src="${root }/img/core-img/user.svg">
				</div>
				<div class="user-name">
					<span>${name }</span>
					<a class="user-info" href="#">
						<div name="setting">
							<img src="${root }/img/core-img/settings.png">
						</div>
					</a>
				</div>
			</div>
		</div>

		<div class="container-tab">
			<div class="tab-warpper">
				<span class="tab">
					<div class="link-wrapper">
						<a href="/mypage">소개</a>
					</div>
				</span> <span class="tab">
					<div class="link-wrapper">
						<a href="/mypage/backed">후원한 프로젝트 </a>
					</div>
				</span>
				<span class="tab">
					<div class="link-wrapper">
						<a href="/mypage/created">올린 프로젝트 </a>
					</div>
				</span>
				<span class="tab">
					<div class="link-wrapper">
						<a href="/mypage/liked">관심프로젝트 </a>
					</div>
				</span> <span class="tab">
					<div class="link-wrapper">
						<a href="/receivedMessage" style="color: #3D3D3D;">메세지 </a>
					</div>
				</span>
				<span class="tab">
					<div class="link-wrapper">
						<a href="#">채팅 </a>
					</div>
				</span>
			</div>
		</div>

	</div>

	<div class="message-threads">
		<br>
		<div class="">
			<button type="button" onclick="location.href='receivedMessage'">받은 메시지</button>
			<button type="button" onclick="location.href='sentMessage'">보낸 메시지</button>
			<!-- <button type="button" onclick="location.href=''">안 읽은 메시지</button> -->
		</div>
		<br>
		
		<table>
			<caption>
				보낸 메세지(<span style="font-size: bold;">${count }</span>)
			</caption>
			<tr>
				<th>받는사람</th>
				<th>내용</th>
				<th>받은 날짜</th>
			</tr>
			<c:if test="${empty sendList}"><!-- totalCount==0 -->
			<tr>
				<td>받은 메세지가 없습니다</td>
			</tr>
			</c:if>
			<c:if test="${count>0}">
			<c:forEach var="a" items="${sendList}">
				<tr id="msg-view" num=${a.num }>
					<td>${a.send_name }</td>
					<td>${a.content }</td>
					<td>${a.send_time }</td>
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