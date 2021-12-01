<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	.payment-info-title{
		font-weight: bold;
		font-size: 12pt;
		margin-bottom: 8px;
	}
	.info-table{
		border: 1px solid #dcdcdc;
		border-collapse: collapse;
		width: 650px;
		margin-bottom: 30px;
	}
	.info-table th, .info-table td{
		padding: 15px 15px;
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
		width: 380px;
		margin: 15px 0;
		height: 50px;
		border-radius: 5px;
		color: white;
		background-color: #cbcbcb;
		font-size: 12pt;
		font-weight: bold;
	}
	.final-payment-check-privacy-content-tb{
		font-size: 8pt;
		margin-bottom: 15px;
	}
	.final-payment-check-privacy-content-tb td{
		padding: 3px;
	}
	.final-payment-check-content {
		font-size: 9pt;
	}
	.final-payment-check-privacy{
		margin-bottom: 20px;
	}
	.plus-icon{
		margin-left: 50px;
	}
	.hp-text{
		width: 70px;
	}
	.email-text{
		width: 100px;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		$(".final-payment-check-content").hide();
		
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
		
		$(".down-icon").click(function(){
			$(this).parent().siblings().toggle(500);
		});
	});
</script>
<div class="container project-payment">
	<div class="project-info">
		<div class="project-info-img">
			<img alt="" src="/thumbnail_image/${dto.thumbnail }">
		</div>
		<div class="project-info-intro">
			<span class="project-info-intro-category">
				${dto.category }
			</span>
			<h4 class="project-info-intro-title">
				${dto.title }
			</h4>
			<div class="project-info-intro-sub">
				<span style="font-weight: bold;"><fmt:formatNumber value="${dto.total_amount }"/>원</span>&nbsp;
				<span style="color: red">${percentageAchieved }%</span>&nbsp;
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
	
	<form action="/project_support/success" type="get">
		<input type="hidden" name="id" value="${sessionScope.id}">
		<input type="hidden" name="idx" value="${dto.idx}">
		<input type="hidden" name="supportNum" value="${dto.number_support}">
		<input type="hidden" name="addr" value="${addr}">
		<input type="hidden" name="hp" value="${hp}">
		<div class="payment-content">
			<div class="payment-left">
				<div class="project-payment-info">
					<div class="payment-info-present">
						<div class="payment-info-title">
							선물 정보
						</div>
						<table class="info-table">
							<thead>
								<tr>
									<td>선물 없이 후원하기</td>
								</tr>
								<tr>
									<th>선물 금액</th>
									<td>
										<input type="hidden" name="price" value="10000">
										1,000원
									</td>
								</tr>
							</thead>
						</table>
					</div>
					<div class="payment-info-support">
						<div class="payment-info-title">
							후원자 정보
						</div>
						<table class="info-table">
							<thead>
								<tr>
									<th>연락처</th>
									<td>
										<c:if test="${mdto.hp == null}">
											연락처를 등록해주세요 <i class="fa fa-plus plus-icon">&nbsp;추가</i>
										</c:if>
										${mdto.hp }
										<div class="add-info add-info-hp">
											<select id="selHp1" class="hp-text">
												<option value="-" selected="selected" disabled="disabled">선택</option> 
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select>
											<b>-</b>
											<input type="text" class="hp-text" name="hp2" id="hp2" required="required" maxlength="4">
											<b>-</b>
											<input type="text" class="hp-text" name="hp3" id="hp3" required="required" maxlength="4">
										</div>
									</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>
										<c:if test="${mdto.email == null}">
											이메일을 등록해주세요 <i class="fa fa-plus plus-icon">&nbsp;추가</i>
										</c:if>
										${mdto.email }
										<div>
											<input type="text" class="email-text" name="email1" required="required">
											<b>@</b>
											<input type="text" class="email-text" name="email2" id="email2" required="required">
											<select id="selemail">
												<option value="_">직접입력</option>
												<option value="naver.com">네이버</option>
												<option value="nate.com">네이트</option>
												<option value="gmail.com">구글</option>
												<option value="hanmail.net">다음</option>
											</select>
										</div>
									</td>
								</tr>
								<tr>
									<th>배송주소</th>
									<td>
										<c:if test="${addr == '   '}">
											배송지를 등록해주세요 <i class="fa fa-plus plus-icon">&nbsp;추가</i>
										</c:if>
										${addr}
									</td>
								</tr>
							</thead>
						</table>
					</div>
					<div class="payment-info-payment-method">
						<div class="payment-info-title">
							결제수단
						</div>
						<table class="info-table">
							<tr>
								<td>
								<label>
									<input type="radio" name="aa"/>카드 및 계좌
								</label>
								<label>
									<input type="radio" name="aa"/>네이버 페이
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
						프로젝트 성공시, 결제는 <strong style="color: #dda0dd">${pymDate}</strong> 에 진행됩니다.
						프로젝트가 무산되거나 중단된 경우, 예약된 결제는 자동으로 취소됩니다.
					</div>
					<div class="final-payment-check">
						<div class="final-payment-check-privacy">
							<div class="final-payment-check-title">
								<span>
									<label>
										<input type="checkbox" class="final-check" name="check-agree">&nbsp; 개인정보 제 3자 제공 동의
									</label>
								</span>
								<span class="down-icon">
									열기&nbsp;<i class="fa fa-angle-down"></i>
								</span>
							</div>
							<div class="final-payment-check-content">
								회원의 개인정보는 당사의 개인정보 취급방침에 따라 안전하게 보호됩니다. 
								'회사'는 이용자들의 개인정보를 개인정보 취급방침의 '제 2조 수집하는 개인정보의 항목, 수집방법 및 이용목적'에서 고지한 범위 내에서 사용하며, 
								이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에 공개하지 않습니다.
								<table class="final-payment-check-privacy-content-tb">
									<tr>
										<th style="width: 100px;">제공받는 자</th>
										<td>후원 프로젝트의 창작자</td>
									</tr>
									<tr>
										<th>제공 목적</th>
										<td>선물 전달 및 배송과 관련된 상담 및 민원처리</td>
									</tr>
									<tr>
										<th>제공 정보</th>
										<td>수취인 성명, 휴대전화 번호, 배송 주소</td>
									</tr>
									<tr>
										<th>보유 및 이용 기간</th>
										<td>재화 또는 서비스의 제공이 완료된 즉시 파기(단, 관계법령에 정해진 규정에 따라 법정기간 동안 보관)</td>
									</tr>
								</table>
								* 동의 거부권 등에 대한 고지
								개인정보 제공은 서비스 이용을 위해 꼭 필요합니다. 개인정보 제공을 거부하실 수 있으나, 이 경우 서비스 이용이 제한될 수 있습니다.
							</div>
						</div>
						<div class="final-payment-check-instructions">
							<div class="final-payment-check-title">
								<span>
									<label>
										<input type="checkbox" class="final-check" name="check-agree">&nbsp; 후원 유의사항 확인
									</label>
								</span>
								<span class="down-icon">
									열기&nbsp;<i class="fa fa-angle-down"></i>
								</span>
							</div>
							<div class="final-payment-check-content">
								<li>
									후원은 구매가 아닌 창의적인 계획에 자금을 지원하는 일입니다.
								</li>
								<div style="padding-left: 15px;">
									텀블벅에서의 후원은 아직 실현되지 않은 프로젝트가 실현될 수 있도록 제작비를 후원하는 과정으로, 
									기존의 상품 또는 용역을 거래의 대상으로 하는 매매와는 차이가 있습니다. 따라서 전자상거래법상 청약철회 등의 규정이 적용되지 않습니다.
								</div>
								<li>
									프로젝트는 계획과 달리 진행될 수 있습니다.
								</li>
								<div style="padding-left: 15px;">
									예상을 뛰어넘는 멋진 결과가 나올 수 있지만 진행 과정에서 계획이 지연, 변경되거나 무산될 수도 있습니다. 
									본 프로젝트를 완수할 책임과 권리는 창작자에게 있습니다.
								</div>
							</div>
						</div>
					</div>
					<div class="final-payment-button">
						<button type="submit" class="btn-final-payment-support" disabled="disabled">
							후원하기
						</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>