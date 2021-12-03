<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/setting.css">

<style>
.CommonStyled__CheckedSynced-bpcmiq-31{    
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    color: rgb(255, 87, 87);
    }
    
.Icon__SVGICON-sc-1xkf9cp-01{
     -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    color: rgb(255, 87, 87);
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    display: inline-flex;
    align-self: center;
    }
    
.Icon__SVGICON-sc-1xkf9cp-01 > svg{
 	-webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    color: rgb(255, 87, 87);
    word-break: break-all;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    box-sizing: inherit;
    overflow: hidden;
    width: 1em;
    height: 1em;
    margin: 0px 6px 0px 0px;
    fill: rgb(255, 87, 87);
    top: 0.125em;
    position: relative;
    }
  .Icon__SVGICON-sc-1xkf9cp-01 > path{
   -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    color: rgb(255, 87, 87);
    word-break: break-all;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    fill: rgb(255, 87, 87);
    fill-rule: evenodd;
    clip-rule: evenodd;
    d: path("M 24 43.8 C 13 43.8 4.2 35 4.2 24 C 4.2 13 13 4.2 24 4.2 C 35 4.2 43.8 13 43.8 24 C 43.8 35 35 43.8 24 43.8 Z M 24 2 C 11.9 2 2 11.9 2 24 C 2 36.1 11.9 46 24 46 C 36.1 46 46 36.1 46 24 C 46 11.9 36.1 2 24 2 Z M 24 32.3 C 22.7 32.3 21.8 33.401 21.8 34.6 C 21.8 35.8 22.9 36.8 24.1 36.8 C 25.4 36.8 26.3 35.7 26.3 34.5 C 26.3 33.3 25.3 32.3 24 32.3 Z M 24.1 29.0998 H 24 C 23.3 28.9998 22.7 28.4008 22.9 27.7008 C 22.8825 27.1051 22.8619 26.3713 22.8388 25.5474 C 22.7299 21.6673 22.565 15.7867 22.4 12.8998 V 12.7998 C 22.3 11.8998 23.1 11.2998 24.2 11.2998 C 25.3 11.2998 26 11.8998 26 12.7998 V 12.9998 C 25.8994 14.7101 25.8241 17.5591 25.7486 20.414 C 25.6741 23.2344 25.5994 26.0604 25.5 27.7998 V 27.9008 C 25.4 28.5998 24.8 29.0998 24.1 29.0998 Z");
    box-sizing: inherit;
    }
.CommonStyled__CheckedSynced-bpcmiq-3{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    color: rgb(0, 200, 142);
}

.Icon__SVGICON-sc-1xkf9cp-0{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    color: rgb(0, 200, 142);
    box-sizing: inherit;
    word-break: break-all;
    text-decoration: none;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    display: inline-flex;
    align-self: center;
}

.CommonStyled__CheckedSynced-bpcmiq- svg{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    color: rgb(0, 200, 142);
    word-break: break-all;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    box-sizing: inherit;
    overflow: hidden;
    width: 1em;
    height: 1em;
    margin: 0px 6px 0px 0px;
    fill: rgb(0, 200, 142);
    top: 0.125em;
    position: relative;
}
.CommonStyled__CheckedSynced-bpcmiq- path{
    -webkit-text-size-adjust: 100%;
    -webkit-font-smoothing: antialiased;
    -webkit-box-direction: normal;
    font-family: 'SF Pro Text', 'Helvetica Neue', 'Segoe UI', Arial, 'NotoSansKR', sans-serif;
    font-size: 14px;
    line-height: 24px;
    letter-spacing: -0.015em;
    font-weight: 400;
    color: rgb(0, 200, 142);
    word-break: break-all;
    -webkit-tap-highlight-color: rgba(0,0,0,.1);
    fill: rgb(0, 200, 142);
    fill-rule: evenodd;
    clip-rule: evenodd;
    d: path("M 41.6 8 L 18.9 30.8 L 6.2 19 L 2 23.5 L 19.1 39.4 L 46 12.4 L 41.6 8 Z");
    box-sizing: inherit;
}
</style>

 <script type="text/javascript">
 
 function setThumbnail(event) {
	 var reader = new FileReader();
	 
	 reader.onload = function(event) { 
		 $(".img2").attr("src", event.target.result);
		 }; 
		 reader.readAsDataURL(event.target.files[0]); 
		 }

 
 $(function(){
	 $('#Email_div').hide();
	 
	 
	 $("span.updatespan_email").click(function(){
			$("div.profileemail").show();
			$('#Email_div').hide();
		});
	 
		$('div.ptofilephotoupdate').hide();
		$("span.updatePhoto").click(function(){
			$("div.ptofilephotoupdate").show();
			$("div.profilephoto").hide();
		});
		
		$("span.close1").click(function(){
			$("div.profilephoto").show();
			$("div.ptofilephotoupdate").hide();
		});
		
		$('div.ptofilenameupdate').hide();
		$("span.updateName").click(function(){
			$("div.ptofilenameupdate").show();
			$("div.profilename").hide();
		});
		
		$("span.close2").click(function(){
			$("div.profilename").show();
			$("div.ptofilenameupdate").hide();
		});

		
		$('div.ptofileurlupdate').hide();
		$("span.updateUrl").click(function(){
			$("div.ptofileurlupdate").show();
			$("div.profileurl").hide();
		});
		
		$("span.close3").click(function(){
			$("div.profileurl").show();
			$("div.ptofileurlupdate").hide();
		});
		
		$('div.introduceupdate').hide();
		$("span.updateIntroduce").click(function(){
			$("div.introduceupdate").show();
			$("div.introduce").hide();
		});
		
		$("span.close4").click(function(){
			$("div.introduce").show();
			$("div.introduceupdate").hide();
		});
		
		$('div.privacyupdate').hide();
		$("span.updatePrivacy").click(function(){
			$("div.privacyupdate").show();
			$("div.privacy").hide();
		});
		
		$("span.close5").click(function(){
			$("div.privacy").show();
			$("div.privacyupdate").hide();
		});
		
		$('div.ptofileemailupdate').hide();
		$("span.updateEmail").click(function(){
			$("div.ptofileemailupdate").show();
			$("div.profileemail").hide();
		});
		
		$("span.close6").click(function(){
			$("div.profileemail").show();
			$("div.ptofileemailupdate").hide();
		});
		
		$('div.passupdate').hide();
		$("span.updatePass").click(function(){
			$("div.passupdate").show();
			$("div.password").hide();
		});
		
		$("span.close7").click(function(){
			$("div.password").show();
			$("div.passupdate").hide();
		});
		
		$('div.hpupdate').hide();
		$("span.updateHp").click(function(){
			$("div.hpupdate").show();
			$("div.hp").hide();
		});
		
		$("span.close8").click(function(){
			$("div.hp").show();
			$("div.hpupdate").hide();
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
		
		 $("#emailupdate").blur(function(){
				var mbrEmail = $("#emailupdate").val();   // email 값 입력
				var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i.test(mbrEmail); // email체크
				
				var email=$(this).val().trim();//입력값
				if(email.trim().length==0){
					$("b.emailmsg").html("<font color='red'>이메일을 입력해주세요</font>");
					return;
				}
				
				if(!(regExp)){
					$("b.emailmsg").html("<font color='red'>이메일 형식으로 작성해주세요</font>");
					$("#emailupdate").val("");
					$("#emailupdate").focus();
				}else{
					$("b.emailmsg").html("");
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
      <li class="active"><a href="#tab-1" tab-id="1" ripple="ripple" ripple-color="#FFF">계정</a></li>
      <li><a href="#tab-2" tab-id="2" ripple="ripple" ripple-color="#FFF">결제수단</a></li>
      <li><a href="#tab-3" tab-id="3" ripple="ripple" ripple-color="#FFF">배송지</a></li>
    </ul>
  </div>
  
  <div class="tabs-content">
    <div tab-id="1" class="tab active">
		<%@ include file="/WEB-INF/mysetting/account.jsp" %>
    
    </div>
    <div tab-id="2" class="tab">
    </div>
    
    <div tab-id="3" class="tab">
		<%@ include file="/WEB-INF/mysetting/delivery.jsp" %>
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
