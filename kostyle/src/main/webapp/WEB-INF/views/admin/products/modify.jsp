<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>상품 목록 페이지</h1>


<table>
<tr>
<td>이름</td>
<td>가격</td>
<td>성별</td>
<td>색</td>
<td>계절</td>
</tr>



<c:forEach items="${product }" var = "pro">
<tr>
<td><c:out value="${pro.name }"/></td>
<td><c:out value="${pro.price }"/></td>
<td><c:out value="${pro.season }"/></td>
<td><c:out value="${pro.color }"/></td>
<td><c:out value="${pro.gender }"/></td>
</tr>
</c:forEach>



</table>

</body>
</html>
