<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.btn-category{
	color: #000000DE;
	font-size: 14px;
	border: 1px solid #f5f5f5;
	background: #ffffff;
	padding: 7px 22px;
	border-radius: 30px;
	float: left;
	margin-left: 5px;
	margin-bottom: 8px;
}
.btn2{
	color: white;
	background: #ff5757;
	padding: 7px 24px;
	float: left;
	margin-left: 5px;
	margin-bottom: 8px;
	font-weight: bold;
}
.btn3{
	color: white;
	background: #cbcbcb;
	padding: 7px 24px;
	font-weight: bold;
	margin-left: 300px;
}
</style>
<script type="text/javascript">
$(function() {
	$("div.layout2").hide();
	//$("div.layout1").hide();
	$(".btn-category").click(function() {
		//alert($(this).val());
		var s = "";
		s += "<button type='button' class='btn btn2'>다음</button>";
		$("#next").html(s);
		$(".btn-category").css({"backgroundColor":"#ffffff","color":"#000000DE"});
		$(this).css({"backgroundColor":"#d2201d","color":"#fff"});
		var category = $(this).val();
		$("#category").val(category);
		
	});
	
	$(document).on("click",".btn2",function(){
		$("div.layout1").hide();
		$("div.layout2").show();

	});

	$(document).on("click","#back",function(){
		$("div.layout2").hide();
		$("div.layout1").show();
		
	});
	
	
    $('input[type="checkbox"]').click(function(){
        var tmpp = $(".inpu").prop('checked'); 
        var tt=$("[name='inpu']:checked").length;

        if(tmpp==true && tt==3){
            $("button.btn3").css({"backgroundColor":"#d2201d","cursor":"pointer","color":"#fff"}).prop("disabled",false);
        }
        else{
            $("button.btn3").css({"backgroundColor":"#cbcbcb","cursor":"auto","color":"white"}).prop("disabled",true);
        }
    });
	
});
</script>
<div class="contact-area d-flex align-items-center">
    
    <div class="img">
        <img alt="" src="${root }/image/1.jpg" style="width: 390px;">
    </div>  
    <div class="contact-info layout1" style="margin-left: 300px;">
        <h4>
			멋진 아이디어가 있으시군요! <br> 어떤 프로젝트를 계획 중이신가요?
		</h4>
		<p style="font-size:13px;">나중에 변경 가능하니 너무 걱정마세요.</p>
		<br>
		<div>
		<ul>
			<li>
				<button type="button" value="게임" class="btn btn-category">게임</button>
			</li>
			<li>
				<button type="button" value="공연" class="btn btn-category">공연</button>
			</li>
			<li>
				<button type="button" value="디자인" class="btn btn-category">디자인</button>
			</li>
			<li>
				<button type="button" value="사진" class="btn btn-category">사진</button>
			</li>
			<li>
				<button type="button" value="영화·비디오" class="btn btn-category">영화·비디오</button>
			</li>
			<li>
				<button type="button" value="푸드" class="btn btn-category">푸드</button>
			</li>
			<li>
				<button type="button" value="음악" class="btn btn-category">음악</button>
			</li>
			<li>
				<button type="button" value="출판" class="btn btn-category">테크</button>
			</li>
			<li>
				<button type="button" value="패션" class="btn btn-category">패션</button>
			</li>
		</ul>
		</div>	
		<div id="next" style="margin-top: 200px; margin-left: 370px;"></div>
    </div>
    
    <div class="contact-info layout2" style="margin-left: 300px;">
        <h4>
			마지막으로, 이런 준비가 필요해요.
		</h4>
		<p style="font-size:13px;">프로젝트를 진행하시려면 아래 내용을 준비해주세요.</p>
		<hr>
		<br>
			<ul>
				<li>
					<label>
						<span style="height: 10px;">
						<input type="checkbox" style="zoom:2.0;" class="inpu" name="inpu">
						</span>
						<span style="height: 10px;">
						대표 창작자는 <strong>만 19세 이상의 성인</strong>이여야 합니다.
	    				</span>
	    			</label>
				</li>
				
				<li>
				<label>
					<span>
					<input type="checkbox" style="zoom:2.0;" class="inpu" name="inpu">
					<span>
					텀블벅에서 필요 시 연락 드릴 수 있도록 
					<strong>본인 명의의 휴대폰 번호</strong>와 <strong>이메일 주소</strong>가 필요합니다.					
    				</span>
    				</span>
    			</label>
				</li>
				
				<li>
				<label>
					<input type="checkbox" style="zoom:2.0;" class="inpu" name="inpu">
					&nbsp;펀딩 성공 후의 정산을 위해 <strong>신분등 또는 사업자 등록증, 국내 은행 계좌</strong>
					를 준비해주세요.					
    			</label>
				</li>
			</ul>
		<br>
		<hr>
		<div>
			<span id="back" style="cursor: pointer;">
				<i class="fa fa-chevron-left" style="font-size: 1.4em;"></i>
				&nbsp;&nbsp;뒤로가기
			</span>
			<form action="insert" method="post">
			<button type="submit" class="btn btn3" disabled="disabled" onclick="/project/insert">시작하기</button>
			<input type="hidden" id="category" name="category">
			</form>
    	</div>
    </div>
</div>