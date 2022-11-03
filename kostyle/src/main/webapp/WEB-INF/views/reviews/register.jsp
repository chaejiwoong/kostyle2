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
				</tr>
			</thead>
				<tr>
					<td><img data-filepath ="${detail.product.img.filepath}"class="thumb" src='' data-uuid="${detail.product.img.uuid}" data-filename="${detail.product.img.filename}"
							style="width: 180px; height: 200px;"></td>
					<td><a href="/products/${detail.product.name}">${detail.product.name}</a></td>
					<td><c:out value="${detail.p_size}" /></td>
					<td><c:out value="${detail.amount}" /></td>
					<td><c:out value="${detail.price}" /></td>
				</tr>
		</table>
		<form id="review-form" class="form-horizonal">
			<label for="name">작성자</label>
			<input id="name" name="name" type="text" class="form-control" value="${sessionScope.user.name }" readonly>
			<label for="starPoint">별점</label>
			<input id="starPoint" class="form-control">
			<label for="content">리뷰내용</label>
			<input id="content" name="content" type="text" class="form-control">
			<button id="submitBtn" type="button" class="btn btn-primary">완료</button>
		</form>
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
	$(document).ready(function(){
		$("#submitBtn").on('click', function(e){
			e.preventDefault();
			
			
			var review = {
					'mno' : ${sessionScope.user.mno},
					'pno' : ${detail.product.pno},
					'odno' : ${detail.odno},
					'starPoint' : $('#starPoint').val(),
					'content' : $('#content').val(),		
			}
			
			$.ajax({
				url:"/reviews/register",
				type:"post",
				data: JSON.stringify(review),
				contentType: "application/json; charSet=UTF-8",
				success: function(result){	
					alert("리뷰 등록이 완료되었습니다 !!")
					self.location="/reviews/write"
				},error: function(xhr){
					alert("잘못된 요청입니다.")
				}
			})
			
		})
		
	})
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
