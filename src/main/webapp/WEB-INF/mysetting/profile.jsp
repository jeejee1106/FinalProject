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
			<div class="form-group">
				<input type="hidden" name="num" value="${dto.num}">
				<input type="text" required="required" class="form-control" id="url" name="url" style="width:50%; margin-top:10px;" value="${dto.url }">
				<div style="color:gray; margin-top:10px;">사용자 이름은 회원님의 프로필 주소로 활용됩니다. 예 ) http://localhost:9002/profile/사용자이름</div>
				<div><b class="urlmsg"></b></div>
			</div>
				<button type="submit" class="btn btn-danger" style="margin-top: 10px;">저장</button>
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


















