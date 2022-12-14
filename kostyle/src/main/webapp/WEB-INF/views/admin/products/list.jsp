
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/vendor/bootstrap/css/main.css" rel="stylesheet">
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/adminHeader.js"></script>
<script type="text/javascript" src="/resources/js/customerCenter.js"></script>
<link href="/resources/css/adminHeader.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet" />
<style type="text/css">
#wrap {
          min-height: 100%;
          position: relative;
          padding-bottom: 100px;
      }
.product{
	color: #35C5F0;
}
.bottom-category {
	display: block;
}
.title-productsList {
	color : #35C5F0;
}
</style>
</head>
<body>
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
                                     <div class="text-center" ><a class="move" href ='<c:out value="${list.pno}"/>'><span class = "btn btn-outline-dark mt-auto" >????????????</span></a></div>
                                    </form>
                                    <br>
                                   ?????? : <fmt:formatNumber value="${list.price}" pattern="#,### ???" />
                                    <br>
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill">????????????
                                        <br>
                                        ?????? : <c:out value="${list.color}"></c:out>
                                        <br>
                                        ????????? : <c:out value="${list.hitCount}" ></c:out>
                                        <br>
                                    	????????? : <fmt:formatDate value="${list.created_date}" pattern="yyyy-MM-dd"/>
                                    	
                                 
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
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>????????????</option>
									
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>?????????</option>
									
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>????????????</option>
									

							</select>
							 <input class="search_input" type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' />
								 <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
								  <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
								  
							<button class='btn btn-default'>Search</button>
							
							<button id="default" class='btn btn-default'>?????????</button>
							<button id="enrollBtn" class="btn enroll_btn">??? ???</button>
						</form>

					
				</div>
				
				<div class="pageMaker_wrap">
                		<ul class="pageMaker">
                			
                			<!-- ?????? ?????? -->
                			<c:if test="${pageMaker.prev }">
                				<li class="pageMaker_btn prev">
                					<a href="${pageMaker.startPage -1}">??????</a>
                				</li>
                			</c:if>
                			
                			<!-- ????????? ?????? -->
                			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="num">
                				<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
                					<a href="${num}">${num}</a>
                				</li>	
                			</c:forEach>
                		
	                    	<!-- ?????? ?????? -->
	                    	<c:if test="${pageMaker.next}">
	                    		<li class="pageMaker_btn next">
	                    			<a href="${pageMaker.endPage + 1 }">??????</a>
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
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
            
<script type="text/javascript">
/* ?????? ?????? ??? */
$("#enrollBtn").on("click", function(e) {

	e.preventDefault();

	self.location="/admin/products/register";
		

});
//????????? ?????????
$("#default").on('click', function(e){
	e.preventDefault();
	self.location="products";
})
	
			/*?????? ?????????  */
		let moveForm = $('#moveForm');
		$(".pageMaker_btn a").on("click", function(e){
			
			e.preventDefault();
			
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			
			moveForm.submit();
			
		});
		
		/* ?????? ?????? ????????? ?????? */
		$(".move").on("click", function(e){
			
			
			e.preventDefault();
			
			
			moveForm.append("<input type='hidden' name='pno' value='"+ $(this).attr("href") + "'>");
			moveForm.attr("action", "/admin/products/get");
			moveForm.submit();
			
		});
		
		/* ?????? ?????? ????????? */
		let delete_result = '${delete_result}';
		
		if(delete_result == 1){
			alert("?????? ??????");
		}
		
		var aa = (function loadThumbnail() {
			var uploadResultArr = $('.thumb');
			
			$(uploadResultArr).each(function (i, obj) {
				//????????? ????????? ???????????? ?????? ??????
				var fileCallPath = encodeURIComponent($(obj).data('filepath').replace(/\\/g,'/') + "/s_" + $(obj).data('uuid') + "_" + $(obj).data('filename'));
				// ????????? ????????? ??? ?????? ?????? ???????????? ????????????
				$(obj).attr('src',"/member/products/display?fileName=" + fileCallPath);
				})
			})();


</script>

    </body>
</html>