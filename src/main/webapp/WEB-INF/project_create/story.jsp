<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<form class="form-horizontal"  id="boardForm" name="boardForm" method="post" enctype="multipart/form-data">
<header class="header_area">
	<div style="height: 50px; background-color: white; border: none;">
		<button type="submit" id="save">저장하기</button>
	</div>
</header> 


<div class="media">
	<div class="main_title">
	<h6>프로젝트 계획<i class="fa fa-asterisk" style="color: red; font-size: 15px;"></i></h6>
		<br>
		<div style="background-color: #fdf4f3; padding: 30px 50px; width: 80%;">
			<span style="color: red; font-size: 12px;" class="fa fa-check-circle-o">
			텍스트 에디터 사용법</span><br>
			<span style="font-size: 11px;">· Enter( )를 누르면 문단이 구분됩니다. 문단 내에서<br>
			간격 없이 줄바꿈 하려면 shift(⇧) + enter(↵) 를 사용해주세요.<br>
			· ctrl+c/v를 이용해 선택한 이미지를 입력창 내에서 복사/붙여넣기 할 수 있습니다.<br>
			· 본문 텍스트와 이미지는 되도록 분리해서 작성해주세요. 통 이미지 사용은 불가합니다.</span>
		</div>
	</div>
	<div>
		<div class="layout1">
		    <label for="inputPassword3" class="">contents</label>
		    <div class="">
		      <div id="summernote" style="width: 100%;"></div>
		    </div>			
		</div>
	</div>
</div>
<hr>
<br>
</form>

<script>
  $('#summernote').summernote({
    placeholder: 'Hello stand alone ui',
    height: 400,
    minHeight: null,             // set minimum height of editor
    maxHeight: null,             // set maximum height of editor
  });
</script>