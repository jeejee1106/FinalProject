<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="/css/project-detail.css">

<script type="text/javascript">
	$(function(){
		loginok="${sessionScope.loginok}";
		var likeCheck = "${likeCheck}";
		
		if(likeCheck == 1){
			$(".project-sub-heart").html("<i class='fa fa-heart' style='color: red;'></i>");
		}
		
		$(".project-community").hide();
		
		$(".btn-project-plan").click(function(){
			$(".project-community").hide();
			$(".project-plan").show();
		});

		$(".btn-project-community").click(function(){
			$(".project-plan").hide();
			$(".project-community").show();
		});
		
		var headerHeight = $('header').outerHeight();
		$(".scroll_move").click(function(event){
            event.preventDefault();
            $('html,body').animate({scrollTop:$("hr").offset().top - headerHeight}, 500);
    	});

		$(".btn-support").click(function(event){
            event.preventDefault();
            $('html,body').animate({scrollTop:$(".present-title").offset().top - headerHeight}, 500);
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
			var supportCheck = "${supportCheck}";
			if(supportCheck==1 && loginok!=''){
				alert("이미 후원한 프로젝트 입니다.")
				return;
			}
			
			var pstName = $(this).siblings().children(".present-name").attr("data-pstName");
			var pstOption = $(this).siblings().children().children(".pstOption").val();
			var pstPrice = $(this).attr("data-price");
			if(loginok==''){
				alert("로그인이 필요한 페이지 입니다.")
				location.href = "/login/main";
			}else{
				location.href = "/project/payment?idx=${dto.idx}&pstN=" + pstName + "&pstO=" + pstOption + "&pstP=" + pstPrice;
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
		
		$(".project-sub-heart").click(function(){
			if(loginok==''){
				alert("로그인이 필요한 서비스 입니다.")
				return;
			}
			
			var id = "${sessionScope.id}";
			var idx = "${dto.idx}";
			
			$.ajax({
				type : "post",
				url : "/liked/check",
				data : {"idx":idx, "id":id},
				success : function(data){
					if(data == 0){
						$(".project-sub-heart").html("<i class='fa fa-heart' style='color: red;'></i>");
						alert("관심 프로젝트에 등록되었습니다.");
					}else{
						$(".project-sub-heart").html("<i class='fa fa-heart-o'></i>");
						alert("관심 프로젝트에서 삭제되었습니다.");
					}
				},
				error : function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			});
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
			<img alt="프로필" src="../profile_image/${memImage}">
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
			<div class="project-sub-title">남은시간 ${pstdto.present_name }</div>
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
			<span class="project-sub-heart"><i class="fa fa-heart-o"></i></span>
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
					<img alt="프로필" src="../profile_image/${memImage}">
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
				<div class="present-name">
					> 선물 없이 후원하기
				</div>
				<button type="button" class="btn-present-support">
					1,000원 후원하기
				</button>
			</div>
			<c:forEach var="pstdto" items="${pstList}">
				<div class="present-option">
					<div class="present-price" >
						<fmt:formatNumber value="${pstdto.price }"/>원 +
					</div>
					<div>
						<span class="present-name" data-pstName="${pstdto.present_name }">
							> ${pstdto.present_name }
						</span>
						<span class="present-description" >
							<c:choose>
								<c:when test="${pstdto.present_option == null}">
								</c:when>
								<c:otherwise>
									<b style="margin-left:20px; font-size:8pt; color:gray">옵션선택</b>
									<select name="" id="" class="pstOption" style="width:150px;">
										<c:set var="present_option" value="${pstdto.present_option}" />
										<c:set var="splitStr" value="${fn:split(present_option, ',') }" />
										<c:forEach var="option" items="${splitStr }">
											<option value="${option}">${option}</option>
										</c:forEach>
									</select>
								</c:otherwise>
							</c:choose>
						</span>
					</div>
					<button type="button" class="btn-present-support" data-price="${pstdto.price }">
						<fmt:formatNumber value="${pstdto.price }"/>원 후원하기
					</button>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<!-- end project content -->

<!-- start message modal -->
<div class="container">
	<div class="message-modal">
		<div class="modal-content">
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