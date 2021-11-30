<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style>
.inner {
	width: 1100px;
	margin: 0 auto;
	position: relative;
}

p {
	margin-left: 300px;
	margin-top: 120px;
	width: 500px;
	height: max-content;
	font-size: 35px;
	position: absolute;
	text-align: center;
}

.red {
	color: red;
	font-weight: bold;
}

.detail {
	font-size: 14px;
}

a {
	color: skyblue;
}
</style>

<div class="inner">
	<p>
		<span class="red">축하합니다. <span class="number"></span>번째<br></span>
		공식 후원자가 되셨습니다! <br> <span class="detail">*후원내역 변경은 <a
			href="">후원상세</a>에서 하실수 있습니다.
		</span>
	</p>
</div>

<script>
  $(function() {
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