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

.bidList-title{
	text-align: center;
    font-size : 25px;
    margin: 30px;
    font-weight:bold;
    margin-bottom: 50px;
}

    
    .bid-title{
    	margin-top:10px;
    	font-weight: bold;
    	font-size: 18px;
    	margin-bottom: 20px;
    }
    
    .bid-content{
    	margin-bottom: 30px;

    }
    
    .bid-result{
     	text-align: center;
    }

/* 경매 미작성, 작성 영역 */
.auction-section{
	margin-left: 50px;
	text-align: center;
} 

.auction-menu{
	margin-bottom:50px;

}

.auction-menu a{
	border: 1px solid #c8c8c8;
	padding-top: 10px;
	padding-bottom:10px;
	font-weight:bold;
}

.auction-menu .selected{
	color:white;     	
    background-color:#f891aa;
}

/* 출력 css */
.auction-content{
	height:150px;
	vertical-align:middle;	
	border-top: 1px solid #c8c8c8;
	font-size:15px;
}


.auction-content:hover{
	background-color: #fff7f9;
}

.auction-title{
	height:50px;
	font-weight:bold;
	font-size:17px;
	border-bottom: 1px solid black;
}

.auction-content .img{
	padding-top:30px;
}

.auction-content span:not(:first-of-type){
	padding-top:70px;
}


.bid-detail, .bid-close{
	color:white;
    background-color:#f891aa;
    border:1px solid #ebebeb;
}

.bid-detail:hover{
	color:white;
    background-color:#f891aa;
    border:1px solid #ebebeb;
}

.bid-close:hover{
	color:white;
    background-color:#f891aa;
    border:1px solid #ebebeb;
}

.bid-detail:active{
	color:white;
    background-color:#f891aa;
    border:1px solid #ebebeb;
}

.bid-close:active{
	color:white;
    background-color:#f891aa;
    border:1px solid #ebebeb;
}

.hello{

	border-top: 1px solid #c8c8c8;
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
	<h1 class="bidList-title">입찰내역</h1>

<div class="auction-section">
	<div class="row auction-menu">
		<a href="/members/bidHistory" class="col-md-6 btn selected">입찰내역</a>
		<a href="/members/attention" class="col-md-6 btn">관심 경매 리스트</a>
	</div>

	<div class="row auction-title">
		<span class="col-md-3">이미지</span>
		<span class="col-md-3">상품명</span>
		<span class="col-md-2">최고입찰가</span>
		<span class="col-md-2">진행여부</span>
		<span class="col-md-2">입찰내역</span>
	</div>
	
	<c:forEach items="${auctions}" var="auction">
		<div class="row auction-content">
			<span class="col-md-3 img"><img data-filepath ="${auction.imgs[0].filepath}"class="thumb" src='' data-uuid="${auction.imgs[0].uuid}" data-filename="${auction.imgs[0].filename}"
							style="width: 100px; height: 100px;"></span>
			<span class="col-md-3"><a href='<c:out value="/auctions/${auction.apno}"/>'> <c:out
								value="${auction.name}" /></a></span>
			<fmt:formatNumber var="best_bid_price" value="${auction.best_bid_price}" type="number"/>
			<span class="col-md-2"><c:out value="${best_bid_price}" /></span>
			<span class="col-md-2"><c:out value="${auction.status}" /></span>
			<span class="col-md-2"><a href='<c:out value="${auction.apno}"/>' class="btn bid-detail">상세보기</a></span>
    		<span class="col-md-2" hidden="hidden"><a href='<c:out value="${auction.apno}"/>' class="btn bid-close">상세닫기</a></span>
		</div>	
		<div id="${auction.apno}" class="bid-result"></div>
	</c:forEach>
	<div class="hello row"></div>
</div>

</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script>
var display = (function loadThumbnail() {
	var uploadResultArr = $('.thumb');
	
	$(uploadResultArr).each(function (i, obj) {
		//섬네일 파일을 불러오기 위한 경로
		var fileCallPath = encodeURIComponent($(obj).data('filepath') + "/" + $(obj).data('uuid') + "_" + $(obj).data('filename'));
		// 섬네일 눌렀을 때 원본 파일 호출해서 보여주기
		$(obj).attr('src',"/commons/display?fileName=" + fileCallPath);
		})
	})();
	
	$(document).ready(function(){
		
		// 상세보기 클릭시 ajax로 해당 상품의 입찰내역 가져오기
		$('.bid-detail').on("click", function(e){
			e.preventDefault();
			var apno = $(this).attr('href');
			
			console.log("apno : " + apno)
			
			$.ajax({
				url: "/members/bidHistory/" + apno,
				type: 'get',
                contentType : "application/json; charset=UTF-8",
                success: function(data){
                	
                	console.log(data)

    	
                	var title = '<div class="row bid-title bid">' +
                		'<span class="col-md-3">번호</span>' + 
                	    '<span class="col-md-3">상품명</span>' +
                		'<span class="col-md-3">입찰금액</span>' +
                		'<span class="col-md-3">입찰시간</span>' +
                		'</div>'

                	$('#' + apno).append(title)

                	$.each(data, function(index, item){
                    	var result = "";
                    	result += '<div class="row bid-content bid">'
                    	result += '<span class="col-md-3">' + item.rank + '</span>';
                		result += '<span class="col-md-3">' + item.name + '</span>';
                		result += '<span class="col-md-3">' + item.price.toLocaleString() + '</span>';
                		result += '<span class="col-md-3">' + new Date(item.created_date).toISOString().replace('T', ' ').replace(/\..*/, '') + '</span>';
                		result += '</div>'
                		
                		$('#' + apno).append(result);
                	})
                
                }

			})
        	$(this).parent().next().show();
        	$(this).parent().hide();
			
		})
		
		// 상세 닫기
		$('.bid-close').on('click', function(e){
			e.preventDefault();
			var apno = $(this).attr('href');
        	$('#' + apno).empty();
        	$(this).parent().prev().show();
        	$(this).parent().hide();
		})
		

	})
	
</script>
</body>
</html>
