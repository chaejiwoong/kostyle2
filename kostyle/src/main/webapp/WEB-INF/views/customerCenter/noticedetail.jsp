<%--
  Created by IntelliJ IDEA.
  User: dhwls
  Date: 2022-10-26
  Time: 오전 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<%--    boarddetail--%>
    <title>공지사항</title>
    <script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
    <script type="text/javascript" src="/resources/js/header.js"></script>
    <script type="text/javascript" src="/resources/js/customerCenter.js"></script>
    <link href="/resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/css/header.css" rel="stylesheet"/>
    <link href="/resources/css/footer.css" rel="stylesheet"/>
    <link href="/resources/css/nav.css" rel="stylesheet"/>
    <link href="/resources/css/noticedetail.css" rel="stylesheet"/>
</head>
<body>
    <%@ include file="/views/include/header.jsp"%>
    <%@ include file="/views/customerCenter/include/nav.jsp"%>
        <div class="detail-box">
            <div class="width-box">
                <div class="detail-date">
                    <c:out value="${boarddetail.created_date}"/>
                </div>
                <div class="detail-title">
                    <c:out value="${boarddetail.title}"/>
                </div>
                <div class="detail-content">
                    <c:out value="${boarddetail.content}"/>
                </div>
            </div>
            <form id='operForm' action="/customerCenter/notice" method="get">
                <input type="hidden"  id='nno' name='nno'
                       value='<c:out value="${boarddetail.nno}"/>'> <input
                    type='hidden' name='pageNum'
                    value='<c:out value="${cri.pageNum}"/>'> <input
                    type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
            </form>
            <div class="detail-btn">
                <button type="submit"><span>목록보기</span></button>
            </div>
        </div>
    <%@ include file="/views/include/footer.jsp"%>
</body>
</html>
