<%--
  Created by IntelliJ IDEA.
  User: cowld
  Date: 2022-10-22
  Time: 오전 3:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Title</title>
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<link href="/resources/css/header.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet" />
<style>
h1 {
	margin-top: 25px;
	margin-bottom: 25px;
	font-size: 30px;
	font-weight: bold;
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<h1>ID/PW 찾기</h1>
	<div class="container">
		<div class="row">
			<a href="#" class="btn btn-primary">아이디 찾기</a> <a href="#"
				class="btn btn-primary">비밀번호 찾기</a>
		</div>
		<div class="center-block">
			<div>
				<form id="findIdForm" action="/auth/findId">
					이름<input type="text" name="name"><br> 생년월일<input
						type="text" name="birth"><br>
					<button type="button" id="findId">아이디 찾기</button>
				</form>
			</div>

			<div>
				<div>

					<form id="findPwForm" action="/auth/findPw">
						이름<input type="text" name="name"><br> 이메일<input
							type="text" name="email">
						<button type="button" id="mail-check-btn">본인인증</button>
						<br>
						<div id="chkEmailDiv" hidden>
							인증번호<input type="text" name="chkEmail" id="chkEmail"
								maxlength="6"><br>
						</div>
						<button type="button" id="findPw">완료</button>
					</form>

				</div>

				<div>
					<form id="changePwForm" action="/auth/changePw" hidden>
						비밀번호<input id="password" type="password" name="password"
							placeholder="영문 대소문자, 숫자,특수문자 포함한 8~20자리"><br> 비밀번호
						확인<input id="chkPassword" type="password" name="chkPassword"><br>
						<button type="button" id="changePw">비밀번호 변경</button>
					</form>
				</div>

			</div>
		</div>
	</div>

	<script src="/resources/js/authService.js"></script>
	<script>
    $(document).ready(function () {
        var idForm = $('#findIdForm');
        var pwForm = $('#findPwForm');
        var changePwForm = $('#changePwForm');

        // 아이디 찾기
        $('#findId').on("click", function () {
            var member = {
                "name": idForm.find("input[name='name']").val(),
                "birth": idForm.find("input[name='birth']").val()
            }

            authService.findId(member, function (result) {
                if (!result) {
                    alert("해당하는 회원이 존재하지 않습니다.");
                } else {
                    alert("회원님의 이메일은 " + result + "입니다.");
                    idForm.find("input[name='name']").val("")
                    idForm.find("input[name='birth']").val("")
                }
            });
        });

        var code;

        // 메일인증
        $('#mail-check-btn').on("click", function () {
            var email = pwForm.find("input[name='email']").val(); // email 추출
            var name = pwForm.find("input[name='name']").val(); // name 추출
            console.log("인증번호를 받을 이메일 : " + email);
            var checkInput = $('#chkEmailDiv');             // 인증번호 input

            $.ajax({
                type: 'get',
                url: '/auth/findEmailAuth?email=' + email + "&name=" + name,
                success(result) {
                    if (result == 'no') {
                        alert("회원정보가 일치하지 않습니다.");
                    } else {
                        checkInput.show();
                        code = result;  // 인증번호 저장
                        alert("인증번호가 전송되었습니다.");
                    }
                }
            })  // End Ajax
        }); // End Send email

        // 비밀번호 수정
        $('#findPw').on("click", function () {
            if(!code){
                alert("본인인증을 완료해주세요.")
            }
            else if (code != pwForm.find("input[name='chkEmail']").val()) {
                alert("인증번호가 일치하지 않습니다!!");
            } else {
                alert("본인 확인이 완료되었습니다.");
                pwForm.hide();
                changePwForm.show();
            }
        });

        $('#changePw').on("click", function () {
            if (changePwForm.find("input[name='password']").val() != changePwForm.find("input[name='chkPassword']").val()) {
                alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요.')
            } else {
                var member = {
                    "email": pwForm.find("input[name='email']").val(),
                    "password": changePwForm.find("input[name='password']").val()
                }

                authService.changePw(member, function (result) {
                    alert("비밀번호 수정이 완료되었습니다.")
                    self.location = "/auth/login";
                }, function (xhr) {
                    alert(xhr.responseJSON.password);
                });
            }
        });
    });
</script>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
