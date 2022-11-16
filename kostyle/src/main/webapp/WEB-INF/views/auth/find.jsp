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
.find-title h1 {
	margin-top: 25px;
	margin-bottom: 25px;
	font-size: 30px;
	font-weight: bold;
	text-align: center;
}

.find-title p {
	font-size: 12px;
	color: gray;
	text-align: center;
}

.center-block {
	display: flex;
	justify-content: center;
	margin-top: 50px;
}

.find-tab {
	text-align: center;
}

.find-tab li {
	width: 296px;
	height: 50px;
	line-height: 50px;
	border: solid 1px #ebebeb;
	cursor: pointer;
	margin: 0;
	padding: 0;
}

.selected{
	background-color: #f891aa;
	color: white;
}


.find-section {
	border: solid 1px #ebebeb;
	width: 600px;
	margin: 20px auto;
	padding-bottom: 30px;
}

.button button{
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

.button button{
	background-color: #f891aa;
	border: solid 1px #ebebeb;
    font-size:15px;
    font-weight:bold;	
}


#mail-check-btn {
	margin-left: 20px;
}

label {
	width: 100px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="find-title">
		<h1>ID / PW 찾기</h1>
		<p>해당하는 정보를 입력하여 아이디 / 비밀번호를 찾을 수 있습니다.</p>
	</div>


	<div class="container">
		<div class="find-section">

			<ul class="find-tab">
				<li id="idsc" class="selected">아이디 찾기</li>
				<li id="pwsc">비밀번호 찾기</li>
			</ul>


			<div class="center-block">

				<div class="find-id">
					<form id="findIdForm" class="form-horizontal" action="/auth/findId">
						<div class="form-inline form-group">
							<label for="name">이름</label> <input type="text" id="name"
								name="name" class="form-control"><br>
						</div>
						<div class="form-inline form-group">
							<label for="birth">생년월일</label> <input type="text" id="birth"
								name="birth" class="form-control"><br>
						</div>
						<div class="row button">
							<button type="button" id="findId"
								class="col-md-12">아이디 찾기</button>
						</div>
					</form>
				</div>

				<div class="find-password" hidden>
					<div>

						<form id="findPwForm" class="form-horizontal"
							action="/auth/findPw">
							<div class="form-inline form-group">
								<label for="name2">이름</label> <input type="text" id="name2"
									name="name" class="form-control"><br>
							</div>
							<div class="form-inline form-group">
								<label for="email">이메일</label> <input type="text" id="email"
									name="email" class="form-control">
								<button type="button" class="btn btn-secondary"
									id="mail-check-btn">본인인증</button>
							</div>
							<div class="form-inline form-group"></div>

							<br>
							<div class="form-inline form-group">
								<div id="chkEmailDiv" hidden>
									<label for="chkEmail">인증번호</label> <input type="text"
										name="chkEmail" id="chkEmail" class="form-control"
										maxlength="6"><br>
								</div>
							</div>
							<div class="form-inline form-group button">
								<span class="col-md-2"></span>
								<button type="button" id="findPw"
									class="col-md-8">완료</button>
							</div>
						</form>

					</div>

					<div>
						<form id="changePwForm" class="form-horizontal"
							action="/auth/changePw" hidden>
							<div class="form-inline form-group">
								<label for="password">변경 비밀번호</label> <input id="password"
									type="password" name="password" class="form-control"><br>
							</div>
							<div class="form-inline form-group">
								<label for="chkPassword">비밀번호 확인</label> <input id="chkPassword"
									type="password" name="chkPassword" class="form-control"><br>
							</div>

							<div class="button">
							<button type="button" id="changePw" class="col-md-12">비밀번호
								변경</button>
							</div>
							
						</form>
					</div>

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
        
        $('#pwsc').on('click', function () {
            $('.find-password').show()
            $('.find-id').hide()
            $('#idsc').removeClass('selected')
            $(this).addClass('selected')            
        });

        $('#idsc').on('click', function () {
            $('.find-id').show()
            $('.find-password').hide()
            $('#pwsc').removeClass('selected')
            $(this).addClass('selected')
        });

        // 아이디 찾기
        $('#findId').on("click", function (e) {
        	e.preventDefault();
        	if(idForm.find("input[name='name']").val()=="" || idForm.find("input[name='birth']").val()==""){
        		alert("빈칸을 작성해주세요 !")
        		return false;
        		
        	}
        	
            var member = {
                "name": idForm.find("input[name='name']").val(),
                "birth": idForm.find("input[name='birth']").val()
            }

            authService.findId(member, function (result) {
                if (!result) {
                    alert("해당하는 회원이 존재하지 않습니다.");
                } else {
                    alert("회원님의 이메일은 " + result + "입니다.");
                    $("#pwsc").trigger("click");       
                    pwForm.find("input[name='email']").val(result)
                    pwForm.find("input[name='name']").val(member.name)
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
