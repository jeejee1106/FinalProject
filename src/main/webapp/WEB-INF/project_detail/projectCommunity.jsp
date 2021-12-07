<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

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
						<button type="button" class="base-btn btn-loc send-btn">등록</button>
					</div>
				</form>
			</div>
		</c:when>
		<c:otherwise>
			<div class="comment-container">
				<h2>후원자만 글작성이 가능합니다</h2>
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
	//프로필이동
	$(document).on("click",".profile-photo", function() {
		let check = confirm("프로필 페이지로 이동하시 겠습니까?")
		if(check == true){
			$("#profileId").val("")
			$("#profileId").val($(this).attr("id"))
			$(".to-profile").submit();
		}
	})
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
	                	
	                	if(data[i].fix == 1 && data[i].grph == 0){
		                s += "&nbsp;<span style='color:red'class='glyphicon glyphicon-pushpin'></span> <br>";	
		                }
	                	if(data[i].profile != null){
	                	s += "<img class='profile-photo' src='../photo/"+data[i].profile+"' id='"+data[i].writer+"'>";
		                }else{
		                s += "<img class='profile-photo' src='../photo/basic.jpg' id='"+data[i].writer+"'>";
		                }
	                	s += "<span>&nbsp;"+data[i].writer+"</span><br>";
	                	if(data[i].grph != 0){
	                	s += "<span class='parent-writer'>"+data[i].parent+"</span><span>님께 답변</span><br>";	
	                	}
	                	s += "<pre class='re-content'>"+data[i].content+"</pre>";
	                	s += "<span id='time'>"+data[i].writetime+"</span>";
	                	
	                	if(loginCheck == 'yes'){
	                	s += "<button class='fix-style reply'><span title='답글' class='glyphicon glyphicon-comment'></span></button>";
		                	if(data[i].writer == loginUser){
			                s += "<button class='fix-style up-loc update'><span title='수정' class='glyphicon glyphicon-pencil'></span></button>";
							s += "<button class='fix-style del-loc delete-btn'><span title='삭제' class='glyphicon glyphicon-trash'></span></button>";              	
		                	}
	                	}
	                	s += "<input type='hidden' id='writer' value='"+data[i].writer+"'>"
	                	s += "<input type='hidden' id='num' value='"+data[i].num+"'>"
	                	s += "<input type='hidden' id='grp' value='"+data[i].grp+"'>"
	                	s += "<input type='hidden' id='grph' value='"+data[i].grph+"'>"
	                	s += "<input type='hidden' id='content' value='"+data[i].content+"'>"
                	s += "</div>";
                	//수정폼이 클릭시 나올 부분
                	s += "<div class='update-form'></div>";
                	//답글폼
	    			s += "<form action='../comment/reply' class='reply-form' method='post'>";
		    			s += "<div class='reply-container'>";
			    			s += "<input type='hidden' name='writer' value='${sessionScope.id}'>";
			    			s += "<input type='hidden' name='parent' value='"+data[i].writer+"'>";
			    			s += "<input type='hidden' name='pnum' value='"+data[i].pnum+"'>";
			    			s += "<input type='hidden' name='grp' id='grp' value='"+data[i].grp+"'>";
			    			s += "<input type='hidden' name='grph' id='grph' value='"+data[i].grph+"'>";
			    			s += "<input type='hidden' name='grps' id='grps' value='"+data[i].grps+"'>";
			    			s += "<textarea required name='content' class='comment' placeholder='답글을 남겨주세요'></textarea>"
			    			s += "<div class='btn-container'>";
								s += "<button type='button' class='base-btn hide-btn'>취소</button>";			    			
				    			s += "<button type='button' class='base-btn reply-btn'>등록</button>"
			    			s += "</div>";
		    			s += "</div>";
	    			s += "</form>";
	                	
               	}
               	$(".comment-list").html(s)
               	$(".reply-form").hide()
               	$(".fix").hide()
               	$(".cancel-fix").hide()
               }, 
               error : function(xhr, status) {
                   alert(xhr + " : " + status);
               }
           }); 
	}
	
	//insert
	$(".send-btn").click(function() {
		if($(".comment").val().trim().length == 0){
			alert("값을 입력해주세요")
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
            	$(".comment").val("");
            }, 
            error : function(xhr, status) {
                alert(xhr + " : " + status);
            }
        }); 
	})
	
	//reply
	$(document).on("click",".reply", function() {
		$(".reply-form").hide()
		$(".update-form").hide()
		$(this).parent().next().next(".reply-form").show()
	})
	$(document).on("click",".hide-btn", function() {
		$(".reply-form").hide()
	})
	$(document).on("click",".reply-btn", function() {
		if($(this).parent().siblings(".comment").val().length == 0){
			alert("값을 입력해주세요")
			$(this).parent().siblings(".comment").focus()
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
	
	//delete
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
	
	//update
	$(document).on("click",".hide-updatefrm", function() {
		$(".update-container").hide()
	})
	
	$(document).on("click",".update", function() {
		$(".reply-form").hide()
		$(".update-form").html('')
		$(".update-form").show()
		let s = '';
		s += "<div class='update-container'>";
			s += "<textarea name='content' class='update-comment'>"+$(this).siblings(".re-content").text()+"</textarea>"
			s += "<div class='btn-container'>";
				s += "<button type='button' class='base-btn hide-updatefrm'>취소</button>";			    			
				s += "<button type='button' class='base-btn update-btn'>수정</button>"
				s += "<input type='hidden' id='update-num' value='"+$(this).siblings("#num").val()+"'>"
			s += "</div>";
		s += "</div>";
		$(this).parent().next('.update-form').html(s)
	}) 
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
	
	//fix
	//고정버튼 나오게하는 리스트 버튼
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