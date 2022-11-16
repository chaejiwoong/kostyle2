<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <head>
        <title>KoStyle4U</title>
        <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
        <script type="text/javascript" src="/resources/js/header.js"></script>
        <link href="/resources/css/header.css" rel="stylesheet"/>
        <link href="/resources/css/footer.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>        
        
<style>



label{
	width:100px;
}

.address-title {
	text-align: center;
    font-size : 25px;
    margin: 30px;
    font-weight:bold;
    margin-bottom: 50px;
}

.address-section{
	margin-left: 50px;
	text-align: center;
	text-align: center;
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
.address-menu{
	position:relative;
}

th{
	text-align:center;
}

td:not(.delivery-address){
	text-align:center;
}
tbody tr:hover{
	background-color: #fff7f9;
}
.table>tbody>tr>td{
	vertical-align:middle;
}

/* 버튼 영역 */
.updateBtn{
	color:white;
    background-color:#f891aa;
    border:1px solid #ebebeb;
}

.updateBtn:hover{
	color:white;
    background-color:#f891aa;
    border:1px solid #ebebeb;
}

.updateBtn:active{
	color:white;
    background-color:#f891aa;
    border:1px solid #ebebeb;
}
.defaultBtn{
	color:white;
    background-color:#f891aa;
    border:1px solid #ebebeb;
}

.defaultBtn:hover{
	color:white;
    background-color:#f891aa;
    border:1px solid #ebebeb;
}

.defaultBtn:active{
	color:white;
    background-color:#f891aa;
    border:1px solid #ebebeb;
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
		<li onclick="location.replace('/members/address')" class="selected">배송지관리</li>
		<li onclick="location.replace('/reviews/unwritten')">리뷰관리</li>
		<li>장바구니</li>
		<li>위시리스트/코디</li>
		<li onclick="location.replace('/members/bidHistory')">내경매조회</li>
		<li onclick="location.replace('/customerCenter/register')">1:1문의</li>
	</ul>  		
</div>
    <h1 class="address-title">배송지 관리</h1>
    
<div class="address-section">
	<div class="row address-menu">
	<span class="col-md-9"></span>
		<a href="#" id="changeDefault" class="btn defaultBtn">기본 배송지로 설정</a>
		<a href="/members/address/register" class="btn btn-default">배송지 추가 +</a>
	</div>
		<table class="table">
			<thead>
				<tr>
					<th>선택</th>
					<th>배송지명</th>
					<th>배송지 정보</th>
					<th>수정 / 삭제</th>
				</tr>
			</thead>
			<tbody>

			<c:forEach items="${addresses}" var="address">
				<tr>
					<td><input type="radio" name="default" value="${address.ano }"<c:out value="${address._default?'checked':''}"/>></td>
					<td>${address.name}</td>

					<td class='delivery-address'>
						<dl>
							<dt>${address.recipient }</dt>
							<dd>${address.tel }</dd>
							<dd>${address.address }</dd>
						</dl>
					</td>
					<td>
						<span class="btn updateBtn" data-ano="${address.ano }">수정</span>
						<c:if test="${!address._default }">
							<span class="btn btn-danger deleteBtn" data-ano="${address.ano }">삭제</span>						
						</c:if>

					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>

</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script>
	$(document).ready(function(){
		
		
		$(".updateBtn").on('click', function(e){
			e.preventDefault();
			
			self.location="/members/address/" + $(this).data('ano')
			
		})
		
		$(".deleteBtn").on('click', function(e){
			e.preventDefault();
			$.ajax({
				url:"/members/address/" + $(this).data('ano'),
				type:'delete',
				success: function(result){
					alert("배송지 삭제가 완료되었습니다.")
					self.location="/members/address"
				}
			})
			
		})		
		
		$('#changeDefault').on('click', function(e){
			e.preventDefault();
			
			$.ajax({
				url:"/members/address/changeDefault/" + $('input[name="default"]:checked').val(),
				type:'put',
				success: function(result){
					alert("기본 배송지 변경이 완료되었습니다.")
					self.location="/members/address"
				}
			})
		})
	})
</script>
</body>
</html>
