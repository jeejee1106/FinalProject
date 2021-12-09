<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="/css/project-community.css">

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
						<span class="count-content countLength">0</span><span class="countLength">/500</span><button type="button" class="base-btn btn-loc send-btn">등록</button>
					</div>
				</form>
			</div>
		</c:when>
		<c:otherwise>
			<div class="comment-container" style="color:gray; padding-left: 25px; padding-top:25px;">
				후원자만 댓글을 작성할 수 있어요.
			</div>
		</c:otherwise>
	</c:choose>
	<div class = "comment-list"></div>
	<form class="to-profile" action="/profile2" method = "post">
		<input id="profileId" type="hidden" name="id">
	</form>
</div>

<script>
	$(function () {
	//해당 회원 프로필로 이동
	$(document).on("click",".profile-photo", function() {
		if($(this).attr("id") == 'admin'){
			alert("관리자 페이지로는 이동이 불가능합니다.")
			return;
		}
		
		let check = confirm("프로필 페이지로 이동하시 겠습니까?");
		if(check == true){
			$("#profileId").val("");
			$("#profileId").val($(this).attr("id"));
			$(".to-profile").submit();
		}
	})
	//댓글출력 함수실행
	getCommentList();
	//getlist
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
               	let projectWriter = '${dto.id}'
                let s = ''; 
               	for(i=0; i<data.length; i++){
               		let grps = 0; 
               		if(data[i].grps > 0){
               			grps = 1;
               		}
               		//댓글리스트가 보여질부분
               		s+="<hr>"
                	s += "<div class='show-comment' style='margin-left:"+grps*70+"px;'>";
               		if(data[i].tempdel == 1){
                		s +="<span>댓글이 삭제되었습니다.</span>"
               		}else{
                	if(data[i].grph == 0 && loginCheck=='yes' && loginUser == projectWriter){
                		s += "<button title='리스트' style='color:black;' class='fix-style list-btn'><i class='fa fa-ellipsis-h'></i></button>";	
	                	
	                	if(data[i].fix != 1){
	                		s += "<button title='고정' class='fix-style fix'><i class='fa fa-thumb-tack'></i></button><br>";	
	                	}else{
	                		s += "<button title='고정취소' class='fix-style cancel-fix'><i class='fa fa-times'></i></button><br>";	
	                	}
                	}
	                	//고정
	                	if(data[i].fix == 1 && data[i].grph == 0){
		                	s += "&nbsp;<span style='color:red'><i class='fa fa-thumb-tack'></i></span> <br>";	
		                }
	                	//프로필사진
	                	if(data[i].grph != 0){
						s += "<img class='re-image' src='../profile_image/re.png'> ";
	                	}
	                	if(data[i].photo == null){
						s += "<img class='profile-photo' src='../profile_image/basic.jpg' id='"+data[i].writer+"'>";
						s += "<img class='profile-photo' src='../profile_image/basic.jpg' id='"+data[i].writer+"'>";
		                }else{
                		s += "<img class='profile-photo' src='../profile_image/"+data[i].photo+"' id='"+data[i].writer+"'>";
		                }
	                	s += "<span class='re-writer-name'>&nbsp;"+data[i].writer+"</span><br>";
	                	//부모글작성자표시
	                	if(data[i].grph != 0){
	                	s += "<div class='parent-writer'>@"+data[i].parent+"</div>";	
	                	}
	                	s += "<pre class='re-content'>"+data[i].content+"</pre>";
	                	s += "<span id='time'>"+data[i].writetime+"</span>";
	                	
	                	//로그인 됬을 경우에만 답글 수정삭제가능
	                	if(loginCheck == 'yes'){
	                	s += "<button class='fix-style reply'><span title='답글' style='color:gray;'>답글쓰기</span></button>";
		                	if(data[i].writer == loginUser){
				                s += "<button class='fix-style up-loc re-update'><span title='수정'><i class='fa fa-pencil'></i></span></button>";
								s += "<button class='fix-style del-loc delete-btn'><span title='삭제'><i class='fa fa-trash-o'></i></span></button>";              	
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
	                	s += "<input type='hidden' id='tempdel' value='"+data[i].tempdel+"'>"
                	s += "</div>";
               		}
                	//수정폼이 클릭시 나올 부분
                	s += "<div class='update-form'></div>";
                	//답글폼 출력용
                	s += "<div class='reply-form'></div>";
	                	
               	}
               	$(".comment-list").html(s);
               	$(".fix").hide();
               	$(".cancel-fix").hide();
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
			alert("댓글 내용을 입력하지 않았습니다.")
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
            	$(".count-content").text('0')
            }, 
            error : function(xhr, status) {
                alert(xhr + " : " + status);
            }
        }); 
	})
	//댓글글자수체크
	$(".comment").keyup(function(){
		let content = $(this).val()
		let contentSize = (content.length+content.split('\n').length-1);
		$(".count-content").html(contentSize)
		if(contentSize > 500){
			alert("500자 이하로 입력해주세요")
			$(this).val(content.substring(0, 500));
			$(".count-content").html('500')
			return;
		}
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
					s += "<span class='countLength count-reply'>0</span><span class='countLength'>/500</span><br>"
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
			alert("댓글 내용을 입력하지 않았습니다.")
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
		let content = $(this).val()
		let contentSize = ($(this).val().length+$(this).val().split('\n').length-1);
		$(".count-reply").html(contentSize)
		if(contentSize > 500){
			alert("500자 이하로 입력해주세요")
			$(this).val(content.substring(0, 500));
			$(".count-reply").html('500')
			return;
		}
		
		
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
		let tempDel = $(this).siblings("#tempdel").val();
        $.ajax({
            url : "../comment/delete",
            type : 'POST', 
            data : {num:num, grp:grp, grph:grph, tempdel:tempDel},
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
	$(document).on("click",".re-update", function() {
		let content = $(this).siblings(".re-content")
		$(".reply-form").hide()
		$(".update-form").html('')
		$(".update-form").show()
		let s = '';
		s += "<div class='update-container'>";
			s += "<textarea name='content' class='update-comment'>"+content.text()+"</textarea>"
			s += "<div class='btn-container'>";
				s += "<span class='count-update countLength'>"+(content.text().length+(content.text().split('\n').length-1))+"</span><span class='countLength'>/500</span><br>"
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
		let content = $(this).val()
		let contentSize = ($(this).val().length+$(this).val().split('\n').length-1);
		$(".count-update").html(contentSize)
		if(contentSize > 500){
			alert("500자 이하로 입력해주세요")
			$(this).val(content.substring(0, 500));
			$(".count-update").html('500')
			return;
		}
		
	})
	//수정버튼
	$(document).on("click",".update-btn", function() {
		let check = confirm("수정하시겠습니까?")
		if(check == true){
			let num = $(this).next("#update-num").val()
			let comment = $(this).parent().siblings(".update-comment").val()
			if(comment.trim().length == 0){
				alert("댓글 내용을 입력하지 않았습니다.")
				$(".update-comment").focus()
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
			
		}
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
		let grp = $(this).siblings("#grp").val()
		$.ajax({
            url : "../comment/fix",
            type : 'POST', 
            data : {grp:grp},
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
		let grp = $(this).siblings("#grp").val()
		$.ajax({
            url : "../comment/cancelFix",
            type : 'POST', 
            data : {grp:grp},
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