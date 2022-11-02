<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        background-color: #ebebeb;;
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
        border-radius: 10px;
        border: 1px solid black;
        width: 250px;
        height: 150px;
        padding: 50px;
        text-align: center;
        margin: 10px;
        cursor: pointer;
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
            <span>Point : <b>${member.point}</b> 포인트</span>
        </div>
    </div>
    <div id="mypage">
        <ul id="mypage-btn">
            <li>주문 배송 조회</li>
            <li onclick="location.replace('/members')">회원정보 수정</li>
            <li>배송지 관리</li>
            <li>리뷰 관리</li>
            <li>장바구니</li>
            <li>위시리스트 / 코디</li>
            <li onclick="location.replace('/members/bidHistory')">내 경매 조회</li>
            <li>1:1 문의</li>

        </ul>

    </div>

</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>