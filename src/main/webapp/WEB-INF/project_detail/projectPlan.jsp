<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	.plan-list li a {
	    cursor: pointer;
	    display: inline-flex;
	    align-items: center;
	    height: 32px;
	    padding: 0px 16px;
	    border-radius: 23px;
	    color: rgb(61, 61, 61);
	    border: 1px solid rgb(240, 240, 240);
	    font-size: 12px;
	}
	.plan-list li a:hover{
		border: 3px solid #dda0dd;
	}
	
	.plan-list li {
	    list-style: none;
	    margin-right: 11px;
	    float: left;
	}
	.project-story{
		clear: both;
		padding-top: 20px;
	}
	.story-section div:nth-child(1){
		font-size:15pt;
		font-weight: bold;
		margin-bottom: 20px;
	}
	.trust-sub-title{
		margin-bottom: 10px;
		font-size:11pt;
		font-weight: bold;
		color: gray;
	}
	.top_bar_fix{position:fixed; top:0; left:0; width:100%;}
.pd_top_80{padding-top:80px;}

	
</style>
<script type="text/javascript">
//스크롤 시 고정 plan 네비바 상단에 고정 - 완성 못함
$(document).ready(function(){
    var topBar = $("#plan-menu").offset();
    
    $(window).scroll(function(){
        var docScrollY = $(document).scrollTop();
        var barThis = $("#plan-menu");
        var fixNext = $("#project-story");
        if( docScrollY > topBar.top ) {
            barThis.addClass("top_bar_fix");
            fixNext.addClass("pd_top_80");
        }else{
            barThis.removeClass("top_bar_fix");
            fixNext.removeClass("pd_top_80");
        }
    });
});


$(function(){
	//plan 네비바 색상변경
	$(".plan-list-title").click(function(){
		$(this).css('background', '#dda0dd');
		$(this).parent().siblings().children().css('background', 'none');
	});
	
	//plan 네비바 클릭 시 해당영역으로 스크롤 이동
	var headerHeight = $('header').outerHeight();
	$(".plan-list-purpose").click(function(event){
		event.preventDefault();
		$('html,body').animate({scrollTop:$("#purpose").offset().top - headerHeight}, 500);
	});
	$(".plan-list-budget").click(function(event){
		event.preventDefault();
		$('html,body').animate({scrollTop:$("#budget").offset().top - headerHeight}, 500);
	});
	$(".plan-list-schedule").click(function(event){
		event.preventDefault();
		$('html,body').animate({scrollTop:$("#schedule").offset().top - headerHeight}, 500);
	});
	$(".plan-list-team-intro").click(function(event){
		event.preventDefault();
		$('html,body').animate({scrollTop:$("#team-intro").offset().top - headerHeight}, 500);
	});
	$(".plan-list-present-intro").click(function(event){
		event.preventDefault();
		$('html,body').animate({scrollTop:$("#present-intro").offset().top - headerHeight}, 500);
	});
	$(".plan-list-trust-safety").click(function(event){
		event.preventDefault();
		$('html,body').animate({scrollTop:$("#trust-safety").offset().top - headerHeight}, 500);
	});
	
	
	
});
</script>
<div class="plan-menu" id="plan-menu">
	<ul class="plan-list" id="plan-list">
		<li>
			<a class="plan-list-title plan-list-purpose">목적</a>
		</li>
		<li>
			<a class="plan-list-title plan-list-budget">예산</a>
		</li>
		<li>
			<a class="plan-list-title plan-list-schedule">일정</a>
		</li>
		<li>
			<a class="plan-list-title plan-list-team-intro">팀 소개</a>
		</li>
		<li>
			<a class="plan-list-title plan-list-present-intro">선물 설명</a>
		</li>
		<li>
			<a class="plan-list-title plan-list-trust-safety">신뢰와 안전</a>
		</li>
	</ul>
</div>
<div class="project-story" id="project-story">
	<div id="purpose" class="story-section">
		<div class="purpose-title">
			프로젝트 목적
		</div>
		<div class="purpose-content">
			${dto.project_goal }
		</div>
	</div>
	<hr>
	<div id="budget" class="story-section">
		<div class="budget-title">
			프로젝트 예산
		</div>
		<div class="budget-content">
			${dto.project_budget }
		</div>
	</div>
	<hr>
	<div id="schedule" class="story-section">
		<div class="schedule-title">
			프로젝트 일정
		</div>
		<div class="schedule-content">
			${dto.project_schedule }
		</div>
	</div>
	<hr>
	<div id="team-intro" class="story-section">
		<div class="team-intro-title">
			프로젝트 팀 소개
		</div>
		<div class="team-intro-content">
			${dto.project_team_intro}
		</div>
	</div>
	<hr>
	<div id="present-intro" class="story-section">
		<div class="present-intro-title">
			선물 설명
		</div>
		<div class="present-intro-content">
			${dto.project_present_intro }
		</div>
	</div>
	<hr>
	<div id="trust-safety" class="story-section">
		<div class="trust-safety-title">
			신뢰와 안전
		</div>
		<div class="anticipated_problem-title trust-sub-title">
			예상되는 어려움
		</div>
		<div class="anticipated_problem-content">
			${dto.anticipated_problem }
		</div>
		<hr>
		<div class="exchange_refund-title trust-sub-title">
			교환 및 환불 안내
		</div>
		<div class="exchange_refund-content">
			모든 프로젝트 공통<br>
			- 펀딩 종료일 후에는 즉시 제작 및 실행에 착수하는 프로젝트 특성상 단순 변심에 의한 후원금 환불이 불가능합니다.<br>
			- 예상 전달일로부터 [ 14 ]일 이상 선물 전달이 이뤄지지 않을 경우, 환불을 원하시는 분들께는 [ 수수료를 포함한 ] 후원금을 환불해 드립니다.<br>
			(플랫폼 수수료: 모금액의 5%, 부가세 별도 / 결제 수수료: 결제 성공액의 3%, 부가세 별도 )<br>
			- 선물 전달을 위한 배송지 및 서베이 답변은 [ 2022. 01. 10 ]에 일괄 취합할 예정입니다.<br>
			- 이후 배송지 변경이나 서베이 답변 변경을 원하실 때에는 '창작자에게 문의하기'로 개별 문의하셔야 합니다.
			<br><br>
			배송이 필요한 선물<br>
			- 파손 또는 불량품 수령 시 [ 14 ]일 이내로 교환이 가능합니다.<br>
			- 교환 및 AS 문의는 '창작자에게 문의하기'로 신청해 주세요.<br>
			- 파손이나 불량품 교환시 발생하는 비용은 창작자가 부담합니다. 선물 확인을 위한 포장 훼손 외에 아이템의 가치가 훼손된 경우에는 교환 및 환불이 불가합니다.<br>
			- 파손이나 불량 기준은 다음과 같습니다.<br>
			1) 페이지 불량 인쇄, 2) 표지 손상, 3) 리워드 인쇄 불량<br>
			- 후원자가 배송지를 잘못 기재하거나 창작자에게 사전 고지 없이 배송지를 수정하여 배송사고가 발생할 경우<br>
			창작자는 [ 최대 1번 ]까지 재발송 해 드립니다. 배송비 부담은 후원자에게 있습니다.
		</div>
	</div>
</div>
