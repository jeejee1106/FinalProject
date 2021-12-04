<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">

function lastcheck2(f)
{
	
	if($("#pass").val() != $("#passcheck").val()){
		$("b.passmsg").html("<font color='red'>비밀번호가 일치하지 않습니다.</font>");
		$("#pass").val("");
		return false;
	}
		return true;
	
}
</script>
<br>
<div class="container" style="margin-bottom:50px;">
<h2 style="color:gray;">회원 탈퇴</h2>
</div>
<hr>

<div class="container" style="border:1px solid gray; padding: 20px 10px 20px 20px; width:500px; margin-top:30px;margin-bottom:30px;">
	<h5><br>본인인증</h5><br><br>
	<form action="../member/memberdelete" method="post" onsubmit="return lastcheck2(this)">
	<input type="text" class="form-control" readonly="readonly" style="width: 60%;" value="${dto.id }"><br>
	<input type="hidden" name="num" value="${dto.num}">
		<div class="form-group">
			<input id="passcheck" type="hidden" name="passcheck" value="${dto.pass}">
			<input type="password" style="width: 60%;;"
				class="form-control" id="pass" name="pass" maxlength="20"
				placeholder="현재 비밀번호" required="required">
				<b class="passmsg"></b>
		</div>
	<button type="submit" class="btn btn-danger">회원탈퇴</button>
	<div style="margin-top:8px;"><a href="">혹시 비밀번호를 잊으셨나요?</a></div>
	</form>
</div>
























