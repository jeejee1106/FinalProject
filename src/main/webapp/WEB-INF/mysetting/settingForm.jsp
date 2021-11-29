<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/setting.css">

 <script type="text/javascript">
 
 function setThumbnail(event) {
	 var reader = new FileReader();
	 
	 reader.onload = function(event) { 
		 $(".img2").attr("src", event.target.result);
		 }; 
		 reader.readAsDataURL(event.target.files[0]); 
		 }

 
 $(function(){
	 
	 
		$('div.ptofilephotoupdate').hide();
		$("span.updatePhoto").click(function(){
			$("div.ptofilephotoupdate").show();
			$("div.profilephoto").hide();
		});
		
		$('div.ptofilenameupdate').hide();
		$("span.updateName").click(function(){
			$("div.ptofilenameupdate").show();
			$("div.profilename").hide();
		});
		

		
		$('div.ptofileurlupdate').hide();
		$("span.updateUrl").click(function(){
			$("div.ptofileurlupdate").show();
			$("div.profileurl").hide();
		});
		
		$('div.introduceupdate').hide();
		$("span.updateIntroduce").click(function(){
			$("div.introduceupdate").show();
			$("div.introduce").hide();
		});
		
		$('div.privacyupdate').hide();
		$("span.updatePrivacy").click(function(){
			$("div.privacyupdate").show();
			$("div.privacy").hide();
		});
		
		$('div.ptofileemailupdate').hide();
		$("span.updateEmail").click(function(){
			$("div.ptofileemailupdate").show();
			$("div.profileemail").hide();
		});
		
		$('div.passupdate').hide();
		$("span.updatePass").click(function(){
			$("div.passupdate").show();
			$("div.password").hide();
		});
		
		$('div.hpupdate').hide();
		$("span.updateHp").click(function(){
			$("div.hpupdate").show();
			$("div.hp").hide();
		});
		
		$("span.memberDelete").click(function(){
			location.href="leave";
		});
		
		
		
		$("#pass1").blur(function(){
			
			var pass=$(this).val().trim();//입력값
			if(pass.trim().length==0){
				$("b.pass1msg").html("<font color='red'>현재 비밀번호를 입력하세요</font>");
				return;
			}
			var mbrPwd = $("#pass1").val();  // pw 입력
			
			var check1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{10,12}$/.test(mbrPwd);   //영문,숫자
			var check2 = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{10,12}$/.test(mbrPwd);  //영문,특수문자
			var check3 = /^(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{10,12}$/.test(mbrPwd);  //특수문자, 숫자
			
			
			if(!(check1||check2||check3)){
				$("b.pass1msg").html("<font color='red'>10자~12자리의 영문(대소문자)+숫자+특수문자 중 2종류 이상을 조합하여 사용할 수 있습니다.</font>");
				$("#pass1").val("");
				$("#pass1").focus();
			}else if(/(\w)\1\1/.test(mbrPwd)){
				$("b.pass1msg").html("<font color='red'>같은 문자를 3번 이상 사용하실 수 없습니다.</font>");
				$("#pass1").val("");
				$("#pass1").focus();
			}else{
				$("b.pass1msg").html("");
			}
				
			
		});
		
		$("#pass").blur(function(){
			
			var pass=$(this).val().trim();//입력값
			if(pass.trim().length==0){
				$("b.passmsg").html("<font color='red'>패스워드를 입력해주세요</font>");
				return;
			}
			var mbrPwd = $("#pass").val();  // pw 입력
			
			var check1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{10,12}$/.test(mbrPwd);   //영문,숫자
			var check2 = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{10,12}$/.test(mbrPwd);  //영문,특수문자
			var check3 = /^(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{10,12}$/.test(mbrPwd);  //특수문자, 숫자
			
			
			if(!(check1||check2||check3)){
				$("b.passmsg").html("<font color='red'>10자~12자리의 영문(대소문자)+숫자+특수문자 중 2종류 이상을 조합하여 사용할 수 있습니다.</font>");
				$("#pass").val("");
				$("#pass").focus();
			}else if(/(\w)\1\1/.test(mbrPwd)){
				$("b.passmsg").html("<font color='red'>같은 문자를 3번 이상 사용하실 수 없습니다.</font>");
				$("#pass").val("");
				$("#pass").focus();
			}else{
				$("b.passmsg").html("<font color='blue'>사용 가능한 비밀번호입니다.</font>");
			}
				
			
		});
		$("#pass2").blur(function(){
			
			var pass2=$(this).val().trim();//입력값
			if(pass2.trim().length==0){
				$("b.passmsg2").html("<font color='red'>패스워드를 입력해주세요</font>");
				return;
			}
			var pass = $("#pass").val();  // pw 입력
			var pass2 = $("#pass2").val();  // pw 입력
			
			
			
			if(pass!=pass2){
				$("b.passmsg2").html("<font color='red'>비밀번호가 서로 다릅니다.</font>");
				$("#pass2").val("");
				$("#pass2").focus();
			}else{
				$("b.passmsg2").html("");  
			}
				
			
		});
		
		$("#hp").blur(function(){
			
			var hp=$(this).val().trim();//입력값
			if(hp.trim().length==0){
				$("b.hpmsg").html("<font color='red'>핸드폰 번호를 입력해주세요</font>");
				return;
			}
			
			var mbrhp = $("#hp").val();  
			var regExp = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/.test(mbrhp);;
			
			
			
			if(!(regExp)){
				$("b.hpmsg").html("<font color='red'>핸드폰 번호를 확인해주세요</font>");
				$("#hp").val("");
				$("#hp").focus();
			}else{
				$("b.hpmsg").html("");  
			}
				
			
		});
		
	});
 
 
 
	function lastcheck(f)
	{
		
		if($("#pass1").val() != $("#passcheck").val()){
			$("b.pass1msg").html("<font color='red'>현재 비밀번호가 일치하지 않습니다.</font>");
			$("#pass1").val("");
			return false;
		}
			return true;
		
	}
 </script>

<div class="tabs">
  <div class="tabs-header">
    <div class="border"></div>
    <ul>
      <li class="active"><a href="#tab-1" tab-id="1" ripple="ripple" ripple-color="#FFF">프로필</a></li>
      <li><a href="#tab-2" tab-id="2" ripple="ripple" ripple-color="#FFF">계정</a></li>
      <li><a href="#tab-3" tab-id="3" ripple="ripple" ripple-color="#FFF">결제수단</a></li>
      <li><a href="#tab-4" tab-id="4" ripple="ripple" ripple-color="#FFF">배송지</a></li>
      <li><a href="#tab-5" tab-id="5" ripple="ripple" ripple-color="#FFF">알림</a></li>
    </ul>
  </div>
  
  <div class="tabs-content">
    <div tab-id="1" class="tab active">
    	<div class="profilephoto">
    		<span><b>프로필 사진</b></span>
    		<span class="updatePhoto">
    			<span class="updatespan">변경</span>
    		</span><br>
    		<c:if test="${dto.photo == null}">
    			<img class="img1" src="../photo/basic.jpg"/>
    		</c:if>
    		<c:if test="${dto.photo != null}">
    			<img class="img1" src="../photo/${dto.photo }"/>
    		</c:if>
    		<hr>
    	</div>
    	
    	<div class="ptofilephotoupdate">
    		<span><b>프로필 사진</b></span>
    		<span onclick="window.location.reload()">
    			<span class="updatespan">취소</span>
    		</span><br>
    		<c:if test="${dto.photo == null}">
    			<img class="img2" align="left" src="../photo/basic.jpg"/>
    		</c:if>
    		<c:if test="${dto.photo != null}">
    			<img class="img2" align="left" src="../photo/${dto.photo }"/>
    		</c:if>

    		<form action="updatephoto" method="post" enctype="multipart/form-data">
    		<input type="hidden" name="num" value="${dto.num}">
			<p style="margin-left: 20px; margin-top: 10px;">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn btn-default" value="파일 업로드" onclick=document.all.file.click();> 
			<input type="file" onchange="setThumbnail(event);" name="file" id="file" style="display: none;"/><br>
	&nbsp;&nbsp;&nbsp;&nbsp;<b>250 x 250 픽셀에 최적화되어 있으며, 10Mb 이하의 JPG, GIF, PNG 파일을 지원합니다.</b></p>
			<button type="submit" class="btn btn-danger" style="margin-top:10px;">저장</button>
			</form>
			<hr>
    	</div>
    	
    	<!-- 이름 -->
    	<div class="profilename">
    		<span><b>이름</b></span>
    		<span class="updateName">
    			<span class="updatespan">변경</span>
    		</span><br>
    			<div style="margin-top:10px;">${dto.name}</div>
    		<hr>
    	</div>
    	
    	<div class="ptofilenameupdate">
    		<span><b>이름</b></span>
    		<span onclick="window.location.reload()">
    			<span class="updatespan">취소</span>
    		</span><br>
    		<form action="updatename" method="post">
    			<input type="hidden" name="num" value="${dto.num}">
				<input type="text" class="form-control" name="name" maxlength="20" style="width:50%; margin-top:10px;" value="${dto.name}"> 		
				<button type="submit" class="btn btn-danger" style="margin-top:10px;">저장</button>	
			</form>
			<hr>
    	</div>
    	
    	<!--  url -->
    	<div class="profileurl">
    		<span><b>사용자(URL)</b></span>
    		<span class="updateUrl">
    			<span class="updatespan">변경</span>
    		</span><br>
    			<div style="margin-top:10px;">http://localhost:9002/profile/<b>${dto.url }</b></div>
    		<hr>
    	</div>
    	
    	<div class="ptofileurlupdate">
    		<span><b>사용자(URL)</b></span>
    		<span onclick="window.location.reload()">
    			<span class="updatespan">취소</span>
    		</span><br>
			
			<form action="updateurl" method="post">
				<input type="hidden" name="num" value="${dto.num}">
				<input type="text" class="form-control" name="url" style="width:50%; margin-top:10px;" value="${dto.url }">
				<div style="color:gray; margin-top:10px;">사용자 이름은 회원님의 프로필 주소로 활용됩니다. 예 ) http://localhost:9002/profile/사용자이름</div>
				<button type="submit" class="btn btn-danger" style="margin-top:10px;">저장</button>
			</form>
			<hr>
    	</div>    	
    	
		
		<!--  소개 -->
    	<div class="introduce">
    		<span><b>소개</b></span>
    		<span class="updateIntroduce">
    			<span class="updatespan">변경</span>
    		</span><br>
    		<div style="margin-top:10px; color:gray;">
		    	<c:if test="${dto.introduce == null}">
		    		등록된 소개가 없습니다.
		    	</c:if>
		    	<c:if test="${dto.introduce != null}">
		    		<div style="margin-top:10px;">${dto.introduce}</div>
		    	</c:if>
	    	</div>
    		<hr>
    	</div>
    	
    	<div class="introduceupdate">
    		<span><b>소개</b></span>
    		<span onclick="window.location.reload()">
    			<span class="updatespan">취소</span>
    		</span><br>
			<form action="updateintroduce" method="post">
				<input type="hidden" name="num" value="${dto.num}">
				<textarea class="form-control" required="required" style="width:100%; height:200px; margin-top:10px;" name="introduce" placeholder="자기소개를 입력해주세요.">${dto.introduce}</textarea>		
				<button type="submit" class="btn btn-danger" style="margin-top:10px;">저장</button>
			</form>
			<hr>
    	</div>
    	
    	<!--  프라이버시 -->
    	<div class="privacy">
    		<span><b>프라이버시</b></span>
    		<span class="updatePrivacy">
    			<span class="updatespan">변경</span>
    		</span><br>
    		<div style="margin-top:10px; color:gray;">
		    	<c:if test="${dto.privacy == null}">
		    		<span style="margin-top:10px;">후원한 프로젝트 목록을 공개합니다.</span>
		    	</c:if>
		    	<c:if test="${dto.privacy != null}">
		    		<div style="margin-top:10px;">후원한 프로젝트 목록을 공개하지 않습니다.</div>
		    	</c:if>
	    	</div>
    		<hr>
    	</div>
    	
    	<div class="privacyupdate">
    		<span><b>프라이버시</b></span>
    		<span onclick="window.location.reload()">
    			<span class="updatespan">취소</span>
    		</span><br>
			
			<input type="checkbox"><span style="margin-top:10px;">후원한 프로젝트 목록을 공개합니다.</span><br>
			<button type="button" class="btn btn-danger" style="margin-top:10px;">저장</button>
			<hr>
    	</div>

    
    </div>
    <div tab-id="2" class="tab">
   		<%@ include file="/WEB-INF/mysetting/account.jsp" %>
    </div>
    
    <div tab-id="3" class="tab">

    </div>
    
    <div tab-id="4" class="tab">
 		<%@ include file="/WEB-INF/mysetting/delivery.jsp" %>

     </div>
    
    <div tab-id="5" class="tab">
    5. Donec ullamcorper nulla non metus auctor fringilla. Aenea

    </div>
  </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript">
$(document).ready(function () {

  // Intial Border Position
  var activePos = $('.tabs-header .active').position();

  // Change Position
  function changePos() {

    // Update Position
    activePos = $('.tabs-header .active').position();

    // Change Position & Width
    $('.border').stop().css({
      left: activePos.left,
      width: $('.tabs-header .active').width()
    });
  }

  changePos();

  // Intial Tab Height
  var tabHeight = $('.tab.active').height();

  // Animate Tab Height
  function animateTabHeight() {

    // Update Tab Height
    tabHeight = $('.tab.active').height();

  }

  animateTabHeight();

  // Change Tab
  function changeTab() {
    var getTabId = $('.tabs-header .active a').attr('tab-id');

    // Remove Active State
    $('.tab').stop().fadeOut(300, function () {
      // Remove Class
      $(this).removeClass('active');
    }).hide();

    $('.tab[tab-id=' + getTabId + ']').stop().fadeIn(300, function () {
      // Add Class
      $(this).addClass('active');

      // Animate Height
      animateTabHeight();
    });
  }

  // Tabs
  $('.tabs-header a').on('click', function (e) {
    e.preventDefault();

    // Tab Id
    var tabId = $(this).attr('tab-id');

    // Remove Active State
    $('.tabs-header a').stop().parent().removeClass('active');

    // Add Active State
    $(this).stop().parent().addClass('active');

    changePos();

    // Update Current Itm
    tabCurrentItem = tabItems.filter('.active');

    // Remove Active State
    $('.tab').stop().fadeOut(300, function () {
      // Remove Class
      $(this).removeClass('active');
    }).hide();

    // Add Active State
    $('.tab[tab-id="' + tabId + '"]').stop().fadeIn(300, function () {
      // Add Class
      $(this).addClass('active');

    });
  });

  // Tab Items
  var tabItems = $('.tabs-header ul li');

  // Tab Current Item
  var tabCurrentItem = tabItems.filter('.active');

  // Next Button
  $('#next').on('click', function (e) {
    e.preventDefault();

    var nextItem = tabCurrentItem.next();

    tabCurrentItem.removeClass('active');

    if (nextItem.length) {
      tabCurrentItem = nextItem.addClass('active');
    } else {
      tabCurrentItem = tabItems.first().addClass('active');
    }

    changePos();
    changeTab();
  });

  // Prev Button
  $('#prev').on('click', function (e) {
    e.preventDefault();

    var prevItem = tabCurrentItem.prev();

    tabCurrentItem.removeClass('active');

    if (prevItem.length) {
      tabCurrentItem = prevItem.addClass('active');
    } else {
      tabCurrentItem = tabItems.last().addClass('active');
    }

    changePos();
    changeTab();
  });

  // Ripple
  $('[ripple]').on('click', function (e) {
    var rippleDiv = $('<div class="ripple" ></div>'),
      rippleOffset = $(this).offset(),
      rippleY = e.pageY - rippleOffset.top,
      rippleX = e.pageX - rippleOffset.left,
      ripple = $('.ripple');

    rippleDiv.css({
      top: rippleY - (ripple.height() / 2),
      left: rippleX - (ripple.width() / 2),
      background: $(this).attr("ripple-color")
    }).appendTo($(this));

    window.setTimeout(function () {
      rippleDiv.remove();
    }, 1500);
  });
});
</script>
