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

			<form action="/admin/customercenter/insertInquiry" method="post" class="form-horizontal">
				<input type="hidden" name="qno" value='<c:out value="${showList.qno }"/>'/>
				<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'> 
				<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
				<div class="admin-answer-box form-horizontal">
					<span class="admin-answer-text">답변</span>
					<textarea class="content" name="content"></textarea>
				</div>
				<div class="btn-box">
					<button type="submit" class="insert-btn insert-Inquiry">등록</button>
				</div>
			</form>

		</div>
        <%-- <form id='operForm' action="/customerCenter/notice" method="get">
            <input type="hidden"  id='nno' name='nno'
                   value='<c:out value="${boarddetail.nno}"/>'> <input
                type='hidden' name='pageNum'
                value='<c:out value="${cri.pageNum}"/>'> <input
                type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
        </form> --%>
<!--         <div class="detail-btn">
            <button type="submit"><span>목록보기</span></button>
        </div> -->

    </div>
</div>
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
