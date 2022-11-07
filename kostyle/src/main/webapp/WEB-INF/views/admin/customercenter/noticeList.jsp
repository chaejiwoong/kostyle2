<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>KoStyle4U</title>
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"rel="stylesheet">
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/adminHeader.js"></script>
<script type="text/javascript" src="/resources/js/customerCenter.js"></script>
<script type="text/javascript" src="/resources/js/notice.js"></script>
<link href="/resources/css/adminHeader.css" rel="stylesheet" />
<link href="/resources/css/notice.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet" />
</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/include/adminHeader.jsp"%>
		<form id="delete"  method="post">
			<div class="feq-box">
				<ul class="list admin-list">
				
					<c:forEach items="${noticeList}" var="list">
						<li class="qna-title">
							<div class="qna-top qna-admin">
								<div class="qna-top2">
									<div class="list-title">
										<c:out value="${list.title}" />
									</div>
								</div>
								<div class="qna-btn">
									<button type="button" class="update" data-nno ="<c:out value="${list.nno}"/>">수정</button>
									<button type="submit" class="delete" data-nno ="<c:out value="${list.nno}"/>">제거</button>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
	
				<!--  end Pagination -->
			</div>
		</form>
		<div class="qna-write">
			<div class="notice-box">
				<button class="write-btn" type="button">
					<span>작성하기</span>
				</button>
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
		<!--  end Pagination -->
	</div>
	<form id='actionForm' action="/admin/customercenter/noticeList" method='get'>
		<input type="hidden" name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input type="hidden" name='amount' value='${pageMaker.cri.amount}'>
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
                            	alert("AD");
                                e.preventDefault();
                                actionForm.append("<input type='hidden' name='nno' value='"
                                    + $(this).attr(
                                        "href")
                                    + "'>")
                                //alert($(this).attr("href"));
                                actionForm.attr("action", "/admin/customercenter/noticedetail");
                                // alert("두번째" + actionForm.attr("action"));
                                // alert("두번째" + actionForm.attr("action","/customerCenter/noticedetail"));
                                actionForm.submit();

                            });
                });
    </script>
</body>
</html>