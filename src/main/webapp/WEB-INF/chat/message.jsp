<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet" />


<style>
/* 공통부분 */
body{
	min-width: 330px;
}
.inner{
    margin: auto;
}
li{
    list-style: none;
}    
hr{
    margin: 3px;
}
.cursor{
	cursor: pointer;
}
/* 채팅 리스트 컨테이너 */
/* 나가기 표시 */
.inner .exit-message{
	width:100%;
	text-align: center;
	position: fixed;
	top: 48px;
	opacity: 0.5;
}
/* 타이틀부분(채팅 리스트 컨테이너) */
.inner .list-container .title-container{
    width: 100%;
    height: 48px;
    margin-bottom: auto;
    background-color: #03c75a;
    text-align: center;
}
.inner .list-container .title-container .title, .option{
    font-weight: bold;
    color: white;
    font-size: 18px;
    line-height: 48px;
}

/* 리스트부분(채팅 리스트 컨테이너) */
.inner .list-container{
    width: 100%;
}
.inner .list-container .empty-message{
	position:fixed;
	top: 48%;
	font-weight: 400;
    font-size: 14px;
	width: 100%;
	text-align: center;
}
.inner .list-container .empty-message .empty-message2{
	padding-top: 7px;
    font-size: 12px;
    line-height: 16px;
    color: #959595;
}

.inner .list-container ul{
    width: 100%;
    overflow-y: auto;
    color: black;
    position: relative;
    padding: 0;
}
.inner .list-container ul li.info-container{
    width: 100%;
    height: 67px;
    list-style: none;
    overflow-x: hidden;
    overflow-y: hidden;
    position: relative;
    padding: 11px;
    border-bottom: 1px solid rgba(0,0,0,.04);
    cursor: pointer;
}
.inner .list-container .print ul li.info-container .open-chat {
    cursor: pointer;
    width: 98%;
}
.inner .list-container ul li.info-container .open-chat .profile-img{
    width: 45px;
    height: 45px;
    border: 1px solid rgba(0,0,0,.04);
    border-radius: 50%;
    left: 5px;
}
.inner .list-container ul li.info-container .open-chat .chat-id{
    top: 15px;
    left: 70px;
    font-weight: 600;
    font-size: 14px;
    position: absolute;
}
.inner .list-container ul li.info-container .open-chat .chat-time{
    top: 15px;
    right: 30px;
    font-size: 8px;
    color: #959595;
    position: absolute;
}
.inner .list-container ul li.info-container .open-chat .unread-count{
    top: 45px;
    right: 30px;
    position: absolute;
    color: #959595;
    font-size: 8px;
}
.inner .list-container ul li.info-container .open-chat .chat-content{
    position: absolute;
    top: 35px;
    left: 70px;
    max-width: 73%;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    word-break: break-all;
    color: #959595;
}
.inner .list-container ul li.info-container .option-cotainer{
    position: absolute;
    width: 32px;
    height: 67px;
    right: 0px;
    top: 0px;
    padding: 13px 0 15px;
    box-sizing: border-box;
    text-align: center;
    
}
.inner .list-container ul li.info-container .option-cotainer .list-btn{
    cursor: pointer;
    font-size: 18px;
    color: rgba(0,0,0,.08);
    
}
.inner .list-container ul li.info-container .option-cotainer .option-list{
    width: 65px;
    height: 48px;
    position: absolute;
    top: 15px;
    right: 25px;
    z-index: 5;
    background-color: rgb(255, 255, 255);
    box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px 0px;
    background-color:white; 
    border-radius: 5px;
    font-size: 8px;
    font-weight: bold;
    color: #959595;
    padding-top: 10px;
}
.inner .list-container ul li.info-container .option-cotainer .option-list
 .read-btn, .exit-btn{
    cursor: pointer;
}

/* 채팅 컨테이너 */
.inner .chat-container{
    width: 100%;
}
/* 채팅컨테이너 타이틀 */
.inner .chat-container .title-container{
    width: 100%;
    height: 48px;
    margin-bottom: auto;
    background-color: #03c75a;
    text-align: center;
    
}
.inner .chat-container .title-container .title, .option, .list{
    color: white;
    font-size: 18px;
    line-height: 48px;
}
.inner .chat-container .title-container .option{
    position: absolute;
    right: 10px;;
    cursor: pointer;
}
.inner .chat-container .title-container .list{
    position: absolute;
    left: 10px;;
    cursor: pointer;
}
.inner .chat-container .title-container .function-conatiner{
    position: absolute;
    width: 130px;
    height: 207px;
    top: 10px;
    right: 30px;
    z-index: 10;
    background-color: rgb(255, 255, 255);
    box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px 0px;
    background-color:white; 
    text-align: left;
    border-radius: 10px;
    overflow: hidden;

}
.inner .chat-container .title-container .function-conatiner ul{
	padding-left: 0;
}
.inner .chat-container .title-container .function-conatiner ul li{
    padding: 10px;
    width: 100%;
    border-bottom: 1px solid #959595;
    color: #959595;
}

/* 채팅컨테이너 내용부분 */
.inner .chat-container .show-message{
	width: 100%;
    margin-bottom: 51px;
    height: 658px;
    overflow-y: scroll; 
    padding-left: 0;
}
.inner .chat-container ul li.chat-info{
    position: relative;
    width: 100%;
    padding-bottom: 10px;
}
.inner .chat-container ul li.chat-info .profile-img{
    width: 45px;
    height: 45px;
    border: 1px solid rgba(0,0,0,.04);
    border-radius: 50%;
    margin-left: 11px;
}
/* 채팅창 공용 */

.inner .chat-container ul li.chat-info{
    position: relative;
}
.inner .chat-container ul li.chat-info .send-time {
    font-size: 5px;
    color: #959595;
}
/* 채팅창 왼쪽 메세지 */
.inner .chat-container ul li.chat-info .left-container {
    padding-top: 5px;
    width: 70%;
    position: relative;
    margin-right: auto;
}
.inner .chat-container ul li.chat-info .left-container .reciver-id {
    font-size: 18px;
}
.inner .chat-container ul li.chat-info .left-container .reciver-content {
    font-size: 13px;
	border: none;
	white-space: pre-line;
    width:max-content;
    max-width: 90%;
    margin-top: 5px;
    margin-left: 60px;
    border-radius: 10px;
}
.inner .chat-container ul li.chat-info .left-container .left-time {
   margin-left: 60px;
}
/* 채팅창 오른쪽 메세지*/
.inner .chat-container ul li.chat-info .right-container{
    width: 70%;
    height: max-content;
    position: relative;
    margin-left: auto;
    padding-top: 5px;
    
}
.inner .chat-container ul li.chat-info .right-container .sender-content {
    font-size: 13px;
    border: none;
	white-space: pre-line;
    width:max-content;
    background-color: #d9f7e7;
    margin-left: auto;
    margin-right: 20px;
    max-width: 90%;
    border-radius: 10px;
}
.inner .chat-container ul li.chat-info .right-container .right-time {
    display: block;
    width: max-content;
    margin-right: 20px;
    margin-left: auto;
}

.inner .chat-container ul li.chat-info .right-container .unread-message {
    font-size: 5px;
    color: #959595;
}
/* 채탱입력 컨터이너 */
.inner .chat-container .text-container{
    width: 100%;
    padding: 8px;
    padding-right: 35px;
    height: 51px;
    border: 1px solid rgba(0,0,0,.1);
    box-sizing: border-box;
    position: fixed;
    bottom: 0;
    left: 0;
    background-color: white;
}
.inner .chat-container .text-container .text:focus{
    outline: none;
}
.inner .chat-container .text-container .text{
    box-sizing: border-box;
    height: 33px;
    width: 100%;
    border: none;
    background-color: #f5f6f8;
    padding-left: 10px;
    padding-top: 8px;
    border-radius: 10px;
    resize: none;
    
}
.inner .chat-container .text-container .send-btn{
    position: absolute;
    font-size: 22px;
    right: 10px;
    top: 13px;
    cursor: pointer;
    color: #03c75a;
}


</style>
    <div class="inner">
        <div class="list-container">
            <div class="title-container">
                <span class="title">내 채팅</span>
            </div>
           	<c:choose>
           		<c:when test="${list.size() == 0}">
           				<p class="empty-message">참여중인 채팅이 없습니다. <br>
           				<span class="empty-message2">맴버와 채팅을 시작해보세요</span>
           				</p>
           		</c:when>
           		<c:otherwise>
		            <ul>
		            	<c:forEach var="messageInfo" items="${list}">
		            	<%-- <c:if test="${messageInfo.exit_id != sessionScope.id}"> --%>
			                <li class="info-container">
			                    <div class="open-chat">
			                    	<input type="hidden" id="loginUser" value="${sessionScope.id}">
									<input type="hidden" id="exitCount" value="${messageInfo.exit_count}">
									<input type="hidden" id="room" value="${messageInfo.room}">
			                        <img class="profile-img" src="../photo/${messageInfo.photo}" alt="프로필이미지">
			                        <c:choose>
										<c:when test="${messageInfo.recv_id == sessionScope.id}">
											<input type="hidden" id="reciver" value="${messageInfo.send_id  }">
										</c:when>
										<c:otherwise>
											<input type="hidden" id="reciver" value="${messageInfo.recv_id  }">
										</c:otherwise>
									</c:choose>
			                        <c:choose>
										<c:when test="${messageInfo.send_id == sessionScope.id}">
											<span class="chat-id">${messageInfo.recv_id}</span>
										</c:when>
										<c:otherwise>
											<span class="chat-id">${messageInfo.send_id }</span>
										</c:otherwise>
									</c:choose>
			                        <span class="chat-time">${messageInfo.send_time}</span>
			                      	<c:choose>
			                      		<c:when test="${messageInfo.exit_count >0}">
			                      			<span class="chat-content"><span class='glyphicon glyphicon-log-out'></span> 상대방이 채팅방을 나가셨습니다.</span>
			                      		</c:when>
			                      		<c:otherwise>
					                        <span class="chat-content">${messageInfo.content}</span>
			                      		</c:otherwise>
			                      	</c:choose>
			                        <c:if test="${messageInfo.unread != 0}">
				                        <span class="unread-count">안읽은메세지 ${messageInfo.unread} </span>
									</c:if>
			                    </div>
		                        <div class="option-cotainer">
		                            <span class="glyphicon glyphicon-option-vertical list-btn"></span>
		                            <div class="option-list">
		                                <span class="read-btn cursor">읽음</span>
		                                <input type = "hidden" id="unreadCheck" value = "${messageInfo.unread}">
		                                <hr>
		                                <span class="exit-list cursor">나가기</span>
		                            </div>
		                    	</div>
			                </li>
			                <%-- </c:if> --%>
		                </c:forEach>
		            </ul>
	            </c:otherwise>
           	</c:choose>
        </div>
       <div class="chat-container">
            <div class="title-container">
                <span class="glyphicon glyphicon-list list" onclick="location.href='list'"></span>
                <span class="title">내 채팅</span>
                <span class="glyphicon glyphicon-cog option"></span>
                <div class="function-conatiner">
                    <ul>
                        <li class = " cursor autoReload"><span class = "glyphicon glyphicon-play"></span> RELOAD자동</li>
                        <li class = " cursor manualReload"><span class = "glyphicon glyphicon-wrench"></span> RELOAD수동</li>
                        <li class = " cursor stopReload"><span class = "glyphicon glyphicon-stop"></span> RELOAD중지</li>
                        <li class = " cursor exit-btn"><span class="glyphicon glyphicon-log-out"></span> 채팅방나가기</li>
                        <li class = " cursor report-btn"><span class="glyphicon glyphicon-bullhorn"></span> 신고하기</li>
                    </ul>
                </div>
            </div>
            <div class="print"></div>
           
            <div class="text-container">
           	    <input type="hidden" id="reciverInfo"> 
				<input type="hidden" id="senderInfo"> 
				<input type="hidden" id="roomInfo">
				<input type="hidden" id="exitCountInfo">
                <textarea placeholder="메세지를 입력하세요." class="text"></textarea>
                <span class="send-btn glyphicon glyphicon-send"></span>
            </div>
        </div>
        <!-- 삭제 Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-sm">

				<!-- Modal content-->
				<div class="modal-content" style="max-width: 90%; width: auto;">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">신고하기</h4>
					</div>
					<div class="modal-body form-inline">
						<form action="/report/send" method="post">
							<input type="hidden" name="address" value="wonseob7942@naver.com">
							<input type="hidden" id="reportRoom" name="room"> 
							<input type="hidden" id="reportId" name="id" value="${sessionScope.id}">
							<input name="title" placeholder="제목" required="required">
							<br>
							<textarea name="message" placeholder="신고 내용을 입력해주세요." cols="33"
								rows="10" required="required"></textarea>
							<button class="btn btn-default" type="submit">제출</button>
						</form>
					</div>
				</div>

			</div>
		</div>
        
    </div>



<script>

	//숨기기
    $(".option-list").hide()
    $(".chat-container").hide()
    $(".function-conatiner").hide()
   
    $(".list-btn").click(function () { 
    	$(this).next(".option-list").toggle();
    })
    $(".option").click(function () { 
   	    $(".function-conatiner").toggle()
    })
    
    //채팅목록중에서 하나 선택시
  	$(".open-chat").click(function() {
  		$(".chat-container").show();
  		$(".list-container").hide();
  		$(".text").focus();
  		let sender = $(this).find("#loginUser").val();
  		let reciver = $(this).find("#reciver").val();
  		let room = $(this).find("#room").val();
  		let exitCount = $(this).find("#exitCount").val();
  		
  		$("#reportRoom").val(room)
  		$("#senderInfo").val(sender);
  		$("#reciverInfo").val(reciver);
  		$("#roomInfo").val(room);
  		$("#exitCountInfo").val(exitCount);
  		
  		senderInfo = $("#senderInfo").val();
  		roomInfo = $("#roomInfo").val();
  		
  		$.ajax({
  			url: "../chat/chatList",
		method: "post",
		dataType: "json",
  			data: {"send_id":sender, "room":room},
		success: function(data){	
			
			let s = "<ul class='show-message'>";
			for(i=0; i<data.length; i++){
				if(sender == data[i].send_id){
					s += "<li class='chat-info'>";
					s += "<div class='right-container'>";
					s += "<pre class='sender-content'>"+data[i].content+"</pre>";
					s += "<span class='send-time right-time'>"+data[i].send_time
					if(data[i].read_check == 0){
					s += "<span class ='unread-message'>  미확인</span>"
					}
					s += "</span>";
					s += "</div>";
					s += "</li>";
				}else{
	                s += "<li class='chat-info'>";
	                s += "<div class='left-container'>";
	                s += "<img class='profile-img' src='../photo/"+data[i].photo+"' alt='프로필이미지'>";
	                s += "<span class='reciver-id'>"+data[i].send_id+"</span>";
	                s += "<pre class='reciver-content'>"+data[i].content+"</pre>";
	                s += "<span class='send-time left-time'>"+data[i].send_time+"</span>";
	                s += "</div>";
	                s += "</li>";
				}
				
			}
			//나간 회원이 있을경우 알림 메세지 
			if($("#exitCountInfo").val() > 0){
				s += "<pre class='exit-message '><span class='glyphicon glyphicon-log-out'></span> 상대방이 채팅방을 나가셨습니다.</pre>"
				$(".text").attr({
					readonly:'readonly',
					placeholder:'메세지 전송이 불가능합니다.'
				})
				$(".send-btn").hide();
		 	}
			s +="</ul>";
			$(".print").html(s);
			
			//스크롤을 제일 아래로 내려준다. 
			$(".show-message").scrollTop($(".show-message")[0].scrollHeight);
			
		}
  		});
  	});
	
  //메세지 전송
  	$(".send-btn").click(function() {
  		reciverInfo = $("#reciverInfo").val();
  		contentInfo = $(".text").val();
  		if(contentInfo.trim() == ""){
  			alert("메세지를 입력해주세요")
  			$(".text").val("");
  			$(".text").focus();
  			return;
  		}
  		 $.ajax({
  			url: "../chat/send",
		method: "post",
  			data: {"send_id":senderInfo, "recv_id":reciverInfo, "content":contentInfo, "room":roomInfo},
		success: function(){
			$(".text").val("");
			$(".text").focus();
			getMessageList();
		}
  		}); 
	});
	//엔터로 메세지 전송
  	$(".text").keydown(function(key) {
        //(13번은 엔터키)
        if (key.keyCode == 13) {
        		
        	  if (!key.shiftKey){
        		  //shitf키를 누르지 않았을 경우에만 전송
        		  $('.send-btn').trigger('click');
              }
        }
    });
	
	
  //리스트 메세지 불러오기
	function getMessageList() {
		$.ajax({
	  		url: "../chat/chatList",
			method: "post",
			dataType: "json",
	  		data: {"send_id":senderInfo, "room":roomInfo},
			success: function(data){	
				let s = "<ul class='show-message'>";
				for(i=0; i<data.length; i++){
					if(senderInfo == data[i].send_id){
						s += "<li class='chat-info'>";
						s += "<div class='right-container'>";
						s += "<pre class='sender-content'>"+data[i].content+"</pre>";
						s += "<span class='send-time right-time'>"+data[i].send_time
						if(data[i].read_check == 0){
						s += "<span class ='unread-message'>  미확인</span>"
						}
						s += "</span>";
						s += "</div>";
						s += "</li>";
					}else{
		                s += "<li class='chat-info'>";
		                s += "<div class='left-container'>";
		                s += "<img class='profile-img' src='../photo/"+data[i].photo+"' alt='프로필이미지'>";
		                s += "<span class='reciver-id'>"+data[i].send_id+"</span>";
		                s += "<pre class='reciver-content'>"+data[i].content+"</pre>";
		                s += "<span class='send-time left-time'>"+data[i].send_time+"</span>";
		                s += "</div>";
		                s += "</li>";
					}
	
				}
				s +="</ul>";
				$(".print").html(s);
				
				//스크롤을 제일 아래로 내려준다. 
				$(".show-message").scrollTop($(".show-message")[0].scrollHeight);
			}
	  	});
	}
  
	//옵션기능(방나가기, 신고하기)
	//메세지 읽음처리하기
	  $(".read-btn").click(function () { 
	    	if($(this).next("#unreadCheck").val() == 0){
	        	alert("미확인 메세지가 없습니다.")
	        	return;
	    	} 
	        let selectedRoom = $(this).parent().parent().siblings().find("#room").val()
	       	let loginUserInfo = $("#loginUser").val()
	       	$.ajax({
		  		url: "../chat/read",
				method: "post",
		  		data: {"send_id":loginUserInfo, "room":selectedRoom},
				success: function(data){
					location.href = "list";
				}
		  	});
	    });
	
	//신고하기
	$(".report-btn").click(function() {
		$("#myModal").modal();
  	});
	//채팅방 나가기(채팅리스트목록에서)
	$(".exit-list").click(function() {
		let check = confirm("채팅방을 나가시 겠습니까?");
		if(check == true){
			let exitRoom = $(this).parent().parent().siblings().find("#room").val()
			let exitId = $(this).parent().parent().siblings().find("#loginUser").val()
			$.ajax({
		  		url: "../chat/exit",
				method: "post",
		  		data: {"exit_id":exitId, "room":exitRoom},
				success: function(){
					location.href = "list";
				}	
			});
		}
  	});
	
	//채팅방 나가기(채팅방에서)
	$(".exit-btn").click(function() {
		let check = confirm("채팅방을 나가시 겠습니까?");
		if(check == true){
			$.ajax({
		  		url: "../chat/exit",
				method: "post",
		  		data: {"exit_id":senderInfo, "room":roomInfo},
				success: function(){
					location.href = "list";
				}	
			});
		}
  	});
  
	//단축키로 reload기능 실행
  	$(window).keydown(function(key) {
        //(13번은 엔터키)
        if (key.keyCode == 65 && key.shiftKey) {
        	$(".autoReload").trigger('click');
        }else if (key.keyCode == 83 && key.shiftKey) {
        	$(".stopReload").trigger('click');
		}else if (key.keyCode == 90 && key.shiftKey){
        	$(".manualReload").trigger('click');
		} 
    });
	
	//reload관련 버튼 이벤트
	$(".manualReload").click(function() {
		getMessageList()
	})
	$(".autoReload").click(function() {
		StartReload()
	})
	$(".stopReload").click(function() {
		StopReload()
	})

	//실시간 채팅 실행
   	function StartReload() {
   		getMessageList();
   		alert("auto reload start")
   	   	reload = setInterval(getMessageList, 1000);
   	}
	//실시간 채팅 중지
   	function StopReload() {
   		clearInterval(reload);
   		alert("auto reload stop")
   	}
</script>