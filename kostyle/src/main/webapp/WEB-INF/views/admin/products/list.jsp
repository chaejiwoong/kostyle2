<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/vendor/bootstrap/css/main.css" rel="stylesheet">
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<link href="/resources/css/adminHeader.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet" />
<style type="text/css">
#wrap {
          min-height: 100%;
          position: relative;
          padding-bottom: 100px;
      }
</style>
</head>
<body>
<div id="wrap">
<!--  -->
<%@ include file="/WEB-INF/views/include/adminHeader.jsp"%>

        
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
		
               <c:forEach  items="${product}" var="list" >
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img data-filepath="${list.imageList[0].filePath}" class = thumb src='' data-uuid="${list.imageList[0].uuid}" 
	                    			data-filename="${list.imageList[0].fileName}" style="width : 253px; height : 150px;">
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
                                        <div class="bi-star-fill">상품설명
                                        <br>
                                        색상 : <c:out value="${list.color}"></c:out>
                                        <br>
                                        조회수 : <c:out value="${list.hitCount}" ></c:out>
                                        <br>
                                    	등록일 : <fmt:formatDate value="${list.created_date}" pattern="yyyy-MM-dd"/>
                                    	
                                 
	                    				</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
               </c:forEach>        
                </div>
            </div>
            
            <div class='search_wrap'>
					<form id='searchForm' action="/admin/products" method='get'>
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
									
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>상품번호</option>
									
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>상품명</option>
									
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>카테고리</option>
									

							</select>
							 <input class="search_input" type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' />
								 <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
								  <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
								  
							<button class='btn btn-default'>Search</button>
							
							<button id="default" class='btn btn-default'>초기화</button>
							<button id="enrollBtn" class="btn enroll_btn">등 록</button>
						</form>

					
				</div>
				
				<div class="pageMaker_wrap">
                		<ul class="pageMaker">
                			
                			<!-- 이전 버튼 -->
                			<c:if test="${pageMaker.prev }">
                				<li class="pageMaker_btn prev">
                					<a href="${pageMaker.startPage -1}">이전</a>
                				</li>
                			</c:if>
                			
                			<!-- 페이지 번호 -->
                			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="num">
                				<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
                					<a href="${num}">${num}</a>
                				</li>	
                			</c:forEach>
                		
	                    	<!-- 다음 버튼 -->
	                    	<c:if test="${pageMaker.next}">
	                    		<li class="pageMaker_btn next">
	                    			<a href="${pageMaker.endPage + 1 }">다음</a>
	                    		</li>
	                    	</c:if>
	                    </ul>
                	</div>
                	
                	<form id="moveForm" action="/admin/products" method="get" >
 						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                	</form>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
            
<script type="text/javascript">
/* 상품 등록 폼 */
$("#enrollBtn").on("click", function(e) {

	e.preventDefault();

	self.location="/admin/products/register";
		

});
//검색어 초기화
$("#default").on('click', function(e){
	e.preventDefault();
	self.location="products";
})
	
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
			moveForm.attr("action", "/admin/products/get");
			moveForm.submit();
			
		});
		
		/* 삭제 결과 경고창 */
		let delete_result = '${delete_result}';
		
		if(delete_result == 1){
			alert("삭제 완료");
		}
		
		var aa = (function loadThumbnail() {
			var uploadResultArr = $('.thumb');
			
			$(uploadResultArr).each(function (i, obj) {
				//섬네일 파일을 불러오기 위한 경로
				var fileCallPath = encodeURIComponent($(obj).data('filepath').replace(/\\/g,'/') + "/s_" + $(obj).data('uuid') + "_" + $(obj).data('filename'));
				// 섬네일 눌렀을 때 원본 파일 호출해서 보여주기
				$(obj).attr('src',"/member/products/display?fileName=" + fileCallPath);
				})
			})();


</script>

    </body>
</html>
