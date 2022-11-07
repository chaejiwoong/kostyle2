<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의</title>
	<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
	<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/resources/js/adminHeader.js"></script>
	<script type="text/javascript" src="/resources/js/customerCenter.js"></script>
	<script type="text/javascript" src="/resources/js/qna.js"></script>
	<link href="/resources/vendor/bootstrap/css/bootstrap.css"rel="stylesheet">
	<link href="/resources/css/adminHeader.css" rel="stylesheet" />
    <link href="/resources/css/footer.css" rel="stylesheet"/>
    <link href="/resources/css/register.css" rel="stylesheet"/>
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/include/adminHeader.jsp"%>
		<div class="admin-inquiry-box">
			<div class="inquiry-box-bottom">
				<table class="table admin-table">
					<thead>
						<tr>
							<th scope="col">No.</th>
							<th scope="col">이름</th>
							<th scope="col">제목</th>
							<th scope="col">작성날짜</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${registerList}" var="list">
							<tr class="admin-tr-list">
								<td scope="row"><span class="tbody-td"><c:out value="${list.qno}"/></span></td>
								<td><span class="tbody-td"><c:out value="${list.memberVO.name}"/></span></td>
								<td><span class="tbody-td"><c:out value="${list.title}"/></span></td>
								<td><span class="tbody-td"><fmt:formatDate pattern="yyyy-MM-dd"
										value="${list.created_date}"/></span></td>
								<td class="td-right">
									<button type="button" class="tbody-btn btn btn-primary" id="openModalBtn" data-toggle="modal" data-qno ="<c:out value="${list.qno}"/>">답변 작성하기</button>
								</td>
							</tr>
							<tr class="answer-box admin-box">
								<td class="answer" colspan="4"><span><c:out value="${list.content}"/></span></td>
								<td class="answer" colspan="1"><button class="answer-btn" data-qno='<c:out value="${list.qno}"/>' type="button">답변보러가기</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- <button class="create-btn" type="submit">문의 작성하기</button> -->
			</div>
		</div>
		<div class='pull-right'>
			<ul class="pagination">
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
		</div>
	</div>
	<form id='actionForm' action="/admin/customercenter/inquiryList" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	</form>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	
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
                            actionForm.append("<input type='hidden' name='qno' value='"
                                + $(this).attr(
                                    "href")
                                + "'>")
                            //alert($(this).attr("href"));
                            actionForm.attr("action", "/admin/customerCenter/answerdetail");
                            // alert("두번째" + actionForm.attr("action"));
                            // alert("두번째" + actionForm.attr("action","/customerCenter/noticedetail"));
                            actionForm.submit();

                        });
                });
    </script>
</body>
</html>