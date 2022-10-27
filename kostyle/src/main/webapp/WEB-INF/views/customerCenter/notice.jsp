<%--
  Created by IntelliJ IDEA.
  User: dhwls
  Date: 2022-10-25
  Time: 오후 6:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>notice</title>
    <script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
    <script type="text/javascript" src="/resources/js/header.js"></script>
    <script type="text/javascript" src="/resources/js/customerCenter.js"></script>
    <link href="/resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/css/header.css" rel="stylesheet"/>
    <link href="/resources/css/footer.css" rel="stylesheet"/>
    <link href="/resources/css/nav.css" rel="stylesheet"/>
    <link href="/resources/css/notice.css" rel="stylesheet"/>
</head>
<body>
    <%@ include file="/views/include/header.jsp"%>
    <%@ include file="/views/customerCenter/include/nav.jsp"%>
    <div class="feq-box">
        <ul class="list">
            <c:forEach items="${noticeList}" var="list">
                <a class="move" href="<c:out value='${list.nno}'/>">
                    <li>
                        <div class="list-title"><c:out value="${list.title}"/></div>
                    </li>
                </a>
            </c:forEach>
        </ul>
        <div class='pull-right'>
            <ul class="pagination">
                <c:if test="${pageMaker.prev}">
                    <li class="paginate_button previous">
                        <a href="${pageMaker.startPage -1}">Previous</a>
                    </li>
                </c:if>
                <c:forEach var="num" begin="${pageMaker.startPage}"
                           end="${pageMaker.endPage}">
                    <li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
                        <a href="${num}">${num}</a>
                    </li>
                </c:forEach>

                <c:if test="${pageMaker.next}">
                    <li class="paginate_button next">
                        <a href="${pageMaker.endPage +1 }">Next</a>
                    </li>
                </c:if>
            </ul>
        </div>
        <!--  end Pagination -->
    </div>
    <form id='actionForm' action="/customerCenter/notice" method='get'>
        <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
        <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
    </form>
    <%@ include file="/views/include/footer.jsp"%>

    <script type="text/javascript">
        $(document)
            .ready(
                function() {

                    var result = '<c:out value="${result}"/>';

                    checkModal(result);
                    history.replaceState({}, null, null);

                    function checkModal(result) {
                        if (result === '' || history.state) {
                            return;
                        }
                    }

                    var actionForm = $("#actionForm");

                    $(".paginate_button a").on(
                        "click",
                        function(e) {

                            e.preventDefault();

                            console.log('click');

                            actionForm.find("input[name='pageNum']")
                                .val($(this).attr("href"));
                            actionForm.submit();
                        });

                    $(".move")
                        .on(
                            "click",
                            function(e) {
                                e.preventDefault();
                                actionForm.append("<input type='hidden' name='nno' value='"
                                    + $(this).attr(
                                        "href")
                                    + "'>")
                                // alert($(this).attr("href"));
                                actionForm.attr("action", "/customerCenter/noticedetail");
                                // alert("두번째" + actionForm.attr("action"));
                                // alert("두번째" + actionForm.attr("action","/customerCenter/noticedetail"));
                                actionForm.submit();

                            });
                });
    </script>
</body>
</html>
