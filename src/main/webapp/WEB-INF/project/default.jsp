<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.media{
		display: flex;
		justify-content: space-between;
		margin: 30px 230px auto;
	}
	.layout1{
		width: 600px;
		margin-bottom: 100px;
	}
	div>p{
	font-size: 12px;
	color: black;
	font-weight: bold;
	}
	div>input,.sel{
		width: 100%;
		padding: 11px 0px;
		border: 1px solid #cccccc;
		border-radius: 5px;		
	}
	.textform{
		margin: 0px;
	}
	.sub_title{
		margin-left: 30px;
		display: flex;
	}
	.groundBorder{
		border: 1px solid #cccccc;
		padding: 20px 5px;
		border-radius: 5px;
	
	}
	.img{
	width: 80%;
	margin-left: 50px;
	}
	.main_title{
		margin: 0px 0px auto;
		display: block;
	}
	.sub_text{
		color: #696969 
	}
	.sub_font{
		font-weight: bold;
		font-size: 13px;
	}
</style>
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
					<option value="게임" class="1">게임</option>
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
			<div>
				<input type="text" class="textform">
			</div>
		</div>
	</div>
</div>