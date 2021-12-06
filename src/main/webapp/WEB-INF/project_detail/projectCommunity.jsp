<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<style>
.fix-style:focus{
	outline: none;
}
.fix-style{
	width: 40px;
	height: 30px;
	background-color: white;
	border: none;
}
.re-loc {
	margin-left: 300px;
}
.base-btn {
	width: 50px;
	height: 30px;
	border-radius: 10px;
	border: none;
	margin-left: 10px;
}
.count-content{
	margin-left: 60px;
}

.base-btn:hover {
	cursor: pointer;
}

.base-btn:focus {
	outline: none;
}

.btn-container {
	width: 200px;
	height: 55px;
	padding-top: 20px;
	padding-left: 20px;
	margin-left: 400px;
}

.container2 {
	margin: 0 auto;
	width: 650px;
	word-break: break-all;
	margin-bottom: 20px;
	border: 2px solid #e5e5e5;
	padding: 20px;
}

/* 댓글컨테이너 */
.container2 .comment-container {
	margin-left: 0px;
	width: 610px;
	height: 120px;
	background-color: white;
	margin-top: 20px;
	border: 2px solid #e5e5e5;
}

.container2 .comment-container .comment, .reply-comment {
	margin-top: 20px;
	margin-left: 20px;
	width: 570px;
	height: 35px;
	border: none;
}

.container2 .comment-container .comment:focus {
	outline: none;
}
.reply-comment:focus {
	outline: none;
}

/* 답글컨테이너 */
.container2 .reply-container, .update-container {
	width: 600px;
	height: 120px;
	background-color: white;
	margin-top: 30px;
	border: 2px solid #e5e5e5;
	margin-left: 0px;
}

.container2 .reply-container .comment, .update-comment {
	margin-top: 20px;
	margin-left: 20px;
	width: 570px;
	height: 35px;
	border: none;
}

.container2 .reply-container .comment:focus, .update-comment:focus {
	outline: none;
}

/* 댓글이 달릴 위치 */
.container2 .show-comment {
	width: 610px;
	height: 140ps;
	padding: 5px;
}

.container2 .show-comment .profile-photo {
	width: 36px;
	height: 36px;
	border-radius: 18px;
	cursor: pointer;
}

.container2 .show-comment .re-content {
	padding:10px;
	width: 400px;
	background-color: rgb(239, 239, 239);
	white-space: pre-line;
	border-radius: 10px;
	margin-top: 10px;
}
/* 기타 */
.comment-list{
	width: 610px;
}
#time{
	font-size: 8px;
}
.parent-writer{
	font-weight: bold;
}
</style>

<div class="container2">
	<input type="hidden" id="pnum" name="pnum" value="${dto.idx}"> 
	<c:choose>
		<c:when test="${sessionScope.loginok == 'yes'}">
			<div class="comment-container">
				<form id="comment" action="../comment/insert" method="post">
					<input type="hidden" name="pnum" value="${dto.idx}"> 
					<input type="hidden" id="loginUser"name="writer" value="${sessionScope.id}">
					<textarea name="content" class="comment" placeholder="댓글을 남겨주세요"></textarea>
					<div class="btn-container">
						<span class="count-content">0</span><span>/500</span><button type="button" class="base-btn btn-loc send-btn">등록</button>
					</div>
				</form>
			</div>
		</c:when>
		<c:otherwise>
			<div class="comment-container">
				<h2>로그인 후 글작성이 가능합니다</h2>
			</div>
		</c:otherwise>
	</c:choose>
	<div class = "comment-list"></div>
	<form class="to-profile" action="../comment/profile" method = "post">
		<input id="profileId" type="hidden" name="id">
	</form>
</div>

<script>
	$(function () {
	//해당 회원 프로필로 이동
	$(document).on("click",".profile-photo", function() {
		let check = confirm("프로필 페이지로 이동하시 겠습니까?")
		if(check == true){
			$("#profileId").val("")
			$("#profileId").val($(this).attr("id"))
			$(".to-profile").submit();
		}
	})
	//댓글출력 함수실행
	getCommentList();
	//댓글출력 함수
	function getCommentList() {
		let num = $("#pnum").val();
       	$.ajax({
               url : "../comment/list",
               type : 'get', 
               dataType: 'json',
               data: {num:num},
               success : function(data) {
               	let loginCheck = '${sessionScope.loginok}';
               	let loginUser = '${sessionScope.id}';
                let s = ''; 
               	for(i=0; i<data.length; i++){
               		//댓글리스트가 보여질부분
                	s += "<div class='show-comment' style='margin-left:"+data[i].grps*15+"px;'>";
	                	s += "<hr>"
                	if(data[i].grph == 0 && loginCheck=='yes' ){
	                	s += "<button title='리스트' style='color:black;' class='fix-style list-btn glyphicon glyphicon-option-horizontal'></button>";	
	                	if(data[i].fix != 1){
	                	s += "<button title='고정' class='fix-style fix glyphicon glyphicon-pushpin'></button><br>";	
	                	}else{
	                	s += "<button title='고정취소' class='fix-style cancel-fix glyphicon glyphicon-remove'></button><br>";	
	                	}
                	}
	                	//고정
	                	if(data[i].fix == 1 && data[i].grph == 0){
		                s += "&nbsp;<span style='color:red'class='glyphicon glyphicon-pushpin'></span> <br>";	
		                }
	                	//프로필사진
	                	if(data[i].profile != null){
	                	s += "<img class='profile-photo' src='../photo/"+data[i].profile+"' id='"+data[i].writer+"'>";
		                }else{
		                s += "<img class='profile-photo' src='../photo/basic.jpg' id='"+data[i].writer+"'>";
		                }
	                	s += "<span>&nbsp;"+data[i].writer+"</span><br>";
	                	//부모글작성자표시
	                	if(data[i].grph != 0){
	                	s += "<span class='parent-writer'>"+data[i].parent+"</span><span>님께 답변</span><br>";	
	                	}
	                	s += "<pre class='re-content'>"+data[i].content+"</pre>";
	                	s += "<span id='time'>"+data[i].writetime+"</span>";
	                	//로그인했을 경우에만 답글 수정 삭제 가능
	                	if(loginCheck == 'yes'){
	                	s += "<button class='fix-style reply'><span title='답글' class='glyphicon glyphicon-comment'></span></button>";
		                	if(data[i].writer == loginUser){
			                s += "<button class='fix-style up-loc update'><span title='수정' class='glyphicon glyphicon-pencil'></span></button>";
							s += "<button class='fix-style del-loc delete-btn'><span title='삭제' class='glyphicon glyphicon-trash'></span></button>";              	
		                	}
	                	}
	                	s += "<input type='hidden' id='parent' value='"+data[i].writer+"'>";
		    			s += "<input type='hidden' id='pnum' value='"+data[i].pnum+"'>";
	                	s += "<input type='hidden' id='writer' value='"+data[i].writer+"'>"
	                	s += "<input type='hidden' id='num' value='"+data[i].num+"'>"
	                	s += "<input type='hidden' id='grp' value='"+data[i].grp+"'>"
	                	s += "<input type='hidden' id='grph' value='"+data[i].grph+"'>"
	                	s += "<input type='hidden' id='grps' value='"+data[i].grps+"'>";
	                	s += "<input type='hidden' id='content' value='"+data[i].content+"'>"
                	s += "</div>";
                	//수정폼 출력용
                	s += "<div class='update-form'></div>";
                	//답글폼 출력용
                	s += "<div class='reply-form'></div>";
               	}
               	$(".comment-list").html(s)
               	$(".fix").hide()
               	$(".cancel-fix").hide()
               }, 
               error : function(xhr, status) {
                   alert(xhr + " : " + status);
               }
           }); 
	}
	
	//댓글작성
	$(".send-btn").click(function() {
		let comment = $(".comment").val()
		if(comment.trim().length == 0){
			alert("값을 입력해주세요")
			$(".comment").focus()
			return;
		}
		if(comment.length > 500){
			alert("500자 이하로 입력해주세요")
			$(".comment").focus()
			return;
		}
		let formData = $("#comment").serialize();

        $.ajax({
            cache : false,
            url : "../comment/insert",
            type : 'POST', 
            data : formData, 
            success : function() {
            	getCommentList();
            	$(".comment").val("")
            	$(".count-content").text(comment.length)
            }, 
            error : function(xhr, status) {
                alert(xhr + " : " + status);
            }
        }); 
	})
	//댓글글자수체크
	$(".comment").keyup(function(){
		let content = $(this).val()
		$(".count-content").html(content.length+content.split('\n').length-1)
	})
	//답글폼 숨기기
	$(document).on("click",".hide-btn", function() {
		$(this).parent().siblings(".reply-comment").val("")
		$(".reply-form").hide()
	})
	//답글폼 보이기
	$(document).on("click",".reply", function() {
		$(".reply-form").hide()
		$(".update-form").hide()
		$(this).parent().next().next(".reply-form").show()
		let parent = $(this).siblings("#parent").val()
		let pnum = $(this).siblings("#pnum").val() 
		let grp = $(this).siblings("#grp").val()
		let grph = $(this).siblings("#grph").val()
		let grps = $(this).siblings("#grps").val()
		let s = ""
		s += "<form action='../comment/reply' class='reply-form' method='post'>";
			s += "<div class='reply-container'>";
				s += "<input type='hidden' name='writer' value='${sessionScope.id}'>";
				s += "<input type='hidden' name='parent' value='"+parent+"'>";
				s += "<input type='hidden' name='pnum' value='"+pnum+"'>";
				s += "<input type='hidden' name='grp' id='grp' value='"+grp+"'>";
				s += "<input type='hidden' name='grph' id='grph' value='"+grph+"'>";
				s += "<input type='hidden' name='grps' id='grps' value='"+grps+"'>";
				s += "<textarea required name='content' class='reply-comment' placeholder='답글을 남겨주세요'></textarea>"
				s += "<div class='btn-container'>";
					s += "<span class='count-reply'>0</span><span>/500</span>"
					s += "<button type='button' class='base-btn hide-btn'>취소</button>";			    			
	    			s += "<button type='button' class='base-btn reply-btn'>등록</button>"
				s += "</div>";
			s += "</div>";
		s += "</form>";
		$(this).parent().siblings('.reply-form').html(s)
	})
	//답글전송
	$(document).on("click",".reply-btn", function() {
		let comment = $(this).parent().siblings(".reply-comment")
		if(comment.val().length == 0){
			alert("값을 입력해주세요")
			comment.focus()
			return;
		}
		if(comment.val().length > 500){
			alert("500자 이하로 입력해주세요")
			comment.focus()
			return;
		}
		let formData2 = $(this).parent().parent().parent().serialize();
        $.ajax({
            cache : false,
            url : "../comment/reply",
            type : 'POST',
            data : formData2, 
            success : function() {
            	getCommentList();
            }, 
            error : function(xhr, status) {
                alert(xhr + " : " + status);
            }
        }); 	 
	})
	//답글글자수체크
	$(document).on("keyup",".reply-comment", function() {
		$(".count-reply").html($(this).val().length+$(this).val().split('\n').length-1)
	})
	//댓글삭제버튼
	$(document).on("click",".delete-btn", function() {
		/* alert($(this).parent().siblings('.comment').val()) */
		let check = confirm("삭제하시겠습니까?")
		if(check != true){
			return;
		}
		let num = $(this).siblings("#num").val();
		let grp = $(this).siblings("#grp").val();
		let grph = $(this).siblings("#grph").val();
        $.ajax({
            url : "../comment/delete",
            type : 'POST', 
            data : {num:num, grp:grp, grph:grph},
            success : function() {
            	getCommentList();
            }, 
            error : function(xhr, status) {
                alert(xhr + " : " + status);
            }
        }); 
	})
	
	//수정폼 숨기기
	$(document).on("click",".hide-updatefrm", function() {
		$(".update-container").hide()
	})
	//수정폼 보이기
	$(document).on("click",".update", function() {
		let content = $(this).siblings(".re-content")
		$(".reply-form").hide()
		$(".update-form").html('')
		$(".update-form").show()
		let s = '';
		s += "<div class='update-container'>";
			s += "<textarea name='content' class='update-comment'>"+content.text()+"</textarea>"
			s += "<div class='btn-container'>";
				s += "<span class='count-update'>"+(content.text().length+(content.text().split('\n').length-1))+"</span><span>/500</span>"
				s += "<button type='button' class='base-btn hide-updatefrm'>취소</button>";			    			
				s += "<button type='button' class='base-btn update-btn'>수정</button>"
				s += "<input type='hidden' id='update-num' value='"+$(this).siblings("#num").val()+"'>"
			s += "</div>";
		s += "</div>";
		/* content2.text().length */
		$(this).parent().next('.update-form').html(s)
	}) 
	//수정폼글자수 체크
	$(document).on("keyup",".update-comment", function() {
		$(".count-update").html($(this).val().length+$(this).val().split('\n').length-1)
	})
	//수정버튼
	$(document).on("click",".update-btn", function() {
		let num = $(this).next("#update-num").val()
		let comment = $(this).parent().siblings(".update-comment").val()
		if(comment.trim().length == 0){
			alert("값을 입력해주세요")
			$(".comment").focus()
			return;
		}
	 $.ajax({
            url : "../comment/update",
            type : 'POST', 
            data : {num:num, comment:comment},
            success : function() {
            	getCommentList();
            }, 
            error : function(xhr, status) {
                alert(xhr + " : " + status);
            }
        }); 
	}) 
	

	//고정버튼 보이게하기
	$(document).on("click",".list-btn", function() {
		$(this).siblings(".fix").toggle()
		$(this).siblings(".cancel-fix").toggle()
	})
	//고정버튼
	$(document).on("click",".fix", function() {
		let check = confirm("이전에 고정한글이 현재글로 변경됩니다")
		if(check != true){
			return;
		}
		let num = $(this).siblings("#num").val()
		$.ajax({
            url : "../comment/fix",
            type : 'POST', 
            data : {num:num},
            success : function() {
            	getCommentList();
            }, 
            error : function(xhr, status) {
                alert(xhr + " : " + status);
            }
        }); 
	})
	//고정취소버튼
	$(document).on("click",".cancel-fix", function() {
		let check = confirm("고정을 취소하시겠습니까?")
		if(check != true){
			return;
		}
		let num = $(this).siblings("#num").val()
		$.ajax({
            url : "../comment/cancelFix",
            type : 'POST', 
            data : {num:num},
            success : function() {
            	getCommentList();
            }, 
            error : function(xhr, status) {
                alert(xhr + " : " + status);
            }
        }); 
	})
	
})	
</script>