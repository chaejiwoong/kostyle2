<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
        <title>KoStyle4U</title>
        <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
</head>
<body>
    <h1>관리자 회원 목록</h1>
    <ul>
        <li><a href="#">상품관리</a></li>
        <li><a href="#">고객센터관리</a></li>
        <li><a href="#">회원관리</a></li>
        <li><a href="#">주문관리</a></li>
        <li><a href="#">경매관리</a></li>
        <li><a href="#">통계</a></li>
    </ul>

    <table>
        <thead>
        <tr>
            <th>회원번호</th>
            <th>이메일</th>
            <th>아이디</th>
            <th>가입일자</th>
        </tr>
        </thead>

        <c:forEach items="${list}" var="member">
            <tr>
                <td><c:out value="${member.mno}" /></td>
                <td><a href='<c:out value="members/${member.mno}"/>'>
                    <c:out value="${member.email}" />
                </a></td>

                <td><c:out value="${member.name}" /></td>
                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.createdDate}" /></td>
            </tr>
        </c:forEach>

    </table>

        <ul class="pagination">
            <!-- 페이징 구현 부분 -->
            <c:if test="${pageMaker.prev}">
                <li class="paginate_button previous"><a
                        href="${pageMaker.startPage -1}">Previous</a></li>
            </c:if>

            <c:forEach var="num" begin="${pageMaker.startPage}"
                       end="${pageMaker.endPage}">
                <li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
                    <a href="${num}">${num}</a>
                </li>
            </c:forEach>

            <c:if test="${pageMaker.next}">
                <li class="paginate_button next"><a
                        href="${pageMaker.endPage +1 }">Next</a></li>
            </c:if>
        </ul>

        <!-- 페이징 번호 요청 시에 submit되는 form -->
        <form id='actionForm' action="/admin/members" method='get'>
            <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
            <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

            <input type='hidden' name='type'
                   value='<c:out value="${ pageMaker.cri.type }"/>'> <input
                type='hidden' name='keyword'
                value='<c:out value="${ pageMaker.cri.keyword }"/>'>
        </form>

<script>
    $(document).ready(function () {
        var actionForm = $("#actionForm");

        $(".paginate_button a").on("click", function(e) {

                e.preventDefault();

                // 해당 pageNum을 a 태그의 href 속성 값으로 치환
                actionForm.find("input[name='pageNum']")
                    .val($(this).attr("href"));
                actionForm.submit();
            });
    });
</script>
</body>
</html>
