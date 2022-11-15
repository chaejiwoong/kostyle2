<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<!-- Core theme CSS (includes Bootstrap)-->
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<link href="/resources/vendor/bootstrap/css/main.css" rel="stylesheet">
<link href="/resources/css/header.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet" />
<style type="text/css">
.auctions {
	color: #35C5F0;
}
.all-category {
	display: none;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
       

        
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

                
                             <c:forEach items="${auctionDeadlineList}" var="auction">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">마감임박</div>
                            <img data-filepath ="${auction.imgs[0].filepath}"class="thumb" src='' data-uuid="${auction.imgs[0].uuid}" data-filename="${auction.imgs[0].filename}"
							style="width : 267px; height : 150px;">
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><a href='<c:out value="auctions/${auction.apno}"/>'> <c:out value="상품명 : ${auction.name}" /></a></h5>
                                    
                                    <br>
                                   
                                     <div class="text-center" ><a class="btn btn-outline-dark mt-auto"  href='<c:out value="/auctions/${auction.apno}"/>'>상세보기</a></div>
                     
                                    <br>
                                 <c:if test="${auction.attention}">
									<a class="btn btn-default attention" href="/auctions/attention/${auction.apno}">관심해제</a>
								</c:if>
								<c:if test="${!auction.attention}">
									<a class="btn btn-default attention" href="/auctions/attention/${auction.apno}">관심등록</a>
								</c:if>
			
                                    <br>
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill">
                                        <br>
                                        <fmt:formatNumber var="best_bid_price2" value="${auction.best_bid_price}" type="number"/>
                                       최고입찰가 : <c:out value="${best_bid_price2}" />
                                        <br>
                                        
                                    	
                                    	
                                 
	                    				</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
               </c:forEach>
               

             <c:forEach items="${auctionProgressList}" var="auction">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">최신</div>
                            <img data-filepath ="${auction.imgs[0].filepath}"class="thumb" src='' data-uuid="${auction.imgs[0].uuid}" data-filename="${auction.imgs[0].filename}"
							style="width : 267px; height : 150px;">
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><a href='<c:out value="auctions/${auction.apno}"/>'> <c:out value="상품명 : ${auction.name}" /></a></h5>
                                    
                                    <br>
                                   
                                     <div class="text-center" ><a class="btn btn-outline-dark mt-auto"  href='<c:out value="/auctions/${auction.apno}"/>'>상세보기</a></div>
                     
                                    <br>
                                 <c:if test="${auction.attention}">
									<a class="btn btn-default attention" href="/auctions/attention/${auction.apno}">관심해제</a>
								</c:if>
								<c:if test="${!auction.attention}">
									<a class="btn btn-default attention" href="/auctions/attention/${auction.apno}">관심등록</a>
								</c:if>
			
                                    <br>
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill">
                                        <br>
                                        <fmt:formatNumber var="best_bid_price" value="${auction.best_bid_price}" type="number"/>
                                       최고입찰가 : <c:out value="${best_bid_price}" />
                                        <br>
                                        
                                    	
                                    	
                                 
	                    				</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
               </c:forEach>
               
                   
                   
              
                          
                    
                </div>
            </div>
            </section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script>
	var display = (function loadThumbnail() {
		var uploadResultArr = $('.thumb');
		
		$(uploadResultArr).each(function (i, obj) {
			//섬네일 파일을 불러오기 위한 경로
			var fileCallPath = encodeURIComponent($(obj).data('filepath') + "/" + $(obj).data('uuid') + "_" + $(obj).data('filename'));
			// 섬네일 눌렀을 때 원본 파일 호출해서 보여주기
			$(obj).attr('src',"/commons/display?fileName=" + fileCallPath);
			})
		})();
	
	// 관심등록 버튼 눌렀을 때 관심등록
	$(document).ready(function(){
		$('.attention').on("click", function(e){
			e.preventDefault();
			var btn = $(this)
			
 			$.ajax({
				url:$(this).attr('href'),
				type:'put',
				success:function(data){
					if(btn.text() =='관심등록'){
						btn.text('관심해제')
					}else{
						btn.text('관심등록')
					}					
				},error:function(){
					alert("로그인이 필요한 서비스입니다.");
					self.location="/auth/login";
				}
			})
			

		})
	})
</script>
       

    </body>
</html>
