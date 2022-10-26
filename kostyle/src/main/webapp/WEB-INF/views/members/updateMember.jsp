<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<%--mno 필요합니다.--%>
    <form id="update-form">
        이름<input type="text" name="name" placeholder="특수문자를 제외한 2~10자리"><br>
        비밀번호<input id="password" type="password" name="password" placeholder="영문 대소문자, 숫자,특수문자 포함한 8~20자리"></span><br>
        비밀번호 확인<input id="chkPassword" type="password" name="chkPassword"><br>
        <button id="update-btn" type="button">수정</button>
        <button id="cancel-btn" type="button">취소</button>
        <button id="remove-btn" type="button">탈퇴</button>
    </form>
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
