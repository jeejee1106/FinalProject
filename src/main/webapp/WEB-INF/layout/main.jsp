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
	}

	function pagination(){
	  $('#pagination-wrap ul li').removeClass('active');
	  $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
	}
})
</script>
		<!-- Start Banner Hero -->
		<div id="wrapper" style="margin-top: 20px;">
      		<div id="slider-wrap">
	        	<ul id="slider">
	        		<li>
	             	 <div>
	                 	<h3>Slide #1</h3>
	                 	<span>Sub-title #1</span>
	             	 </div>                
					<img src="https://fakeimg.pl/350x200/960a96/000?text=11111">
	           		</li>
	           
	          		 <li>
	              		<div>
	                  		<h3>Slide #2</h3>
	                  		<span>Sub-title #2</span>
	              		</div>
					<img src="https://fakeimg.pl/350x200/D27328/000?text=22222">
	           		</li>
	           
	          		<li>
						<div>
               				<h3>Slide #3</h3>
               				<span>Sub-title #3</span>
            			</div>
					<img src="https://fakeimg.pl/350x200/FF607F/000?text=33333">
             		</li>
             
            		<li>
                		<div>
                    		<h3>Slide #4</h3>
                    		<span>Sub-title #4</span>
                		</div>
					<img src="https://fakeimg.pl/350x200/0A6E0A/000?text=44444">
             		</li>
             
            		<li>
                		<div>
		                    <h3>Slide #5</h3>
		                    <span>Sub-title #5</span>
                		</div>
					<img src="https://fakeimg.pl/350x200/0064CD/000?text=55555">
             		</li>
             
				</ul>
          
           <!--controls-->
          <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
          <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
          <div id="counter"></div>
          <!--controls-->  
      </div>
   </div>
		<!-- End Banner Hero -->
		
		
		
	<div class="div-title">
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
	<div class="div-title">
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
	<div class="div-title">
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
	<div class="div-title">
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
	<div class="bottom-img-div">
		<img src="${root}/image/bottom-logo-img.png">
	</div>
