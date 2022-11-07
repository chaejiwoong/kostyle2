<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
        <title>KoStyle4U</title>
        <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
        <script type="text/javascript" src="/resources/js/adminHeader.js"></script>
        <link href="/resources/css/header.css" rel="stylesheet"/>
        <link href="/resources/css/footer.css" rel="stylesheet"/>
<style>
h1{
margin-top: 25px;
margin-bottom: 25px;
font-size: 30px;
font-weight: bold;
 text-align: center;
        }
        
 .selectBox{
	text-align: center;
}
.paging {
	text-align: center;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/adminHeader.jsp"%>
	<h1>관리자 주문취소 목록</h1>

<div class="container">

		<div class="selectBox">
		<form id='searchForm' class="form-horizontal" action="/admin/orderCancels" method='get'>
	<div class="form-inline form-group">
				<select class="form-control" name='type'>
				<option value=""
					<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
				<option value="K"
					<c:out value="${pageMaker.cri.type eq 'K'?'selected':''}"/>>취소번호</option>
				<option value="P"
					<c:out value="${pageMaker.cri.type eq 'P'?'selected':''}"/>>상품명</option>
				<option value="C"
					<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>취소구분</option>

			</select>
			<input type='text' id='keyword' name='keyword' class='form-control' value='<c:out value="${pageMaker.cri.keyword}"/>' />
				<button id="search" class='btn btn-default'>Search</button>
				<button id="default" class='btn btn-default'>Default</button>
			</div>
			<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
			<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />

		</form>
		
		
		</div>
<table class="table">
		<thead>
			<tr>
				<th>취소번호</th>
				<th>상품명</th>
				<th>분류</th>
				<th>취소일자</th>
				<th>조회</th>
			</tr>
		</thead>

		<c:forEach items="${orderCancels}" var="orderCancel">
			<tr>
				<td><c:out value="${orderCancel.ocno}" /></td>
				<td><c:out value="${orderCancel.product.name}" /></td>
				<td><c:out value="${orderCancel.category}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${orderCancel.created_date}" /></td>
				<td><a href='<c:out value="/admin/orderCancels/${orderCancel.ocno}"/>'
				 class="btn btn-primary">상세조회</a></td>
			</tr>
		</c:forEach>

	</table>
	<div class="paging">
	
	
			<ul class="pagination">
			<!-- 페이징 구현 부분 -->
			<c:if test="${pageMaker.prev}">
				<li class="paginate_button previous"><a
					href="${pageMaker.startPage -1}">Previous</a></li>
			</c:if>

			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next}">
				<li class="paginate_button next"><a
					href="${pageMaker.endPage +1 }">Next</a></li>
			</c:if>
		</ul>
		</div>

		<!-- 페이징 번호 요청 시에 submit되는 form -->
		<form id='actionForm' action="/admin/orderCancels" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

			<input type='hidden' name='type'
				value='<c:out value="${ pageMaker.cri.type }"/>'> <input
				type='hidden' name='keyword'
				value='<c:out value="${ pageMaker.cri.keyword }"/>'>
		</form>

</div>
	
	<script>
	
	$(document).ready(function(){
	    var actionForm = $("#actionForm");

	    $(".paginate_button a").on("click", function(e) {

	            e.preventDefault();

	            // 해당 pageNum을 a 태그의 href 속성 값으로 치환
	            actionForm.find("input[name='pageNum']")
	                .val($(this).attr("href"));
	            actionForm.submit();
	        });
		var searchForm = $('#searchForm'); 
	    $("#search").on(
				"click",
				// 값이 들어있지 않다면 alert창 호출
				function(e) {

					if (!searchForm.find("option:selected")
							.val()) {
						alert("검색종류를 선택하세요");
						return false;
					}

					if (!searchForm.find(
							"input[name='keyword']").val()) {
						alert("키워드를 입력하세요");
						return false;
					}

					// 1페이지로 바꾸고 submit.
					searchForm.find("input[name='pageNum']")
							.val("1");
					e.preventDefault();

					searchForm.submit();

				});
		
		$("#default").on('click', function(e){
			e.preventDefault();
			self.location="/admin/orderCancels";
		})
	})
	
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
