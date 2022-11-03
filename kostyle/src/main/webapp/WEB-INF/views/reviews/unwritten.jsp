<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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
        
.paging {
	text-align: center;
}

.selectBox{
	text-align: center;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/adminHeader.jsp"%>
<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>이미지</th>
					<th>상품명</th>
					<th>사이즈</th>
					<th>수량</th>
					<th>가격</th>
					<th>리뷰</th>
				</tr>
			</thead>

			<c:forEach items="${details}" var="detail">
				<tr>
					<td><c:out value="이미지" /></td>
					<td><a href="/products/${detail.product.name}">${detail.product.name}</a></td>
					<td><c:out value="${detail.p_size}" /></td>
					<td><c:out value="${detail.amount}" /></td>
					<td><c:out value="${detail.price}" /></td>
					<td><a href='/reviews/register?odno=${detail.odno}' class="btn btn-primary register">리뷰작성</a></td>
				</tr>
			</c:forEach>

		</table>
</div>

<script>

</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
