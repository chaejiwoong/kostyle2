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
    #wrap {
    min-height: 100%;
    position: relative;
    padding-bottom: 100px;
}
        h1{
            margin-top: 25px;
            margin-bottom: 25px;
            font-size: 30px;
            font-weight: bold;
            text-align: center;
        }

        .last {
            margin-bottom: 30px;
            margin-top: 10px;

        }

        #loginForm{
            margin-left: 50px;
        }

        .button{
            margin-left: 20px;
        }
        
        .register{
        	margin-left: 60px;
        }
    </style>
</head>

<body>
<div id="wrap">
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<h1>로그인</h1>
	<div class="container">
	    <form id="loginForm" class="form-horizontal" action="/auth/login">
	        <div class="form-inline form-group">
	            <span class="col-md-4"></span>
	            <label for="email" class="col-md-1">email</label>
	            <input class="form-control" type="text" name="email" id="email">
	        </div>
	        <div class="form-inline form-group">
	            <span class="col-md-4"></span>
	            <label for="password" class="col-md-1">password</label>
	            <input id="password" type="password" class="form-control" name="password">
	        </div>
	        <div class="button">
	            <div class="row">
	                <span class="col-md-4"></span>
	                <label for="remember-id">아이디 기억</label>
	                <input id="remember-id" type="radio" class="radio-inline" value="remember-id">
	                <a href="/auth/register">회원가입</a>
	                <a href="/auth/find">id/pw찾기</a>
	            </div>
	
	
	            <div class="row last">
	                <span class="col-md-4"></span>
	                <a id="login" class="btn btn-primary col-md-3" href="/auth/login">로그인</a>
	            </div>
	        </div>
	    </form>
	</div>

</div>
<script src="/resources/js/authService.js"></script>
<script>
    $(document).ready(function () {
        var form = $("#loginForm")

        // jwt 쿠키 설정
        function setCookie(name, value, exp) {
            var date = new Date();
            date.setTime(date.getTime() + exp);
            document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
        }


        // 로그인 요청
        $("#login").on("click", function (e) {

            e.preventDefault();

            // 회원 정보 객체 생성
            var member = {
                "email" : form.find("input[name='email']").val(),
                "password" : form.find("input[name='password']").val()
            };

            function add(member, callback, error){
                $.ajax({
                    type : "post",
                    url : "/auth/login",
                    data : JSON.stringify(member),
                    contentType : "application/json; charset=UTF-8",
                    success: function (result, status, xhr) {
                        if (callback) {
                            callback(result);
                        }
                    },
                    error: function (xhr, status, er) {
                        console.log(xhr.responseText)
                        if (error) {
                            error(er);
                        }
                    }
                });
            }

            // 로그인 처리
            add(member, function (result) {
                if (result.length >= 100) {
                    alert("해당하는 회원정보가 없습니다.");
                } else {
                    alert( "회원님 반갑습니다." + result);
                    self.location = "/kostyle4u";


                }
            });
        });

    });
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
