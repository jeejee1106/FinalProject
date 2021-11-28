<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	.project-info{
		display: flex;
		margin-top: 20px;
	}
	.project-info-img{
		max-width: 160px;
		margin-right: 20px;
	}
	.final-payment-info{
		min-height: 50px;
		padding:10px 15px;
		border: 1px solid #dcdcdc;
		border-radius: 5px;
		text-align:right;
		line-height: 50px;
		font-size: 16px;
		font-weight: bold;
	}
	.final-title{
		float:left;
		color: #dda0dd;
	}
	.final-payment-notice{
		padding: 0 15px;
	}
	.final-notice{
		margin: 15px 0 20px 0;
		font-size: 12px;
	}
	.final-payment-check input{
		zoom: 1.5;
	}
	.payment-content{
		display: flex;
	}
	.payment-left{
		width: 670px;
		margin-right: 30px;
	}
	.payment-right{
		width: 400px;
		margin-top: 25px;
	}
	.down-icon{
		float: right;
	}
	.btn-final-payment-support{
		border: none;
		width: 300px;
		margin-top: 15px;
		height: 50px;
		border-radius: 5px;
		color: white;
		background-color: #cbcbcb;
		font-size: 12pt;
		font-weight: bold;
	}
</style>
<script type="text/javascript">
	$(function(){
		$('input[type="checkbox"]').click(function(){
	        var agree = $(".final-check").prop('checked'); 
	        var agreeLength=$("[name='check-agree']:checked").length;

	        if(agree==true && agreeLength==2){
	            $(".btn-final-payment-support").css({"backgroundColor":"#dda0dd","cursor":"pointer","color":"#white"}).prop("disabled",false);
	        }
	        else{
	            $(".btn-final-payment-support").css({"backgroundColor":"#cbcbcb","cursor":"auto","color":"white"}).prop("disabled",true);
	        }
	    });
	});
</script>
<div class="container project-payment">
	<div class="project-info">
		<div class="project-info-img">
			<img alt="" src="/image/project_thumb30.PNG">
		</div>
		<div class="project-info-intro">
			<span class="project-info-intro-category">
				타로게임 ㅣ 카드
			</span>
			<h5 class="project-info-intro-title">
				우울에 빠진 2030을 위한, 마음과 나 다이어리
			</h5>
			<div class="project-info-intro-sub">
				<span><fmt:formatNumber value="${dto.total_amount }"/></span>
				<span>291%</span>
				<span>
					<fmt:parseDate value="${today }" var="strPlanDate" pattern="yyyy-MM-dd"/>
					<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate" />
					<fmt:parseDate value="${dto.end_date }" var="endPlanDate" pattern="yyyy-MM-dd"/>
					<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate" />
					
					${endDate - strDate }일 남음
				</span>
			</div>
		</div>
	</div>
	
	<hr>
	
	<div class="payment-content">
		<div class="payment-left">
			<div class="project-payment-info">
				<div class="payment-info-present">
					<div class="payment-info-title">
						선물 정보
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>선물 구성</th>
								<td>선물 없이 후원하기</td>
							</tr>
							<tr>
								<th>선물 금액</th>
								<td>1,000원</td>
							</tr>
						</thead>
					</table>
				</div>
				<div class="payment-info-support">
					<div class="payment-info-title">
						후원자 정보
					</div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>연락처</th>
								<td>010-1111-1111</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>1@1</td>
							</tr>
						</thead>
					</table>
				</div>
				<div class="payment-info-payment-method">
					<div class="payment-info-title">
						결제수단
					</div>
					<table class="table table-bordered">
						<tr>
							<td>
							<label>
								<input type="radio"/>카드 및 계좌
							</label>
							<label>
								<input type="radio"/>네이버 페이
							</label>
							</td>
						</tr>
						<tr>
							<td>결제수단 추가</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="payment-right">
			<div class="final-payment-info">
				<span class="final-title">최종 후원 금액</span>
				1,000원
			</div>
			<div class="final-payment-notice">
				<div class="final-notice">
					프로젝트 성공시, 결제는 <strong>2021.12.20</strong> 에 진행됩니다.프로젝트가 무산되거나 중단된 경우, 예약된 결제는 자동으로 취소됩니다.
				</div>
				<div class="final-payment-check">
					<div class="final-payment-check-privacy">
						<span>
							<label>
								<input type="checkbox" class="final-check" name="check-agree">&nbsp; 개인정보 제 3자 제공 동의
							</label>
						</span>
						<span class="down-icon">
							열기&nbsp;<i class="fa fa-angle-down"></i>
						</span>
					</div>
					<div class="final-payment-check-instructions">
						<span>
							<label>
								<input type="checkbox" class="final-check" name="check-agree">&nbsp; 후원 유의사항 확인
							</label>
						</span>
						<span class="down-icon">
							열기&nbsp;<i class="fa fa-angle-down"></i>
						</span>
					</div>
				</div>
				<div class="final-payment-button">
					<button class="btn-final-payment-support" disabled="disabled">
						후원하기
					</button>
				</div>
			</div>
		</div>
	</div>
</div>