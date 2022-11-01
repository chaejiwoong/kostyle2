<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>KoStyle4U</title>
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<link href="/resources/css/header.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet" />
<style>

h1{
margin-top: 25px;
margin-bottom: 25px;
font-size: 30px;
font-weight: bold;
 text-align: center;
        }
        
 .selectBox{
	text-align: center;
}
.paging {
	text-align: center;
}
    #left-sidebar{
        position: relative;
        float: left;
        margin-left: 30px;
        font-size: 17px;
        border: solid 1px #ebebeb;
        vertical-align: center;
        border-radius: 10px;
        padding-top: 20px;
        margin-top: 20px;
    }

    #left-sidebar h1{
        border-bottom: 1px solid black;
        text-align: center;
        height: 50px;
        font-size: 20px;
        font-weight: bold;
    }

    #menu li{
        display: block;
        list-style: circle;
        width: 200px;
        height: 50px;
        padding-left: 10px;
        padding-top: 10px;
    }
    
	.selected-li{
    	background-color: black;
    	color: white;
    }
    
    #menu li:hover{
        background-color: black;
    	color: white;
    }
    .attention-list{
        display: flex;
        justify-content: center;
    }

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div id="left-sidebar">
    <h1>MyPage</h1>
    <ul id="menu">
        <li><a href=""></a>주문목록/배송조회</li>
        <li>리뷰관리</li>
        <li>회원정보수정/탈퇴</li>
        <li>배송지관리</li>
        <li>장바구니</li>
        <li>코디/위시리스트</li>
        <li class="selected-li">내 경매 조회</li>
    </ul>
</div>
	<div class="container">

	<h1>관심 경매 목록</h1>	
	<div class="attention-list">
			<table class="table">
			<thead>
				<tr>
					<th>경매번호</th>
					<th>이미지</th>
					<th>상품명</th>
					<th>입찰시작가</th>
					<th>최고입찰가</th>
					<th>입찰단위</th>
					<th>관심해제</th>

				</tr>
			</thead>

			<c:forEach items="${auctions}" var="auction">
				<tr>
					<td><c:out value="${auction.apno}" /></td>
					<td><img data-filepath ="${auction.imgs[0].filepath}"class="thumb" src='' data-uuid="${auction.imgs[0].uuid}" data-filename="${auction.imgs[0].filename}"></td>
					<td><a href='<c:out value="/auctions/${auction.apno}"/>'> <c:out
								value="${auction.name}" /></a></td>
					<td><c:out value="${auction.start_price}" /></td>
					<td><c:out value="${auction.best_bid_price}" /></td>
					<td><c:out value="${auction.bid_unit}" /></td>
					<td><a class="btn btn-default attention" href="/auctions/attention/${auction.apno}">관심해제</a></td>

				</tr>
			</c:forEach>

		</table>
	</div>

	</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script>
var aa = (function loadThumbnail() {
	var uploadResultArr = $('.thumb');
	
	$(uploadResultArr).each(function (i, obj) {
		//섬네일 파일을 불러오기 위한 경로
		var fileCallPath = encodeURIComponent($(obj).data('filepath') + "/s_" + $(obj).data('uuid') + "_" + $(obj).data('filename'));
		// 섬네일 눌렀을 때 원본 파일 호출해서 보여주기
		$(obj).attr('src',"/commons/display?fileName=" + fileCallPath);
		})
	})();
	
$(document).ready(function(){
	$('.attention').on("click", function(e){
		e.preventDefault();
		
			$.ajax({
			url:$(this).attr('href'),
			type:'put',
			success:function(data){
				alert("해제가 완료되었습니다.")
				self.location="/members/attention"
			}
		})
	})
})

</script>
</body>
</html>
