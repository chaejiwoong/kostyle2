<%--
  Created by IntelliJ IDEA.
  User: dhwls
  Date: 2022-10-25
  Time: 오후 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
    <script type="text/javascript" src="/resources/js/header.js"></script>
    <script type="text/javascript" src="/resources/js/customerCenter.js"></script>
    <link href="/resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/css/header.css" rel="stylesheet"/>
    <link href="/resources/css/footer.css" rel="stylesheet"/>
    <link href="/resources/css/nav.css" rel="stylesheet"/>
    <link href="/resources/css/register.css" rel="stylesheet"/>
</head>
<body>
<div id="wrap">
    <%@ include file="/WEB-INF/views/include/header.jsp"%>
    <%@ include file="/WEB-INF/views/customerCenter/include/nav.jsp"%>
    	<div class="chat-box">
    	<!--action="/customerCenter/register/chatadd"-->
            <form method="post">
                <span class="inquiry-content">문의 내용</span>
                <input class="inquiry-input" type="text" name="chat-title"/>
                <button class="inquiry-btn" type="submit"><span>서비스 신청</span></button>
                <div class="text-box"><span class="clean-text">상담원도 누군가의 소중한 가족입니다. 욕설/폭언/장난 등은 삼가 부탁드립니다.</span></div>
            </form>
        </div>
        <div class="waiting-box">
            <span class="waiting-people">현재 대기중인 고객: 0명</span>
        </div>

        <div class="inquiry-box">
            <div class="inquiry-box-bottom">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">No.</th>
                        <th scope="col">이름</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성날짜</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${registerList}" var="list">
	                    <tr>
	                        <td scope="row"><c:out value="${list.qno}"/></td>
	                        <td><c:out value="${list.memberVO.name}"/></td>
	                        <td><c:out value="${list.title}"/></td>
	                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.created_date}"/></td>
	                        
	                    </tr>
	                    <tr class="admin-box">
							<td class="answer" colspan="3"><span><c:out value="${list.content}"/></span></td>
							<td class="answer right" colspan="1"><button class="answer-btn" data-qno='<c:out value="${list.qno}"/>' type="button">답변보러가기</button></td>
						</tr>
                    </c:forEach>
                    </tbody>
                </table>
                <button class="create-btn" type="submit">문의 작성하기</button>
            </div>
        </div>
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

    </div>
    <form id='actionForm' action="/customerCenter/register" method='get'>
	    <input type='hidden' class='pageNum' name='pageNum' value='${pageMaker.cri.pageNum}'>
	    <input type='hidden' class='amount' name='amount' value='${pageMaker.cri.amount}'>
    </form>
    
    
    
        <!--  end Pagination -->
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
    
    <script type="text/javascript">
        $(document)
            .ready(
                function() {
                	var pageNum = $(".pageNum").val();
                	var amount = $(".amount").val();
                	$(".admin-box").each(function(){
            			var parmeter = $(this).find(".answer-btn").data("qno");
            			var btn = $(this).find(".answer-btn");
            			
            			$(btn).click(function(){
            				location.href = "/customerCenter/answerdetail?qno=" + parmeter + "&pageNum=" + pageNum + "&amount=" + amount;
            			});
            		});
                	
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
