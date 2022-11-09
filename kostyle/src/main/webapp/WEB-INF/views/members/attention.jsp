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

/* 사이드바 */
#left-sidebar{
	position:absolute;
	left:0px;
	text-align:center;
	width:200px;
	border: 1px solid black;
	border-radius: 4px;
	margin-top: 20px;
}


#left-sidebar h1{
	font-size: 20px;
	font-weight: bold;
	padding:20px;
	border-bottom: 1px solid black;
}

#left-sidebar li{
	display:block;
	padding: 15px;
	font-weight:bold;
}

#left-sidebar li:hover{
	background-color: #f891aa;
	color: white;
	cursor:pointer;
}

.selected{
	background-color: #f891aa;
	color: white;
}
/* 사이드바 끝 */
.attention-title{
	text-align: center;
    font-size : 25px;
    margin: 30px;
    font-weight:bold;
    margin-bottom: 50px;
}

.attention-section{
	margin-left: 50px;
	text-align:center;
} 

.result{
	height:150px;
	vertical-align:middle;
	border-bottom: 1px solid #c8c8c8;
	font-size:15px;
}

.result:hover{
	background-color: #fff7f9;
}

.attentions-title{
	height:50px;
	font-weight:bold;
	font-size:17px;
	border-bottom: 1px solid black;
}

.result .img{
	padding-top:30px;
}

.result span:not(:first-of-type){
	padding-top:70px;
}



/* 리뷰 미작성, 작성 영역 */
.attention-menu{
	margin-bottom:50px;

}

.attention-menu a{
	border: 1px solid #c8c8c8;
	padding-top: 10px;
	padding-bottom:10px;
	font-weight:bold;
}

.attention-menu .selected{
	color:white;     	
    background-color:#f891aa;
}


</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div class="container">

<div id="left-sidebar">
    <h1>MyPage</h1>

	<ul>
		<li onclick="location.replace('/orders')">주문배송조회</li>
		<li onclick="location.replace('/members')">회원정보수정</li>
		<li onclick="location.replace('/members/address')">배송지관리</li>
		<li onclick="location.replace('/reviews/unwritten')">리뷰관리</li>
		<li onclick="loaction.replace('/shop/cartList')">장바구니</li>
		<li>위시리스트/코디</li>
		<li onclick="location.replace('/members/bidHistory')" class="selected">내경매조회</li>
		<li>1:1문의</li>
	</ul>  		
	
</div>
	<h1 class="attention-title">관심 경매 목록</h1>

<div class="attention-section">
	<div class="row attention-menu">
		<a href="/members/bidHistory" class="col-md-6 btn">입찰내역</a>
		<a href="/members/attention" class="col-md-6 btn selected">관심 경매 리스트</a>
</div>
	<div class="row attentions-title">
		<span class="col-md-2">이미지</span>
		<span class="col-md-2">상품명</span>
		<span class="col-md-2">입찰시작가</span>
		<span class="col-md-2">최고입찰가</span>
		<span class="col-md-2">입찰단위</span>
		<span class="col-md-2">관심해제</span>
	</div>
	<c:forEach items="${auctions}" var="auction">
		<div class="row result">
			<span class="col-md-2 img"><img data-filepath ="${auction.imgs[0].filepath}"class="thumb" src='' data-uuid="${auction.imgs[0].uuid}" data-filename="${auction.imgs[0].filename}"
							style="width: 100px; height: 100px;"></span>
			<span class="col-md-2"><a href='<c:out value="/auctions/${auction.apno}"/>'> <c:out
								value="${auction.name}" /></a></span>
			<fmt:formatNumber var="startPrice" value="${auction.start_price}" type="number"/>								
			<span class="col-md-2"><c:out value="${startPrice}" /></span>
			<fmt:formatNumber var="best_bid_price" value="${auction.best_bid_price}" type="number"/>
			<span class="col-md-2"><c:out value="${best_bid_price}" /></span>
			<fmt:formatNumber var="bidUnit" value="${auction.bid_unit}" type="number"/>
			<span class="col-md-2"><c:out value="${bidUnit}" /></span>
			<span class="col-md-2"><a href="/auctions/attention/${auction.apno}" class="btn btn-default attention">관심해제</a></span>
		</div>	
	</c:forEach>

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
