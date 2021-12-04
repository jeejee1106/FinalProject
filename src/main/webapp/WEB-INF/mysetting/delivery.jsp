<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/css/delivery.css">

<style>
.drop{
	height:30px;
	padding:5px; 5px; 5px; 5px;
}
.drop:hover{
	background-color: silver;
}
</style>

	<div class="Container__ContainerComponent-sc-1ey2h1l-0 kUAclQ StyledTBB__column2Wrapper-trchgn-2 CommonStyled__Wrapper-bpcmiq-0 gYkBev cwoqcI">
		<div class="container">
			<div class="SettingForm__Wrapper-sc-169upu5-0 jKMMYF forms">
				<div class="SettingForm__FormHeader-sc-169upu5-1 jzTvBl fnt-p1">
					<p class="SettingForm__FormTitle-sc-169upu5-2 jKbeSH">등록된 배송지</p>
					<button class="PlainLink__StyledLink-qbfirs-0 iFKMSH delivery"
				data-toggle="modal" data-target="#moaModal" color="sub0180" type="button">+ 추가</button>
				</div>
			<c:if test="${totalCount==0}">
				<img src="../photo/delivery.PNG">
			</c:if>
			<c:forEach var="a" items="${list}" varStatus="i">
				<div class="RoundedWrapper__Wrapper-a7usag-0 qlVky">
					<div class="ListElementComponent__Wrapper-sc-1wy7ql5-0 gxVril" style="padding:20px;10px;20px;10px;"
						type="address">
							<div>
								<b>${a.name }</b>
								<c:if test="${a.pin==1 }">
								<span type="isDefault" class="Label__Wrapper-ac7bbp-0 gWxYCF CommonStyled__DefaultLabel-bpcmiq-12 hSXOrt">기본</span>
								</c:if>
								<img src="../photo/dropd.PNG" class="dropdown-toggle" data-toggle="dropdown" style="float:right;">
							    <div class="dropdown-menu">
								     <div class="drop">
								     	<div class="d_update" num="${a.num }" data-toggle="modal" data-target="#md" style="cursor:pointer;">수정</div>
								     </div>
								     <div class="drop">
								     	<div class="d_delete" num="${a.num }" style="cursor:pointer;">삭제</div>
									 </div>
								
								</div>
								
							</div>
							<div class="fnt-p3 tbb-clr-gray-80">
								${a.addr } ${a.addr2 }<br>${a.hp }
							</div>
					</div>
				</div>
				<br>
				</c:forEach>
		</div>
		</div>
		
		
		<div class="CommonStyled__SettingPageDescBox-bpcmiq-1 cwYHpD">
			<p class="fnt-p1 tbb-clr-gray-80 fnt-st-bd">배송지를 삭제하면 예약된 후원의 배송지
				정보도 삭제되나요?</p>
			<div class="fnt-p3 tbb-clr-gray-60">
				현재 후원하신 프로젝트에 등록된 배송지가 삭제되거나 변경되진 않습니다. 이를 변경하시려면 후원현황에서
				변경해주세요.&nbsp;<span color="sub0180"
					class="PlainNavLink__Wrapper-sc-9qhsie-0 kZoYUd"><a
					href="/pledges">내 후원현황 바로가기</a></span>
			</div>
		</div>
		
		
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
	         <input type="text" class="form-control" style="margin-top:10px; width:60%; height:40px;" id="name" placeholder="받는 분 성함을 입력해주세요."
                        name="name" maxlength="20" required="required" >
              <b class="namemsg"></b><br>
            <span>주소</span>
            <input type="hidden" id="sample4_postcode" placeholder="우편번호">
            <span class="glyphicon glyphicon-search" style="margin-top:30px; cursor:pointer;" onclick="sample4_execDaumPostcode()"></span><br>
			<input type="button" class="form-control addr" style="margin-top:10px; text-align:left; height:40px;" id="sample4_roadAddress" required="required" onclick="sample4_execDaumPostcode()" placeholder="도로명주소">
			<span id="guide" style="color:#999;display:none"></span><br>
			<input type="text" class="form-control addr2" id="sample4_detailAddress" style="margin-top:-10px; margin-bottom:30px; height:40px;" required="required" placeholder="상세주소">
			
			<span>받는 사람 휴대폰 번호</span>
			<input type="text" class="form-control" id="hp1" name="hp" maxlength="11" style="width: 100%; margin-top: 10px; height:40px;" placeholder="받는 분 휴대폰 번호를 입력해주세요.">
            <b class="hp1msg"></b><br>
            <input type="checkbox" id="pin" style="margin-top:30px; margin-bottom:20px;"> 기본 배송지로 등록   
             <div class="modal-footer">
          		<button class="btn btn-danger insterbtn" style="width:100%" type="submit" data-dismiss="modal">등록완료</button>
       		 </div>
        <!-- </form>  -->
        </div>
        
      </div>
    </div>
  </div>
  
  
   <!-- Moa Modal2-->
  <div class="modal fade" id="md" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
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
	        <input type="hidden"  id="updateid" value="${dto.id }">
	        <input type="hidden"  id="num" value="${dto.num }">
	         <input type="text" class="form-control" style="margin-top:10px; width:60%; height:40px;" id="updatename" placeholder="받는 분 성함을 입력해주세요."
                        maxlength="20" required="required" value="">
                        <b class="updatenamemsg"></b><br>
            <span>주소</span>
            <input type="hidden" id="sample4_postcode2" placeholder="우편번호">
            <span class="glyphicon glyphicon-search" style="margin-top:30px; cursor:pointer;" onclick="sample4_execDaumPostcode()"></span><br>
			<input type="button" class="form-control aaddr" required="required" value="" style="margin-top:10px; text-align:left; height:40px;" onclick="sample4_execDaumPostcode()" id="sample4_roadAddress2" placeholder="도로명주소">
			<span id="guide" style="color:#999;display:none"></span><br>
			<input type="text" required="required" class="form-control aaddr2" id="sample4_detailAddress2" value="" style="margin-top:-10px; margin-bottom:30px; height:40px;" placeholder="상세주소">
			
			<span>받는 사람 휴대폰 번호</span>
			<input type="text" class="form-control" id="updatehp1" value="" maxlength="11" style="width: 100%; margin-top: 10px; height:40px;" placeholder="받는 분 휴대폰 번호를 입력해주세요.">
			<b class="updatehp1msg"></b><br>
            <input type="checkbox" id="pin1" style="margin-top:30px; margin-bottom:20px;"> 기본 배송지로 등록   
             <div class="modal-footer">
          		<button class="btn btn-danger updatebtn" style="width:100%" type="submit" data-dismiss="modal">수정완료</button>
       		 </div>
        <!-- </form>  -->
        </div>
        
      </div>
    </div>
  </div>














<script type="text/javascript">
	

		$("div.d_update").click(function() {
			var num = $(this).attr("num");
		/*	var addr = $("#aaddr").val();
			var addr2 = $("#aaddr2").val();
			var hp = $("#ahp").val();
			var pin = $("#apin").val();
			$("#updatename").val(name);
			$(".aaddr").val(addr);
			$(".aaddr2").val(addr2);
			$("#updatehp1").val(hp);
			if(pin==1){
				$("#pin1").prop("checked", true);
			}*/
			$("b.updatehp1msg").html("");  
			$("b.updatenamemsg").html(""); 
			
			
			
			$.ajax({
				type:"get",
				dataType:"json",
				data:{"num":num},
				url:"deliveryupdate",
				success:function(data){
					$("#num").val(data.num);
					$("#updatename").val(data.name);
					$(".aaddr").val(data.addr);
					$(".aaddr2").val(data.addr2);
					$("#updatehp1").val(data.hp);
					if(data.pin=="1"){
						$("#pin1").prop("checked", true);
					}
				}
			});
			
		});
	

	  $("button.delivery").click(function() {
		  $("#name").val("");
			$(".addr").val("");
			$(".addr2").val("");
			$("#hp1").val("");
			$("b.namemsg").html("");
			$("b.hp1msg").html(""); 
		});
	  
	  
	//수정 버튼 이벤트
		$("button.updatebtn").click(function(){
			
			
			var hp=$("#updatehp1").val().trim();//입력값
			if(hp.trim().length==0){
				$("b.updatehp1msg").html("<font color='red'>핸드폰 번호를 입력해주세요</font>");
				return false;
			}
			
			var name=$("#updatename").val().trim();//입력값
			if(name.trim().length==0){
				$("b.updatenamemsg").html("<font color='red'> 비워두시면 안됩니다.</font>");
				return false;
			}else{
				$("b.updatenamemsg").html("");  
			}
			
			var mbrhp = $("#updatehp1").val();  
			var regExp = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/.test(mbrhp);;
			
			
			
			if(!(regExp)){
				$("b.updatehp1msg").html("<font color='red'>핸드폰 번호를 확인해주세요</font>");
				$("#updatehp1").val("");
				$("#updatehp1").focus();
				return false;
			}else{
				$("b.updatehp1msg").html("");  
			}
			
			
			var check = $("#pin1").is(":checked");
			var pin
			if(check){
				pin = 1;
			}else{
				pin = 0;
			}
			
			//num,pass 읽기
			var num = $("#num").val();
			var id=$("#updateid").val();
			var name=$("#updatename").val();
			var addr=$(".aaddr").val();
			var addr2=$(".aaddr2").val();
			var hp=$("#updatehp1").val();
			//삭제파일 호출
			$.ajax({
				type:"get",
				dataType:"json",
				data:{"num":num,"id":id,"name":name,"addr":addr,"addr2":addr2,"hp":hp,"pin":pin},
				url:"updatedelivery",
				success:function(data){
					location.reload();
				},error:function(error){
					//$("#d_content").load('/setting/main #d_content');
					alert("수정되었습니다.");
					location.reload();
				}
			});
		});
	
		$("div.d_delete").click(function() {
			var num = $(this).attr("num");
			$.ajax({
				type:"get",
				dataType:"json",
				data:{"num":num},
				url:"deliverydelete",
				success:function(data){
					location.reload();
				},error:function(error){
				//	$("#d_content").load('/setting/main #d_content');
					alert("삭제되었습니다.");
					location.reload();
				}
			});
			
		});
		
	  	
		//insert 버튼 이벤트
		$("button.insterbtn").click(function(){
			
			var hp=$("#hp1").val().trim();//입력값
			if(hp.trim().length==0){
				$("b.hp1msg").html("<font color='red'>핸드폰 번호를 입력해주세요</font>");
				return false;
			}
			
			var name=$("#name").val().trim();//입력값
			if(name.trim().length==0){
				$("b.namemsg").html("<font color='red'> 비워두시면 안됩니다.</font>");
				return false;
			}else{
				$("b.namemsg").html("");  
			}
			
			var mbrhp = $("#hp1").val();  
			var regExp = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/.test(mbrhp);;
			
			
			
			if(!(regExp)){
				$("b.hp1msg").html("<font color='red'>핸드폰 번호를 확인해주세요</font>");
				$("#hp1").val("");
				$("#hp1").focus();
				return false;
			}else{
				$("b.hp1msg").html("");  
			}
			
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
					alert("인서트 성공");
					location.reload();
				},error:function(error){
				//	$("#d_content").load('/setting/main #d_content');
					location.reload();
				}
			});
		});
	  
	  </script>
	  

		<script
			src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
		</script>
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
                document.getElementById("sample4_roadAddress2").value = roadAddr;
                

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















