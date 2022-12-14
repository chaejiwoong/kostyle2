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
                          <div class="fs-5 mb-5" name = "season">
                            <span> 계절 : <c:out value="${product.season}월" /></span>
                        </div>
                        <div class="fs-5 mb-5" >
                            <span> 상품사이즈: 
                            <c:forEach items="${product.stockList }" var = "stock">
                   			<div class="form_section_content">
                   				<textarea class="input_block" name="p_size" readonly="readonly"><c:out value='${stock.p_size }'/></textarea>
                   				<textarea class="input_block" name="amount" readonly="readonly"><c:out value='${stock.amount }'/></textarea>
                   			</div>
                   			</c:forEach>
                        </div>
							
                        <div class="d-flex">
                            <button class="btn btn-outline-dark flex-shrink-0" type="button" id = "list"><span class = "list">목록</span>  </button>
                            <button class="btn btn-outline-dark flex-shrink-0" type="button" id = "modify"><span class = "modify"> 수정</span> </button>
                            <button class="btn btn-outline-dark flex-shrink-0" type="button" id = "delete"><span class = "delete"> 삭제</span> </button>
                        </div>

                    </div>
                </div>
            </div>
        </section>
        

            
            
            
            <!-- 페이징처리 -->
                <form id="moveForm" method="get">
                	<input type="hidden" name="pno" value='<c:out value="${product.pno }"/>'>
                	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
                	<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>' >
                	<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
                </form>
            
            
            
<%@ include file="/WEB-INF/views/include/footer.jsp"%>            
            
 <script type="text/javascript">
	
    	
    	let moveForm = $("#moveForm");

/* 상품목록이동 버튼 */
$("#list").on("click", function(e){
	
	e.preventDefault();
	
	$("input[name=pno]").remove();
	moveForm.attr("action", "/admin/products")
	moveForm.submit();
	
});

/* 상품 수정 페이지 이동 버튼 */
$("#modify").on("click", function(e){
	
	e.preventDefault();
	let addInput = '<input type="hidden" name="pno" value="${product.pno}">';
	$("#moveForm").append(addInput);
	$("#moveForm").attr("action", "/admin/products/modify");
	$("#moveForm").submit();
	
});

/* 수정 성공 이벤트 */
let modify_result = '${modify_result}';

if(modify_result == 1){
	alert("수정 완료");
}	

/* 글 삭제 버튼 */
	$("#delete").on("click", function(e){
	e.preventDefault();
        $.ajax({
            url: "/admin/products/"+${product.pno},
            type : "DELETE",
            success: function (data) {
            	alert("삭제완료");
            	location.href = "/admin/products/"
            		
            }

});
}); 

	//이미지 출력
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
      
</script>



    </body>
</html>
