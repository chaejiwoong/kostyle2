<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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
            font-size: 20px;
            font-weight: bold;
            text-align: center;
        }
        
        </style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/adminHeader.jsp"%>

<div class="container">
	<h1>주문정보</12>
	<table class="table">
		<thead>
			<tr>
				<th>주문번호</th>
				<th>이메일</th>
				<th>결제방식</th>
				<th>가격</th>
				<th>배송상태</th>
				<th>주문일자</th>
			</tr>
		</thead>

		<tr>
			<td><c:out value="${order.ono}" /></td>
			<td><c:out value="${order.member.email}" /></td>
			<td><c:out value="${order.payment}" /></td>
			<td><c:out value="${order.totalPrice}" /></td>
			<td><c:out value="${order.status}" /></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd"
					value="${order.created_date}" /></td>
		</tr>

	</table>
	<h1>배송지 정보</h1>
	<table class="table">
		<thead>
			<tr>
				<th>배송번호</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>주소지명</th>
			</tr>
		</thead>
		<tr>
			<td><c:out value="${order.address.ano}" /></td>
			<td><c:out value="${order.address.address}" /></td>
			<td><c:out value="${order.address.tel}" /></td>
			<td><c:out value="${order.address.name}" /></td>
		</tr>
	</table>

	<h1>주문상품 정보</h1>
	<table class="table">
		<thead>
			<tr>
				<th>주문상세번호</th>
				<th>상품명</th>
				<th>수량</th>
				<th>가격</th>
				<th>주문취소</th>
			</tr>
		</thead>

		<c:forEach items="${details}" var="detail">
			<tr>
				<td><c:out value="${detail.odno}" /></td>
				<td><c:out value="${detail.product.name}" /></td>
				<td><c:out value="${detail.amount}" /></td>
				<td><c:out value="${detail.price}" /></td>
				<td>
				<c:if test="${order.status eq '상품준비중' }">
				
				<a class="cancel btn btn-danger" href='<c:out value="/admin/orderCancels/${detail.odno}"/>' data-odno="${detail.odno }">취소</a>
				</c:if>
				
				</td>
			</tr>
		</c:forEach>
	</table>

</div>

	<script>
		$(document).ready(function(){
			
			$('.cancel').on('click', function(e){
				
				var odnoVal = $(this).data('odno');
				e.preventDefault();
				
				var orderCancel = {
						'odno' : odnoVal,
						'category' : 'cancel',
						'reason' : '관리자 취소',
				}
				
				$.ajax({
					url: $(this).attr('href'),
					type: 'post',
					data : JSON.stringify(orderCancel),
					contentType: 'application/json; charset=UTF-8',
					success : function(result, status, xhr){
						alert('주문취소가 완료되었습니다.')
						self.location="/admin/orders/" + ${order.ono}
					},error : function(xhr, status, er){
						alert('잘못된 요청입니다.')
					}
				})
			})
		})
	</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
