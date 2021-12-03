<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

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
    		<span class="close1">
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
    		<span class="close2">
    			<span class="updatespan">취소</span>
    		</span><br>
    		<form action="updatename" method="post">
    			<input type="hidden" name="num" value="${dto.num}">
				<input type="text" class="form-control" name="name" maxlength="20" required="required" style="width:50%; margin-top:10px;" value="${dto.name}"> 		
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
    		<span class="close3">
    			<span class="updatespan">취소</span>
    		</span><br>
			
			<form action="updateurl" method="post">
				<input type="hidden" name="num" value="${dto.num}">
				<input type="text" required="required" class="form-control" name="url" style="width:50%; margin-top:10px;" value="${dto.url }">
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
    		<span class="close4">
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
    		<span class="close5">
    			<span class="updatespan">취소</span>
    		</span><br>
			
			<input type="checkbox"><span style="margin-top:10px;">후원한 프로젝트 목록을 공개합니다.</span><br>
			<button type="button" class="btn btn-danger" style="margin-top:10px;">저장</button>
			<hr>
    	</div>


<!-- 이메일 -->
<div class="profileemail">
	<span><b>이메일</b></span> <span class="updateEmail">
	<span class="updatespan">변경</span>
	</span><br>
	<div style="margin-top: 10px;">${dto.email}</div>
	
	<c:if test="${dto.auth_status == 0 }">
	<div class="CommonStyled__CheckedSynced-bpcmiq-31 cIhcRD">
		<div name="error-1" class="Icon__SVGICON-sc-1xkf9cp-01 ccxeYs baseline">
			<svg viewBox="0 0 48 48">
				<path fill-rule="evenodd" clip-rule="evenodd"
					d="M24 43.8C13 43.8 4.2 35 4.2 24C4.2 13 13 4.2 24 4.2C35 4.2 43.8 13 43.8 24C43.8 35 35 43.8 24 43.8ZM24 2C11.9 2 2 11.9 2 24C2 36.1 11.9 46 24 46C36.1 46 46 36.1 46 24C46 11.9 36.1 2 24 2ZM24 32.3C22.7 32.3 21.8 33.401 21.8 34.6C21.8 35.8 22.9 36.8 24.1 36.8C25.4 36.8 26.3 35.7 26.3 34.5C26.3 33.3 25.3 32.3 24 32.3ZM24.1 29.0998H24C23.3 28.9998 22.7 28.4008 22.9 27.7008C22.8825 27.1051 22.8619 26.3713 22.8388 25.5474C22.7299 21.6673 22.565 15.7867 22.4 12.8998V12.7998C22.3 11.8998 23.1 11.2998 24.2 11.2998C25.3 11.2998 26 11.8998 26 12.7998V12.9998C25.8994 14.7101 25.8241 17.5591 25.7486 20.414C25.6741 23.2344 25.5994 26.0604 25.5 27.7998V27.9008C25.4 28.5998 24.8 29.0998 24.1 29.0998Z"></path></svg>
		</div>
		미인증 이메일입니다.
	</div>
	</c:if>
	
	<c:if test="${dto.auth_status == 1 }">
	<div class="CommonStyled__CheckedSynced-bpcmiq-3 eYgKHf">
		<div name="check" class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs baseline">
			<svg viewBox="0 0 48 48">
				<path fill-rule="evenodd" clip-rule="evenodd"
					d="M41.6 8L18.9 30.8L6.2 19L2 23.5L19.1 39.4L46 12.4L41.6 8Z"></path></svg>
		</div>
		인증된 이메일입니다.
	</div>
	</c:if>
	<hr>
</div>

<div class="ptofileemailupdate">
	<span><b>이메일</b></span>
	<span class="close6">
		<span class="updatespan">취소</span>
	</span><br>
<!-- 	<form action="mail" method="post" onsubmit="return emailcheck()"> -->
		<input type="hidden" name="auth_status" id="auth_status" value="${dto.auth_status}">
		<input type="hidden" name="num" id="num" value="${dto.num}">
		<input type="text" class="form-control" id="emailupdate" name="email" maxlength="50"
			style="width: 100%; margin-top: 10px;" required="required" value="${dto.email}">
		<b class="emailmsg"></b><br>
		<button type="submit" class="btn btn-danger emailupdatebtn" style="margin-top: 10px;">인증메일 전송</button>
	<!--</form> -->
	<hr>
</div>

<div class="Email__EmailNeedConfirm-p3qd8f-0 duKYnV" id="Email_div">
	<span><b>이메일</b></span>
	<span class="close6">
		<span class="updatespan_email">취소</span>
	</span><br>
	<div style="margin-top:20px; margin-bottom:20px;">
	신청하신 이메일로 인증메일이 발송되었습니다. 이메일 확인 후 인증 링크를 클릭하시면
	이메일 변경이 완료되며, 변경하신 이메일로 로그인하실 수 있습니다.
	</div>
	<hr>
</div>

<script>
//수정 버튼 이벤트
$("button.emailupdatebtn").click(function(){
	
	//num,pass 읽기
	var auth_status = $("#auth_status").val();
	var num = $("#num").val();
	var email = $("#emailupdate").val();
	
	if(auth_status == 1){
		$("b.emailmsg").html("<font color='red'>이미 인증된 이메일입니다.</font>");
		return;
	}else{
	//삭제파일 호출
	$.ajax({
		type:"post",
		dataType:"json",
		data:{"num":num,"email":email},
		url:"mail",
		success:function(data){
		},error:function(error){
			//$("#d_content").load('/setting/main #d_content');
			$("#Email_div").show();
			$("div.ptofileemailupdate").hide();
		}
	});
	}
});
</script>

 
<!-- 비밀번호 -->
<div class="password">
	<span><b>비밀번호</b></span> <span class="updatePass">
	<span class="updatespan">변경</span>
	</span><br>
	<hr>
</div>

<div class="passupdate">
	<span><b>비밀번호</b></span> 
	<span class="close7">
		<span class="updatespan">취소</span>
	</span><br>
	<form action="updatepass" method="post" onsubmit="return lastcheck(this)">
		<input type="hidden" name="num" value="${dto.num}">
		<div class="form-group">
			<div style="margin-top:10px;">현재 비밀번호</div>
			<input id="passcheck" type="hidden" name="passcheck" value="${dto.pass}">
			<input type="password" style="margin-top:10px;"
				class="form-control" id="pass1" name="pass1" maxlength="20"
				placeholder="현재 비밀번호" required="required">
				<b class="pass1msg"></b>
				<div style="margin-top:8px;">비밀번호가 기억나지 않나요?<a href="">비밀번호 초기화</a></div>
		</div>

		<div class="form-group">
			<div>변경할 비밀번호</div>
			<input type="password" style="margin-top:10px;"
				class="form-control" id="pass" name="pass" maxlength="20"
				placeholder="변경할 비밀번호" required="required">
				<b class="passmsg"></b>
		</div>
		<div class="form-group">
			<div>비밀번호 확인</div> <input style="margin-top:10px;"
				type="password" class="form-control" name="pass2" id="pass2"
				maxlength="20" placeholder="변경할 비밀번호 확인"
				required="required">
				<b class="passmsg2"></b>
		</div>

		<button type="submit" class="btn btn-danger" style="margin-top: 10px;">저장</button>
	</form>
	<hr>
</div>


   	<!--  연락처 -->
    	<div class="hp">
    		<span><b>연락처</b></span>
    		<span class="updateHp">
    			<span class="updatespan">변경</span>
    		</span><br>
    		<div style="margin-top:10px; color:gray;">
		    	<c:if test="${dto.hp == null}">
		    		<span style="margin-top:10px;">등록된 연락처가 없습니다.</span>
		    	</c:if>
		    	<c:if test="${dto.hp != null}">
		    		<div style="margin-top:10px;">${dto.hp}</div>
		    	</c:if>
	    	</div>
    		<hr>
    	</div>
    	
    	<div class="hpupdate">
    		<span><b>연락처</b></span>
    		<span class="close8">
    			<span class="updatespan">취소</span>
    		</span><br>
			<form action="updatehp" method="post">
				<input type="hidden" name="num" value="${dto.num}">
				<input type="text" required="required" class="form-control" id="hp" name="hp" maxlength="11" style="width:100%; margin-top:10px;" placeholder="휴대폰 번호를 입력해주세요." value="${dto.hp}">
				<b class="hpmsg"></b><br>
				<button type="submit" class="btn btn-danger" style="margin-top:10px;">저장</button>
			</form>
			<hr>
    	</div>
    	

<!-- 회원탈퇴 -->
<div class="memberdelete">
	<span><b>회원탈퇴</b></span> <span class="memberDelete">
	<span class="updatespan">탈퇴</span>
	</span><br>
	<hr>
</div>


























