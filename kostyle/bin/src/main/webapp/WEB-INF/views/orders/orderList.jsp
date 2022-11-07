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
.order-title{
	text-align: center;
    font-size : 25px;
    margin: 30px;
    font-weight:bold;
    margin-bottom: 50px;
}

.order-section{
	margin-left: 50px;
	text-align: center;
	vertical-align:middle;
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
		<li>장바구니</li>
		<li>위시리스트/코디</li>
		<li onclick="location.replace('/members/bidHistory')" class="selected">내경매조회</li>
		<li>1:1문의</li>
	</ul>  		
	
</div>
	<h1 class="order-title">주문 목록</h1>

	<div class="order-section">
	<div class="selectBox row">
		<form id='searchForm' class="form-horizontal" action="/orders" method='get'>
	<div class="form-inline form-group">
				<button id="default" class='btn btn-default'>Default</button>
				
				<span>필터</span>
				<label for="three-day">3일</label><input type="radio" id="three-day" class="form-control filter" name="filter" value="3"
				<c:out value="${pageMaker.cri.filter eq '3'?'checked':''}"/>>				
				<label for="week">7일</label><input type="radio" id="week" class="form-control filter" name="filter" value="7"
				<c:out value="${pageMaker.cri.filter eq '7'?'checked':''}"/>>
				<label for="month">1달</label><input type="radio" id="month" class="form-control filter" name="filter" value="30"
				<c:out value="${pageMaker.cri.filter eq '30'?'checked':''}"/>>
				<label for="three-month">3달</label><input type="radio" id="three-month" class="form-control filter" name="filter" value="90"
				<c:out value="${pageMaker.cri.filter eq '90'?'checked':''}"/>>								
			</div>
			<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
			<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />

		</form>
		</div>	


	
				<div class="row">
					<span>주문번호</span>
					<span>이미지</span>
					<span>상품명</span>
					<span>총 가격</span>
					<span>결제방식</span>
					<span>배송상태</span>					
					<span>주문일자</span>
					<span>주문상세</span>
				</div>

			<c:forEach items="${orders}" var="order">
			<div>
				<div class="row">
					<span><c:out value="${order.ono}" /></span>
					<c:if test="${order.category eq '구매' }">
						<span><img data-filepath ="${order.orderDetail.product.img.filepath}"class="thumb" src='' data-uuid="${order.orderDetail.product.img.uuid}" data-filename="${order.orderDetail.product.img.filename}"></span>
					</c:if>
					<c:if test="${order.category eq '낙찰' }">
						<span><img data-filepath ="${order.winningBid.img.filepath}"class="thumb" src='' data-uuid="${order.winningBid.img.uuid}" data-filename="${order.winningBid.img.filename}"></span>
					</c:if>
					<span><c:out value="${order.name}" /></span>
								
					<span><c:out value="${order.totalPrice}" /></span>
					<span><c:out value="${order.payment}" /></span>			
					<span><c:out value="${order.status}" /></span>				
					<span><fmt:formatDate pattern="yyyy-MM-dd"
							value="${order.created_date}" /></span>
					
					<span><a href="${order.ono }" class="btn btn-primary detailBtn" data-category="${order.category }" data-status="${order.status }">상세보기</a></span>
					<span hidden="hidden"><a href="${order.ono }" class="btn btn-primary closeBtn">상세닫기</a></span>
				</div>
				<div class="row address" hidden="hidden">
					<span>배송지</span>
					<span>전화번호</span>					
				</div>
				<div class="row address" hidden="hidden">
					<span>${order.address.address }</span>
					<span>${order.address.tel }</span>					
				</div>
				<div id="${order.ono }">
				</div>
			</div>

			</c:forEach>


	
		<div class="paging">
			<ul class="pagination">
				<!-- 페이징 구현 부분 -->
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous"><a
						href="${pageMaker.startPage -1}">Previous</a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
						<a href="${num}">${num}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next}">
					<li class="paginate_button next"><a
						href="${pageMaker.endPage +1 }">Next</a></li>
				</c:if>
			</ul>

		</div>
	</div>	

		<!-- 페이징 번호 요청 시에 submit되는 form -->
		<form id='actionForm' action="/orders" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

			<input type='hidden' name='type'
				value='<c:out value="${ pageMaker.cri.type }"/>'> <input
				type='hidden' name='keyword'
				value='<c:out value="${ pageMaker.cri.keyword }"/>'>
			<input type='hidden' name='filter'
				value='<c:out value="${ pageMaker.cri.filter }"/>'>				
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
	
    var actionForm = $("#actionForm");

    $(".paginate_button a").on("click", function(e) {

            e.preventDefault();

            // 해당 pageNum을 a 태그의 href 속성 값으로 치환
            actionForm.find("input[name='pageNum']")
                .val($(this).attr("href"));
            actionForm.submit();
        });

	// 상세보기 클릭시 ajax로 해당 주문의 주문상세 가져오기
	$('.detailBtn').on("click", function(e){
		e.preventDefault();
		var ono = $(this).attr('href');
		var category = $(this).data('category')
		var status= $(this).data('status')
		$(this).parent().parent().parent().find("div.address").show();
		
		console.log("ono : " + ono)
		

		$.ajax({
			url: "/orders/" + ono +"?category=" + category,
			type: 'get',
            contentType : "application/json; charset=UTF-8",
            success: function(data){
            	
            	console.log(data)
 
        		if(category =="구매"){
        			
                	var title = '<div>' +
            		'<span>상세번호</span>' + 
            	    '<span>이미지</span>' +
            		'<span>상품명</span>' +
            		'<span>사이즈</span>' +
            		'<span>수량</span>' +
            		'<span>가격</span>' +
            		'</div>'

            		$('#' + ono).append(title)    
            		
                	$.each(data, function(index, item){
                		var fileCallPath = encodeURIComponent(item.product.img.filepath + "/s_" + item.product.img.uuid + "_" + item.product.img.filename);
                		
                		
                		
                		console.log(fileCallPath)
                    	var result = "";
                    	result += '<div class="row">'
                    	result += '<span>' + item.odno + '</span>'; 
                        result += '<span><img class="thumb" src="/commons/display?fileName=' + fileCallPath + '"></span>';                				
                		result += '<span>' + item.product.name + '</span>';
                		result += '<span>' + item.p_size + '</span>';
                		result += '<span>' + item.amount+ '</span>';
                		result += '<span>' + item.price + '</span>';
                		if(status == '상품준비중'){
                			result += '<span><a class="btn btn-default detail-cancel" data-odno="' + item.odno + '">주문취소</a></span>'	
                		}
                		
                		result += '</div>'
                		
                    	$('#' + ono).append(result);     
                	})

        		}else{
        			
                	var title = '<div>' +
            		'<span>낙찰번호</span>' + 
            	    '<span>이미지</span>' +
            		'<span>상품명</span>' +
            		'<span>가격</span>' +
            		'</div>'

            		$('#' + ono).append(title)   
            		
            		
            		var fileCallPath = encodeURIComponent(data.img.filepath + "/s_" + data.img.uuid + "_" + data.img.filename);
            		
            		
            		console.log(fileCallPath)
                	var result = "";
                	result += '<div class="row">'
                	result += '<span>' + data.wbno + '</span>'; 
                    result += '<span><img class="thumb" src="/commons/display?fileName=' + fileCallPath + '"></span>';                				
            		result += '<span>' + data.name + '</span>';
            		result += '<span>' + data.price + '</span>';
            		result += '</div>'
            		
                	$('#' + ono).append(result);                		
        		}
        
            }

		})		
		$(this).parent().next().show();
    	$(this).parent().hide();
		
	})
	
	// 상세 닫기
	$('.closeBtn').on('click', function(e){
		e.preventDefault();
		var ono = $(this).attr('href');
		$(this).parent().parent().parent().find("div.address").hide();
        $('#' + ono).empty();
        $(this).parent().prev().show();
        $(this).parent().hide();
	})
	
	// 반품/취소 페이지로 이동
	$(document).on("click",".detail-cancel",function(e){
		e.preventDefault();
		
		var odno = $(this).data('odno');
		
		self.location="/orders/cancel/" + odno
		
	})
	var searchForm = $('#searchForm')
	$("#three-day, #week, #month, #three-month").on('change', function(){
		// 1페이지로 바꾸고 submit.
		searchForm.find("input[name='pageNum']")
				.val("1");

		searchForm.submit();
	})	
	
	
	$("#default").on('click', function(e){
		e.preventDefault();
		self.location="/orders";
	})
	
})
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
