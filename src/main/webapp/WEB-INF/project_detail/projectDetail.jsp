<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	.project-intro{
		width: 1200px;
		height: 230px;
		text-align: center;
		line-height: 60px;
		margin-top: 80px;
	}
	.project-intro-title{
		font-weight: bold;
	}
	.profile-img img{
		border: 1px solid;
		width:30px;
		height: 30px;
		border-radius: 100px;
	}
	.project-main{
		display:inline-block;
	}
	.project-sub-aside{
		display:inline-block;
		margin:10px 0px 0px 30px;

	}
	.project-main-img img{
		margin-top:-390px;
	}
	
	.project-sub{
		margin-bottom: 20px;
	}
	.project-sub-value{
		font-size: 30pt;
	}
	.project-sub-per{
		margin-left: 10px;
		font-size: 13pt;
		font-weight: bold;
	}
	.project-sub-heart{
		cursor: pointer;
	}
	.funding-info{
		border: 1px solid #dcdcdc;
		width: 400px;
		padding: 15px 20px 15px 20px;
		margin: 20px 0px 20px 0px;
		font-size: 12pt;
	}
	button{
		border: none;
		cursor: pointer;
	}
	.project-sub-heart{
		margin: 0 40px;
	}
	.btn-support{
		width: 200px;
		height: 50px;
		font-size: 12pt;
		font-weight: bold;
		border-radius: 5px;
		color: white;
		background-color: #dda0dd;
		
	}
	.content-navigation a{
		font-size: 11pt;
		font-weight: bold;
		margin-right: 12px;
	}
	.btn-creator-message{
		width: 200px;
		height: 50px;
		
	}
	.project-content{
		display: flex;
		word-break: break-all;
	}
	.project-plan, .project-community{
		max-width:650px;
	}
	.content-sub{
		max-width:500px;
		margin:0px 0px 0px 40px;
	}
	.sub-title, .creator-name{
		font-size: 11pt;
		font-weight: bold;
	}
	.sub-creator{
		border: 1px solid gray;
		width: 390px;
		padding: 15px 15px 0px 15px;
		margin-bottom: 20px;
	}
	
	.creator-message{
		text-align:center;
	}
	
	.sub-creator div{
		margin: 0px 0px 15px 0px;
	}
	.creator-intro{
		font-size: 10pt;
		color: gray;
	}
	.present-title{
		padding-top: 20px;
	}
	.present-option{
		border: 1px solid gray;
		margin-top: 10px;
		padding: 15px 15px 15px 15px;
	}
	.present-price{
		font-size: 16pt;
		font-weight: bold;
	}
	.community_all_text{
		padding: 10px;
	}
	.btn-present-support{
		width: 355px;
		margin-top: 15px;
		height: 50px;
		border-radius: 5px;
		color: white;
		background-color: #dda0dd;
		font-size: 12pt;
		font-weight: bold;
	}
	.message-modal{ 
		display:none;
		position:fixed;
		width:100%;
		height:100%;
		background: rgba(0,0,0,0.8);
		top:0;
		left:0;
		z-index: 1000;
	
	}

	.modal_content{
		width:600px;
		height:500px;
		background:#fff;
		border-radius:10px;
		position:absolute;
		box-sizing:border-box;
		padding:30px 30px 30px 30px;
		top: calc(50% - 250px);
		left: calc(50% - 300px);
	}
	
	.message-title{
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 20px;
	}
	.message-title2{
		float: right;
		cursor: pointer;
	}
	.word-count{
		float: right;
	}
	#btn-send{
		width: 540px;
		height: 50px;
		margin-top: 10px;
		font-size: 12pt;
		font-weight: bold;
		border-radius: 5px;
		color: white;
		background-color: #dda0dd;
	}
</style>
<script type="text/javascript">
	$(function(){
		loginok="${sessionScope.loginok}";
		
		$(".project-community").hide();
		
		$(".btn-project-plan").click(function(){
			$(".project-community").hide();
			$(".project-plan").show();
		});

		$(".btn-project-community").click(function(){
			$(".project-plan").hide();
			$(".project-community").show();
		});
		
		$(".scroll_move").click(function(event){         
            event.preventDefault();
            $('html,body').animate({scrollTop:$(".btn-support").offset().top}, 500);
    	});

		$(".btn-support").click(function(event){         
            event.preventDefault();
            $('html,body').animate({scrollTop:$(".btn-creator-message").offset().top}, 500);
    	});
		$(".btn-creator-message").click(function(){
			if(loginok==''){
				alert("로그인이 필요한 페이지 입니다.")
				location.href = "/login/main";
			}else{
				$(".message-modal").fadeIn();
			}
		});
		
		$(".btn-present-support").click(function(){
			if(loginok==''){
				alert("로그인이 필요한 페이지 입니다.")
				location.href = "/login/main";
			}else{
				location.href = "/project/payment?idx=${dto.idx}";
			}
		});
		
		$(".message-title2").click(function(){
			$(".message-modal").fadeOut();
		});
		
		$("#message-content").keyup(function(){
			var content = $(this).val();
			$('.word-count').html(content.length+" / 1000");
			if (content.length > 1000){
		        alert("최대 1000자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 1000));
		        $('.word-count').html("1000 / 1000");
		    }
		});
	});
	
	$(document).on("click","#btn-send",function(){
		var content = $("#message-content").val();
		var inquiry_type = $("#inquiry_type").val();
		var recv_name= $("#recv_name").val(); // 상대방 name
		var send_name = $("#send_name").val(); // 나의 name
		
		$.ajax ({
			type: "post",
			dataType: "text",
			url: "/message/messageReply",
			data: {"content":content,"inquiry_type":inquiry_type,"recv_name":recv_name},
			success: function (data) {
				alert("메세지가 전송되었습니다.");
				$(".message-modal").fadeOut();
			},error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		});
	});
</script>
<!-- start project main -->
<div class="container">
	<div class="project-intro">
		<span class="project-intro-category">${dto.category }</span>
		<h1 class="project-intro-title">${dto.title } </h1>
		<span class="profile-img">
			<img alt="프로필" src="/image/creator_profile30.png">
		</span>
		<span class="project-intro-creator-name">${dto.name}</span>
	</div>
	<div class="project-main">
		<div class="project-main-img">
			<img alt="프로젝트 커버 이미지" src="/thumbnail_image/${dto.thumbnail}" style="width: 650px; height: 500px">
		</div>
	</div>
	<div class="project-sub-aside">
		<div class="project-sub">
			<div class="project-sub-title">모인금액</div>
			<div>
				<span class="project-sub-value">
					<fmt:formatNumber value="${dto.total_amount }"/>
				</span>
				<span>원</span>
				<span class="project-sub-per">${percentageAchieved }%</span>
			</div>
		</div>
		<div class="project-sub">
			<div class="project-sub-title">남은시간</div>
			<div>
				<span class="project-sub-value">
					<fmt:parseDate value="${today }" var="strPlanDate" pattern="yyyy-MM-dd"/>
					<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate" />
					<fmt:parseDate value="${dto.end_date }" var="endPlanDate" pattern="yyyy-MM-dd"/>
					<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate" />
					${endDate - strDate }
				</span>
				<span>일</span>
			</div>
		</div>

		<div class="project-sub">
			<div class="project-sub-title">후원자</div>
			<div>
				<span class="project-sub-value">${dto.number_support }</span>
				<span>명</span>
			</div>
		</div>
		<div class="funding-info" style="background-color: #faebd7">
			<div class="funding-info-title" style="font-weight: bold;">펀딩 진행중</div>
			<span class="funding-info-content">
				목표금액인 <fmt:formatNumber value="${dto.target_amount}"/> 원이 모여야만 결제됩니다.
				<br>
				결제는 ${pymDate}에 다함께 진행됩니다.
				
			</span>
		</div>
		<div class="project-sub">
			<span class="project-sub-heart" style="font-size: 15pt;"><i class="fa fa-heart-o"></i></span>
			<button class="btn-support">프로젝트 후원하기</button>
		</div>
	</div>
</div>
<!-- end project main -->

<hr class="content-hr">

<!-- start project navigation -->
<div class="container">
	<div class="content-navigation">
		<a class="scroll_move btn-project-plan">프로젝트 계획</a>
		<a class="scroll_move btn-project-community">커뮤니티</a>
	</div>
</div>
<!-- end project navigation -->

<hr>

<!-- start project content -->
<div class="container project-content">
	<div class="content-main">
		<div class="project-plan">
			<jsp:include page="projectPlan.jsp" flush="false" />
		</div>
		<div class="project-community">
			<jsp:include page="projectCommunity.jsp" flush="false" />
		</div>
	</div>
	<div class="content-sub">
		<div class="sub-creator">
			<div class="sub-title creator-title">
				창작자 소개
			</div>
			<div class="creator-profile">
				<span class="profile-img">
					<img alt="프로필" src="/image/creator_profile30.png">
				</span>
				<span class="creator-name">
					${dto.name }
				</span>
			</div>
			<div class="creator-intro">
				겨울의 끝을 마무리하는 차분함과, 봄을 준비하는 설레임을 함께 담은 작업을 하는 스튜디오입니다. 다양한 출판, 사진 관련 작업을 하고 있습니다. 잘 부탁드립니다.
			</div>
			<div class="creator-message">
				<button type="button" class="btn-creator-message">
					<i class="fa fa-envelope-o"></i>창작자에게 문의
				</button>
			</div>
		</div>
		<div class="sub-present">
			<div class="sub-title present-title">
				선물 선택
			</div>
			<div class="present-option">
				<div class="present-price">
					1,000원+
				</div>
				<div class="present-description">
					선물 없이 후원하기
				</div>
				<button type="button" class="btn-present-support">
					1,000원 후원하기
				</button>
			</div>
			<div class="present-option">
				<div class="present-price">
					19,200원+
				</div>
				<div class="present-description">
					도서 1권 + 키링 1개(배송비 포함)
				</div>
				<button type="button" class="btn-present-support">
					19,200원 후원하기
				</button>
			</div>
			<div class="present-option">
				<div class="present-price">
					26,200원+
				</div>
				<div class="present-description">
					도서 1권 + 키링 1개(배송비 포함)
				</div>
				<button type="button" class="btn-present-support">
					26,200원 후원하기
				</button>
			</div>
			<div class="present-option">
				<div class="present-price">
					36,000원+
				</div>
				<div class="present-description">
					도서 2권 (배송비 포함)
				</div>
				<button type="button" class="btn-present-support">
					36,000원 후원하기
				</button>
			</div>
			<div class="present-option">
				<div class="present-price">
					40,000원+
				</div>
				<div class="present-description">
					도서 2권 + 키링 1개(배송비 포함)
				</div>
				<button type="button" class="btn-present-support">
					40,000원 후원하기
				</button>
			</div>
		</div>
	</div>
</div>
<!-- end project content -->

<!-- start message modal -->
<div class="container">
<div class="message-modal">
	<div class="modal_content">
		<div class="message-title">
			<span class="message-title1">
				창작자에게 문의
			</span>
			<span class="message-title2">
				<i class="fa fa-times"></i>
			</span>
		</div>
		<div class="message-main">
			<input type="hidden" id="send_name" value="${name }">
			<input type="hidden" id="id" value="${sessionScope.id}">
			<table class= "table table-bordered">
				<tr>
					<td>
						받는사람
					</td>
					<td>
						<input type="text" readonly="readonly" id="recv_name" value="${dto.name}">
					</td>
				</tr>
				<tr>
					<td>
						문의 내용
					</td>
					<td>
						<select name="inquiry_type" id="inquiry_type">
							<option value="문의유형" selected="selected" disabled="disabled">문의유형</option>
							<option value="프로젝트">프로젝트</option>
							<option value="교환/환불">교환/환불</option>
							<option value="배송">배송</option>
							<option value="기타">기타</option>
						</select>
					</td>
				</tr>
			</table>
			<textarea style="width: 540px; height: 200px;" placeholder="프로젝트 진행자에게 문의하고 싶은 내용을 적어주세요." id="message-content"></textarea>
			<span class="word-count">0/1000</span>
			<button type="button" id="btn-send">전송</button>
		</div>
	</div>
</div>
</div>
<!-- end message modal -->
<input type="hidden" name="session-id" value="${sessionScope.loginok}">
