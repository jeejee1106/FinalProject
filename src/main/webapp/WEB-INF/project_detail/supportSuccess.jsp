<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style>
.inner {
	width: 1100px;
	height: 600px; margin : 0 auto;
	position: relative;
	margin: 0 auto;
}

.inner p {
	margin-left: 300px;
	margin-top: 120px;
	width: 500px;
	height: max-content;
	font-size: 35px;
	text-align: center;
}

.inner p .red {
	color: red;
	font-weight: bold;
}

.inner p .detail {
	font-size: 14px;
}

.inner p a {
	color: skyblue;
}

.inner .title {
	margin-top: 60px;
	margin-left: 30px; width : 250px;
	height: 30px;
	font-size: 18px;
	font-weight: bold;
	width: 250px;
}

.inner .recommend-container {
	width: 1140px;
	height: 250px;
	display: flex;
	padding-right: 50px;
}

.inner .recommend-container .project-container {
	width: 260px;
	height: 260px;
	margin-left: 20px;
	margin-top: 10px;
	font-size: 15px;
	box-sizing: border-box;
	cursor: pointer;
}

.inner .recommend-container .project-container .project-img {
	width: 260px;
	height: 200px;
	box-sizing: border-box;
}

.inner .recommend-container .project-container .project-title {
	width: 260px;
	height: 60px;
	background-color: rgba(0, 0, 0, 0.6);
	box-sizing: border-box;
	padding: 15px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	word-break: break-all;
	color: white;
	font-weight: bold;
}
</style>

<div class="inner">
	<p>
		<span class="red">축하합니다. <span class="number"></span>번째<br></span>
		공식 후원자가 되셨습니다! <br> <span class="detail">*후원내역 변경은 <a
			href="">후원상세</a>에서 하실수 있습니다.
		</span>
	</p>
	<c:if test="${recommendList.size()>3}">
		<div class="title">
			<span>이런 프로젝트는 어때요?</span>
		</div>
		<div class="recommend-container">
			<c:forEach var="dto" items="${recommendList}" begin="0" end="4">
				<div class="project-container">
					<input type = "hidden" id="idx" value="${dto.idx}">
					<img class="project-img" src="../thumbnail_image/${dto.thumbnail}"
						alt="">
					<div class="project-title">
						<span>${dto.title}</span>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
</div>

<script>
  $(function() {
		$(".project-container").click(function () {
			let idx = $(this).find("#idx").val();
			alert(idx)
			location.href='../project/detail?idx='+idx;
		})  
	  
        let startNum = 0;
        let sponsorNum = ${supportNum};
        let countSpeed = 60;
        if(sponsorNum > 50){
            countSpeed = 10;
        }
        counterSponsor();

        function counterSponsor() {

            count = setInterval(countNum, countSpeed);

            function countNum() {
                startNum++;
                if (startNum > sponsorNum) {
                clearInterval(count);
                } else {
                $(".number").text(startNum);
                }
            }
        }
    });
</script>