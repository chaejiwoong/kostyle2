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

</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
       
       <div>
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Kostyle</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With Shopping</p>
                </div>
            </div>
        </div>
        
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                
               
                                   <c:forEach  items="${product}" var="list" >
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Best</div>
                            <img data-filepath="${list.imageList[0].filePath}" class = thumb src='' data-uuid="${list.imageList[0].uuid}" 
	                    			data-filename="${list.imageList[0].fileName}" style="width : 267px; height : 150px;">
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">NO.${list.pno}<br>${list.name}</h5>
                                    
                                    <br>
                                    <form action="" method="get" >
                                     <div class="text-center" ><a class="move" href ='<c:out value="${list.pno}"/>'><span class = "btn btn-outline-dark mt-auto" >상세보기</span></a></div>
                                    </form>
                                    <br>
                                   가격 : <fmt:formatNumber value="${list.price}" pattern="#,### 원" />
                                    <br>
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill">
                                        <br>
                                        색상 : <c:out value="${list.color}"></c:out>
                                        <br>
                                        조회수 : <c:out value="${list.hitCount}" ></c:out>
                                        <br>
                                    	
                                    	
                                 
	                    				</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
               </c:forEach>   
				
                <c:forEach  items="${hitImg}" var="list" >
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">추천</div>
                            <img data-filepath="${list.imageList[0].filePath}" class = thumb src='' data-uuid="${list.imageList[0].uuid}" 
	                    			data-filename="${list.imageList[0].fileName}" style="width : 267px; height : 150px;">
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">NO.${list.pno}<br>${list.name}</h5>
                                    
                                    <br>
                                    <form action="" method="get" >
                                     <div class="text-center" ><a class="move" href ='<c:out value="${list.pno}"/>'><span class = "btn btn-outline-dark mt-auto" >상세보기</span></a></div>
                                    </form>
                                    <br>
                                   가격 : <fmt:formatNumber value="${list.price}" pattern="#,### 원" />
                                    <br>
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill">
                                        <br>
                                        색상 : <c:out value="${list.color}"></c:out>
                                        <br>
                                        조회수 : <c:out value="${list.hitCount}" ></c:out>
                                        <br>
                                    	
                                    	
                                 
	                    				</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
               </c:forEach>
               
               
               <c:forEach  items="${day}" var="list" >
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">최신</div>
                            <img data-filepath="${list.imageList[0].filePath}" class = thumb src='' data-uuid="${list.imageList[0].uuid}" 
	                    			data-filename="${list.imageList[0].fileName}" style="width : 267px; height : 150px;">
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">NO.${list.pno}<br>${list.name}</h5>
                                    
                                    <br>
                                    <form action="" method="get" >
                                     <div class="text-center" ><a class="move" href ='<c:out value="${list.pno}"/>'><span class = "btn btn-outline-dark mt-auto" >상세보기</span></a></div>
                                    </form>
                                    <br>
                                   가격 : <fmt:formatNumber value="${list.price}" pattern="#,### 원" />
                                    <br>
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill">
                                        <br>
                                        색상 : <c:out value="${list.color}"></c:out>
                                        <br>
                                        조회수 : <c:out value="${list.hitCount}" ></c:out>
                                        <br>
                                    	
                                    	
                                 
	                    				</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
               </c:forEach>
               
                   
                   
                     <form id="moveForm" action="/main" method="get" >
 						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                	</form>
                                
                          
                    
                </div>
            </div>

<script type="text/javascript">
var aa = (function loadThumbnail() {
	var uploadResultArr = $('.thumb');
	
	$(uploadResultArr).each(function (i, obj) {
		//섬네일 파일을 불러오기 위한 경로
		var fileCallPath = encodeURIComponent($(obj).data('filepath').replace(/\\/g,'/') + "/s_" + $(obj).data('uuid') + "_" + $(obj).data('filename'));
		// 섬네일 눌렀을 때 원본 파일 호출해서 보여주기
		$(obj).attr('src',"/member/products/display?fileName=" + fileCallPath);
		})
	})();
	
/*상품 페이지  */
let moveForm = $('#moveForm');
$(".pageMaker_btn a").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	
	moveForm.submit();
	
});

/* 상품 상세 페이지 이동 */
$(".move").on("click", function(e){
	
	
	e.preventDefault();
	
	console.log("ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ")
	moveForm.append("<input type='hidden' name='pno' value='"+ $(this).attr("href") + "'>");
	moveForm.attr("action", "/main/product");
	moveForm.submit();
	
});


</script>
       

    </body>
</html>
