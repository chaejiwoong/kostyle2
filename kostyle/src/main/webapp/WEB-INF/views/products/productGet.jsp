<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>Title</title>
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<link href="/resources/vendor/bootstrap/css/styles.css" rel="stylesheet">
<link href="/resources/css/header.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet" />



</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" >
                    	<div id="uploadReslut">							
						</div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="small mb-1"></div>
                        <h1 class="display-5 fw-bolder" name = "pno">상품명 <br> <c:out value='${product.name }'/> </h1>
                        <div class="fs-5 mb-5" name = "price">
                        
                            <span> 상품 가격 : <fmt:formatNumber value="${product.price}" pattern="#,### 원" />	</span>
                        </div>
                        <div class="fs-5 mb-5" name = "color">
                            <span> 상품 색상 : <c:out value="${product.color}" /></span>
                        </div>
                        <div class="fs-5 mb-5" name = "gender">
                            <span> 상품 성별 : <c:out value="${product.gender}"/></span>
                        </div>
                        <div class="fs-5 mb-5" >
                            <span> 상품사이즈: 
                            <c:forEach items="${product.stockList }" var = "stock">
                   			<div class="form_section_content">
                   				<textarea class="input_block" name="p_size" readonly="readonly"><c:out value='${stock.p_size }'/></textarea>
                   			</div>
                   			</c:forEach>
                        </div>
							
                        <div class="d-flex">
                            <input class="form-control text-center me-3" id="inputQuantity" type="num" value="" style="max-width: 5rem">
                            <p>
                            <button class="btn btn-outline-dark flex-shrink-0" type="button" id = "buy"><span class = "buy">구매</span>  </button>
                            <button class="btn btn-outline-dark flex-shrink-0" type="button" id = "cart"><span class = "cart"> 장바구니담기</span> </button>
                        </div>
<!--                         	<div class = listbutton>
                          		<button class="btn btn-outline-dark flex-shrink-0" type="button" id = "cancelBtn"> 상품리스트 </button>
                    		</div> -->
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">인기 추청 상품</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                       		<!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">추천</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">조회수1위 상품</h5>
                                    <!-- Product price-->
                                   $80.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">바로가기</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">추천</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">추천상품2</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    $18.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">바로가기</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">추천</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">추천상품3</h5>
                                    <!-- Product price-->
                                    $25.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">바로가기</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Sale badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">추천</div>
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">추천상품4</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                    $40.00
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">바로가기</a></div>
                            </div>
                        </div>
                    </div>
                </div>
          
            </div>

            
            
            
            <!-- 페이징처리 -->
                <form id="moveForm" method="get">
                	<input type="hidden" name="pno" value='<c:out value="${product.pno }"/>'>
                	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
                	<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>' >
                	<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
                </form>
            
            
            
<%@ include file="/WEB-INF/views/include/footer.jsp"%>            
            
 <script type="text/javascript">
      $(document).ready(function() {
    		let pno = '<c:out value="${product.pno }"/>';
    		let uploadReslut = $("#uploadReslut");
    		

    		
    		$.getJSON("/member/products/getImgList", {pno : pno}, function(arr){	
    			let str = "";
    			let obj = arr[0];
    			
    			console.log("CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC");
    			
    			if(arr.length === 0){	
    				let str = "";
    				str += "<div id='result_card'>";
    				str += "<img src='/resources/img/noimg.png'>";
    				str += "</div>";
    				
    				uploadReslut.html(str);	
    				return;
    			}	
    			
    			let fileCallPath = encodeURIComponent(obj.filePath.replace(/\\/g,'/')+ "/s_" + obj.uuid + "_" + obj.fileName);
    			str += "<div id='result_card'";
    			str += "data-path='" + obj.filePath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
    			str += ">";
    			str += "<img src='/member/products/display?fileName=" + fileCallPath + "'>";
    			str += "</div>";		
    			console.log("ê²½ë¡±ããããããããããããããããããããããããããããããããããã"+fileCallPath);
    			
    			uploadReslut.html(str);		
    		});	
    		
    		
    		
    		
    		
    		
    	})
    	
    	
    	let moveForm = $("#moveForm");

/* 상품목록이동 버튼 */
$("#cancelBtn").on("click", function(e){
	
	e.preventDefault();
	
	$("input[name=pno]").remove();
	moveForm.attr("action", "/products")
	moveForm.submit();
	
});
      
</script>



    </body>
</html>
