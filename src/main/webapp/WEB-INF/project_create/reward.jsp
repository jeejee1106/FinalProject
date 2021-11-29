<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header(button) -->
<header class="header_area">
	<div style="height: 50px; background-color: white; border: none;">
		<button type="submit" id="save">저장하기</button>
	</div>
</header>
<div class="media">
	<div class="main_title" style="width: 350px;">
	<h6>내가 만든 선물</h6>
		<br>
		<div style="background-color: width; border: 1px solid #cccccc; 
		padding: 30px 50px; height: 10%; text-align: center;">
			<span style="font-size: 10px;">만든 아이템 없고 totalCount아직 안불러옴	</span>
		</div>
	</div>
	<div>
		<div class="layout1" style="margin-top: 30px;">
			<div class="groundBorder">
				<div class="" style="margin: 40px;">
					<div style="width: 250px;" class="sub_font">
					선물 만들기<br>
					</div>
					<div>
					선물은 후원자에게 프로젝트의 가치를 전달하는 수단입니다. 
					다양한 금액대로 여러 개의 선물을 만들어주세요. 펀딩 성공률이 높아지고, 
					더 많은 후원 금액을 모금할 수 있어요.
					</div>	
				</div>
				<div style="margin: 40px;">
					<p>아이템 이름&nbsp;<span class="fa fa-question-circle-o" style="color: red; font-size: 15px;"></span>
					<div></div>
					<input type="text" placeholder="아이템 이름을 입력해주세요" 
					class="textform" style="width: 100%;">
				</div>	
				<br>
				<div style="margin: 40px;">
					<p>옵션&nbsp;<span class="fa fa-question-circle-o" style="color: red; font-size: 15px;"></span>
					<div>
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn textform" style="width: 250px;">
								<input type="radio" name="jb-radio" id="jb-radio-1" class="textform"> 없음
							</label>
						</div>
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn textform" style="width: 250px;">
								<input type="radio" name="jb-radio" id="jb-radio-1" class="textform" > 객관식
							</label>
						</div>
					</div>
				</div>
				<div style="margin: 40px;">
					<p>옵션 항목
					<div></div>
					<input type="text" placeholder="아이템 이름을 입력해주세요" 
					class="textform" style="width: 100%; height: 80px; text-align: left;">
				</div>	
			</div>
		</div>
	</div>
</div>
<hr>
<br>
