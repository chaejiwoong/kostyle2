<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<html>
<head>
<meta charset="UTF-8">
<title>코디 글 목록</title>
<!-- <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<link href="/resources/css/header.css" rel="stylesheet"/>
<link href="/resources/css/footer.css" rel="stylesheet"/>

<script src="https://kit.fontawesome.com/89998ce003.js" crossorigin="anonymous"></script>

</head>
<body>
<!-- 헤더 -->
<%@ include file="/WEB-INF/views/include/header.jsp" %>


<!-- 바디 -->
<div class="panel-body">
<h1>코디 글 목록</h1>

	<!-- 글쓰기 버튼 회원/비회원 구분 -->
	<div class="form-group">
		<div class="form-group-sort">
			<ul style="display: inline;">
				<li>
					<button class="sort" type="button">최신순</button>
				</li>
				<li>
					<button class="sort" type="button">인기순</button>
				</li>
				<li>
					<button class="sort" type="button">조회순</button>
				</li>
				<li>
					<button class="sort" type="button">댓글순</button>
				</li>
			</ul>
		</div>
	
		<div class="form-group-btn">
			<button  type="button" class="register" id="register-btn" >글쓰기</button>
		</div>
			
	</div>
	
	<!-- 코디사진 메인 (무한스크롤) -->


	<div class="form-group" id="form-group-feed">
		<div class="form-group-feed">
			<!-- 게시글 목록 -->
		</div>
		

		<!-- 로딩이미지? 할까 말까 -->
		<!-- <div class="form-group-loading">
			<div class="back-drop">
			<img src="./로딩이미지 사진 경로"> 
			</div>
		</div> -->
		
		
	</div>	





</div>

<script type="text/javascript" src="/resources/js/coordiComment.js"></script>
<script >

	var feedList =$(".form-group-feed");
	var isLoading = false;
	var scrollPage = 1;
	
	
	$(document).ready(function () {
		
		console.log("창 열림")
		console.log("총 글 갯수 " + '${pageMaker.total}')
		
		getCoordiList(scrollPage); //글 목록 1페이지
		
		$(window).scroll(function () {
			
			var scrollNow = $(window).scrollTop();
			
			console.log("스크롤탑  " + scrollNow)
			console.log("스크롤 비교  " + $("#form-group-feed").height())
			
		    if (scrollNow + $(window).height() + 100 >= $("#form-group-feed").height()){
		       
		    	if(scrollPage == isLoading){
		    		return;
		    	}
		    	getCoordiList(scrollPage); //ajax로 게시글 가져오기
		    }
			
		})	    
	})//end document

	
	//게시글 목록
	function getCoordiList(page) {
	    
		
		console.log("페이지" + page)
		
		
	    if(!isLoading){
	        
	    	isLoading = true;
	        
	    	$.ajax({
	            url:'/coordies/ajaxCoordies?page='+page,
	            type:'get',      
	            success:function (list) {
	            	
	            	console.log("DDD" + list)
	            	
	            	console.log("현재 페이지는 "+ scrollPage);
	            	
	            	$(".form-group-feed").append(list);
	            	
	            	isLoading = false;
	                scrollPage += 1;
	            	
	            	
	            	 /* var str="";

	            	 for(var i=0, len=list.length||0; i<len; i++){
	            		
	            		var fileCallPath = encodeURIComponent(list[i].filepath + "/s_" + list[i].uuid + "_" + list[i].filename);
	            		
	            		console.log("파일패스 " + fileCallPath);
	            		
	            		let Buffer = require('buffer').Buffer;
	            		let path = require('path');
	            		let fs = require('fs');
	            		
	            		let buf = fs.readFileSync(fileCallPath); //binary 형태로 반환됨
	            		let base64 = buf.toString('base64')
	            		fileCallPath = 'data:image/png;base64,${base64}' //binary를 base64로 변환
	            		
	            		image.src = fileCallPath; 
	            		
	            		
	            		str +="<div class='feed-no'>글번호: <span id='no'>"+list[i].cno+"</span></div>";
	            		str +="<div class='feed-writer'>작성자: <a id='writer' href=''>"+list[i].email+"</a></div>";
	            		//str +="<div class='feed-img' ><img src='' data-filepath='" +list[i].filepath+"' data-filename='"+list[i].filename+"' data-uuid='"+list[i].uuid+"' style='width: 300px; height: 400px;'></div>";            		
	            		str +="<div class='feed-img' ><img src='"+fileCallPath+"' style='width: 300px; height: 400px;'></div>";            		
	    				str +="<div class='feed-btn'><a class='feed-comment-count' href='/coordies/get?cno="+list[i].cno+"'>댓글<span id='commentCount'>"+list[i].c_count+"</span></a>";
	    				str +="<span id='feed-hitcount'>조회수: "+list[i].hitcount+"</span></div>"
	    				str +="<div class='feed-title'>제목: <a id='title' href='/coordies/get?cno="+list[i].cno+"'>"+list[i].title+"</a></div>";
            			str +="=========================" 
	            	}
	            	feedList.html(str);
	                
	            }
	        })
	    }
	    
	}//end getCoordiList
	
	
	//글쓰기 버튼 클릭
	$("#register-btn").on("click", function (e) {
		e.preventDefault();		
		
		self.location="/coordies/register";	
	})//end 글쓰기 클릭 이벤트

	
	

	//좋아요 버튼 클릭
	$(".like-btn").on("click", function () {
	        
	    	//사용자
	    	var mno = '${sessionScope.user.mno}';
	    	
	        //해당 글 번호 받아 저장
	        var cno = $(this).attr("id");
	        console.log("좋아요 클릭");

	        //빈하트 눌렀을 때 (빈하트 꽉찬하트 svg아이콘 클래스명 다르게)
	        if($(this).children("svg").attr("class") == "빈하트 클래스명"){
	            console.log("빈하트 클릭 / 게시물 번호 :" + cno);
	            
	            $.ajax({
	                url:"/likeUp",
	                type:"get",
	                data:{
	                	cno : cno,
	                	mno : mno
	                }
	                success:function (coordi객체) {

	                    let lk_count = coordi.lk_count;

	                    //페이지에 하트 수 갱신?
	                    //$(".like_count" + cno).text(lk_count);  블로그 내용:cno는 왜 더하지
	                    $(".like_count").text(lk_count);
	                    
	                    $(".like-btn")
	                    
	                    
	                    console.log("하트 추가 성공")
	                },
	                error:function (xhr) {
	                    console.log(xhr)   
	                }
	            });

	            //꽉찬 하트로 바꾸기
	            $(this).html("<svg~ 꽉찬 하트 아이콘"); //이거 안 먹으면 아래꺼 쓰기
	            //$(".like-btn").html("<svg~ 꽉찬 하트 아이콘");

	        }else if($(this).children("svg").attr("class") == "꽉찬하트 클래스명"){

	            console.log("꽉찬하트 클릭 / 게시물번호 : " + cno)

	            $.ajax({
	                url:"/likeDown",
	                type:"get",
	                data:cno,
	                success:function(coordi객체){

	                    let lk_count = coordi.lk_count;

	                    //페이지에 하트 수 갱신
	                    $(".like_count").text(lk_count);

	                    console.log("하트 삭제 성공")    
	                },
	                error:function (xhr) {
	                    console.log(xhr)   
	                }
	            });

	            //빈 하트로 바꾸기
	            $(this).html("<svg~ 빈 하트 아이콘"); //이거 안 먹으면 아래꺼 쓰기
	            //$(".like-btn").html("<svg~ 빈 하트 아이콘");
	        }
	    }) */


</script> 


<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>