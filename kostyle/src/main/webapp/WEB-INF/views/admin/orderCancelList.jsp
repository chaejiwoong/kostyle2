<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>KoStyle4U</title>
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
</head>
<body>
	<h1>관리자 주문취소 목록</h1>
	<ul>
		<li><a href="#">상품관리</a></li>
		<li><a href="#">고객센터관리</a></li>
		<li><a href="#">회원관리</a></li>
		<li><a href="#">주문관리</a></li>
		<li><a href="#">경매관리</a></li>
		<li><a href="#">통계</a></li>
	</ul>

	<table>
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
				<td><a href='<c:out value="/admin/orderCancels/${orderCancel.ocno}"/>'>상세조회</a></td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>
