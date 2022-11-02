<%--
  Created by IntelliJ IDEA.
  User: dhwls
  Date: 2022-10-22
  Time: 오후 6:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>Q&A</title>
    <script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
    <script type="text/javascript" src="/resources/js/header.js"></script>
    <script type="text/javascript" src="/resources/js/qna.js"></script>
    <script type="text/javascript" src="/resources/js/ajax.js"></script>
    <link href="/resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/css/header.css" rel="stylesheet"/>
    <link href="/resources/css/footer.css" rel="stylesheet"/>
    <link href="/resources/css/nav.css" rel="stylesheet"/>
    <link href="/resources/css/qna.css" rel="stylesheet"/>
</head>
<body>
<div id="wrap">
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<%@ include file="/WEB-INF/views/customerCenter/include/nav.jsp"%>
	 <nav class="qna-nav">
	     <ul>
	         <li><a href="/customerCenter/qna?category=all" id="all" data-value="all" class="board-radio on" name="all"><span class="all">전체</span></a></li>
	         <li><a id="usage-policy" data-value="usage-policy" class="board-radio"><span class="usage-policy">이용정책</span></a></li>
	         <li><a id="purchase" data-value="purchase" name="purchase" class="board-radio"><span class="purchase">구매</span></a></li>
	         <li><a class="board-radio" data-value="sale"> <span class="sale">판매</span></a></li>
	     </ul>
	 </nav>
	 <div class="feq-box">
	     <ul class="list">
	        <c:forEach items="${qnaList}" var="list">
	        <li class="qna-title">
	            <div class="qna-top">
	                <div class="list-category">
	                		<c:out value="${list.category}"/>
	             	</div>
	                <div class="list-title"><c:out value="${list.title}"/></div>
	                <div class="date">날짜: <fmt:formatDate pattern="yyyy-MM-dd" value="${list.created_date}"/></div>
	                <a></a>
	            </div>
	            <div class="qna-bottom">
	                <div class="qna-box">
	                    <div class="qna-answer"><c:out value="${list.content}"/></div>
	                </div>
	            </div>
	        </li>
	        </c:forEach>
	     </ul>
	     
	     <!--  end Pagination -->
	 </div>
</div>
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
