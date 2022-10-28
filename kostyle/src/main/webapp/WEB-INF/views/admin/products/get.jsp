<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
 <script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<link href="/resources/css/header.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet" />
</head>
<body>
<h1>상품 상세 페이지</h1>


<table>
<tr>
<td>상품번호</td>
<td>이름</td>
<td>가격</td>
<td>성별</td>
<td>색</td>
<td>계절</td>
<td>사이즈</td>
<td>재고</td>
</tr>


<tr>
<td><c:out value="${product.pno }"/></td>
<td><c:out value="${product.name }"/></td>
<td><c:out value="${product.price }"/></td>
<td><c:out value="${product.season }"/></td>
<td><c:out value="${product.color }"/></td>
<td><c:out value="${product.gender }"/></td>
<td><c:out value="${product.p_size }"/></td>
<td><c:out value="${product.amount }"/></td>
</tr>



</table>

</body>
</html>
