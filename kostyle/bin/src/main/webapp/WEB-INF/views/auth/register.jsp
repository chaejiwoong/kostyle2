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
    </head>
<style>

#mail-check-btn{
	margin-left: 10px;
}

.signin-section{
	display:flex;
	justify-content:center;
}
	
label{
    width:100px;
}    
    	
.signin-title{
    text-align: center;
    font-size : 25px;
    margin: 30px;
    font-weight:bold;
}    

.button a{
	width:130px;
}

#register{
	margin-right:20px;
    background-color:#f891aa;
    border:1px solid #ebebeb;	
}
#prev{
	margin-left:20px;
}

#male{
	margin-right:50px;
}

.gender{
	width:20px;
}

.ok{
	color:green;
}

.error{
	color:red;
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<div class="container">
<h1 class="signin-title">회원가입</h1>
<div class="signin-section">

    <form id="insertForm" class="form-horizonal" action="/auth/register">

        <div class="row form-inline form-group">
            <label for="name">이름</label>
            <input class="form-control" id="name" type="text" name="name" placeholder="특문제외 2~10자리">
        </div>

        <div class="row form-inline form-group">
        	<label></label>
            <span id="nameError" hidden="hidden"></span>
        </div>


        <div class="row form-inline form-group">
            <label for="email" >이메일</label>
            <input class="form-control" type="text" name="email" id="email"><button type="button" class="btn-secondary btn" id="mail-check-btn">본인인증</button><br>
        </div>

        <div id="chkEmailDiv" class="row form-inline form-group" hidden="hidden">
            <label for="chkEmail">인증번호</label>
            <input type="text" name="chkEmail" class="form-control" id="chkEmail" maxlength="6">
        </div>

        <div class="row form-inline form-group">
            <label></label>
            <span id="emailError" hidden="hidden"></span>
        </div>


        <div class="row form-inline form-group">
            <label for="password">비밀번호</label>
            <input id="password" type="password" class="form-control" name="password" placeholder="영문,숫자,특수문자 포함 8~20자리">
        </div>
        
        <div class="row form-inline form-group">
        	<label></label>        
            <span id="passwordError" hidden="hidden"></span>
        </div>

        <div class="row form-inline form-group">
            <label for="chkPassword">비밀번호 확인</label>
            <input id="chkPassword" type="password" class="form-control" name="chkPassword" placeholder="영문,숫자,특수문자 포함한 8~20자리">
        </div>
        
        
        <div class="row form-inline form-group">
        	<label></label>        
            <span id="check" hidden="hidden"></span>
        </div>

        <div class="row form-inline form-group">
            <label for="birth">생년월일</label>
            <input id="birth" type="text" name="birth" class="form-control" placeholder="6자리의 생년월일">
        </div>
        
        <div class="row form-inline form-group">
        	<label></label>        
            <span id="birthError" hidden="hidden"></span>
        </div>

        <div class="row form-inline form-group">
            <label>성별</label>
            <label for="male" class="gender">남</label>
            <input id="male" type="radio"  name="gender" value="M" checked>
            <label for="female" class="gender">여</label>
            <input id="female" type="radio"  name="gender" value="F">
        </div>
        
    <div class="row last button">
        <a id="register" class="btn btn-primary" href="/auth/register">가입</a>
        <a id="prev" href="/auth/login" class="btn btn-default">취소</a>
    </div>
    </form>



</div>



</div>
<script src="/resources/js/authService.js"></script>
<script>
    $(document).ready(function () {
        // 로그인 폼
        var form = $("#insertForm")

        var isChecked = false;

        // 비밀번호 확인 검증
        $('#chkPassword, #password').change(function () {
            console.log("change....")
            console.log($('#password').val())
            console.log($('#chkPassword').val())
            if ($('#password').val() != $("#chkPassword").val()) {
                isChecked = false;
                $('#check').show();
                $('#check').text('비밀번호가 일치하지 않습니다.').addClass('error').removeClass('ok');
            } else {
                isChecked = true;
                $('#check').show();
                $('#check').text('비밀번호가 일치합니다.').addClass('ok').removeClass('error');
            }
        });

        var code;
        var emailAuth = false;

        // 메일인증
        $('#mail-check-btn').on("click", function () {
            var email = form.find("input[name='email']").val(); // email 추출
            var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
            if(!exptext.test(email)){
            	alert("올바른 이메일 형식을 입력해주세요 !")
            	return false;
            }
            
            console.log("인증번호를 받을 이메일 : " + email);
            var checkInput = $('#chkEmailDiv');             // 인증번호 input

            $.ajax({
                type: 'get',
                url: '/auth/emailAuth?email=' + email,
                success(result) {
                    if (result == "duplicate") {
                        alert("이미 가입되어 있는 이메일입니다 !");
                    } else {
                        checkInput.show();
                        console.log("chkEmail result : " + result);
                        code = result;  // 인증번호 저장
                        $('#email').attr('readonly', true)
                        alert("인증번호가 전송되었습니다.");
                    }
                }
            })  // End Ajax
        }); // End Send email

        $("#chkEmail").change(function () {
            $("#emailError").show();
            if (code != form.find("input[name='chkEmail']").val()) {
                emailAuth = false;
                $("#emailError").text("인증번호가 일치하지 않습니다.").addClass('error').removeClass('ok')
            } else {
                $("#emailError").text("인증번호가 일치합니다.").addClass('ok').removeClass('error');
                emailAuth = true;
            }
        });

        // 가입버튼 클릭
        $("#register").on("click", function (e) {

            e.preventDefault();

            if (!isChecked) {
                alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요.')
            } else if (!emailAuth) {
                alert("본인인증을 완료해주세요. !!")
            } else {
                var member = {
                    "email": form.find("input[name='email']").val(),
                    "name": form.find("input[name='name']").val(),
                    "password": form.find("input[name='password']").val(),
                    "chkPassword": form.find("input[name='chkPassword']").val(),
                    "birth": form.find("input[name='birth']").val(),
                    "gender": form.find('input[name=gender]:checked').val(),
                };


                // 회원가입 요청
                authService.insert(member, function (result) {
                    alert("회원가입이 완료되었습니다.");
                    self.location = "/auth/login";
                }, function (xhr) {
                	
                	var xmlDoc = xhr.responseXML;
                	var name = $(xmlDoc.getElementsByTagName("name")[0]).text()
                	console.log(xmlDoc.getElementsByTagName("name")[0] + "zz");
                	console.log(name);
                	
                    alert("다시 입력해주세요.");
                    form.find('span').text("");
                    if (xmlDoc.getElementsByTagName("name") != null) {
                        $('#nameError').show().text($(xmlDoc.getElementsByTagName("name")[0]).text()).addClass('error')
                    }
                    if (xmlDoc.getElementsByTagName("birth") != null) {
                        $('#birthError').show().text($(xmlDoc.getElementsByTagName("birth")[0]).text()).addClass('error')
                    }
                    if (xmlDoc.getElementsByTagName("password") != null) {
                        $('#passwordError').show().text($(xmlDoc.getElementsByTagName("password")[0]).text()).addClass('error')
                    }

                });
            }
        });
    });
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
