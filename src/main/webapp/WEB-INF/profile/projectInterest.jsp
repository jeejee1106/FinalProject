<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 관심 프로젝트 -->

<link rel="stylesheet" type="text/css" href="/css/profile.css">

<script type="text/javascript">
	$(function() {
		list();
	});
	
	function list() {
		$.ajax ({
			type: "get",
			dataType: "json",
			url: ""
		});
	}
</script>

<!-- 메뉴 -->
<div class="container">

	<div class="header-profile">
	
		<div class="container-user">
 				<div class="user-photo" style="width: 100px; height: 100px;">
					<c:choose>
						<c:when test="${sessionScope.id == id and dto.photo == null}">
				    		<img src="../photo/basic.jpg"/>
						</c:when>
						<c:when test="${sessionScope.id == id and dto.photo != null}">
			    			<img src="../photo/${photo }"/>
						</c:when>
						<c:otherwise>
			    			<img src="../photo/${movedto.photo }"/>
						</c:otherwise>
					</c:choose>
	    		</div>
				<div class="a">
					<div class="user-name">
						<c:if test="${sessionScope.id == id }">
							<span>${dto.name }</span>
						</c:if>
						<c:if test="${sessionScope.id != id }">
							<span>${movedto.name }</span>
						</c:if>
						<c:if test="${sessionScope.id == id }">
							<a class="user-info" href="/setting/main">
								<div name="setting">
									<img src="${root }/img/core-img/settings.png">
								</div>
							</a>
						</c:if>
					</div>
				</div>
		</div>
		
		<div class="container-tab">
			<div class="tab-warpper">
			<c:if test="${ sessionScope.id != 'admin'}">
				<div class="tab-warpper-in">
					<span class="tab current">
						<div class="link-wrapper">
							<a href="/profile" class="select">소개</a>
						</div>
					</span>
					<span class="tab">
						<div class="link-wrapper">
							<a href="/profile/backed">후원한 프로젝트 </a>
						</div>
					</span>
					<span class="tab">
						<div class="link-wrapper">
							<a href="/profile/created">올린 프로젝트
							</a>
						</div>
					</span>
					<span class="tab">
						<div class="link-wrapper">
							<a href="/profile/liked">관심프로젝트 </a>
						</div>
					</span>
					<c:if test="${sessionScope.id == id }">
						<span class="tab">
							<div class="link-wrapper">
								<a href="/message/receivedMessage">메세지 </a>
							</div>
						</span>
						</c:if>
						<c:if test="${id != sessionScope.id}">
							<span class="tab">
								<div class="link-wrapper">
									<a class='personal-chat'>채팅 </a>
								</div>
							</span>
						</c:if>
					</div>
			</c:if>
			<!-- 관리자 -->
			<c:if test="${sessionScope.id == 'admin'}">
				<div class="tab-warpper-in">
					<span class="tab current">
						<div class="link-wrapper">
							<a href="#">회원목록</a>
						</div>
					</span>
					<span class="tab">
						<div class="link-wrapper">
							<a href="#">프로젝트 </a>
						</div>
					</span>
				</div>
			</c:if>
			</div>
		</div>
	</div>
							<form name="popForm">
							<input type="hidden" name="id" value="${id}" />
						</form>

</div>
<!--  -->
<div
	class="ProjectListWithCard__ListWrapper-sc-80ruv-4 dDlzrp Liked__StyledProjectListWithCard-sc-1ie8qjp-10 dIzNAL">
	<div class="ProjectListWithCard__ListSubWrapper-sc-80ruv-5 etiKPc">
		<div class="ProjectListWithCard__ProjectCounter-sc-80ruv-2 eTjENz"></div>
		<div class="ProjectListWithCard__SortWrapper-sc-80ruv-6 ikTKgr">
			<div class="ComboBox__ComboBoxWrapper-u0j2ou-0 jKglZR">
				<button class="ComboBox__ComboBoxOpener-u0j2ou-1 enaFCm">
					<span>추가순<i
						class="_13KHfN73YmQgsYHxXvuh_J _1QY7TzdLHKX3-BKPDNNYKF yv2X_NOjMYirwH0R23J17 _1VrPfMADpAt7zR19Yj-duV"></i></span>
				</button>
			</div>
		</div>
	</div>
	<div
		class="Container__ContainerComponent-sc-1ey2h1l-0 kUAclQ Liked__ListWrapper-sc-1ie8qjp-0 cgUBxs ProjectListWithCard__StyledWrapperComponent-sc-80ruv-0 deBJIz">
		<div class="card-wrapper">
			<div class="ProjectCard__Wrapper-opxl0a-10 dDwhHI">
				<div class="ProjectCard__Card-opxl0a-5 cnhGLf link-wrapper">
					<div name="editor_pick"
						class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs ProjectCard__StyledEditorpickIcon-opxl0a-11 dKtosL">
						<svg viewBox="0 0 48 48">
							<path fill-rule="evenodd" clip-rule="evenodd"
								d="M2 14V34H46L41.299 24L46 14H2Z"></path>
							<path fill-rule="evenodd" clip-rule="evenodd"
								d="M23.6 26.7217C24.4 26.7217 24.9 26.0637 24.9 25.2637V25.0637H26.8V25.2637C26.7 26.9637 25.5 28.3217 23.8 28.3217H23.5C21.6 28.4217 19.9 27.0217 19.8 25.0217V24.4217V23.5217C19.6 21.6217 20.9 19.9217 22.8 19.6217H23.4C25.1 19.4217 26.6 20.6217 26.8 22.3217V22.6217V22.8217H24.9C25 22.0217 24.4 21.3217 23.6 21.2217H23.4C22.4 21.2217 21.8 22.0217 21.8 23.4217V24.5217C21.8 25.9217 22.6 26.7217 23.6 26.7217ZM11.8 24.1213H11L11.1 21.3213H12.1H12.3C13 21.4213 13.5 22.0213 13.4 22.7223C13.4 23.7223 12.8 24.1213 11.8 24.1213ZM15.4 22.4213C15.3 20.8213 14 19.7223 12.5 19.8213H9V28.2223H11V25.6213H12.4H12.8C14.3 25.5213 15.5 24.2223 15.4 22.7223V22.4213ZM18.5999 28.2217H16.5999V19.8217H18.5999V28.2217ZM35.4995 28.2217L32.4995 23.5217L35.4995 19.8217H33.3005L30.3995 23.4217H30.3005V19.8217H28.3005V28.2217H30.3005V25.7217L30.9995 24.8217L33.1005 28.2217H35.4995Z"></path></svg>
					</div>
					<div
						class="LikeButton__Wrapper-whittq-0 gavScN ProjectCard__StyledLikeButton-opxl0a-6 kKYhmq">
						<button type="button" class="LikeButton__LikedBtn-whittq-1 zFifS">
							<span>좋아요</span>
						</button>
					</div>
					<div class="image-wrapper">
						<a
							href="/year_end_book_2021?ref=%EA%B4%80%EC%8B%AC%2F%EC%A2%8B%EC%95%84%ED%95%9C"><img
							alt=""
							src="https://tumblbug-pci.imgix.net/d144c62f4eb6a5beda1ee962d6490e198b63fd1b/9f292bd00b9fd7821c9ce0a9b4efded33d1661bf/a77105434e88c0b839ee6ea7bfaf45cc9a686538/5eb2744d-8d58-477e-ba38-4715a7b401dd.jpeg?auto=format%2Ccompress&amp;fit=crop&amp;h=465&amp;lossless=true&amp;w=620&amp;s=12b9375958567ed386119a9f7edb1a6e"></a>
					</div>
					<dl>
						<dt>
							<a
								href="/year_end_book_2021?ref=%EA%B4%80%EC%8B%AC%2F%EC%A2%8B%EC%95%84%ED%95%9C">2021년을
								기록하는 100가지 질문, &lt;연말정산&gt; 7주년</a>
						</dt>
						<dd class="project-sub-info">
							<span><a
								href="/discover?category=practical-and-hooby-books">실용 · 취미</a></span><span><a
								href="/u/userwabushidane">DAY-OFF</a></span>
						</dd>
						<dd class="project-desc">1년을 의미있게 마무리하는 일, &lt;연말정산&gt;에
							2021년을 기록하세요!</dd>
					</dl>
					<div class="ProjectCard__PercentageBar-opxl0a-9 fqAZao"></div>
					<div class="ProjectCard__FundingStatus-opxl0a-8">
						<span class="funding-amount"><em>32,130,000</em>원</span><span
							class="percentage">6426%</span><span class="rest-day"><div
								name="time"
								class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs ProjectCard__StyledSVGIcon-opxl0a-0 jTfJfo">
								<svg viewBox="0 0 48 48">
									<path fill-rule="evenodd" clip-rule="evenodd"
										d="M4.5 24C4.5 34.8 13.2 43.5 24 43.5C34.8 43.5 43.5 34.8 43.5 24C43.5 13.3 34.8 4.5 24 4.5C13.2 4.5 4.5 13.2 4.5 24ZM2 24C2 11.9 11.9 2 24 2C36.1 2 46 11.9 46 24C46 36.1 36.1 46 24 46C11.9 46 2 36.1 2 24ZM22.8002 12.5H25.2002V24.4L32.8002 30.1L31.4002 32.1L22.8002 25.6V12.5Z"></path></svg>
							</div>4시간 남음</span>
					</div>
				</div>
			</div>
		</div>
		<div class="card-wrapper">
			<div class="ProjectCard__Wrapper-opxl0a-10 dDwhHI">
				<div class="ProjectCard__Card-opxl0a-5 cnhGLf link-wrapper">
					<div name="editor_pick"
						class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs ProjectCard__StyledEditorpickIcon-opxl0a-11 dKtosL">
						<svg viewBox="0 0 48 48">
							<path fill-rule="evenodd" clip-rule="evenodd"
								d="M2 14V34H46L41.299 24L46 14H2Z"></path>
							<path fill-rule="evenodd" clip-rule="evenodd"
								d="M23.6 26.7217C24.4 26.7217 24.9 26.0637 24.9 25.2637V25.0637H26.8V25.2637C26.7 26.9637 25.5 28.3217 23.8 28.3217H23.5C21.6 28.4217 19.9 27.0217 19.8 25.0217V24.4217V23.5217C19.6 21.6217 20.9 19.9217 22.8 19.6217H23.4C25.1 19.4217 26.6 20.6217 26.8 22.3217V22.6217V22.8217H24.9C25 22.0217 24.4 21.3217 23.6 21.2217H23.4C22.4 21.2217 21.8 22.0217 21.8 23.4217V24.5217C21.8 25.9217 22.6 26.7217 23.6 26.7217ZM11.8 24.1213H11L11.1 21.3213H12.1H12.3C13 21.4213 13.5 22.0213 13.4 22.7223C13.4 23.7223 12.8 24.1213 11.8 24.1213ZM15.4 22.4213C15.3 20.8213 14 19.7223 12.5 19.8213H9V28.2223H11V25.6213H12.4H12.8C14.3 25.5213 15.5 24.2223 15.4 22.7223V22.4213ZM18.5999 28.2217H16.5999V19.8217H18.5999V28.2217ZM35.4995 28.2217L32.4995 23.5217L35.4995 19.8217H33.3005L30.3995 23.4217H30.3005V19.8217H28.3005V28.2217H30.3005V25.7217L30.9995 24.8217L33.1005 28.2217H35.4995Z"></path></svg>
					</div>
					<div
						class="LikeButton__Wrapper-whittq-0 gavScN ProjectCard__StyledLikeButton-opxl0a-6 kKYhmq">
						<button type="button" class="LikeButton__LikedBtn-whittq-1 zFifS">
							<span>좋아요</span>
						</button>
					</div>
					<div class="image-wrapper">
						<a
							href="/doctor25_ver2?ref=%EA%B4%80%EC%8B%AC%2F%EC%A2%8B%EC%95%84%ED%95%9C"><img
							alt=""
							src="https://tumblbug-pci.imgix.net/d05a1d64f756ec69917d918d04d51173c6bcdef9/8623a894f67815de2d3c823a7335ff4fea53a174/cc591deae9995e762856e85960c0d76d9306e1a4/1d2ed3cc-f009-428b-bcf2-338e30a92af7.png?auto=format%2Ccompress&amp;fit=crop&amp;h=465&amp;lossless=true&amp;w=620&amp;s=5b09231f9ec31d7b77f4a64cc0151bb6"></a>
					</div>
					<dl>
						<dt>
							<a
								href="/doctor25_ver2?ref=%EA%B4%80%EC%8B%AC%2F%EC%A2%8B%EC%95%84%ED%95%9C">의사들이
								직접 만든 구급함 [우리집 미니 응급실]</a>
						</dt>
						<dd class="project-sub-info">
							<span><a href="/discover?category=hardware">하드웨어</a></span><span><a
								href="/u/xbkrjhbfooktqhsq">닥터25</a></span>
						</dd>
						<dd class="project-desc">살면서 마주하는 다양한 응급상황들, 닥터25 응급키트로 든든하게
							대비하세요!</dd>
					</dl>
					<div class="ProjectCard__BackersInfo-opxl0a-7 fKywvA">
						<div
							class="Avatar__Wrapper-t8o1rw-1 LhMwB ProjectCard__StyledAvatar-opxl0a-1 gpOGjh fnt">
							<div class="Avatar__ProfileImageWrapper-t8o1rw-2 gaIkYq">
								<div
									src="https://tumblbug-upi.imgix.net/10e469ef9bc61ad745733e3ce75ebb42a7d2e742.jpg?auto=format%2Ccompress&amp;ch=Save-Data&amp;facepad=2.0&amp;fit=facearea&amp;h=200&amp;mask=ellipse&amp;w=200&amp;s=0e97f35f74f1a869db258c447d74b384"
									class="Avatar__ProfileImage-t8o1rw-3 gqlJZj"></div>
							</div>
						</div>
						<div
							class="Avatar__Wrapper-t8o1rw-1 LhMwB ProjectCard__StyledAvatar-opxl0a-1 gpOGjh fnt">
							<div class="Avatar__ProfileImageWrapper-t8o1rw-2 gaIkYq">
								<div
									src="https://tumblbug-upi.imgix.net/0803f2a8-357c-4e95-b315-4da8cc624889.jpg?auto=format%2Ccompress&amp;ch=Save-Data&amp;facepad=2.0&amp;fit=facearea&amp;h=200&amp;mask=ellipse&amp;w=200&amp;s=1b132664626e6f8a188ae189df10984c"
									class="Avatar__ProfileImage-t8o1rw-3 eDFDYI"></div>
							</div>
						</div>
						<div
							class="Avatar__Wrapper-t8o1rw-1 LhMwB ProjectCard__StyledAvatar-opxl0a-1 gpOGjh fnt">
							<div class="Avatar__ProfileImageWrapper-t8o1rw-2 gaIkYq">
								<div
									src="https://tumblbug-upi.imgix.net/cb048b80d0997d747b223207b2b04f36eff5de60.jpg?auto=format%2Ccompress&amp;ch=Save-Data&amp;facepad=2.0&amp;fit=facearea&amp;h=200&amp;mask=ellipse&amp;w=200&amp;s=4b5ab3ba16edc9f208a0f162017307cb"
									class="Avatar__ProfileImage-t8o1rw-3 REbBG"></div>
							</div>
						</div>
						<em>603</em>명의 후원으로 펀딩 성공
					</div>
				</div>
			</div>
		</div>
		<div class="card-wrapper">
			<div class="ProjectCard__Wrapper-opxl0a-10 dDwhHI">
				<div class="ProjectCard__Card-opxl0a-5 cnhGLf link-wrapper">
					<div
						class="LikeButton__Wrapper-whittq-0 gavScN ProjectCard__StyledLikeButton-opxl0a-6 kKYhmq">
						<button type="button" class="LikeButton__LikedBtn-whittq-1 zFifS">
							<span>좋아요</span>
						</button>
					</div>
					<div class="image-wrapper">
						<a
							href="/mythago2021?ref=%EA%B4%80%EC%8B%AC%2F%EC%A2%8B%EC%95%84%ED%95%9C"><img
							alt=""
							src="https://tumblbug-pci.imgix.net/1707fb6cb8ce42a8cc0e976994c65e4c14b54019/d144c62f4eb6a5beda1ee962d6490e198b63fd1b/db5126fd9501a8883642fb3f4c211fed3ec01402/40ccd5f5-8597-4a82-a655-160d692d5dc0.jpeg?auto=format%2Ccompress&amp;fit=crop&amp;h=465&amp;lossless=true&amp;w=620&amp;s=daa46dd5cbabbc17df64cd22c0e40c18"></a>
					</div>
					<dl>
						<dt>
							<a
								href="/mythago2021?ref=%EA%B4%80%EC%8B%AC%2F%EC%A2%8B%EC%95%84%ED%95%9C">크리스마스
								선물로, 미사고블루의 조디악&amp;새알 스카프/머플러</a>
						</dt>
						<dd class="project-sub-info">
							<span><a href="/discover?category=fashion-goods">잡화</a></span><span><a
								href="/u/mythagoblue">Mythago Jin</a></span>
						</dd>
						<dd class="project-desc">미사고블루의 2021 F/W 스카프와 머플러. 신비로운 조디악과
							아름다운 새알 컬렉션!</dd>
					</dl>
					<div class="ProjectCard__PercentageBar-opxl0a-9 fRszWt"></div>
					<div class="ProjectCard__FundingStatus-opxl0a-8">
						<span class="funding-amount"><em>6,581,000</em>원</span><span
							class="percentage">658%</span><span class="rest-day"><div
								name="time"
								class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs ProjectCard__StyledSVGIcon-opxl0a-0 jTfJfo">
								<svg viewBox="0 0 48 48">
									<path fill-rule="evenodd" clip-rule="evenodd"
										d="M4.5 24C4.5 34.8 13.2 43.5 24 43.5C34.8 43.5 43.5 34.8 43.5 24C43.5 13.3 34.8 4.5 24 4.5C13.2 4.5 4.5 13.2 4.5 24ZM2 24C2 11.9 11.9 2 24 2C36.1 2 46 11.9 46 24C46 36.1 36.1 46 24 46C11.9 46 2 36.1 2 24ZM22.8002 12.5H25.2002V24.4L32.8002 30.1L31.4002 32.1L22.8002 25.6V12.5Z"></path></svg>
							</div>9일 남음</span>
					</div>
				</div>
			</div>
		</div>
		<div class="card-wrapper">
			<div class="ProjectCard__Wrapper-opxl0a-10 dDwhHI">
				<div class="ProjectCard__Card-opxl0a-5 cnhGLf link-wrapper">
					<div name="editor_pick"
						class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs ProjectCard__StyledEditorpickIcon-opxl0a-11 dKtosL">
						<svg viewBox="0 0 48 48">
							<path fill-rule="evenodd" clip-rule="evenodd"
								d="M2 14V34H46L41.299 24L46 14H2Z"></path>
							<path fill-rule="evenodd" clip-rule="evenodd"
								d="M23.6 26.7217C24.4 26.7217 24.9 26.0637 24.9 25.2637V25.0637H26.8V25.2637C26.7 26.9637 25.5 28.3217 23.8 28.3217H23.5C21.6 28.4217 19.9 27.0217 19.8 25.0217V24.4217V23.5217C19.6 21.6217 20.9 19.9217 22.8 19.6217H23.4C25.1 19.4217 26.6 20.6217 26.8 22.3217V22.6217V22.8217H24.9C25 22.0217 24.4 21.3217 23.6 21.2217H23.4C22.4 21.2217 21.8 22.0217 21.8 23.4217V24.5217C21.8 25.9217 22.6 26.7217 23.6 26.7217ZM11.8 24.1213H11L11.1 21.3213H12.1H12.3C13 21.4213 13.5 22.0213 13.4 22.7223C13.4 23.7223 12.8 24.1213 11.8 24.1213ZM15.4 22.4213C15.3 20.8213 14 19.7223 12.5 19.8213H9V28.2223H11V25.6213H12.4H12.8C14.3 25.5213 15.5 24.2223 15.4 22.7223V22.4213ZM18.5999 28.2217H16.5999V19.8217H18.5999V28.2217ZM35.4995 28.2217L32.4995 23.5217L35.4995 19.8217H33.3005L30.3995 23.4217H30.3005V19.8217H28.3005V28.2217H30.3005V25.7217L30.9995 24.8217L33.1005 28.2217H35.4995Z"></path></svg>
					</div>
					<div
						class="LikeButton__Wrapper-whittq-0 gavScN ProjectCard__StyledLikeButton-opxl0a-6 kKYhmq">
						<button type="button" class="LikeButton__LikedBtn-whittq-1 zFifS">
							<span>좋아요</span>
						</button>
					</div>
					<div class="image-wrapper">
						<a
							href="/liber_perfume_2?ref=%EA%B4%80%EC%8B%AC%2F%EC%A2%8B%EC%95%84%ED%95%9C"><img
							alt=""
							src="https://tumblbug-pci.imgix.net/745e4ad4e6ac53fb909a3c8da8b7e3e72a53e64d/78dcc3cfd8056cc15cee044f1d1e77f8e66cb6cc/f896e1f4bba93496e3d82d2f34fe38f2cfe49125/6598bfba-16d9-4f54-97e6-6f48cc046416.jpeg?auto=format%2Ccompress&amp;fit=crop&amp;h=465&amp;lossless=true&amp;w=620&amp;s=4d3b4e98f51532551aa72d1db6be57e6"></a>
					</div>
					<dl>
						<dt>
							<a
								href="/liber_perfume_2?ref=%EA%B4%80%EC%8B%AC%2F%EC%A2%8B%EC%95%84%ED%95%9C">&lt;금목서&gt;,&lt;정산소종&gt;
								가을과 겨울 그 사이 어딘가의 향.</a>
						</dt>
						<dd class="project-sub-info">
							<span><a href="/discover?category=perfumes">조향</a></span><span><a
								href="/u/liber">리베르</a></span>
						</dd>
						<dd class="project-desc">가을과 겨울 사이, 향을 통한 시간의 복원. 새로운 리베르 향수
							2종 단독 공개.</dd>
					</dl>
					<div class="ProjectCard__PercentageBar-opxl0a-9 cWPWdr"></div>
					<div class="ProjectCard__FundingStatus-opxl0a-8">
						<span class="funding-amount"><em>108,839,500</em>원</span><span
							class="percentage">21767%</span><span class="rest-day"><div
								name="time"
								class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs ProjectCard__StyledSVGIcon-opxl0a-0 jTfJfo">
								<svg viewBox="0 0 48 48">
									<path fill-rule="evenodd" clip-rule="evenodd"
										d="M4.5 24C4.5 34.8 13.2 43.5 24 43.5C34.8 43.5 43.5 34.8 43.5 24C43.5 13.3 34.8 4.5 24 4.5C13.2 4.5 4.5 13.2 4.5 24ZM2 24C2 11.9 11.9 2 24 2C36.1 2 46 11.9 46 24C46 36.1 36.1 46 24 46C11.9 46 2 36.1 2 24ZM22.8002 12.5H25.2002V24.4L32.8002 30.1L31.4002 32.1L22.8002 25.6V12.5Z"></path></svg>
							</div>10일 남음</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 스크립트 -->
<script type="text/javascript">
$(function () {
   $(".personal-chat").click(function() {
      /* let num = ${num}; */
      /* var win = window.open("../chat/personalChat?num="+num, "PopupWin", "width=480,height=765 , left = 400px, top = 100px");  */
      onSubmit()
   })
})   

function onSubmit(){
 var myForm = document.popForm;
 var url = "/chat/personalChat";
 window.open("" ,"popForm","width=480,height=765 , left = 400px, top = 100px");
 myForm.action =url;
 myForm.method="post";
 myForm.target="popForm";
 myForm.submit();
}
</script>

<!-- 관심프로젝트 -->
<div class="container">

	<div class="title">
		<h1>관심 프로젝트</h1>
	</div>
	<div class="created-wrapper">
		<div class="project-wrapper">
			<div class="project-count">
				<em>0</em>개의 프로젝트를 좋아합니다.
			</div>
			<div class="project-list">
				<!-- 리스트 0개 -->
				<div class="list-zero">
					<div name="like-line" class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs Liked__StyledSVGIcon-sc-1ie8qjp-6 fUVLV">
					</div>
					<span class="message-wrapper">좋아한 프로젝트가 없습니다.</span>
				</div>
				<!-- /리스트 0개 -->
				<!-- 테스트 -->
				<div class="list-attention"></div>
				<!--  -->
				<div class="card-wrapper">
					<div class="link-wrapper">
						<div class="like-button-wrapper">
							<button type="button" class="like-button">
								<span>좋아요</span>
							</button>
						</div>
						<div class="image-wrapper">
							<a href="#">
								<img src="#"></a>
						</div>
						<dl>
							<dt>
								<a href="#">프로젝트 이름</a>
							</dt>
							<dd class="project-sub-info">
								<span><a href="#">카테고리</a></span>
								<span><a href="#">창작자 이름</a></span>
							</dd>
							<dd class="project-desc">작은 제목</dd>
						</dl>
						<div class="percentage-bar"></div><!-- 선 -->
						<div class="funding-status">
							<span class="funding-amount">
								<em>12,445,000</em>원
							</span>
							<span class="percentage">2489%</span>
							<span class="rest-day">
								<div name="time" class="Icon__SVGICON-sc-1xkf9cp-0 ccxeYs ProjectCard__StyledSVGIcon-opxl0a-0 jTfJfo">
								</div>
								9일 남음
							</span>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	
</div>
