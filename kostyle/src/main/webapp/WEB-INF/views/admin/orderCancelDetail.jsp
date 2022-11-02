<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
        <title>KoStyle4U</title>
        <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
        <script type="text/javascript" src="/resources/js/adminHeader.js"></script>
        <link href="/resources/css/header.css" rel="stylesheet"/>
        <link href="/resources/css/footer.css" rel="stylesheet"/>
<style>
        label{
            width: 100px;
        }
        h1{
            margin-top: 25px;
            margin-bottom: 25px;
            font-size: 30px;
            font-weight: bold;
            text-align: center;
        }
        .cancel-section{
                    display: flex;
            justify-content: center;
        }
        
        .list-btn{
        	margin-bottom: 20px;
        }
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/adminHeader.jsp"%>

	<h1>취소 상세</h1>
	
<div class="container">
	<div class="cancel-section">
	
	<form class="form-horizonal">
			<div class="form-inline form-group">
				<label for="ocno">취소번호</label>
				<input type="text" id="ocno" class="form-control" value="${orderCancel.ocno}" readonly />
			</div>
			<div class="form-inline form-group">
				<label for="name">상품명</label>
				<input type="text" id="name" class="form-control" value="${orderCancel.product.name}" readonly /><br>
			</div>
			<div class="form-inline form-group">
				<label for="category">분류</label>
				<input type="text" id="category" class="form-control" value="${orderCancel.category}" readonly /><br>
			</div>
			<div class="form-inline form-group">
				<label for="reason">사유</label>
				<textarea id="reason" class="form-control" rows="5" cols="60" readonly>${orderCancel.reason }</textarea><br>
			</div>
			<div class="form-inline form-group">
				<label for="created_date">취소일자</label>
				<input type="text" class="form-control" name="created_date" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${orderCancel.created_date}" />"
			readonly />
			</div>
			<div class="form-inline form-group">
			<span class="col-md-10"></span>
				<a href="/admin/orderCancels" class="btn btn-primary col-md-2 list-btn">목록으로</a>
			</div>
			
		</form>

	</div>
			
</div>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
