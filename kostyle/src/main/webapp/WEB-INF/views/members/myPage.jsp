<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>Title</title>
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
    <script type="text/javascript" src="/resources/js/header.js"></script>
    <link href="/resources/css/header.css" rel="stylesheet"/>
    <link href="/resources/css/footer.css" rel="stylesheet"/>
    
    <style>

    #info{
        margin-top: 25px;
        padding: 25px;
        text-align: center;
        font-size: 16px;
        border: 1px solid #ebebeb;
        border-radius: 10px;
    }
    
    #order-info{
        margin-top: 25px;
        padding: 25px;
        font-size: 20px;
        text-align: center;
        border: 1px solid #ebebeb;
        border-radius: 10px;
        background-color: #fff7f9;;
    
    }

    .info-name{
        position: relative;
        float: left;
        margin-left: 30px;
    }
    .info-img{
        position: relative;
        float: left;
        margin-left: 70px;

    }
    
    #user-img{
    	border-radius: 50%;
    }

    #mypage{
        padding-top: 50px;
        margin-bottom: 50px;
    }
    
    #mypage-btn{
    	margin-left: 25px;
    }

    #mypage-btn li{
    	font-size:18px;
        border-radius: 10px;
        border: 1px solid #ebebeb;
        color: #f891aa;
        width: 250px;
        height: 150px;
        padding-top:25px;
        padding-right: 25px;
        padding-left: 25px;
        text-align: center;
        margin: 10px;
        cursor: pointer;
        
    }
    
    #mypage-btn li:hover{
    background-color: #fff7f9
    }
    
    #mypage-btn li div{
        padding-top:25px;
    	font-size:11px;
    	color:#818181;
        
    }    
    
    
</style>
</head>

<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div class="container">

    <div id="info" class="row">
        <div class="info-img">
            <img id="user-img" src="/resources/img/user.jpg" width="50px" height="50px">
        </div>

        <div class="info-name">
            <span><b>${member.name}</b> 회원님 반가워요 !</span>
        </div>
        <div class="info-point">
        <fmt:formatNumber var="point" value="${member.point }" type="number"/>
            <span>Point : <b>${point}</b> 포인트</span>
        </div>
    </div>
    
    
     <div id="order-info" class="row">
     
		<div class="row">
			<span class="col-md-2" style="padding-top: 20px;"><b>주문현황</b></span>
			<span class="col-md-2"><b>상품준비중</b></span>
			<span class="col-md-2" style="padding-top: 20px;">&gt</span>
			<span class="col-md-2"><b>배송중</b></span>
			<span class="col-md-2" style="padding-top: 20px;">&gt</span>			
			<span class="col-md-2"><b>배송완료</b></span>						
		</div>
		
		<div class="row">
			<span class="col-md-2"></span>
			<span class="col-md-2">${member.ready }</span>
			<span class="col-md-2" ></span>			
			<span class="col-md-2">${member.delivery }</span>
			<span class="col-md-2"></span>			
			<span class="col-md-2">${member.done }</span>						
		</div>
    </div>
    
    <div id="mypage">
        <ul id="mypage-btn">
            <li onclick="location.replace('/orders')"><strong>주문 배송 조회</strong><div>고객님께서 주문하신 상품의 주문내역과 배송현황을 확인하실 수 있어요.</div></li>
            <li onclick="location.replace('/members')"><strong>회원정보 수정</strong><div>고객님의 개인정보 및 비밀번호를 변경할 수 있어요.</div></li>
            <li onclick="location.replace('/members/address')"><strong>배송지 관리</strong><div>주문한 상품이 배송되는 배송지를 변경/삭제할 수 있어요.</div></li>
            <li onclick="location.replace('/reviews/unwritten')"><strong>리뷰 관리</strong><div>고객님께서 구매하신 상품의 리뷰를 작성할 수 있어요.</div></li>
            <li onclick="loaction.replace('/shop/cartList')"><strong>장바구니</strong><div>고객님이 장바구니에 담아둔 상품 목록을 확인하실 수 있어요.</div></li>
            <li ><strong>위시리스트 / 코디</strong><div>코디를 자랑하거나 위시리스트를 관리할 수 있어요.</div></li>
            <li onclick="location.replace('/members/bidHistory')"><strong>내 경매 조회</strong><div>고객님의 경매 입찰 내역을 확인하실 수 있어요.</div></li>
            <li><strong>1:1 문의</strong><div>궁금하신 문의사항은 1:1로 문의해보세요.</div></li>

        </ul>

    </div>

</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>