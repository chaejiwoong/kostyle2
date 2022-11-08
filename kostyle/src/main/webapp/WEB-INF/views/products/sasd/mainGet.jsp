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
                            <span> 상품사이즈: </span>
                            <c:forEach items="${product.stockList }" var = "stock">
                   			<div class="form_section_content">
                   				<textarea class="input_block" name="p_size" readonly="readonly"><c:out value='${stock.p_size }'/></textarea>
                   				<textarea class="input_block" name="amount" readonly="readonly"><c:out value='${stock.amount }'/></textarea>
                   			</div>
                   			</c:forEach>
                        </div>
							
                        <div class="d-flex">
                            <input class="form-control text-center me-3" id="inputQuantity" type="num" value="" style="max-width: 5rem" name ="amount">
                            <p>
                            <button class="btn btn-outline-dark flex-shrink-0" type="button" id = "buy"><span class = "buy">구매</span>  </button>
                            <button class="btn btn-outline-dark flex-shrink-0" type="button" id = "cart"><span class = "cart"> 장바구니담기</span> </button>
                                <button class="btn btn-outline-dark flex-shrink-0" type="button" id = "list"><span class = "list">목록</span>  </button>
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
                <h2 class="fw-bolder mb-4">인기 추천 상품</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
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
                                     <div class="text-center" ><a class="move" href ="${list.pno }" data-pno = "${list.pno }"><span class = "btn btn-outline-dark mt-auto" >상세보기</span></a></div>
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
                    
                </div>
          
            </div>

                        <form action="/orders/pay" method = "get">
						<input type = "hidden" name="pno" type="text" size="50" value="${product.pno}"  maxlength="24">
						
						<input type = "hidden"  name="amount" type="text" size="50" value="${product.stockList.amount}"  maxlength="24">
						<input  type = "hidden" name="price" type="text" size="50" value="${product.price}"  maxlength="24">
						</form>
            
            
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
    			
    			
    			uploadReslut.html(str);		
    		});	
    		
    		
    		
    		
    		
    		
    	})
    	
   	


/* 상품목록이동 버튼 */
$("#list").on("click", function(e){
	
	e.preventDefault();
	
	$("input[name=pno]").remove();
	moveForm.attr("action", "/main")
	moveForm.submit();
	
});

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
	
	
	moveForm.append("<input type='hidden' name='pno' value='"+ $(this).attr("href") + "'>");
	moveForm.attr("action", "/main/get");
	moveForm.submit();
	
});


      
</script>



    </body>
</html>
