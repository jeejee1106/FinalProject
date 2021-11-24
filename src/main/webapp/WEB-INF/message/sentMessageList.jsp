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

</style>
<script type="text/javascript">
/* 	$(function () {
		list();
	});
	
	function list() {
		$.ajax ({
			type: "get",
			dataType: "json",
			url: "messages",
			data: {"recv_name":recv_name},
			success: function (data) {
				var s = "";
				$.each(data, function (i, dto) {
					s+="<td>"+dto.send_name+"</td>";
					s+="<td>"+dto.content+"</td>";
					s+="<td>"+dto.send_time+"</td>";
				});
				
				$("div.messagelist").html(s);
			}
			
		});
	} */
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
			<button type="button" onclick="location.href=''">안 읽은 메시지</button>
		</div>
		<br>
		
		<table>
			<caption>
				받은 메세지(<span style="font-size: bold;">${count }</span>)
			</caption>
			<tr>
				<th>받는사람</th>
				<th>내용</th>
				<th>받은 날짜</th>
			</tr>
			<c:forEach var="a" items="${sendList}">
				<tr>
					<td>${a.send_name }</td>
					<td>${a.content }</td>
					<td>${a.send_time }</td>
				</tr>
			</c:forEach>
		
		</table>

	</div>

</div>
