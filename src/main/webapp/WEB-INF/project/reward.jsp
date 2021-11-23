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
	<div class="main_title" style="width: 350px;">
	<h6>내가 만든 아이템</h6>
		<br>
		<div style="background-color: width; border: 1px solid #cccccc; 
		padding: 30px 50px; height: 10%; text-align: center;">
			<span style="font-size: 10px;">만든 아이템 없고 totalCount아직 안불러옴	</span>
		</div>
	</div>
	<div>
		<div class="layout1" style="margin-top: 30px;">
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
</form>