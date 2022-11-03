<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
        <title>KoStyle4U</title>
        <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
        <script type="text/javascript" src="/resources/js/adminHeader.js"></script>
        <link href="/resources/css/header.css" rel="stylesheet"/>
        <link href="/resources/css/footer.css" rel="stylesheet"/>

            <style>
        label{
            width: 100px;
        }

        .update-section{
            display: flex;
            justify-content: center;
        }

        .container h1{
            text-align: center;
            font-size: 30px;
            margin-bottom: 50px;
        }

        button{
            margin: 20px;
        }

    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/adminHeader.jsp"%>

<div class="container">
    <h1>회원 상세</h1>
    <div class="update-section">
        <form id="update-form" class="form-horizontal">
            <div class="form-inline form-group">
                <label for="mno">회원번호</label>
                <input type="text" id="mno" name="mno" class="form-control" value="${member.mno}" readonly/><br>
            </div>
            <div class="form-inline form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" class="form-control" value="${member.name}" readonly/><br>
            </div>
            <div class="form-inline form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" class="form-control" value="${member.email}" readonly/><br>
            </div>
            <div class="form-inline form-group">
                <label for="birth">생년월일</label>
                <input type="text" id="birth" name="birth" class="form-control" value="${member.birth}" readonly/><br>
            </div>
            <div class="form-inline form-group">
                <label for="gender">성별</label>
                <input type="text" id="gender" name="gender" class="form-control" value="${member.gender}" readonly/><br>
            </div>
            <div class="form-inline form-group">
                <label for="point">포인트</label>
                <input type="text" id="point" name="point" class="form-control" value="${member.point}" readonly/><br>
            </div>
            <div class="form-inline form-group">
                <label for="authority">권한</label>
                <input type="text" id="authority" name="authority" class="form-control" value="${member.authority}" readonly/><br>
            </div>
            <div class="form-inline form-group">
                <label for="created_date">가입일자</label>
                <input type="text" id="created_date" name="created_date" class="form-control" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${member.createdDate}" />" readonly/><br>
            </div>
            <div class="form-inline form-group">
                <button type="button" class="btn btn-primary" id="update-btn">수정</button>
                <button type="button" class="btn btn-primary" id="completion-btn">완료</button>
                <button type="button" class="btn btn-secondary" id="prev-btn">이전</button>
                <button type="button" class="btn btn-danger" id="delete-btn">삭제</button>
            </div>
        </form>
    </div>

</div>
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
        $('#completion-btn').hide();

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
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
