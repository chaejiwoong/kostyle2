<%--
  Created by IntelliJ IDEA.
  User: dhwls
  Date: 2022-10-25
  Time: 오후 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
    <script type="text/javascript" src="/resources/js/header.js"></script>
    <script type="text/javascript" src="/resources/js/customerCenter.js"></script>
    <link href="/resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/css/header.css" rel="stylesheet"/>
    <link href="/resources/css/footer.css" rel="stylesheet"/>
    <link href="/resources/css/nav.css" rel="stylesheet"/>
    <link href="/resources/css/register.css" rel="stylesheet"/>
</head>
<body>
    <%@ include file="/views/include/header.jsp"%>
    <%@ include file="/views/customerCenter/include/nav.jsp"%>
        <div class="chat-box">
            <form method="">
                <span class="inquiry-content">문의 내용</span>
                <input class="inquiry-input" type="text" name="chat-title"/>
                <button class="inquiry-btn" type="submit"><span>서비스 신청</span></button>
                <div class="text-box"><span class="clean-text">상담원도 누군가의 소중한 가족입니다. 욕설/폭언/장난 등은 삼가 부탁드립니다.</span></div>
            </form>
        </div>
        <div class="waiting-box">
            <span class="waiting-people">현재 대기중인 고객: 0명</span>
        </div>

        <div class="inquiry-box">
            <div class="inquiry-box-bottom">
<%--                <span class="">문의</span>--%>
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">No.</th>
                        <th scope="col">이름</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성날짜</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td scope="row">1</td>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <td scope="row">2</td>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                    </tr>
                    </tbody>
                </table>
                <button class="create-btn" type="submit">문의 작성하기</button>
            </div>
        </div>
    <%@ include file="/views/include/footer.jsp"%>
</body>
</html>
