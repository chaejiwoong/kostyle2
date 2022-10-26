<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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
	<h2>취소 상세</h2>

		<form>
			취소번호 : <input type="text" value="${orderCancel.ocno}" readonly /><br>
			상품명 : <input type="text"  value="${orderCancel.product.name}" readonly /><br>
			분류 : <input type="text"  value="${orderCancel.category}"readonly /><br>
			 사유 :<textarea rows="5" cols="60">${orderCancel.reason }</textarea><br>
			 취소일자 : <input type="text" name="created_date" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${orderCancel.created_date}" />"
				readonly /><br>
		</form>
		<a href="/admin/orderCancels">목록으로</a>
</body>
</html>
