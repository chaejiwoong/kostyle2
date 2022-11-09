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
<script type="text/javascript" src="/resources/js/adminHeader.js"></script>
<script type="text/javascript" src="/resources/js/customerCenter.js"></script>
<script type="text/javascript" src="/resources/js/qna.js"></script>
<link href="/resources/vendor/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<link href="/resources/css/adminHeader.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet" />
<link href="/resources/css/insertInquiry.css" rel="stylesheet"/>
    
</head>
<body>
<body>
<div id="wrap">
	<%@ include file="/WEB-INF/views/include/adminHeader.jsp"%>
    <div class="detail-box">
        <div class="box">
            <div class="user-name font-size">
                이름 : <c:out value="${showList.name}"/>
            </div>
            <div class="user-title font-size">
                제목 : <c:out value="${showList.title}"/>
            </div>
            <div class="user-content font-size">
                내용 : <c:out value="${showList.content}"/>
            </div>
            <div class="user-content font-size">
                답변 : <c:out value="${list.content}"/>
            </div>
			<div class="detail-btn">
            	<button type="button"><span>목록보기</span></button>
        	</div>
		</div>
      <form id='operForm' action="/admin/customerCenter/inquiryList" method="get">
            <input type="hidden"  id='qno' name='qno' value='<c:out value="${showList.qno}"/>'> 
            <input class="pageNum" type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'> 
            <input class="amount" type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
        </form>

    </div>
</div>
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
