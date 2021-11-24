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
  
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">contents</label>
    <div class="col-sm-10">
      <div id="summernote"></div>
    </div>
  </div>
</form>
<script>
  $('#summernote').summernote({
    placeholder: 'Hello stand alone ui',
    height: 400,
    minHeight: null,             // set minimum height of editor
    maxHeight: null,             // set maximum height of editor
  });
</script>