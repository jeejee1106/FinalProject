<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
$(function() {
	//current position
	var pos = 0;
	//number of slides
	var totalSlides = $('#slider-wrap ul li').length;
	//get the slide width
	var sliderWidth = $('#slider-wrap').width();
	$(document).ready(function(){
	  
	  
	  /*****************
	   BUILD THE SLIDER
	  *****************/
	  //set width to be 'x' times the number of slides
	  $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
	  
	    //next slide  
	  $('#next').click(function(){
	    slideRight();
	  });
	  
	  //previous slide
	  $('#previous').click(function(){
	    slideLeft();
	  });
	  
	  
	  
	  /*************************
	   //*> OPTIONAL SETTINGS
	  ************************/
	  //automatic slider
	  var autoSlider = setInterval(slideRight, 3000);
	  
	  //for each slide 
	  $.each($('#slider-wrap ul li'), function() { 
	     //create a pagination
	     var li = document.createElement('li');
	     $('#pagination-wrap ul').append(li);    
	  });
	  //counter
	  countSlides();
	  
	  //pagination
	  pagination();
	  
	  //hide/show controls/btns when hover
	  //pause automatic slide when hover
	  $('#slider-wrap').hover(
	    function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
	    function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
	  );
	  
	});//DOCUMENT READY
	  
	/***********
	 SLIDE LEFT
	************/
	function slideLeft(){
	  pos--;
	  if(pos==-1){ pos = totalSlides-1; }
	  $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));  
	  //*> optional
	  countSlides();
	  pagination();
	}
	/************
	 SLIDE RIGHT
	*************/
	function slideRight(){
	  pos++;
	  if(pos==totalSlides){ pos = 0; }
	  $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
	  //*> optional 
	  countSlides();
	  pagination();
	}
	  
	/************************
	 //*> OPTIONAL SETTINGS
	************************/
	function countSlides(){
	  $('#counter').html(pos+1 + ' / ' + totalSlides);
	  $('#counter2').val(pos+1);
	}
	function pagination(){
	  $('#pagination-wrap ul li').removeClass('active');
	  $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
	}
	
	
	/************************
	//*>SUB BENNER
	/************************
	/* hidden타입의 input에 값 변경시 감지하는 함수 */
	function survey(selector, callback) {
	    var input = $(selector);
	    var oldvalue = input.val();
	    setInterval(function(){
	       if (input.val()!=oldvalue){
	           oldvalue = input.val();
	           callback();
	       }
	    }, 100);
	}	
	
	survey("counter2", function(){
		sub_
	})
})
</script>
<!-- Start Banner Hero -->
        <input type="text" id="counter2">
<div id="wrapper" style="margin-top: 30px;">
        <!-- 1/5 -->
        <div id="counter"></div>
    <div id="slider-wrap" class="bannerWallpaper">
		<ul id="slider">
         	<li>
			<img src="${root }/img/bg-img/pawinhandxmarimong.png">
          	</li>
          
         	<li>
			<img src="${root }/img/bg-img/hello2022-8.png">
          	</li>
          
         	<li>
			<img src="${root }/img/bg-img/roomfriends_2.png">
           </li>
           
         	<li>
			<img src="${root }/img/bg-img/fantasyart.png">
           </li>
           
         	<li>
			<img src="${root }/img/bg-img/hello2022-8.png">
           </li>
		</ul>
	</div>
    <div id="slider-wrap2" class="testLayout">
    		<div class="sub_benner" id="slider2"></div>
<!--         	<ul id="slider2">
         	<li>
				<div style="background-color: rgb(229, 89, 89); height: 100%;"></div>
          	</li>
          
         	<li>
				<div style="background-color: (29, 50, 102); height: 100%;"></div>
          	</li>
          
         	<li>
				<div style="background-color: rgb(62, 112, 76); height: 100%;"></div>
           </li>
           
         	<li>
				<div style="background-color: rgb(115, 103, 166); height: 100%;"></div>
           </li>
           
         	<li>
				<div style="background-color: yellow; height: 100%;"></div>
           </li>
		</ul> -->
    </div>
         <!--controls-->
        <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
        <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
</div>

<!-- End Banner Hero -->
		
		
<div class="totalLayout">	
	<div class="">
		<a class="list-titles" title="공개예정 프로젝트" href="/listchul/listChul?state=no&category=no">모든 프로젝트 &nbsp;<i class="fa fa-angle-right"></i>
		</a>
	</div>
	<div class="main-lists">
		<c:forEach var="dto" items="${alist}">
			<a href="/project/detail?idx=${dto.idx}&key=detail"class="list-thumbnail">
				<div class="img-div">
					<img src="${root}/thumbnail_image/${dto.thumbnail}">
				</div>
				<div class="txt-div">
					<p class="tit">${dto.title}</p>
				</div>
			</a>
		</c:forEach>
	</div>
	<div class="">
		<a class="list-titles" title="인기 프로젝트" href="/listchul/listChul?state=pop&category=no">인기
			프로젝트 &nbsp;<i class="fa fa-angle-right"></i>
		</a>
	</div>
	<div class="main-lists">

		<c:forEach var="dto" items="${plist}">
			<a href="/project/detail?idx=${dto.idx}&key=detail" class="list-thumbnail">
				<div class="img-div">
					<img src="${root}/thumbnail_image/${dto.thumbnail}">
				</div>
				<div class="txt-div">
					<p class="tit">${dto.title}</p>
				</div>
			</a>
		</c:forEach>
	</div>
	<div class="">
		<a class="list-titles" title="성공임박 프로젝트" href="/listchul/listChul?state=endsoon&category=no">마감임박
			프로젝트 &nbsp;<i class="fa fa-angle-right"></i>
		</a>
	</div>
	<div class="main-lists">

		<c:forEach var="dto" items="${elist}">
			<a href="/project/detail?idx=${dto.idx}&key=detail" class="list-thumbnail">
				<div class="img-div">
					<img src="${root}/thumbnail_image/${dto.thumbnail}">
				</div>
				<div class="txt-div">
					<p class="tit">${dto.title}</p>
				</div>
			</a>
		</c:forEach>
	</div>
	<div class="">
		<a class="list-titles" title="신규 프로젝트" href="/listchul/listChul?state=new&category=no">최신
			프로젝트 &nbsp;<i class="fa fa-angle-right"></i>
		</a>
	</div>
	<div class="main-lists">

		<c:forEach var="dto" items="${nlist}">
			<a href="/project/detail?idx=${dto.idx}&key=detail" class="list-thumbnail">
				<div class="img-div">
					<img src="${root}/thumbnail_image/${dto.thumbnail}">
				</div>
				<div class="txt-div">
					<p class="tit">${dto.title}</p>
				</div>
			</a>
		</c:forEach>
	</div>
	<div>
		<img src="${root}/image/bottom-logo-img.png">
	</div>
</div>