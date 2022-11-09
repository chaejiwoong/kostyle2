<%--
  Created by IntelliJ IDEA.
  User: dhwls
  Date: 2022-10-25
  Time: 오후 6:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>문의하기</title>
    <script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
    <script type="text/javascript" src="/resources/js/header.js"></script>
    <script type="text/javascript" src="/resources/js/customerCenter.js"></script>
    <link href="/resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/css/header.css" rel="stylesheet"/>
    <link href="/resources/css/footer.css" rel="stylesheet"/>
    <link href="/resources/css/nav.css" rel="stylesheet"/>
    <link href="/resources/css/insert.css" rel="stylesheet"/>
    
</head>
<body>
    <%@ include file="/WEB-INF/views/include/header.jsp"%>
    <%@ include file="/WEB-INF/views/customerCenter/include/nav.jsp"%>
    
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    	<div class="wrap-box">
	    	<div class="insert-name">이름:<span><c:out value="${sessionScope.user.name}"/></span></div>
	    	<form action="/customerCenter/insert" method="post">
		    	<div class="insert-box">
		    		<div class="insert-text">
		    			<label for="title">제목</label><input id="title" type="text" name="title"/>
		    		</div>
		    		<div class="insert-textarea">
		    			<label for="content">내용</label><textarea class="content" id="content" name="content"></textarea>
		    		</div>
		    		<div class="insert-btn">
		    			<button class="insert" type="submit">등록</button>
		    		</div>
		    	</div>
	    	</form>
    	</div>
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
