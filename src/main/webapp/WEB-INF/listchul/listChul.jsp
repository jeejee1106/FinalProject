<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
$(function(){
	list();
});
function list()
{		
	$.ajax({
		type:"get",
		dataType:"json",
		url:"listAll",
		success:function(data){
			var s="";
			$.each(data, function(i,dto) {
				s+="<div class='contain-list'>";
				s+="<a href=''/project/detail?idx="+dto.idx+"' class='list-thumbnail'>";
				s+="<div class='img-div'>";
				s+="<img src=${root}/image/"+dto.thumbnail+">";
				s+="</div> </a> <a href='/project/detail?idx="+dto.idx+"' class='list-thumbnail'>";
				s+="<div class='txt-div'>";
				s+="<p class='tit'><strong>"+dto.title+"</strong></p>";
				s+="</div> </a> <div> <p>390,000원</p><p>78%</p> </div> </div>";
				//s+="<div class='contain-list'>";
				//s+="<div>"+dto.idx+"</div>";
				//s+="<div><img src='../../image/"+dto.thumbnail+"'/></div></div>"; */
				/* s+="<figure>";
				s+="<img src='../../image/"+dto.thumbnail+"'/>";
				s+= "<figcaption>"+dto.idx+"</figcaption>";
				s+="</figure>";
				s+="</div>"; */
				/* s+="<div class='contain-list'>";
				s+="<a href=''/project/detail?idx="+dto.idx+"' class='list-thumbnail'>";
				s+="<div class='img-div'>";
				s+="<img src='../image/"+dto.thumbnail+"'>";
				s+="</div> </a> <a href='/project/detail?idx="+dto.idx+"' class='list-thumbnail'>";
				s+="<div class='txt-div'>";
				s+="<p class='tit'><strong>"+dto.title+"</strong></p>";
				s+="</div> </a> <div> <p>390,000원</p><p>78%</p> </div> </div>"; */
				}
			);
			$(".list-chul-ajax").html(s);
		}
	});
}
</script>
<div class="list-select">
	<div class="wrap">
		<span class="list-gore"> <select class="list-gore-btn">
				<option value="">카테고리</option>
				<option value="공연">공연</option>
				<option value="디자인">디자인</option>
				<option value="사진">사진</option>
				<option value="영화">영화</option>
				<option value="푸드">푸드</option>
				<option value="음악">음악</option>
				<option value="출판">출판</option>
				<option value="패션">패션</option>
		</select>
		</span> <span class="list-gore"> <select class="list-gore-btn">
				<option value="모든">상태</option>
				<option value="인기">인기 프로젝트</option>
				<option value="성공">성공 임박프로젝트</option>
				<option value="신규">신규 프로젝트</option>
				<option value="공개">공개 예정프로젝트</option>
		</select>
		</span> <span class="list-gore"> <select class="list-gore-btn">
				<option value="">달성률</option>
				<option value="75down">75% 이하</option>
				<option value="75to100">75%~100%</option>
				<option value="100up">100% 이상</option>
		</select>
		</span>
	</div>
</div>
<span style="clear:both"></span>
<div class="list-chul-ajax">
</div>