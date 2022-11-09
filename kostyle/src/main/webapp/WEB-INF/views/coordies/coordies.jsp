<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<html>
<head>
<meta charset="UTF-8">
<title>코디 글 목록</title>

<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<link href="/resources/css/header.css" rel="stylesheet"/>
<link href="/resources/css/footer.css" rel="stylesheet"/> 
<link href="/resources/css/coordies.css" rel="stylesheet"/>

<script src="https://kit.fontawesome.com/89998ce003.js" crossorigin="anonymous"></script>

</head>
<body>
<!-- 헤더 -->
<%@ include file="/WEB-INF/views/include/header.jsp" %> 


<!-- 바디 -->
<div class="panel-body">


	<!-- 글쓰기 버튼 회원/비회원 구분 -->
	<div class="form-group-top">
		<div class="form-group-sort">
			<ul class="sort-ul" style="display: inline;">
				<li>
					<button class="top-btn" type="button" value="created_date" onclick="/coordies/ajaxCoordies?sort=created_date">최신순</button>
				</li>
				<li>
					<button class="top-btn" type="button" value="lk_count" >인기순</button>
				</li>
				<li>
					<button class="top-btn" type="button" value="hitcount">조회순</button>
				</li>
				<li>
					<button class="top-btn" type="button" value="c_count">댓글순</button>
					<!-- onclick="location.href='/coordies/ajaxCoordies?page=${pageMaker.cri.pageNum}&sort=c_count'" -->
				</li>
			</ul>
		</div>
	
		<div class="form-group-btn">
			<button  type="button" class="top-btn" id="register-btn" >글쓰기</button>
			
		</div>
			
	</div>

<section class="page page--static">
	<!-- 코디사진 메인 (무한스크롤) -->
	<div class="form-group" id="form-group-feed">
		<ul class="form-group-feed-ul">
			<!-- 게시글 목록 -->
		</ul>

	</div>	
	
</section>




</div>

<script type="text/javascript" src="/resources/js/coordiComment.js"></script>
<script >

	var feedList =$(".form-group-feed-ul");
	var scrollPage = 1;
	var sort = "";
	var totalCount;
	var endPage;
	
	//이미지 불러오기 card-img-top
	var display = (function loadThumbnail() {
		var uploadResultArr = $('.card-img-top');
		
		$(uploadResultArr).each(function (i, obj) {
			//섬네일 파일을 불러오기 위한 경로
			var fileCallPath = encodeURIComponent($(obj).data('filepath') + "/" + $(obj).data('uuid') + "_" + $(obj).data('filename'));
			// 섬네일 눌렀을 때 원본 파일 호출해서 보여주기
			$(obj).attr('src',"/commons/display?fileName=" + fileCallPath);
			})
		});
	
	
	//페이지 처음 창
	$(document).ready(function () {
		console.log("창 열림")
		
		totalCount = '${pageMaker.total}'	
		endPage = '${pageMaker.endPage}'	
		console.log("총 글 갯수 " + totalCount);	
		console.log("마지막 페이지 " + totalCount);	
		
		getCoordiList(scrollPage); //글 목록 1페이지
 
	})//end document
	
	//스크롤 했을 때
	$(window).scroll(function () {
		
		var scrollTop = $(window).scrollTop() + $(window).height() + 1; //위로 스크롤된 길이		
		var documentHeight = $(document).height(); //문서 전체의 높이 
		
		console.log("스크롤한 길이  " + scrollTop)
		console.log("비교할 값 " + documentHeight)
		
	    if (scrollTop >= documentHeight){
				
	    	scrollTop -= documentHeight;
	    	
	    	console.log("그다음 불러올 페이지" + scrollPage)

	    	if(scrollPage == endPage){
	    		getCoordiList(scrollPage);
	    		return;
	    	}
	    	getCoordiList(scrollPage); //ajax로 게시글 가져오기	

	    }		
	})	 
	
	
	//게시글 목록
	function getCoordiList(page) {
		//sort ='${pageMaker.cri.sort}' 

		console.log("현재 페이지" + page)
	
		console.log("정렬 누른 후 들어오는 솔트값은 :" + sort)
		
	    $.ajax({
	    	url:'/coordies/ajaxCoordies?page='+page+"&sort="+sort,
	    	type:'get',
	    	success:function (htmlList) {
	    		$(".form-group-feed-ul").append(htmlList);
	    		display(); //이미지 출력
	    		scrollPage ++; //페이지 수 증가
	    	
	    	}
	    }) //end ajax
	}//end getCoordiList

	
	//글쓰기 버튼 클릭
	$("#register-btn").on("click", function (e) {
		e.preventDefault();		
		
		self.location="/coordies/register";	
	})//end 글쓰기 클릭 이벤트
	
	
	
	//좋아요 버튼 클릭
		$(".form-group-feed-ul").on("click", ".like-btn" , function () {
	        
	    	//사용자
	    	var mno = '${sessionScope.user.mno}';
	    	
	        //해당 글 번호 받아 저장
	        var cno = $(this).attr("id");
	        console.log("좋아요 클릭");
	        
	        $.ajax({        	
	        	url:"/coordies/like?cno="+cno+"&mno="+mno,
	        	type:"get",
	        	success:function (result) {
	        		let lk_count = '${coordi.lk_count}';
	        		
	        		//페이지에 하트 수 갱신
	        		$(".like_count").text(lk_count);
	        		
	        		console.log("하트 추가, 삭제 성공")
	        		if(result == "꽉찬 하트"){
	        			console.log("꽉찬하트")
	        			$(this).html("<i class='fa-solid fa-heart'></i>"); 
	        		}else if(result = "텅빈 하트"){
	        			console.log("텅빈 하트")
	        			$(this).html("<i class='fa-regular fa-heart'></i>");
	        		}                    
	                    self.location="/coordies"
				},
				error:function (xhr) {
					self.location = "/auth/login"
					console.log(xhr)   
				}
			}); //end ajax	        
	}) //end 좋아요 버튼 클릭

	
	//이미지 클릭
	$(".form-group-feed-ul").on("click", "img" , function (){
		
		console.log("이미지 클릭")
		var cno = $(this).attr("id");
		self.location ="/coordies/get?cno="+cno;
	});
	
	
	//정렬 클릭 //@집가서 다시보기 => 정렬은 모든 페이지 내에서 전체 데이터를 조회해서 1페이지만을 출력해야하는데 1페이지 내에서만 조회하고 출력해버리는 문제 발생
	$("ul .top-btn").on("click", function () {
		sort = $(this).val();
		console.log("정렬 솔트값" + sort)
		
		$(".form-group-feed-ul").empty(); //기존 값 비워주고
		
		console.log("정렬 총 페이지: " + scrollPage)
		
		
		getCoordiList('${pageMaker.cri.pageNum}'); //해당하는 새로운 데이터 가져오기
	});
 
</script> 


<%-- <%@ include file="/WEB-INF/views/include/footer.jsp" %> --%>
</body>
</html>