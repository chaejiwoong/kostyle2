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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<% pageContext.setAttribute("replaceChar", "\n"); %>
<html>
<head>
    <title>문의하기</title>
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/adminHeader.js"></script>
<script type="text/javascript" src="/resources/js/customerCenter.js"></script>
<script type="text/javascript" src="/resources/js/qna.js"></script>
<link href="/resources/vendor/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<link href="/resources/css/adminHeader.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet" />
<link href="/resources/css/noticedetail.css" rel="stylesheet"/>
    
</head>
<body>
<div id="wrap">
    <%@ include file="/WEB-INF/views/include/adminHeader.jsp"%>
    
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    	<div class="wrap-box">
	    	<div class="insert-name">이름:<span><c:out value="${sessionScope.user.name}"/></span></div>
	    	<form action="/admin/customercenter/noticedetail" method="post">
	    	<input name="nno" type="hidden" value="<c:out value='${boarddetail.nno}'/>"/>
		    	<div class="insert-box">
		    		<div class="insert-text">
		    			<label for="title">제목</label><input id="title" type="text" name="title" value="<c:out value='${boarddetail.title}'/>"/>
		    		</div>
		    		<div class="insert-textarea">
		    			<label for="content">내용</label><textarea id="content" name="content">${fn:replace(boarddetail.content, replaceChar, "<br/>")}</textarea>
		    		</div>
		    		<div class="select-box">
		    			<span class="category-name">카테고리 : 공지사항</span>
	    				<input type="hidden" class="category-ch" name="category" value="notice"/>
    				</div>
		    		<div class="insert-btn">
		    			<button type="submit">수정</button>
		    		</div>
		    	</div>
	    	</form>
    	</div>
    </div>
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
