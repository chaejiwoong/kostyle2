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
label{
	width:100px;
}

.update-title {
	text-align: center;
    font-size : 25px;
    margin: 30px;
    font-weight:bold;
    margin-bottom: 100px;
}

.update-contents{
    vertical-content:center;
	display:flex;
	justify-content:center;
	height: 360px;
}
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

.orderCancel-title{
	text-align: center;
    font-size : 25px;
    margin: 30px;
    font-weight:bold;
    margin-bottom: 50px;
}

#orderCancel-form{
	margin-left: 100px;
	margin-top: 165px;
}


#orderCancel-section{
    vertical-content:center;
	display:flex;
	justify-content:center;
	height: 360px;
} 

.product{
	padding-left:200px;
}

.product div:first-child{
	font-size:20px;
	font-weight:bold;
}

.product div span:first-child{
	font-weight:bold;
}

.product div{
	margin: 10px;
}


#cancel-btn{
    color:white;
    display: inline-block;
    padding: 6px 12px;
	line-height: 1.42857143;    	
	border-radius: 4px;        	
    width:80px;
    margin-bottom:10px;
    font-size:15px;
    font-weight:bold;
    background-color:#f891aa;
    border:1px solid #ebebeb;
    margin-right: 30px;
}

#prev-btn{
    display: inline-block;
    padding: 6px 12px;
	line-height: 1.42857143;    	
	border-radius: 4px;        	
    width:80px;
    margin-bottom:10px;
    font-size:15px;
    font-weight:bold;
    border:1px solid #ebebeb;
    margin-right: 30px;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/adminHeader.jsp"%>

<div class="container">

<div id="left-sidebar">
    <h1>MyPage</h1>

	<ul>
		<li onclick="location.replace('/orders')" class="selected">주문배송조회</li>
		<li onclick="location.replace('/members')" class="selected">회원정보수정</li>
		<li onclick="location.replace('/members/address')" class="selected">배송지관리</li>
		<li onclick="location.replace('/reviews/unwritten')" class="selected">리뷰관리</li>
		<li onclick="loaction.replace('/shop/cartList')" class="selected">장바구니</li>
		<li>위시리스트/코디</li>
		<li onclick="location.replace('/members/bidHistory')" class="selected">내경매조회</li>
		<li onclick="location.replace('/customerCenter/register')">1:1문의</li>
	</ul>  		
</div>

<h1 class="orderCancel-title">주문취소 페이지</h1>
	<div id="orderCancel-section">

				<div class="row product">
					<div>
						<span>상품정보</span>
					</div>
					<div>
						<span><img data-filepath ="${detail.product.img.filepath}"class="thumb" src='' data-uuid="${detail.product.img.uuid}" data-filename="${detail.product.img.filename}"
							style="width: 200px; height: 200px;"></span>
						</div>
					<div>
						<span>상품명&nbsp;&nbsp; &nbsp;&nbsp; </span>
						<span>${detail.product.name}</span>
					</div>
					<div>
						<span>사이즈&nbsp;&nbsp;  &nbsp;&nbsp;</span>
						<span><c:out value="${detail.p_size}" /></span>
					</div>
					<div>
						<span>수량&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
					 	<span><c:out value="${detail.amount}" /></span>
					</div>
					<div>
						<span>가격&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> 
						<fmt:formatNumber var="price" value="${detail.price}" type="number"/>
						<span><c:out value="${price}" /></span>
					</div>
				</div>


		<form id="orderCancel-form" class="form-horizonal">
		

            <div class="form-inline form-group">
				<label for="name">작성자</label>
				<input id="name" name="name" type="text" class="form-control" value="${sessionScope.user.name }" readonly>
            </div>			
            <div class="form-inline form-group">
            	<label for="category">분류</label>
				<select id="category">	
					<option value="cancel" selected>주문취소</option>
				</select>	           
            </div>		            

            <div class="form-inline form-group">
				<label for="reason">취소사유</label>
				<textarea id="reason" name="reason" class="form-control" rows="2" cols="60"></textarea>
            </div>
            <div class="form-group form-inline">
				<button id="cancel-btn" type="button">완료</button>
            	<button id="prev-btn" type="button">취소</button>
            </div>	
		</form>	
	
	</div>
</div>

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
		
		// 뒤로가기
		$("#prev-btn").on('click', function(e){
			e.preventDefault();
			self.location="/orders"			
		})
		
		// 완료버튼
		$('#cancel-btn').on('click', function(e){
			e.preventDefault();
			
			var cancel={
					'category': $('#category').val(),
					'reason' : $('#reason').val()
			}
			
			$.ajax({
				url:"/orders/cancel/" + ${detail.odno},
				type:'post',
				data:JSON.stringify(cancel),
				contentType:'application/json; charSet=UTF-8',
				success: function(data){
					alert("해당 요청이 완료되었습니다.")
					self.location="/orders";
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
