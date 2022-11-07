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
.is_default{
	width:20px;
}
#Y{
	margin-right:50px;
}

.address-title {
	text-align: center;
    font-size : 25px;
    margin: 30px;
    font-weight:bold;
    margin-bottom: 50px;
}

.address-contents{
    vertical-content:center;
	display:flex;
	justify-content:center;
	height: 360px;
}

/* 사이드바 */
#left-sidebar{
	position: absolute;
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

/* 폼 영역 */
#address-num {
	width:100px;
}

#address-info, #address-detail{
	width: 300px;
}
#register-btn{
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
    margin-left: 100px;
}

#cancel-btn{
	width:80px;
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
		<li>1:1문의</li>
	</ul>  		
</div>
    <h1 class="address-title">배송지 등록</h1>
       <div class="address-contents">

        <form id="address-form" class="form-horizontal">
            <div class="form-inline form-group">
                <label for="name">배송지명</label>
                <input type="text" id="name" name="name" class="form-control">
            </div>
            
            <div class="form-inline form-group">
                <label for="address-num">배송지 주소</label>
                <input type="text" id="address-num" name="address-num" class="form-control">
                <button id="findAddress" type="button" class="btn btn-secondary">우편번호</button>
            </div>
            
            <div class="form-inline form-group">
                <label for="address-info"></label>
                <input type="text" id="address-info" name="address-info" class="form-control">
            </div>
            
            <div class="form-inline form-group">
                <label for="address-detail"></label>
                <input type="text" id="address-detail" name="address-detail" class="form-control" placeholder="상세 주소를 입력하세요.">
            </div>
            
                                                
            <div class="form-inline form-group">
                <label for="tel">휴대폰번호</label>
                <input id="tel" type="text" name="tel" class="form-control" placeholder="-빼고 입력">
            </div>
            <div class="form-inline form-group">
                <label for="recipient">수령인</label>
                <input id="recipient" type="text" class="form-control" name="recipient">
            </div>
            <div class="form-inline form-group">
            	<label>기본배송지</label>
            	<label for="Y" class="is_default">Y</label>
            	<input id="Y" type="radio"  name="is_default" value="1" checked>
            	<label for="N" class="is_default">N</label>
            	<input id="N" type="radio"  name="is_default" value="0">
            </div>            
            <div class="form-group form-inline">
                <button id="register-btn" type="button">등록</button>
            	<button id="cancel-btn" class="btn btn-secondary" type="button">취소</button>
            </div>

        </form>
    </div>

</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

$(document).ready(function(){
	//우편번호 조회
	$('#findAddress').on('click', function(e){
		e.preventDefault();
	    new daum.Postcode({
	        oncomplete: function(data) {

	            $('#address-num').val(data.zonecode).attr('readonly',true);
	            $('#address-info').val(data.address).attr('readonly',true);
	        }
	    }).open();
	})	
	
	$('#register-btn').on('click', function(e){
		
		
		console.log($('input[name="is_default"]:checked').val());
		
		var address = {
				name : $('#name').val(),
				address : "[" + $('#address-num').val() +"]" + $('#address-info').val() + "/" + $('#address-detail').val(),
				tel : $('#tel').val().substr(0,3) + "-" + $('#tel').val().substr(3,4) + "-" + $('#tel').val().substr(7),
				recipient : $('#recipient').val(),
				is_default: $('input[name="is_default"]:checked').val()==1?true:false
		}
		
		$.ajax({
			url:"/members/address/register",
			type:'post',
			data: JSON.stringify(address),
			contentType: 'application/json; charset=UTF-8',
			success: function(result){
				alert('배송지 등록이 완료되었습니다.')
				self.location="/members/address"
			}
		})
	})
	
	$('#cancel-btn').on('click', function(e){
		e.preventDefault();
		self.location="/members/address"
	})
})


</script>
</body>
</html>
