<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="defaultUpdate" method="get" enctype="multipart/form-data">

<!-- header(button) -->
<header class="header_area">
	<div style="height: 50px; background-color: white; border: none;">
		<button type="submit" id="save">저장하기</button>
	</div>
</header>

<div class="media">
	<div class="main_title">
	<h6>프로젝트 카테고리<i class="fa fa-asterisk" style="color: red; font-size: 15px;"></i></h6>
		<div class="sub_text">
			프로젝트 성격과 가장 일치하는 카테고리를 선택해주세요.<br>
			적합하지 않을 경우 운영자에 의해 조정될 수 있습니다.
		</div>
	</div>
	<div>
		<div class="layout1">
			<p>카테고리</p>
			<div>
				<select class="sel">
					<option value="게임">게임</option>
					<option>공연</option>
					<option>디자인</option>
					<option>사진</option>
					<option>영화·비디오</option>
					<option>푸드</option>
					<option>음악</option>
					<option>출판</option>
					<option>패션</option>
				</select>
			</div>
		</div>
	</div>
</div>
<hr>
<br>
<div class="media">
	<div class="main_title">
	<h6>프로젝트 제목<i class="fa fa-asterisk" style="color: red; font-size: 15px;"></i></h6>
		<div class="sub_text">
			프로젝트와 주제, 창작물의 특징이 드러나는 멋진 제목을 붙여<br>
			주세요.
		</div>
	</div>
	<div>
		<div class="layout1">
			<p>제목</p>
			<div class="groundBorder">
				<div class="sub_title">
					<div style="width: 250px;" class="sub_font">
					긴 제목은<br>
					어디에 쓰이나요?
					</div>	
					<div>
					<img alt="" src="${root }/image/title.png" class="img">
					</div>
				</div>
			</div>
			<br><br>
			<div>
				<input type="text" class="textform">
			</div>
		</div>
	</div>
</div>
<hr>
<br>
<div class="media">
	<div class="main_title">
	<h6>프로젝트 대표 이미지<i class="fa fa-asterisk" style="color: red; font-size: 15px;"></i></h6>
		<div class="sub_text">
			후원자들이 프로젝트의 내용을 쉽게 파악하고 좋은 인강을 받<br>
			을 수 있도록 이미지 가이드라인을 따라주세요.
		</div>
	</div>
	<div>
		<div class="layout1">
			<div class="groundBorder">
				<div class="sub_title">
					<div>
					<img alt="" src="${root }/image/image.png" class="img">
					</div>
				</div>
			</div>
			<br><br>
			<div class="file_box">
				<div style="margin-top:30px; margin-left: 200px;">
					<div style="margin-left: 10px;">
					<label for="ex_file">
						<img src="${root }/image/3.JPG">
					</label>
					</div>
					<div class="filebox"> 
						<label for="ex_file">이미지 업로드</label> 
						<input type="file" id="ex_file"> 
					</div>
				</div>
				<div style="margin-top: 20px; margin-left: 100px;">
					<label for="ex_file" class="label_box">
						파일 형식은 jpg또는 png로,<br>
						사이즈는 가로1,240px,세로 930px 이상<br>
						으로 올려주세요.
					</label>
				</div>
			</div>
		</div>
	</div>
</div>
</form>