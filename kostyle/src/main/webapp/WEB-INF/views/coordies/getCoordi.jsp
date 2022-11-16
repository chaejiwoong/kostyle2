<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>


<html>
<head>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/vendor/bootstrap/css/main.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/header.js"></script>
<link href="/resources/css/header.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/89998ce003.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>


<style type="text/css">
/* 크기지정 */
.py-5{
	width: 50%;
	margin: auto;
}
.mb-5{
	width: 100%;
	height: 100%;
}
	
/* 좋아요 버튼 */
.like-li{
    float: right;
    margin-right: 80px;
    margin-top: 10px;
}
.like-btn{		
    background: none;
    border: none;
    color: #f891aa;		
}	
	
/* 조회수 */
.hitcount-li{	
    float: right;
    margin-right: -130px;
    margin-top: 25px;
    color: gray;
    font-size: smaller;
}
	
/* 댓글 */
.comment-content-text{
    width: 100%;
    height: 35px;
    border-radius: 8px;
   border-color: gray;
}
.write-btn{
    background: none;
    border: none;
    margin-left: -60px;
    color: gray;
}
.comment-list{
	margin: 25px 0px;
}
.comment-list li{
	margin: 10px 0px;
}
.comment-list li:first-child{
	width: 20%;
}
.comment-list li:not(:first-of-type){
	width: 65%;
}
.comment-list li:nth-child(3){
    font-size: smaller;
    color: gray;
    width: 8%;
}
.comment-list li:nth-child(4){
	width: 4%;
}
.comment-remove-btn{
    background: none;
    border: none;
}

/* 페이지 버튼 */
.page-footer a{
	background-color: #35C5F0 !important;
	border-color: #35C5F0 !important;
}

/* 하단 버튼 */
.detail-btn button{
	width: 100px;
    border-radius: 5px;
    padding: 6px;
    background-color: #ffc8c8;
    color: white;
    font-weight: bolder;
    border: none;
}

</style>

</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

 <!-- Section-->
       <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                
                
                    <div class="col mb-5">
                    
                    <!-- 글번호 -->
                    <div class="form-group">
						<input class="form-control" name='cno' hidden=""
						value='<c:out value="${coordi.cno }"/>' readonly="readonly">
					</div>
					
                    <ul style="margin-bottom: 20px;">
                    	<!-- 작성자 -->
                    	<li>
                    		<div class="text-center">                 			
                    			<a class="btn btn-outline-dark mt-auto" href="#" style="border-radius: 20px;"><c:out value="${coordi.email}"/></a>
							</div>
                    	</li>
                    		
                   		<!-- 좋아요 --> 
                   		<li class="like-li">              		
							<c:if test="${!coordi.like}"><!-- 빈하트일때 -->
								<button class="like-btn" id="${coordi.cno }" type="button">
									<i class="fa-regular fa-heart fa-2x"></i>						
									<span class="like-count"><c:out value="${coordi.lk_count}" /></span>
								</button>
							</c:if>
											
							<c:if test="${coordi.like}"><!-- 꽉찬 하트일때 -->
								<button class="like-btn" id="${coordi.cno }" type="button">
									<i class="fa-solid fa-heart fa-2x"></i>
									<span class="like-count"><c:out value="${coordi.lk_count}" /></span>
								</button>
							</c:if>													
                   		</li>
                    		
                    	<!-- 조회수 -->
                   		<li class="hitcount-li">	
                   			<span class="hitcount"> 조회수 <c:out
									value="${coordi.hitcount}" />
							</span>
                   		</li>
                    		
                   	</ul>
                   	
                   		<div class="card h-100" style="border-radius: 15px;">
                   		
                            <!-- 코디 사진 -->
                           <img class="card-img-top" 
								data-filepath="${coordi.filepath }"
								data-filename="${coordi.filename }" data-uuid="${coordi.uuid }"
								style="width: 100%; height: 100%; border-radius: 15px;" />
                           
                                              
                            <!-- 코디 하단 -->
                            <div class="card-body p-4">
                                <div class="text-center">                             
                                    <!-- 제목 -->                                 
                                    <h5 class="fw-bolder"><c:out value="${coordi.title }"/></h5>
                                    <br>
                                    
                                    <!-- 내용 -->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill">
                                        	<c:out value="${coordi.content}" />      					
                                        </div>  
                                	</div>
                                	
                            	</div>
                        	</div>
                      
                    </div>
                    
                    <!-- 수정, 삭제, 목록 버튼 -->
					<div class="detail-btn" style="margin-top: 30px;">
						<span class="list">
							<button class="list-btn" data-oper='list'>목록보기</button> <!-- 나중에 페이지 번호 가져가는거 해보기 -->
						</span>

						<c:if test="${sessionScope.user.email eq coordi.email }">
						<span class="modify">
							<button class="modify-btn" data-oper='modify'>수정하기</button>
						</span>
						
						<span class="remove">
							<button class="remove-btn" data-oper='remove' type="button">삭제하기</button>
						</span>
						</c:if>
			
						<form id="operForm" action="/coordies/modify" method="get">
							<input type="hidden" id="cno" name="cno" value="<c:out value="${coordi.cno }"/>">
						</form>
					</div>	
										
					<!-- 댓글 -->
					<div class="" id="comment" style="margin-top: 20px;">
						<section class="modal-section">
							<P>
								<i class="fa-regular fa-comment-dots fa-2x"></i>
								<span class="comment-count"><c:out value="${coordi.c_count}" /></span>
							</P>
							
							<!-- 댓글 작성 (로그인한 사람만) -->
							<form class="comment-write" method="post">
							<ul>
								<li style="width: 20%">
									<div class="comment-writer">
										<a href="그사람 마이페이지" style="width: 100%">${sessionScope.user.email}</a>
					                			<%-- <c:if test="로그인 안 했을때">
					                			로그인을 해주세요
					                			</c:if> --%>
					                </div>
					            </li>
					            
					            <li style="width: 78%">
					            	<div class="comment-content">
					            		<input class="comment-content-text"  type="text" placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다!">
					                </div>
					            </li>
					            
					            <li>
					            	<div class="comment-btn">
					            		<button class="write-btn" type="button" >입력</button>
					               	 </div> 
					            </li>
							</ul>
							</form>
							
							<!-- 댓글 목록 -->
							<div class="comment-list">							
							</div>
							
							<!-- 페이지 버튼 -->
							<div class="page-footer">
							</div>
					</section>
				</div>
			</div>
		</div>
	</section>
 

<script type="text/javascript" src="/resources/js/coordiComment.js"></script> 

<script>  
	var thumbnail = (function loadThumbnail() {
		var uploadResultArr = $('.card-img-top');
	   
	   $(uploadResultArr).each(function (i, obj) {
	      //섬네일 파일을 불러오기 위한 경로
	      var fileCallPath = encodeURIComponent($(obj).data('filepath').replace(/\\/g,'/') + "/" + $(obj).data('uuid') + "_" + $(obj).data('filename'));
	      // 섬네일 눌렀을 때 원본 파일 호출해서 보여주기
	      $(obj).attr('src',"/commons/display?fileName=" + fileCallPath);
	      })
	   })();

	
	$(document).ready(function () {
		//비회원 버전
		//회원 인증 후
		//수정하기,삭제하기(버튼 숨겨놨다가 본인이랑 작성자랑 같으면 버튼 드러나도록),목록보기 버튼 이벤트
		var operForm = $("#operForm");
		
		
		//console.log("댓글 좌표는" + document.querySelector("#comment").offsetTop);
		
		
		
		//수정하기
		$("button[data-oper='modify']").on("click", function (e) {
			operForm.attr("action", "/coordies/modify").submit();
		});
		
		//삭제하기
		$("button[data-oper='remove']").on("click", function (e) {								
			 e.preventDefault();		
			 $.ajax({
				 url:'/coordies/'+${coordi.cno},
				 type:'delete',
				 success:function(data){
					 alert("삭제가 완료되었습니다");
					 console.log(data);
					 self.location="/coordies"
				 }
			 })
		})
		
		//목록보기
 		$("button[data-oper='list']").on("click", function (e) {
			console.log("목록보기 버튼 클릭");			
 			operForm.find("#cno").remove();
			operForm.attr("action", "/coordies").submit(); 
		}) 

		
		
		//댓글 목록 가져오기
        //회원x버전
        var cno = '<c:out value="${coordi.cno }"/>';
        var commentList = $(".comment-list");

            showList(1);
            
            function showList(page) {
            	
            	console.log("현재 페이지는" + page)
            	console.log("글번호" + cno)
            	
            	commentService.getCommentList({cno:cno, page:page}, function (c_count, list) {
   		
                	if(page == -1){
                		pageNum = Math.ceilc(c_count/10.0);
                		showList(pageNum);
                		return;
                	}            
                	            	
                    var str="";
                    
                    if(list == null || list.length == 0){
                        commentList.html("");                                       
                        return;
                    }              
                    
                    for(var i = 0, len = list.length||0; i<len; i++){
                        str +="<ul><li><a href='그사람 마이페이지'>" + list[i].email + "</a></li>";
                        str +="<li><p>" + list[i].content + "</p></li>";
                        str +="<li><span>" + commentService.displayTime(list[i].date) + "</span></li>";            
                        
             			//작성자별 댓글 삭제 버튼
             			if("${sessionScope.user.email}" == list[i].email ||  "${sessionScope.user.authority}" == "ROLE_ADMIN"){
             				str += "<li class='remove-btn'><button class='comment-remove-btn' type='button' value=" + list[i].ccno + ">";
             				str += '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/><path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/></svg>';    
             				str += "</button></div></li></ul>";
             			}	
                    }
                    commentList.html(str);          
                    
                    showCommentPage(c_count);
                });            	
				
			}//showList 끝
			
			var pageNum = 1;
			var commentPageFooter = $(".page-footer");
			
			function showCommentPage(c_count) {
				
				 var endNum = Math.ceil(pageNum / 10.0) * 10;  
			      var startNum = endNum - 9; 
			      
			      var prev = startNum != 1;
			      var next = false;
			      
			      if(endNum * 5 >= c_count){
			        endNum = Math.ceil(c_count/10.0);
			      }
			      
			      if(endNum * 5 < c_count){
			        next = true;
			      }
			      
			      var str = "<ul class='pagination pull-right'>";
			      
			      if(prev){
			        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>이전</a></li>";
			      }
			      
			      for(var i = startNum ; i <= endNum; i++){
			        
			        var active = pageNum == i? "active":"";
			        
			        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			      }
			      
			      if(next){
			        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>다음</a></li>";
			      }
			      
			      str += "</ul></div>";
			      
			      console.log("댓글 목록: " + str);
			      
			      commentPageFooter.html(str);
			    }
			
				commentPageFooter.on("click","li a", function(e){
				       e.preventDefault();
				       console.log("page click");
				       
				       var targetPageNum = $(this).attr("href");
				       
				       console.log("targetPageNum: " + targetPageNum);
				       
				       pageNum = targetPageNum;
				       
				       showList(pageNum);
				     });    
      		//댓글 페이지 처리 끝
            

				
            //여기서부터 회원만 가능
            //일단 비회원 버전
            //댓글 작성
            $(".write-btn").on("click", function (e) {
            	e.preventDefault();
				
            	var content = $(".comment-content-text").val();
            	//cno 위에 선언해둠         	
            	commentService.addComment({cno:cno, content:content}, function (data) {
					console.log("데이터는" + data)
					self.location = "/coordies/get?cno=" + ${coordi.cno}
				});
            	
			})//댓글 등록 끝

            
            //댓글 삭제
            $(".comment-list").on("click", "button", function (e) {
            	e.preventDefault();
            	
				var ccno = $(this).val();			
				commentService.removeComment(ccno, function () {
					self.location = "/coordies/get?cno=" + ${coordi.cno}
				});

			});//댓글 삭제 끝
	})  
	
	
	//좋아요 버튼 클릭
 	$(".like-btn").on("click" , function () {
    	
    	var mno = '${sessionScope.user.mno}'; //사용자
    	
        //해당 글 번호 받아 저장
        var cno = $(this).attr("id");
        console.log("좋아요 클릭");

        //빈하트 눌렀을 때 (빈하트 꽉찬하트 svg아이콘 클래스명 다르게)
       // if($(this).children("i").attr("class") == "fa-regular fa-heart"){
        //    console.log("빈하트 클릭 / 게시물 번호 :" + cno);
        
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
                    self.location="/coordies/get?cno="+cno;
			},
			error:function (xhr) {
				self.location = "/auth/login"
				console.log(xhr)   
			}
		}); //end ajax	        
	}) //end 좋아요 버튼 클릭		
	
	
	
</script>   


</body>
</html>
