<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  
<script>
	$(function(){
		$("#start_date").datepicker({
			closeText: '닫기',
			
			prevText: '이전달',

			nextText: '다음달',

			currentText: '오늘',

			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],

			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],

			dayNames: ['일','월','화','수','목','금','토'],

			dayNamesShort: ['일','월','화','수','목','금','토'],

			dayNamesMin: ['일','월','화','수','목','금','토'],

			weekHeader: 'Wk',

			dateFormat: 'yy-mm-dd',

			firstDay: 0,

			isRTL: false,

			duration:200,

			showAnim:'show',

			showMonthAfterYear: true,

			yearSuffix:'년' , 
			
			minDate: 10 , 
			
			maxDate: "+60D" ,
			
			onSelect: function (date) {
				var endDate = $('#end_date');
				var startDate = $(this).datepicker('getDate');
				var minDate = $(this).datepicker('getDate');
				endDate.datepicker('setDate', minDate);
				startDate.setDate(startDate.getDate() + 30);
				endDate.datepicker('option', 'maxDate', startDate);
				endDate.datepicker('option', 'minDate', minDate);
			}
		});
		
		$("#end_date").datepicker({
closeText: '닫기',
			
			prevText: '이전달',

			nextText: '다음달',

			currentText: '오늘',

			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],

			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],

			dayNames: ['일','월','화','수','목','금','토'],

			dayNamesShort: ['일','월','화','수','목','금','토'],

			dayNamesMin: ['일','월','화','수','목','금','토'],

			weekHeader: 'Wk',

			dateFormat: 'yy-mm-dd',

			firstDay: 0,

			isRTL: false,

			duration:200,

			showAnim:'show',

			showMonthAfterYear: true,

			yearSuffix:'년'
		});
		
	});
</script>
<script>
function call()
{
    var sdd = document.getElementById("start_date").value;
    var edd = document.getElementById("end_date").value;
    var ar1 = sdd.split('-');
    var ar2 = edd.split('-');
    var da1 = new Date(ar1[0], ar1[1], ar1[2]);
    var da2 = new Date(ar2[0], ar2[1], ar2[2]);
    var dif = da2 - da1;
    var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
    var cMonth = cDay * 30;// 월 만듬
    var cYear = cMonth * 12; // 년 만듬
 if(sdd && edd){
    document.getElementById('years').value = parseInt(dif/cYear)
    document.getElementById('months').value = parseInt(dif/cMonth)
    document.getElementById('days').value = parseInt(dif/cDay)
 }
}
</script>
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
		<div style="background-color: #fdf4f3; padding: 30px 50px; width: 100%;">
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
					<input type="text" placeholder="50만원 이상의 금액을 입력해주세요" id="target_amount" name="target_amount"
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
							<input type="text" class="textform" id="start_date">
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
						<input type="text" id="num_nights" size="6" style="text-align:center;">
						</div>
					</div>
				</li>
				<li>
					<div style="width: 100%; height: 100px">
						<div>
							<p>종료일
						</div>
						<div style="display: flex; width: 100%;">
							<input type="text" class="textform" id="end_date">
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