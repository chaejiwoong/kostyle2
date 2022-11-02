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
        
        <style>
    #left-sidebar{
        position: relative;
        float: left;
        margin-left: 30px;
        margin-right: 30px;
        font-size: 17px;
        border: solid 1px #ebebeb;
        vertical-align: center;
        border-radius: 10px;
        padding-top: 20px;
        margin-top: 20px;
    }

    #left-sidebar h1{
        border-bottom: 1px solid black;
        text-align: center;
        height: 50px;
        font-size: 20px;
        font-weight: bold;
    }

    #menu li{
        display: block;
        list-style: circle;
        width: 200px;
        height: 50px;
        padding-left: 10px;
        padding-top: 10px;
    }
    
	.selected-li{
    	background-color: black;
    	color: white;
    }
    
    #menu li:hover{
        background-color: black;
    	color: white;
    }

    .update-contents{
        display: flex;
        justify-content: center;
    }
    #update-title{
        margin-top: 25px;
        margin-bottom: 25px;
        font-size: 30px;
        font-weight: bold;
        text-align: center;
    }

    #update-form{
        margin-top: 50px;
    }

    label{
        width: 100px;
        font-size: 15px;
    }

    .form-div{
        margin-top: 30px;
    }

    button{
        margin: 15px;
    }
    

</style>
    </head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div id="left-sidebar">
    <h1>MyPage</h1>
    <ul id="menu">
        <li><a href=""></a>주문목록/배송조회</li>
        <li>리뷰관리</li>
        <li class="selected-li">회원정보수정/탈퇴</li>
        <li>배송지관리</li>
        <li>장바구니</li>
        <li>코디/위시리스트</li>
        <li>내 경매 조회</li>
    </ul>
</div>
<div class="container">
    <h1 id="update-title">회원정보 수정</h1>
    <div class="update-contents">

        <form id="update-form" class="form-horizontal">
            <div class="form-inline form-group form-div">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" class="form-control"><br>
            </div>
            <div class="form-inline form-group form-div">
                <label for="password">비밀번호</label>
                <input id="password" type="password" name="password" class="form-control"><br>
            </div>
            <div class="form-inline form-group form-div">
                <label for="chkPassword">비밀번호 확인</label>
                <input id="chkPassword" type="password" class="form-control" name="chkPassword"><br>
            </div>
            <div class="form-div form-group form-inline"></div>
            <button id="update-btn" class="btn btn-primary" type="button">수정</button>
            <button id="cancel-btn" class="btn btn-secondary" type="button">취소</button>
            <button id="remove-btn" class="btn btn-danger" type="button">탈퇴</button>
        </form>
    </div>

</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script>
    var memberService = (function(){
        function updateInfo(member, callback, error) {
            $.ajax({
                type: 'put',
                url: "/members",
                data: JSON.stringify(member),
                contentType : "application/json; charset=UTF-8",
                success: function (result, status, xhr) {
                    if (callback) {
                        callback(result);
                    }
                },
                error: function (xhr, status, er) {
                    if (error) {
                        error(xhr);
                    }
                }
            })
        }

        function deleteMember(callback, error) {
            $.ajax({
                type: 'delete',
                url: "/members",
                contentType : "application/json; charset=UTF-8",
                success: function (result, status, xhr) {
                    if (callback) {
                        callback(result);
                    }
                },
                error: function (xhr, status, er) {
                    if (error) {
                        error(xhr);
                    }
                }
            })
        }

        return {updateInfo:updateInfo, deleteMember:deleteMember}
    })();// 즉시 실행함수

    $(document).ready(function () {

        var updateForm = $('#update-form')

        // 쿠키 설정
        function setCookie(name, value, exp) {
            var date = new Date();
            date.setTime(date.getTime() + exp);
            document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
        }

        // 취소 버튼을 눌렀을 때 마이페이지 이동
        $('#cancel-btn').on('click', function () {
            self.location = "/members/myPage";
        });

        $('#update-btn').on('click', function () {
            if (updateForm.find("input[name='password']").val() != updateForm.find("input[name='chkPassword']").val()) {
                alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요.')
            } else {
                var member = {
                    "name": updateForm.find("input[name='name']").val(),
                    "password": updateForm.find("input[name='password']").val()
                }


                memberService.updateInfo(member, function (result) {
                    alert("회원정보 변경이 완료되었습니다.")
                    self.location = "/members/myPage";
                }, function (xhr) {
                    if (xhr.responseJSON.password && xhr.responseJSON.name) {
                        alert(xhr.responseJSON.name +"\n" + xhr.responseJSON.password)
                    }else if (xhr.responseJSON.name) {
                        alert(xhr.responseJSON.name);
                    } else {
                        alert(xhr.responseJSON.password);
                    }
                });
            }
        });

        $('#remove-btn').on('click', function () {
            memberService.deleteMember(function () {
                setCookie("Authorization", "", -1);
                alert("회원탈퇴가 완료되었습니다.");
                self.location = "auth/login";
            });
        });
    });
</script>
</body>
</html>
