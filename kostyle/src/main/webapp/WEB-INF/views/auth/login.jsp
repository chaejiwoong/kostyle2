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
    	label{
    		width:100px;
    	}    
    	
    	
    
    	#login{
    		color:white;
    		display: inline-block;
    		padding: 6px 12px;
			line-height: 1.42857143;    	
			border-radius: 4px;        	
    	    width:300px;
    		margin-bottom:10px;
    		font-size:15px;
    		font-weight:bold;
    		background-color:#f891aa;
    		border:1px solid #ebebeb;
    	}
    	
    	#login:click{  	
    	    width:300px;
    		margin-bottom:10px;
    		font-size:15px;
    		font-weight:bold;
    		background-color:#f891aa;
    		border:1px solid #ebebeb;    	
    	}
    	
    	.button a{
    		display: inline-block;
    		padding: 6px 12px;
			line-height: 1.42857143;    	
			border-radius: 4px;    	
    		width:300px;
    		margin-bottom:10px;
    		font-size:15px;
    		font-weight:bold;
    	}
    	
    	#signin{
    		background-color:#ffc8c8;
    		border:1px solid #ebebeb;
    	}
    	
    	#find{
    		background-color: #fda9a9;
   	 		border: 1px solid #ebebeb;
    		color: white;	

    	}    	
    	

    	
    	.hello{
    		display:flex;
    		justify-content:center;
    	}
    	
    	.login-title{
    		text-align: center;
    		font-size : 25px;
    		margin: 30px;
    		font-weight:bold;
    	}
    	

    	
    	
    </style>
    
    
</head>

<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<div class="container">
<h1 class="login-title">로그인</h1>
<div class="hello">
    <form id="loginForm" class="form-horizonal" action="/auth/login">
			<div class="row form-group form-inline">
			    <label for="email">email</label>
            	<input class="form-control" type="text" name="email" id="email">
			</div>


			<div class="row form-group form-inline">
            	<label for="password">password</label>
            	<input id="password" type="password" class="form-control" name="password">
			</div>
        	<div class="row button form-group form-inline form-check">
                <label for="remember-id" class="form-check-label">아이디 기억</label>
                <input id="remember-id" type="checkbox" class="form-check-input" value="remember-id">

            </div>


            <div class="row last button">
                <button type="submit" id="login" >로그인</button>
            </div>
            <div class="row button">
                <a id="signin" class="register btn btn-primary" href="/auth/register">회원가입</a>	
            </div>
            <div class="row button">
                <a id="find" href="/auth/find" class="btn btn-default">id/pw찾기</a>
            </div>
    </form>
</div>



</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script src="/resources/js/authService.js"></script>
<script>
    $(document).ready(function () {
        var form = $("#loginForm")
    	
    	var email = localStorage.getItem('remember-id');
    	if(email != undefined){
    		form.find("input[name='email']").val(email);
    		$('#remember-id').prop('checked', true) 
    	}

    	

	
	    
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

            function login(member, callback, error){
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
            login(member, function (result) {
                if (result.length >= 100) {
                    alert("해당하는 회원정보가 없습니다.");
                } else {
                	if($('#remember-id').is(':checked')){
                		localStorage.setItem("remember-id", result)
                	}
                    alert( "회원님 반갑습니다." + result);
                    self.location = "/members/myPage";
                }
                
            });
        });

    });
</script>
</body>
</html>
