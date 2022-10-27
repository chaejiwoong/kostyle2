<%--
  Created by IntelliJ IDEA.
  User: dhwls
  Date: 2022-10-22
  Time: 오후 6:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>Q&A</title>
    <script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
    <script type="text/javascript" src="/resources/js/header.js"></script>
    <script type="text/javascript" src="/resources/js/qna.js"></script>
    <script type="text/javascript" src="/resources/js/ajax.js"></script>
    <link href="/resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/css/header.css" rel="stylesheet"/>
    <link href="/resources/css/footer.css" rel="stylesheet"/>
    <link href="/resources/css/nav.css" rel="stylesheet"/>
    <link href="/resources/css/qna.css" rel="stylesheet"/>
</head>
<body>
    <%@ include file="/views/include/header.jsp"%>
    <%@ include file="/views/customerCenter/include/nav.jsp"%>
    <nav class="qna-nav">
        <ul>
            <li><a href="" class="board-radio on" name="all"><span class="all">전체</span></a></li>
            <li><a id="usage-policy" class="board-radio"><span class="usage-policy">이용정책</span></a></li>
            <li><a id="purchase" class="board-radio"><span class="purchase">구매</span></a></li>
            <li><a class="board-radio"><span class="sale">판매</span></a></li>
        </ul>
    </nav>
    <div class="feq-box">
        <ul class="list">
           <c:forEach items="${qnaList}" var="list">
           <li class="qna-title">
               <div class="qna-top">
                   <div class="list-category"><c:out value="${list.category}"/></div>
                   <div class="list-title"><c:out value="${list.title}"/></div>
                   <div class="date">날짜:<fmt:formatDate pattern="yyyy-MM-dd" value="${list.created_date}"/></div>
                   <img src="../../resources/img/icn_dropdown.png">
               </div>
               <div class="qna-bottom">
                   <div class="qna-box">
                       <div class="qna-answer"><c:out value="${list.content}"/></div>
                   </div>
               </div>
           </li>
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
    <form id='actionForm' action="/customerCenter/qna" method='get'>
        <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
        <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

        <input type='hidden' name='type'
               value='<c:out value="${ pageMaker.cri.type }"/>'> <input
            type='hidden' name='keyword'
            value='<c:out value="${ pageMaker.cri.keyword }"/>'>
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
                });
    </script>
</body>
</html>
