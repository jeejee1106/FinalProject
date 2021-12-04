<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function() {
	projectData();
	audit = ($("#audit").val());
	$("#getData").hide();
	var sel = $("#db_category").val();
	$("#category option[value='" + sel + "']").prop('selected', 'selected').change();
	
	function readURL(input) {
		$("#layout3").hide();

		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#imgArea').attr('src', e.target.result); 
			}
			reader.readAsDataURL(input.files[0]);
		}
		$("#layout4").css({'margin-left':'360px','margin-bottom':'300px;'});
	}

	$(":input[name='upload']").change(function() {
		if( $(":input[name='upload']").val() == '' ) {
			$('#imgArea').attr('src' , '');  
		}
		$('#imgViewArea').css({ 'display' : '' });
		readURL(this);
	});
	$("#title").on("input",function() {
		if($("#title").val() != '' && audit == 0){
			 $("button#save0").css({"backgroundColor":"#d2201d","cursor":"pointer","color":"#fff"}).prop("disabled",false);
		}else{
			 $("button#save0").css({"backgroundColor":"#cbcbcb","cursor":"auto","color":"white"}).prop("disabled",true);
			 
		}
	});
	
	function imgAreaError(){
		$('#imgViewArea').css({ 'display' : 'none' });
	}
	
	

 	$("#finalSave1, #finalSave2, #finalSave3, #finalSave4, #finalSave5").click(function() {
		  var idx = $("#idx").val();
		  var audit = '1';
		  
		  $.ajax({
			  type		: "post",
			  url		: "progressUpdata",
			  data		: {"idx" : idx, "audit" : audit},
			  success	: function() {
				  alert("요청완료!");
				  $("button#save0,#save2,#save3,#save4,#save5").css({"backgroundColor":"#cbcbcb","cursor":"auto","color":"white"}).prop("disabled",true);
				  $("#finalSave1, #finalSave2, #finalSave3, #finalSave4, #finalSave5").css({"backgroundColor":"#cbcbcb","cursor":"auto","color":"white"}).prop("disabled",true).html("심사중");
			  },
			  error		: function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			  }
		  })
	}); 

});
</script>
<form action="defaultUpdate" method="post" enctype="multipart/form-data" id="upload-file-form">

	<!-- header(button) -->
	<header class="header_area">
		<div id="btn" style="height: 50px; background-color: white; border: none;">	
			<button type="submit" id="save0" class="btn save" disabled="disabled">저장하기</button>
			<button type="button" id="finalSave1" class="btn" disabled="disabled" style="position: absolute; margin-left: 1190px;">심사요청</button>
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
					<select class="sel" id="category" name="category">
						<option value="게임">게임</option>
						<option value="공연">공연</option>
						<option value="디자인">디자인</option>
						<option value="사진">사진</option>
						<option value="영화·비디오">영화·비디오</option>
						<option value="푸드">푸드</option>
						<option value="음악">음악</option>
						<option value="출판">출판</option>
						<option value="패션">패션</option>
					</select>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<br>
	<div class="media">
		<div class="main_title">
		<h6>프로젝트 제목<i class="fa fa-asterisk" style="color: red;  font-size: 15px;"></i></h6>
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
						제목은<br>
						어디에 쓰이나요?
						</div>	
						<div>
						<img alt="" src="${root }/image/title.png" class="img">
						</div>
					</div>
				</div>
				<br><br>
				<div>
					<input type="text" class="textform" name="title" id="title" required="required" value="${dto.title }">
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
					<div id="img_layout">
					<div id="imgViewArea" style="width: 200px; ">
					<img id="imgArea" style="width:200px;" onerror="imgAreaError()" src="${root }/thumbnail_image/${dto.thumbnail}"/>
					</div>
						<div style="margin-top:30px; margin-left: 200px;" id="layout4">
							<div style="margin-left: 10px;">
							<label for="upload">
								<img src="${root }/image/3.JPG">
							</label>
							</div>
							<div class="filebox"> 
								<label for="upload">이미지 업로드</label> 
								<input type="file" id="upload" name="upload"> 
							</div>
						</div>
						<div id="layout3" style="margin-top: 20px; margin-left: 100px;">
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
	</div>
	<input type="hidden" value="${idx }" id="idx" name="idx">
</form>
<!-- 진행률 알아보기 -->
<div id="getData">
<input type="text" id="db_thumbnail">
<input type="text" id="db_target">
<input type="text" id="db_project_goal">
<input type="text" id="db_policy">
<input type="text" id="titl">
<input type="text" id="progress">
</div>