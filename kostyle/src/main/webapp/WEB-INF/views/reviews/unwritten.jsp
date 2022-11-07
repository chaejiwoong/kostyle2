<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
        <title>KoStyle4U</title>
        <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
        <script type="text/javascript" src="/resources/js/adminHeader.js"></script>
        <link href="/resources/css/header.css" rel="stylesheet"/>
        <link href="/resources/css/footer.css" rel="stylesheet"/>
<style>

        h1{
            margin-top: 25px;
            margin-bottom: 25px;
            font-size: 30px;
            font-weight: bold;
            text-align: center;
        }
        
.paging {
	text-align: center;
}

.selectBox{
	text-align: center;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/adminHeader.jsp"%>
<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>이미지</th>
					<th>상품명</th>
					<th>사이즈</th>
					<th>수량</th>
					<th>가격</th>
					<th>리뷰</th>
				</tr>
			</thead>

			<c:forEach items="${details}" var="detail">
				<tr>
					<td><img data-filepath ="${detail.product.img.filepath}"class="thumb" src='' data-uuid="${detail.product.img.uuid}" data-filename="${detail.product.img.filename}"
							style="width: 180px; height: 200px;"></td>
					<td><a href="/products/${detail.product.name}">${detail.product.name}</a></td>
					<td><c:out value="${detail.p_size}" /></td>
					<td><c:out value="${detail.amount}" /></td>
					<td><c:out value="${detail.price}" /></td>
					<td><a href='/reviews/register?odno=${detail.odno}' class="btn btn-primary register">리뷰작성</a></td>
				</tr>
			</c:forEach>

		</table>
</div>

<script>
var display = (function loadThumbnail() {
	var uploadResultArr = $('.thumb');
	
	$(uploadResultArr).each(function (i, obj) {
		//섬네일 파일을 불러오기 위한 경로
		var fileCallPath = encodeURIComponent($(obj).data('filepath') + "/s_" + $(obj).data('uuid') + "_" + $(obj).data('filename'));
		// 섬네일 눌렀을 때 원본 파일 호출해서 보여주기
		$(obj).attr('src',"/commons/display?fileName=" + fileCallPath);
		})
	})();
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
