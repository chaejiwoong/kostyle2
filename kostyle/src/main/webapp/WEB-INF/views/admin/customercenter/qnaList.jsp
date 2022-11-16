<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/adminHeader.js"></script>
<script type="text/javascript" src="/resources/js/customerCenter.js"></script>
<script type="text/javascript" src="/resources/js/qna.js"></script>
<script type="text/javascript" src="/resources/js/ajax.js"></script>
<link href="/resources/vendor/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<link href="/resources/css/adminHeader.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet" />
<link href="/resources/css/qna.css" rel="stylesheet" />
</head>
<body>
		<%@ include file="/WEB-INF/views/include/adminHeader.jsp"%>
		<nav class="qna-nav admin-qna">
			<ul>
				<li><a href="/admin/customercenter/qnaList?category=all"
					id="all" data-value="all" class="board-radio on" name="all"><span
						class="all">전체</span></a></li>
				<li><a id="usage-policy" data-value="usage-policy"
					class="board-radio"><span class="usage-policy">이용정책</span></a></li>
				<li><a id="purchase" data-value="purchase" name="purchase"
					class="board-radio"><span class="purchase">구매</span></a></li>
				<li><a class="board-radio" data-value="sale"> <span
						class="sale">판매</span></a></li>
			</ul>
		</nav>
		<form id="delete"  method="post">
			<div class="feq-box">
				<ul class="list admin-list">
				
					<c:forEach items="${qnaList}" var="list">
						<li class="qna-title qna-admin">
							<div class="qna-top qna-admin">
								<div class="qna-top2">
									<div class="list-category">
										<c:out value="${list.category}" />
									</div>
									<div class="list-title">
										<c:out value="${list.title}" />
									</div>
									<div class="date">
										날짜:
										<fmt:formatDate pattern="yyyy-MM-dd"
										value="${list.created_date}" />
									</div>
									<a class="img admin-img"></a>
								</div>
								<div class="qna-btn">
									<button type="button" class="update btn btn-primary" data-nno ="<c:out value="${list.nno}"/>">수정</button>
									<button type="submit" class="delete btn btn-primary" data-nno ="<c:out value="${list.nno}"/>">제거</button>
								</div>
							</div>
							
							<div class="qna-bottom">
								<div class="qna-box">
									<div class="qna-answer">
										<c:out value="${list.content}" />
									</div>
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
	
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>