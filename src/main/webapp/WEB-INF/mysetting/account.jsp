<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!-- 이메일 -->
<div class="profileemail">
	<span><b>이메일</b></span> <span class="updateEmail">
	<span class="updatespan">변경</span>
	</span><br>
	<div style="margin-top: 10px;">${dto.name}</div>
	<hr>
</div>

<div class="ptofileemailupdate">
	<span><b>이메일</b></span> <span onclick="window.location.reload()">
		<span class="updatespan">취소</span>
	</span><br>
	<form action="updateemail" method="post">
		<input type="hidden" name="num" value="${dto.num}">
		<input type="text" class="form-control" name="email" maxlength="20"
			style="width: 100%; margin-top: 10px;" value="${dto.email}">
		<button type="submit" class="btn btn-danger" style="margin-top: 10px;">인증메일 전송</button>
	</form>
	<hr>
</div>


<!-- 비밀번호 -->
<div class="password">
	<span><b>비밀번호</b></span> <span class="updatePass">
	<span class="updatespan">변경</span>
	</span><br>
	<hr>
</div>

<div class="passupdate">
	<span><b>비밀번호</b></span> <span onclick="window.location.reload()">
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
    		<span onclick="window.location.reload()">
    			<span class="updatespan">취소</span>
    		</span><br>
			<form action="updatehp" method="post">
				<input type="hidden" name="num" value="${dto.num}">
				<input type="text" class="form-control" id="hp" name="hp" maxlength="20" style="width:100%; margin-top:10px;" placeholder="휴대폰 번호를 입력해주세요." value="${dto.hp}">
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


























