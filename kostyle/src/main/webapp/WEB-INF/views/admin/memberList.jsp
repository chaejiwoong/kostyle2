<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
        <title>KoStyle4U</title>
        <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
        <script type="text/javascript" src="/resources/js/adminHeader.js"></script>
        <script type="text/javascript" src="/resources/js/customerCenter.js"></script>
        <link href="/resources/css/adminHeader.css" rel="stylesheet"/>
        <link href="/resources/css/footer.css" rel="stylesheet"/>
<style>
		.member {
			color: #35C5F0;
		}
		.title-memberList {
			color: #35C5F0;
		}
		.bottom-category {
			display: block;
		}

        h1{
            margin-top: 25px;
            margin-bottom: 25px;
            font-size: 30px;
            font-weight: bold;
            text-align: center;
        }
        
.paging {
	text-align: center;
}

.selectBox{
	text-align: center;
}
</style>
</head>
<body>
<div id="wrap">
<%@ include file="/WEB-INF/views/include/adminHeader.jsp"%>
	<h1>관리자 회원 목록</h1>

	<div class="container selectBox">
	<form id='searchForm' class="form-horizontal" action="/admin/members" method='get'>
	<div class="form-inline form-group">
				<select class="form-control" name='type'>
				<option value=""
					<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
				<option value="K"
					<c:out value="${pageMaker.cri.type eq 'K'?'selected':''}"/>>회원번호</option>
				<option value="E"
					<c:out value="${pageMaker.cri.type eq 'E'?'selected':''}"/>>이메일</option>
				<option value="N"
					<c:out value="${pageMaker.cri.type eq 'N'?'selected':''}"/>>이름</option>

			</select>
			<input type='text' id='keyword' name='keyword' class='form-control' value='<c:out value="${pageMaker.cri.keyword}"/>' />
				<button id="search" class='btn btn-default'>Search</button>
				<button id="default" class='btn btn-default'>Default</button>
	</div>
			<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
			<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />

		</form>

		<table class="table table-hover">
			<thead>
				<tr>
					<th>회원번호</th>
					<th>이메일</th>
					<th>이름</th>
					<th>가입일자</th>
				</tr>
			</thead>

			<c:forEach items="${list}" var="member">
				<tr>
					<td><c:out value="${member.mno}" /></td>
					<td><a href="members/${member.mno}">${member.email}</a></td>

					<td><c:out value="${member.name}" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${member.createdDate}" /></td>
				</tr>
			</c:forEach>

		</table>

		<div class="paging">
			<ul class="pagination">
				<!-- 페이징 구현 부분 -->
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous"><a
						href="${pageMaker.startPage -1}">&lt</a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
						<a href="${num}">${num}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next}">
					<li class="paginate_button next"><a
						href="${pageMaker.endPage +1 }">&gt</a></li>
				</c:if>
			</ul>
			
		</div>


		<!-- 페이징 번호 요청 시에 submit되는 form -->
		<form id='actionForm' action="/admin/members" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

			<input type='hidden' name='type'
				value='<c:out value="${ pageMaker.cri.type }"/>'> <input
				type='hidden' name='keyword'
				value='<c:out value="${ pageMaker.cri.keyword }"/>'>
		</form>
	</div>


	<script>
		$(document).ready(
				function() {
					var actionForm = $("#actionForm");

					$(".paginate_button a").on(
							"click",
							function(e) {

								e.preventDefault();

								// 해당 pageNum을 a 태그의 href 속성 값으로 치환
								actionForm.find("input[name='pageNum']").val(
										$(this).attr("href"));
								actionForm.submit();
							});
					
					var searchForm = $('#searchForm');

					$("#search").on(
							"click",
							// 값이 들어있지 않다면 alert창 호출
							function(e) {

								if (!searchForm.find("option:selected")
										.val()) {
									alert("검색종류를 선택하세요");
									return false;
								}

								if (!searchForm.find(
										"input[name='keyword']").val()) {
									alert("키워드를 입력하세요");
									return false;
								}

								// 1페이지로 바꾸고 submit.
								searchForm.find("input[name='pageNum']")
										.val("1");
								e.preventDefault();

								searchForm.submit();

							});
					
					$("#default").on('click', function(e){
						e.preventDefault();
						self.location="/admin/members";
					})

				});
	</script>
</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
