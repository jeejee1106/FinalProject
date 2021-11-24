<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="fundingUpdate" method="get" enctype="multipart/form-data">

<!-- header(button) -->
<header class="header_area">
	<div style="height: 50px; background-color: white; border: none;">
		<button type="submit" id="save">저장하기</button>
	</div>
</header>
<div class="media">
	<div class="main_title">
	<h6>목표 금액<i class="fa fa-asterisk" style="color: red; font-size: 15px;"></i></h6>
		<div class="sub_text">
			프로젝트를 완수하기 위해 필요한 금액을 설정해주세요.		
		</div>
		<br>
		<div style="background-color: #fdf4f3; padding: 30px 50px; width: 80%;">
			<span style="color: red; font-size: 12px;" class="fa fa-check-circle-o">
			목표 금액을 설적 시 꼭 알아두세요!</span><br>
			<span style="font-size: 11px;">* 종료일까지 목표금액을 달성하지 못하면 후원자 결제가 진행되지 않습니다.<br>
			* 종료 전 후원 취소를 대비해 10% 이상 초과 달성을 목표로 해주세요.<br>
			* 제작비, 선물 배송비, 인건비, 예비 비용 등을 함께 고려해주세요.</span>
		</div>
	</div>
	<div>
		<div class="layout1">
			<div class="groundBorder" style="height: 350px;">
				<div class="">
					<div style="width: 250px; margin: 20px;" class="sub_font">
					목표금액<br>
					</div>
				</div>
				<div>
					<input type="text" placeholder="50만원 이상의 금액을 입력해주세요" 
					class="textform" style="width: 90%; text-align:right; margin-left: 20px;">원
				</div>	
				<div style="width: 90%; height:150px; background-color: #fcfcfc; margin: 25px 30px; padding: 20px 20px; border-radius: 5px;">
					목표금액 달성 시 예상 수령액
					<br><hr>
					총 수수료 <br>
					결제대행 수수료(총 결제액의 3% + VAT) <br>
					플랫폼 수수료(총 모금액의 5% + VAT)
				</div>
			</div>
		</div>
	</div>
</div>
<hr>
<br>
<div class="media">
	<div class="main_title">
	<h6>펀딩 일정<i class="fa fa-asterisk" style="color: red; font-size: 15px;"></i></h6>
		<div class="sub_text">
			설정한 일시가 되면 펀딩이 자동 시작됩니다. 펀딩 시작 전까지<br> 날짜를 변경할 수 있고, 즉시 펀딩을 시작할 수도 있습니다.
		</div>
	</div>
	<div>
		<div class="layout1" >
			<ol>
				<li>
					<div style="display: flex; width: 100%; height: 100px">
						<div >
							<p>시작일
							<div>
							<input type="datetime-local" class="textform">
							</div>
						</div>
						<div style="width: 20px;"></div>
						<div>
							<p>시작 시간
							<div>
							<input type="datetime-local" class="textform">
							</div>
						</div>
					</div>
					<div style="width: 100%; height: 80px">
						펀딩기간
						<div id="total_date">
						28일
						</div>
					</div>
				</li>
				<li>
					<div style="width: 100%; height: 100px">
						<div>
							<p>종료일
						</div>
						<div style="display: flex; width: 100%;">
							<input type="date" class="textform">
						</div>
					</div>
					<br><br>
				</li>
				<li>
					<div style="width: 100%; height: 80px">
						<p>후원자 결제 종료
						<div id="total_date">
						2021.12.28
						</div>
					</div>					
				</li>
				<li>
					<div style="width: 100%; height: 80px">
						<p>정산일
						<div id="total_date">
						2022.01.10
						</div>
					</div>					
				</li>
			</ol>
		</div>
	</div>
</div>
</form>