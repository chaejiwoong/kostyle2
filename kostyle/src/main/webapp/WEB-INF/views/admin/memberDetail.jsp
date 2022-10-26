<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
        <title>KoStyle4U</title>
        <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
</head>
<body>
    <h1>회원 상세</h1>
    <ul>
        <li><a href="#">상품관리</a></li>
        <li><a href="#">고객센터관리</a></li>
        <li><a href="#">회원관리</a></li>
        <li><a href="#">주문관리</a></li>
        <li><a href="#">경매관리</a></li>
        <li><a href="#">통계</a></li>
    </ul>

    <form id="update-form">
        회원번호 : <input type="text" name="mno" value="${member.mno}" readonly/><br>
        이름 : <input type="text" name="name" value="${member.name}" readonly/><br>
        이메일 : <input type="email" name="email" value="${member.email}" readonly/><br>
        생년월일 : <input type="text" name="birth" value="${member.birth}" readonly/><br>
        성별 : <input type="text" name="gender" value="${member.gender}" readonly/><br>
        포인트 : <input type="text" name="point" value="${member.point}" readonly/><br>
        권한 : <input type="text" name="authority" value="${member.authority}" readonly/><br>
        가입일자 : <input type="text" name="created_date" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${member.createdDate}" />" readonly/><br>

        <button type="button" id="update-btn">수정</button>
        <button type="button" id="completion-btn" hidden>완료</button>
        <button type="button" id="prev-btn">이전</button>
        <button type="button" id="delete-btn">삭제</button>
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
                url: "/admin/members/" + ${member.mno},
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

        function updateMember(member, callback, error) {
            $.ajax({
                type:'put',
                url:'/admin/members/' + ${member.mno},
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

        return {updateInfo:updateInfo, deleteMember:deleteMember, updateMember:updateMember}
    })();// 즉시 실행함수

    $(document).ready(function () {

        var form = $("#update-form");

        $('#update-btn').on('click', function () {
            $(form.find("input[name='point']")).attr('readonly', false);
            $(form.find("input[name='authority']")).attr('readonly', false);
            $(this).hide();
            $('#completion-btn').show();
        });

        $('#prev-btn').on('click', function () {
            self.location = "/admin/members";
        });

        $('#delete-btn').on('click', function () {
            memberService.deleteMember(function () {
                alert("회원삭제가 완료되었습니다.");
                self.location = "/admin/members";
            });
        });

        $('#completion-btn').on('click', function () {
            var member = {
                'point' :form.find("input[name='point']").val(),
                'authority' :form.find("input[name='authority']").val()
            }

            memberService.updateMember(member, function (result) {
                alert('수정이 완료되었습니다.');
                $(form.find("input[name='point']")).attr('readonly', true);
                $(form.find("input[name='authority']")).attr('readonly', true);
                $('#completion-btn').hide();
                $('#update-btn').show();
            });
        });
    });
</script>
</body>
</html>
