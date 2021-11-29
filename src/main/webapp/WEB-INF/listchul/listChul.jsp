<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
   var category="no";
   var state="no";
   var percent="no";
   
	$(function() {
		category=$("#categore").val();
		state=$("#states").val();
	    setTimeout(() => {
			list();
		}, 100);

		$(".list-gore-btn").change(function(){
			category=$("#list-gore").val();
			list();
		});
		$(".list-state-btn").change(function(){
			state=$("#list-state").val();
			
			//alert(state);
			list();
		});
		$(".list-percent-btn").change(function(){
			percent=$("#list-percent").val();
			
			//alert(percent);
			list();
		});
	});
	function list() {
		
		$.ajax({
			type : "get",
			dataType : "json",
			url : "listAll",
			data:{"category":category,"state":state,"percent":percent},
			
			success : function(data) {
			var s = "";
			$.each(data,function(i, dto) 
					{
						s += "<div class='contain-list'>";
						s += "<a href='/project/detail?idx="
								+ dto.idx
								+ "' class='list-thumbnail'>";
						s += "<div class='img-div'>";
						s += "<img src=${root}/image_thumbnail/"+dto.thumbnail+">";
						s += "</div> </a> <a href='/project/detail?idx="
								+ dto.idx
								+ "&key=detail' class='list-thumbnail'>";
						s += "<div class='txt-div'>";
						s += "<p class='tit'><strong>"
								+ dto.title
								+ "</strong></p>";
						s += "</div> </a> <div> <p>390,000원</p><p>78%</p> </div> </div>";
					});
						$(".list-chul-ajax").html(s);
					}
				});
	}

</script>
<div class="list-select">
	<div class="wrap">
		<span class="list-gore"> <select class="list-gore-btn" id="list-gore">
				<option value="no">카테고리</option>
				<option value="공연" ${category=='공연'?'selected':'' }>공연</option>
				<option value="디자인" ${category=='디자인'?'selected':'' }>디자인</option>
				<option value="사진" ${category=='사진'?'selected':'' }>사진</option>
				<option value="영화" ${category=='영화'?'selected':'' }>영화</option>
				<option value="푸드" ${category=='푸드'?'selected':'' }>푸드</option>
				<option value="음악" ${category=='음악'?'selected':'' }>음악</option>
				<option value="게임" ${category=='게임'?'selected':'' }>게임</option>
				<option value="패션" ${category=='패션'?'selected':'' }>패션</option>
		</select>
		</span> <span class="list-gore"> <select class="list-state-btn" id="list-state">
				<option value="no"${state=='no'?'selected':'' }>모든 프로젝트</option>
				<option value="pop"${state=='pop'?'selected':'' }>인기 프로젝트</option>
				<option value="endsoon"${state=='endsoon'?'selected':'' }>마감 임박프로젝트</option>
				<option value="new"${state=='new'?'selected':'' }>최신 프로젝트</option>
		</select>
		</span> <span class="list-gore"> <select class="list-percent-btn" id="list-percent">
				<option value="no">달성률</option>
				<option value="75down">75% 이하</option>
				<option value="75to100">75%~100%</option>
				<option value="100up">100% 이상</option>
		</select>
		</span>
	</div>
</div>
<div class="list-chul-ajax">
</div>
<input type="hidden" id="categore" value="${category}">
<input type="hidden" id="states" value="${state}">