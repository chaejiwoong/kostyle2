<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
        <title>KoStyle4U</title>
        <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
        <script type="text/javascript" src="/resources/js/header.js"></script>
        <link href="/resources/css/header.css" rel="stylesheet"/>
        <link href="/resources/css/footer.css" rel="stylesheet"/>
        
        		<!-- 모달창 스크립트 -->
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
.review-title{
	text-align: center;
    font-size : 25px;
    margin: 30px;
    font-weight:bold;
    margin-bottom: 50px;
}

.review-section{
	margin-left: 50px;
	text-align: center;
	vertical-align:middle;
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

.reviews-title{
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


.reviewDetail{
	
	color:white;     	
    background-color:#f891aa;
    border:1px solid #ebebeb;
}

.reviewDetail:hover{
	color:white;
    background-color:#f891aa;
    border:1px solid #ebebeb;
}

.reviewDetail:active{
	color:white;
    background-color:#f891aa;
    border:1px solid #ebebeb;
}

/* 리뷰 미작성, 작성 영역 */
.review-menu{
	margin-bottom:50px;

}

.review-menu a{
	border: 1px solid #c8c8c8;
	padding-top: 10px;
	padding-bottom:10px;
	font-weight:bold;
}

.review-menu .selected{
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
		<li onclick="location.replace('/reviews/unwritten')" class="selected">리뷰관리</li>
		<li onclick="location.replace('/shop/cartList')">장바구니</li>
		<li>위시리스트/코디</li>
		<li onclick="location.replace('/members/bidHistory')">내경매조회</li>
		<li onclick="location.replace('/customerCenter/register')">1:1문의</li>
	</ul>  		
	
</div>
	<h1 class="review-title">리뷰 관리</h1>

<div class="review-section">
	<div class="row review-menu">
		<a href="/reviews/unwritten" class="col-md-6 btn">리뷰 미작성 상품</a>
		<a href="/reviews/write" class="col-md-6 btn selected">리뷰 작성 상품</a>
	</div>
	<div class="row reviews-title">
		<span class="col-md-2">이미지</span>
		<span class="col-md-2">상품명</span>
		<span class="col-md-2">사이즈</span>
		<span class="col-md-2">수량</span>
		<span class="col-md-2">가격</span>
		<span class="col-md-2">리뷰</span>
	</div>
	<c:forEach items="${details}" var="detail">
		<div class="row result">
			<span class="col-md-2 img"><img data-filepath ="${detail.product.img.filepath}"class="thumb" src='' data-uuid="${detail.product.img.uuid}" data-filename="${detail.product.img.filename}"
							style="width: 100px; height: 100px;"></span>
			<span class="col-md-2"><a href="/main/product?pno=${detail.product.pno}">${detail.product.name}</a></span>
			<span class="col-md-2"><c:out value="${detail.p_size}" /></span>
			<span class="col-md-2"><c:out value="${detail.amount}" /></span>
			<fmt:formatNumber var="price" value="${detail.price}" type="number"/>
			<span class="col-md-2"><c:out value="${price}" /></span>
			<span class="col-md-2"><a data-odno="${detail.odno }" class="btn reviewDetail">리뷰보기</a></span>
		</div>	
	</c:forEach>

	</div>
	
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">리뷰 내용</h4>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-danger modalClose">닫기</button>
      </div>          
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
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

	    var modal = $(".modal");

		$('.reviewDetail').on('click', function(e){
			e.preventDefault();
			$('.modal-body').empty();
			$.ajax({
				url:"/reviews/detail?odno=" + $(this).data('odno'),
				type:'get',
				success:function(result){
					console.log(result)			      
		    			var str = "<dl>" +
		    			"<dt>댓글번호 : " + result.rno + "</dt>" + 
		    			"<dd>댓글내용 : " + result.content + "</dd>" + 	
		    			"<dd>별점 : " + result.starPoint + "</dd>" + 
						"<dd>작성일자 : " + new Intl.DateTimeFormat('kr').format(new Date(result.last_modified_date)) + "</dd>" + 
						"</dl>" 
				      
				      $('.modal-body').append(str);
					  
				}
			})
			$(".modal").modal("show");
		})
		
		$('.modalClose').on('click', function(e){
			e.preventDefault();
			modal.modal("hide")
		})
	})
	
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
