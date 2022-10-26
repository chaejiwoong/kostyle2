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
        h1{
            margin-top: 25px;
            margin-bottom: 25px;
            font-size: 30px;
            font-weight: bold;
            text-align: center;
        }
        #mail-check-btn{
            margin-left: 10px;
        }

        .last{
            margin-bottom: 30px;
        }

        .error{
            color: red;
        }

        .ok{
            color: green;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<div class="container">
    <div class="row">
        <h1>회원가입</h1>
    </div>
    <form class="form-horizontal" id="insertForm" action="/auth/register">

        <div class="form-inline form-group">
            <span class="col-md-3"></span>
            <label for="name" class="col-md-2">이름</label>
            <input class="form-control col-md-3" id="name" type="text" name="name" placeholder="특문제외 2~10자리">
        </div>

        <div class="form-inline form-group">
            <span class="col-md-5"></span>
            <span id="nameError" class="col-md-7" hidden></span>
        </div>


        <div class="form-inline form-group">
            <span class="col-md-3"></span>
            <label for="email" class="col-md-2">이메일</label>
            <input class="form-control col-md-3" type="text" name="email" id="email"><button type="button" class="btn-secondary btn" id="mail-check-btn">본인인증</button><br>
        </div>

        <div id="chkEmailDiv" class="form-inline form-group" hidden>
            <span class="col-md-3"></span>
            <label for="chkEmail" class="col-md-2">인증번호</label>
            <input type="text" name="chkEmail" class="form-control col-md-3" id="chkEmail" maxlength="6">
        </div>

        <div class="form-inline form-group">
            <span class="col-md-5"></span>
            <span id="emailError" class="col-md-7" hidden></span>
        </div>


        <div class="form-inline form-group">
            <span class="col-md-3"></span>
            <label for="password" class="col-md-2">비밀번호</label>
            <input id="password" type="password" class="form-control col-md-3" name="password" placeholder="영문,숫자,특수문자 포함 8~20자리">
        </div>
        <div class="form-inline form-group">
            <span class="col-md-5"></span>
            <span id="passwordError" class="col-md-7" hidden></span>
        </div>

        <div class="form-inline form-group">
            <span class="col-md-3"></span>
            <label for="chkPassword" class="col-md-2">비밀번호 확인</label>
            <input id="chkPassword" type="password" class="form-control col-md-3" name="chkPassword" placeholder="영문,숫자,특수문자 포함한 8~20자리">
        </div>
        <div class="form-inline form-group">
            <span class="col-md-5"></span>
            <span id="check" class="col-md-7" hidden></span>
        </div>

        <div class="form-inline form-group">
            <span class="col-md-3"></span>
            <label for="birth" class="col-md-2">생년월일</label>
            <input id="birth" type="text" name="birth" class="form-control col-md-3" placeholder="6자리의 생년월일">
        </div>
        <div class="form-inline form-group">
            <span class="col-md-5"></span>
            <span id="birthError" class="col-md-7" hidden></span>
        </div>

        <div class="form-inline form-group">
            <span class="col-md-3"></span>
            <label class="col-md-2">성별</label>
            <label for="male">남</label>
            <input id="male" type="radio" class="radio-inline" name="gender" value="M">
            <label for="female">여</label>
            <input id="female" type="radio" class="radio-inline" name="gender" value="M">
        </div>
    </form>

    <div class="row last">
        <span class="col-md-4"></span>

        <a id="register" class="btn btn-primary col-md-1" href="/auth/register">가입</a>
        <span class="col-md-1"></span>
        <a href="/auth/login" class="btn btn-default col-md-1">취소</a>
    </div>


</div>
<script src="/resources/js/authService.js"></script>
<script>
    $(document).ready(function () {
        // 로그인 폼
        var form = $("#insertForm")

        var isChecked = false;

        // 비밀번호 확인 검증
        $('#chkPassword').change(function () {
            console.log("change....")
            console.log($('#password').val())
            console.log($(this).val())
            if ($('#password').val() != $(this).val()) {
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
