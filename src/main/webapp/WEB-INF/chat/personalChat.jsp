<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link
	href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
.exit-message{
	position: fixed;
	bottom: 45px;
}


</style>
	<div class="inner">
       <div class="chat-container">
            <div class="title-container">
                <span class="glyphicon glyphicon-list list"></span>
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
           	    <input type="hidden" id="reciver" value="${dto.id}"> 
				<input type="hidden" id="sender" value="${sessionScope.id}"> 
				<input type="hidden" id="room"> 
				<input type="hidden" id="listSize">
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
<script type="text/javascript">
	$(".function-conatiner").hide()
	$(".option").click(function () { 
		    $(".function-conatiner").toggle()
	})

	checkRoomInfo();
	//생성된 룸정보 확인
	function checkRoomInfo(){
		let sender = $("#sender").val();
		let reciver = $("#reciver").val();
		$.ajax({
			url: "../chat/getRoomNumber",
			method: "post",
			dataType: "json",
			data: {"send_id":sender, "recv_id":reciver},
			success: function(data){
				$("#room").val(data);
				getMessageList();
				return;
			}
		})
	}	
	
	//메세지 출력리스트
	function getMessageList() {
		let sender = $("#sender").val();
		let room = $("#room").val();
		$("#reportRoom").val(room)
		$.ajax({
			url: "../chat/chatList",
			method: "post",
			dataType: "json",
			data: {"send_id":sender, "room":room},
			success: function(data){
				$("#listSize").val(data.length)
				let count = 0;
				if(data.length != 0){
					count = data[0].exit_count;
				}
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
		                if(data[i].photo != null){
			                s += "<img class='profile-img' src='../photo/"+data[i].photo+"' alt='프로필이미지'>";
		                }else{
			                s += "<img class='profile-img' src='../photo/basic.jpg' alt='프로필이미지'>";
		                }
		                s += "<span class='reciver-id'>"+data[i].send_id+"</span>";
		                s += "<pre class='reciver-content'>"+data[i].content+"</pre>";
		                s += "<span class='send-time left-time'>"+data[i].send_time+"</span>";
		                s += "</div>";
		                s += "</li>";
					}
					//나간 회원이 있을경우 알림 메세지 
					if(data[i].exit_count > 0){
						s += "<pre class='exit-message '><span class='glyphicon glyphicon-log-out'></span> 상대방이 채팅방을 나가셨습니다.</pre>"
						$(".text").attr({
							readonly:'readonly',
							placeholder:'메세지 전송이 불가능합니다.'
						})
						$(".send-btn").hide();
				 	}
				}
				
					
				s +="</ul>";
				$(".print").html(s);
				//스크롤을 제일 아래로 내려준다. 
				$(".show-message").scrollTop($(".show-message")[0].scrollHeight);
				
			}
		})
	}
	
	//메세지 전송
	$(".send-btn").click(function() {
		let sender = $("#sender").val();
		let reciver = $("#reciver").val();
		let content = $(".text").val();
		let room = $("#room").val();
		if(content.trim() == ""){
			alert("메세지를 입력해주세요")
			 $(".text").val("");
			 $(".text").focus("");
			return
		}
		$.ajax({
			url: "../chat/send",
			method: "post",
			data: {"send_id":sender, "recv_id":reciver, "content":content, "room":room},
			success: function(){
				$(".text").val("");
				$(".text").focus();
				getMessageList();
			}
		})
		
	});
	
	//엔터키로 메세지 전송
	$(".text").keydown(function(key) {
    //13번은 엔터키
    if (key.keyCode == 13) {
    	  if (!key.shiftKey){
    		  $('.send-btn').trigger('click');
          }
    	}
	});
	//옵션기능(채팅방나가기,채팅목록이동,신고하기)
	//채팅방 나가기
	$(".exit-btn").click(function() {
		if($("#listSize").val() == 0){
			alert("채팅 내역이 없습니다.")
			return;
		}
		let exitId = $("#sender").val();
		let roomInfo = $("#room").val();
		let check = confirm("채팅방을 나가시 겠습니까?");
		if(check == true){
			$.ajax({
		  		url: "../chat/exit",
				method: "post",
		  		data: {"exit_id":exitId, "room":roomInfo},
				success: function(){
					location.href = "list";
					window.close();
				}	
			});
	  		
		}
  	});
	//채팅목록으로 이동하기
	$(".list").click(function() {
		if($("#listSize").val()>0){
			location.href='../chat/list';
		}else{
			alert("채팅 내역이 없습니다.");
			return;
		}
	});
	//신고하기
	$(".report-btn").click(function() {
		if($("#listSize").val() == 0){
			alert("채팅 내역이 없습니다.")
			return;
		}
		$("#myModal").modal();
		return
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
