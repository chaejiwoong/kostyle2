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
#update-btn{
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

#cancel-btn{
	width:80px;
}

 #remove-btn{
	width:80px;
	margin-left:30px;
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
		<li onclick="location.replace('/members')" class="selected">회원정보수정</li>
		<li onclick="location.replace('/members/address')">배송지관리</li>
		<li onclick="location.replace('/reviews/unwritten')">리뷰관리</li>
		<li onclick="loaction.replace('/shop/cartList')">장바구니</li>
		<li>위시리스트/코디</li>
		<li onclick="location.replace('/members/bidHistory')">내경매조회</li>
		<li>1:1문의</li>
	</ul>  		
</div>
    <h1 class="update-title">회원정보 수정</h1>
    <div class="update-contents">

        <form id="update-form" class="form-horizontal">
            <div class="form-inline form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" class="form-control"><br>
            </div>
            <div class="form-inline form-group">
                <label for="password">수정 비밀번호</label>
                <input id="password" type="password" name="password" class="form-control"><br>
            </div>
            <div class="form-inline form-group">
                <label for="chkPassword">비밀번호 확인</label>
                <input id="chkPassword" type="password" class="form-control" name="chkPassword"><br>
            </div>
            <div class="form-group form-inline">
                <button id="update-btn" type="button">수정</button>
            	<button id="cancel-btn" class="btn btn-secondary" type="button">취소</button>
            	<button id="remove-btn" class="btn btn-danger" type="button">탈퇴</button>
            </div>

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
