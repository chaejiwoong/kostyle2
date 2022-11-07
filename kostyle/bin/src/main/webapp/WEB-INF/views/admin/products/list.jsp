<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>Title</title>
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<link href="/resources/css/header.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet" />
<link href="/resources/css/productList.css" rel="stylesheet" />


</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

	 <div class="goods_table_wrap">
                    	<!-- 상품 리스트 O -->
	                    <form action="/admin/products/register" method="get" id="enrollForm">
	                    	<table class="goods_table">
	                    		<thead>
	                    			<tr>
										<td class="th_column_1">상품번호</td>
										<td class="th_column_2">상품</td>
	                    				<td class="th_column_3">상품이름</td>
	                    				<td class="th_column_4">상품색상</td>
	                    				<!-- <td class="th_column_4">상품 재고</td> -->
	                    				<td class="th_column_5">상품가격</td>
	                    				<td class="th_column_6">성별</td>
	                    				<td class="th_column_7">등록날짜</td>
	                    				<td class="th_column_8">조회수</td>
	                    			</tr>
	                    		</thead>	
	                    		<c:forEach items="${product}" var="list">
	                    		<tr>
	                    			<td><c:out value="${list.pno}"></c:out></td>
	                    			<td><img data-filepath="${list.imageList[0].filePath}" class = thumb src='' data-uuid="${list.imageList[0].uuid}" 
	                    			data-filename="${list.imageList[0].fileName}"></td>
	                    			<td><a class="move" href ='<c:out value="${list.pno}"/>'><c:out value="${list.name}"/></a></td>
	                    			<td><c:out value="${list.color}"></c:out></td>
	                    			<td><fmt:formatNumber value="${list.price}" pattern="#,### 원" /></td>
	                    			<td><c:out value="${list.gender}" ></c:out></td>
	                    			<td><fmt:formatDate value="${list.created_date}" pattern="yyyy-MM-dd"/></td>
	                    			<td><fmt:formatDate value="${list.last_modified_date}" pattern="yyyy-MM-dd"/></td>
	                    			<td><c:out value="${list.hitCount}" ></c:out></td>
	                    		</tr>
	                    		</c:forEach>
	                    	</table>
	                    			</form>
		<div class="btn_section">
			<button id="enrollBtn" class="btn enroll_btn">등 록</button>
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
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>색상</option>
									

							</select>
							 <input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' />
								 <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
								  <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>Search</button>
							
							<button id="default" class='btn btn-default'>초기화</button>
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
			
			
	<script type="text/javascript">
	
		
	$("#default").on('click', function(e){
		e.preventDefault();
		self.location="/products";
	})
		let enrollForm = $("#enrollForm")


		/* 상품 등록 폼 */
		$("#enrollBtn").on("click", function(e) {

			e.preventDefault();

			enrollForm.submit();

		});
		
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
	
	
<!-- 	<script>
$(document).ready(function(){
	
	let eResult = '<c:out value="${enroll_result}"/>';
	
	checkResult(eResult);
	
	function checkResult(result){
		
		if(result === ''){
			return;
		}
		
		alert("상품을 등록하였습니다.");
		
	}

});
</script> -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
