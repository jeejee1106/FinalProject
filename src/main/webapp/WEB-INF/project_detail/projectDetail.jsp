<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	.project-intro{
		width: 1200px;
		height: 230px;
		text-align: center;
		line-height: 100px;
		left: 230px;
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
		margin:50px 0px 0px 30px;
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
		font-weight: bold;
	}
	.funding-info{
		border: 1px solid #f0ffff;
		width: 400px;
		padding: 15px 20px 15px 20px;
		margin: 20px 0px 20px 0px;
		font-size: 12pt;
	}
	.support-btn{
		width: 200px;
		height: 50px;
		font-size: 12pt;
	}
	.content-navigation a{
		font-size: 11pt;
		font-weight: bold;
		margin-right: 12px;
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
	
	
</style>
<script type="text/javascript">
	$(function(){
		
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
            $('html,body').animate({scrollTop:$(".support-btn").offset().top}, 500);
    	});

		$(".support-btn").click(function(event){         
            event.preventDefault();
            $('html,body').animate({scrollTop:$(".btn-creator-message").offset().top}, 500);
    	});
		
		
	});
</script>
<div class="container">
	<div class="project-intro">
		<span class="project-intro-category">카테고리</span>
		<h1 class="project-intro-title">${dto.title } </h1>
		<span class="profile-img">
			<img alt="프로필" src="/image/creator_profile30.png">
		</span>
		<span class="project-intro-creator-name">${dto.nick}</span>
	</div>
	<div class="project-main">
		<div class="project-main-img">
			<img alt="프로젝트 커버 이미지" src="/image/${dto.thumbnail}" style="width: 650px; height: 500px">
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
				<span class="project-sub-per">765%</span>
			</div>
		</div>
		<div class="project-sub">
			<div class="project-sub-title">남은시간</div>
			<div>
				<span class="project-sub-value">41</span>
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
				결제는  <fmt:formatDate value="${dto.start_date }" pattern="yyyy년 MM월 dd일" />에 다함께 진행됩니다.
			</span>
		</div>
		<div class="project-sub">
			<span class="project-sub-heart" style="font-size: 15pt;"><i class="fa fa-heart-o"></i>찜</span>
			<button class="support-btn">프로젝트 후원하기</button>
		</div>
	</div>
</div>
<hr class="content-hr">
<div class="container">
	<div class="content-navigation">
		<a class="scroll_move btn-project-plan">프로젝트 계획</a>
		<a class="scroll_move btn-project-community">커뮤니티</a>
	</div>
</div>
<hr>
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
					${dto.nick }
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
			</div>
			<div class="present-option">
				<div class="present-price">
					19,200원+
				</div>
				<div class="present-description">
					도서 1권 + 키링 1개(배송비 포함)
				</div>
			</div>
			<div class="present-option">
				<div class="present-price">
					26,200원+
				</div>
				<div class="present-description">
					도서 1권 + 키링 1개(배송비 포함)
				</div>
			</div>
			<div class="present-option">
				<div class="present-price">
					36,000원+
				</div>
				<div class="present-description">
					도서 2권 (배송비 포함)
				</div>
			</div>
			<div class="present-option">
				<div class="present-price">
					40,000원+
				</div>
				<div class="present-description">
					도서 2권 + 키링 1개(배송비 포함)
				</div>
			</div>
		</div>
	</div>
</div>

