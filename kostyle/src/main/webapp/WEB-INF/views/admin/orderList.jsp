<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--
  Created by IntelliJ IDEA.
  User: cowld
  Date: 2022-10-23
  Time: 오후 2:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>KoStyle4U</title>
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/adminHeader.js"></script>
<script type="text/javascript" src="/resources/js/customerCenter.js"></script>
<link href="/resources/css/adminHeader.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet"/>
<style>
#wrap {
    min-height: 100%;
    position: relative;
    padding-bottom: 100px;
}
.order {
	color: #35C5F0;
}
.bottom-category {
	display: block;
}
.title-orderList {
	color: #35C5F0;
}

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

		<h1>주문 목록</h1>
		<div class="container">
			<div class="selectBox">
			<form id='searchForm' class="form-horizontal" action="/admin/orders" method='get'>
		<div class="form-inline form-group">
					<select class="form-control" name='type'>
					<option value=""
						<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
					<option value="K"
						<c:out value="${pageMaker.cri.type eq 'K'?'selected':''}"/>>주문번호</option>
					<option value="E"
						<c:out value="${pageMaker.cri.type eq 'E'?'selected':''}"/>>이메일</option>
					<option value="S"
						<c:out value="${pageMaker.cri.type eq 'S'?'selected':''}"/>>배송상태</option>
	
				</select>
				<input type='text' id='keyword' name='keyword' class='form-control' value='<c:out value="${pageMaker.cri.keyword}"/>' />
					<button id="search" class='btn btn-default'>Search</button>
					<button id="default" class='btn btn-default'>Default</button>
					
					<span>구분</span>
					<label for="product">상품</label><input type="radio" id="product" class="form-control filter" name="filter" value="P"
					<c:out value="${pageMaker.cri.filter eq 'P'?'checked':''}"/>>
					<label for="auction_product">경매</label><input type="radio" id="auction_product" class="form-control filter" name="filter" value="A"
					<c:out value="${pageMaker.cri.filter eq 'A'?'checked':''}"/>>				
				</div>
				<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
				<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
	
			</form>
			
			
			</div>
		
			
			<table class="table">
				<thead>
					<tr>
						<th>주문번호</th>
						<th>이메일</th>
						<th>결제방식</th>
						<th>가격</th>
						<th>배송상태</th>
						<th>구분</th>					
						<th>주문일자</th>
						<th>배송버튼</th>
					</tr>
				</thead>
	
				<c:forEach items="${orders}" var="order">
					<tr>
						<td><c:out value="${order.ono}" /></td>
						<td><a href='<c:out value="/admin/orders/${order.ono}"/>'>
								<c:out value="${order.member.email}" />
						</a></td>
						<td><c:out value="${order.payment}" /></td>
						<td><c:out value="${order.totalPrice}" /></td>
						<td><c:out value="${order.status}" /></td>
						<td><c:out value="${order.category}" /></td>						
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${order.created_date}" /></td>
		
						<td><c:if test="${order.status eq '상품준비중' }">
									<a class="btn btn-primary delivery" data-ono="${order.ono }">배송</a>
							</c:if></td>
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
			<form id='actionForm' action="/admin/orders" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	
				<input type='hidden' name='type'
					value='<c:out value="${ pageMaker.cri.type }"/>'> <input
					type='hidden' name='keyword'
					value='<c:out value="${ pageMaker.cri.keyword }"/>'>
				<input type='hidden' name='filter'
					value='<c:out value="${ pageMaker.cri.filter }"/>'>				
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
	    
	    
	    
	    $(".delivery").on('click', function(e){
	    	e.preventDefault();
	    	
	    	console.log("아이고")
	    	var onoVal = $(this).data('ono')
	    	
	    	$.ajax({
	    		url: "/admin/orders/delivery/" + onoVal,
	    		type: 'post',
	    		success: function(result){
	    			alert(onoVal + " : 배송이 시작되었습니다.")
	    			actionForm.submit();
	    		
	    		},error: function(){
	    			alert("잘못된 요청입니다.")
	    			actionForm.submit();
	    		}
	    			
	    	})

	    })
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
				self.location="/admin/orders";
			})
			
			$("#product, #auction_product").on('change', function(){
				// 1페이지로 바꾸고 submit.
				searchForm.find("input[name='pageNum']")
						.val("1");

				searchForm.submit();
			})			
	})
	
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
