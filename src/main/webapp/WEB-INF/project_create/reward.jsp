<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.searchclear{
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#plus_form").hide();
		$("#option_no").click(function() {
			$("#form1").css("border","1px solid red");
			$("#form2").css("border","1px solid #cccccc");
			$(".option_form").val('');
			$("#plus_form").hide();
		});
		$("#option_yes").click(function() {
			$("#form2").css("border","1px solid red");
			$("#form1").css("border","1px solid #cccccc");
			$("#plus_form").show()
			
		});
		
		$("#save5").click(function() {
			if (confirm("저장하시겠습니까?") != true){
				return;
			}
			var present_name = $("#present_name").val();	
			var option1 = $("#option1").val() + ",";
			var option2 = $("#option2").val() + ",";
			var option3 = $("#option3").val() + ",";
			var option4 = $("#option4").val() + ",";
			var option5 = $("#option5").val() + ",";
			var price_data = $("#price").val();
			var idx = $("#idx").val();
			var price = price_data.split(',').join("");
			
			var option = option1 + option2 + option3 + option4 + option5;  
			
			if (option.endsWith(",") == true){
				option = option.slice(0, -1);			
				option = option.replace(',,,', ',');
				option = option.replace(',,,,', ',');
				option = option.replace(/,$/, '');
			}
			if (option.endsWith(",,") == true){
				option = option.slice(0, -2);
				option = option.replace(',,', ',');			
				option = option.replace(',,,', ',');
				option = option.replace(/,$/, '');
			}
			if (option.endsWith(",,,") == true){
				option = option.slice(0, -3);
				option = option.replace(',,', ',');			
				option = option.replace(/,$/, '');
			}
			if (option.endsWith(",,,,") == true){
				option = option.slice(0, -4);
				option = option.replace(/,$/, '');
			}
			if (option.endsWith(",,,,,") == true){
				option = option.slice(0, -5);
				option = option.replace(/,$/, '');
			}else{
				option = null;	
			}

 			$.ajax({
				type		: "post",
				dataType	: "text",
				url			: "../project/rewardUpdate",
				data		: { "present_name"	:present_name,
								"option"		:option,
								"price"			:price,
								"idx"			:idx
								},
				success		: function(date){
					alert("저장되었습니다!");	
				},
				error		:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			}); 
		});
		
		$('#present_name').on('input', checkInput);
		$('#price').on('input', checkInput);

		function checkInput() {
		  var present_name = $('#present_name').val();
		  var price = $('#price').val();

		  if (present_name != '' && price != '') {
			  $("button#save5").css({"backgroundColor":"#d2201d","cursor":"pointer","color":"#fff"}).prop("disabled",false);
		  } else {
			  $("button#save5").css({"backgroundColor":"#cbcbcb","cursor":"auto","color":"white"}).prop("disabled",true);
		  }
		}
	});
	
	function inputNumberFormat(obj) {
	    obj.value = comma(uncomma(obj.value));
	}
	
	function comma(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	
	function uncomma(str) {
	    str = String(str);
	    return str.replace(/[^\d]+/g, '');
	}

</script>
<!-- header(button) -->
<header class="header_area">
	<div style="height: 50px; background-color: white; border: none;">
		<button type="submit" id="save5" class="btn save" disabled="disabled">저장하기</button>
	</div>
</header>
<div class="media">
	<div class="main_title" style="width: 350px;">
	<h6>내가 만든 선물</h6>
		<br>
		<div style="background-color: width; border: 1px solid #cccccc; padding: 30px 50px; height: 10%; text-align: center;"
		id="present_list">
			<strong>1,000원+</strong><br>
			<span>선물 없이 후원하기</span>
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
					<p>선물 이름&nbsp;<span class="fa fa-question-circle-o" style="color: red; font-size: 15px;"></span>
					<div></div>
					<input type="text" placeholder="선물 이름을 입력해주세요" id="present_name"
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
				<div style="margin: 40px;" id="plus_form">
					<p>옵션 항목
					<input type="text" class="textform option_form" style="width: 95%;" id="option1" name="option"
					placeholder="옵션 항목을 입력해주세요.예)블랙=230mm,블랙-240mm">
	            	<span class='searchclear' id=''>&nbsp;&nbsp;X</span><br><br>
					<input type="text" class="textform option_form" style="width: 95%;" id="option2" name="option"
					placeholder="옵션 항목을 입력해주세요.예)블랙=230mm,블랙-240mm">
	            	<span class='searchclear' id=''>&nbsp;&nbsp;X</span><br><br>
					<input type="text" class="textform option_form" style="width: 95%;" id="option3" name="option"
					placeholder="옵션 항목을 입력해주세요.예)블랙=230mm,블랙-240mm">
	            	<span class='searchclear' id=''>&nbsp;&nbsp;X</span><br><br>
					<input type="text" class="textform option_form" style="width: 95%;" id="option4" name="option"
					placeholder="옵션 항목을 입력해주세요.예)블랙=230mm,블랙-240mm">
	            	<span class='searchclear' id=''>&nbsp;&nbsp;X</span><br><br>
					<input type="text" class="textform option_form" style="width: 95%;" id="option5" name="option"
					placeholder="옵션 항목을 입력해주세요.예)블랙=230mm,블랙-240mm">
	            	<span class='searchclear' id=''>&nbsp;&nbsp;X</span><br><br>
				</div>
				<div style="margin: 40px;">
					<p>최소 후원 금액&nbsp;<span class="fa fa-question-circle-o" style="color: red; font-size: 15px;"></span>
					<div>
					배송이 필요한 선물은 배송비를 포함해주세요.
					</div>
					<br>
					<input type="text" placeholder="1000원 이상의 금액을 입력해주세요" onkeyup="inputNumberFormat(this)"
					class="textform" style="width: 100%;" id="price" name="price">
				</div>
				<br>
			</div>
		</div>
	</div>
</div>
<hr>
<br>
<input type="hidden" id="idx" name="idx" value="${idx }">