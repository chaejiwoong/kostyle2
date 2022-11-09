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

</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

 <!-- Section-->
       <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                
                
                    <div class="col mb-5" style="width: 700px; height: 1000px;">
                    
                    <div class="form-group">
						<input class="form-control" name='cno' hidden=""
						value='<c:out value="${coordi.cno }"/>' readonly="readonly">
					</div>
					
                    	<ul>
                    		<li>
                    			<!-- 작성자 -->
                    			<div class="text-center">
                    				<a class="btn btn-outline-dark mt-auto" href="#">
                    					<input class="form-control" name='email'
										value='<c:out value="${coordi.email }"/>' readonly="readonly">
                   					</a>                   
                   				 </div>
                    		</li>
                    		
                    		<li>        
	                    		<!-- 좋아요 -->        		
								<c:if test="${!coordi.like}"><!-- 빈하트일때 -->
									<button class="like-btn" id="${coordi.cno }" type="button">
										<i class="fa-regular fa-heart"></i><!-- svg 하트 아이콘 -->좋아요							
										<span class="like-count"><c:out value="${coordi.lk_count}" /></span>
									</button>
								</c:if>
											
								<c:if test="${coordi.like}"><!-- 꽉찬 하트일때 -->
									<button class="like-btn" id="${coordi.cno }" type="button">
										<i class="fa-solid fa-heart"></i><!-- svg 하트 아이콘 -->좋아요
										<span class="like-count"><c:out value="${coordi.lk_count}" /></span>
									</button>
								</c:if>													
                    		</li>
                    		
                    		<li>
                    			<!-- 조회수 -->
                    			<div class="form-group">
									<label>조회수</label> <input class="form-control" name='hitcount'
									value='<c:out value="${coordi.hitcount }"/>' readonly="readonly">
								</div>
                    		</li>
                    	</ul>
                    
                    
                    


                        <div class="card h-100">
                            <!-- 코디 사진 -->
                           <img class="card-img-top" 
								data-filepath="${coordi.filepath }"
								data-filename="${coordi.filename }" data-uuid="${coordi.uuid }"
								style="width: 700px; height: 700px; border-radius: 15px;" />
                           
                           

                           
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">                             
                                    <!-- 제목 -->
                                    <h5 class="fw-bolder">
       									<input class="form-control" name='title' value='<c:out value="${coordi.title }"/>' readonly="readonly">
	           						</h5>
                                    <br>
                                    
                                    <!-- 내용 -->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill">
                                        	<textarea class="form-control" rows="3" name='content'
											readonly="readonly"><c:out value="${coordi.content}" /></textarea>        					
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                
                        </div>
                        
                        
                        <!-- 수정, 삭제, 목록 버튼 -->
	<div class="">
	
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
					    <div class="" id="comment">
					        <section class="modal-section">
					            <P>
					            	<i class="fa-regular fa-comment-dots fa-2x"></i>
									<span class="comment-count"><c:out value="${coordi.c_count}" /></span>    
					            </P>
					
					            <!-- 댓글 작성 (로그인한 사람만) -->
					            <form class="comment-write" method="post">
					            	<ul>
					            		<li>
					            			<div class="comment-writer">
					                   			작성자: <a href="그사람 마이페이지">${sessionScope.user.email}</a>
					                			<%-- <c:if test="로그인 안 했을때">
					                			로그인을 해주세요
					                			</c:if> --%>
					                		</div>
					            		</li>
					            		
					            		<li>
					            			<div class="comment-content">
					                   		 <input class="comment-content-text"  type="text" placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다!">
					                		</div>
					            		</li>
					            		
					            		<li>
					            			<div class="comment-btn">
					                    		<button class="write-btn" type="button" >댓글 등록</button>
					               	 		</div> 
					            		</li>
					            	</ul>					      
					            </form>
					            
					            
					            
					            
					            
					
					
					             <!-- 댓글 목록 -->
					            <ul class="comment-list">
					            </ul>
					            
					            <!-- 페이지 버튼 -->
					            <div class="page-footer">         
					            </div>
					            
					
					        </section>
					    </div>  
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
                        str +="<li class='comment-li'>";
                        str +="<div><a href='그사람 마이페이지'>" + list[i].email + "</a></div></li>";
                        str +="<li><div><p>" + list[i].content + "</p></div></li>";
                        str +="<div><span>" + commentService.displayTime(list[i].date) + "</span></div>";            
                        
             			//작성자별 댓글 삭제 버튼
             			if("${sessionScope.user.email}" == list[i].email ||  "${sessionScope.user.authority}" == "ROLE_ADMIN"){
             				str += "<li><div class='remove-btn'><button class='comment-remove-btn' type='button' value=" + list[i].ccno + ">삭제</button></div></li>"
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
