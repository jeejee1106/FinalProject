<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<style>
.ListElementComponent__Wrapper-sc-1wy7ql5-0{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    color: #3d3d3d;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    border-width: 1px 0px;
    border-style: solid;
    border-color: rgb(230, 230, 230);
    border-image: initial;
    border-radius: 4px;
    border-left-width: 1px;
    border-right-width: 1px;
    margin-left: 0px;
    margin-right: 0px;
     }
</style>
<!-- 배송지 -->
<div class="profileemail">
	<span><b>등록된 배송지</b></span>
	<span class="delivery" data-toggle="modal" data-target="#moaModal">
		<span class="updatespan">+추가</span>
	</span>
<br><hr>
	<c:if test="${totalCount==0}">
		<img src="../photo/delivery.PNG">
	</c:if>
	<c:forEach var="a" items="${list}" varStatus="i">
		<div class="ListElementComponent__Wrapper-sc-1wy7ql5-0 gxVril" style="border: 1px solid gray; width:600px;">
			<b>${a.name }</b><br>
			<span>${a.addr }</span><span>${a.addr2 }</span><br>
			<span>${a.hp }</span>
		</div>
	</c:forEach>
</div>

 <!-- Moa Modal-->
  <div class="modal fade" id="moaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title" id="exampleModalLabel"><b>배송지 추가</b></h4>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">x</span>
          </button>
        </div>
        <div class="modal-body">
	        <span>받는 사람</span>
	     <!--    <form action="deliveryinsert" method="post"> -->
	        <input type="hidden" name="id" id="id" value="${dto.id }">
	         <input type="text" class="form-control" id="name" placeholder="받는 분 성함을 입력해주세요."
                        name="name" maxlength="20" required="required" >
            <span>주소</span>
            <input type="hidden" id="sample4_postcode" placeholder="우편번호">
            <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소">
			<span id="guide" style="color:#999;display:none"></span><br>
			<input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소">
			
			<span>받는 사람 휴대폰 번호</span>
			<input type="text" class="form-control" id="hp1" name="hp" maxlength="20" style="width:100%; margin-top:10px;" placeholder="받는 분 휴대폰 번호를 입력해주세요.">
            <input type="checkbox" id="pin"> 기본 배송지로 등록   
             <div class="modal-footer">
          		<button class="btn btn-danger insterbtn" style="width:100%" type="submit" data-dismiss="modal">등록완료</button>
       		 </div>
        <!-- </form>  -->
        </div>
        
      </div>
    </div>
  </div>
	 
	  <script type="text/javascript">
	  $("span.delivery").click(function() {
	  		//alert("dfdfd");
	  		$("#myModal").modal();
		});
	  	
	//삭제 버튼 이벤트
		$("button.insterbtn").click(function(){
			
			var check = $("#pin").is(":checked");
			
			var pin
			
			if(check){
				pin = 1;
			}else{
				pin = 0;
			}
			
			//num,pass 읽기
			var id=$("#id").val();
			var name=$("#name").val();
			var addr=$("#sample4_roadAddress").val();
			var addr2=$("#sample4_detailAddress").val();
			var hp=$("#hp1").val();
			//삭제파일 호출
			$.ajax({
				type:"get",
				dataType:"json",
				data:{"id":id,"name":name,"addr":addr,"addr2":addr2,"hp":hp,"pin":pin},
				url:"deliveryinsert",
				success:function(data){
					
				}
			});
		});
	  
	  </script>
	  
	  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>