<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.searchclear{
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(function() {
		let num = 0;
		$("#option").hide();
		$("#option_no").click(function() {
			$("#form1").css("border","1px solid red");
			$("#form2").css("border","1px solid #cccccc");
			$("#option").hide();
			$(".option_form").remove();
			$(".searchclear").remove();
			num = 0;
		});
		$("#option_yes").click(function() {
			$("#form2").css("border","1px solid red");
			$("#form1").css("border","1px solid #cccccc");
			$("#option").show();
			
		});
		$("#option_form").on("keyup", function(key){
			if(key.keyCode == 13) {
				if(num.size < 5){
	            var option = $(this).val();
	            var plus = "";
	            num ++;
	            plus += "<input type='text' class='textform option_form' style='width: 95%;' id='option" + num + "' name='option" + num + "' value='"+ num + "'>";
	            plus += "<span class='searchclear' id=''>&nbsp;&nbsp;X</span><br><br>"
	            $("#plus_form").append(plus);
	        	$(this).val('');
				}else{
					alert("추가가능한 옵션은 최대 5개까지 입니다.");
					return;
				}
			}		
			$(".searchclear").on("click",function(){
				$(this).prev().remove();
				$(this).next().remove();
				$(this).next().remove();
				$(this).remove();
				num --;
			});
		});
		
	});
</script>
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
						<div class="btn-group btn-group-toggle">
							<label class="btn textform" style="width: 250px;" id="form1">
								<input type="radio" name="jb-radio" id="option_no" class="textform"> 없음
							</label>
							<label class="btn textform" style="width: 250px;" id="form2">
								<input type="radio" name="jb-radio" id="option_yes" class="textform" > 객관식
							</label>							
						</div>
					</div>
				</div>
				<div style="margin: 40px;" id="option">
					<p>옵션 항목
					<div></div>
					<input type="text" placeholder="옵션 항목을 입력해주세요.예)블랙=230mm,블랙-240mm" 
					class="textform" style="width: 100%; height: 80px; text-align: left;" id="option_form">
					
				</div>
				<div style="margin: 40px;" id="plus_form">
				</div>
				<div style="margin: 40px;">
					<p>최소 후원 금액&nbsp;<span class="fa fa-question-circle-o" style="color: red; font-size: 15px;"></span>
					<div>
					배송이 필요한 선물은 배송비를 포함해주세요.
					</div>
					<br>
					<input type="text" placeholder="1000원 이상의 금액을 입력해주세요" 
					class="textform" style="width: 100%;">
				</div>
				<br>
			</div>
		</div>
	</div>
</div>
<hr>
<br>
