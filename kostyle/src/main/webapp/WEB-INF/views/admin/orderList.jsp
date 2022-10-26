<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: cowld
  Date: 2022-10-23
  Time: 오후 2:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
        <title>KoStyle4U</title>
        <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
</head>
<body>
<h1>관리자 주문 목록</h1>
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
        <th>주문번호</th>
        <th>이메일</th>
        <th>결제방식</th>
        <th>가격</th>
        <th>배송상태</th>
        <th>주문일자</th>
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
            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${order.created_date}" /></td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
