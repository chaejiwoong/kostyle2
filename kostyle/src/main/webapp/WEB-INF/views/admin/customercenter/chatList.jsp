<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chat</title>
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/adminHeader.js"></script>
<script type="text/javascript" src="/resources/js/customerCenter.js"></script>
<script type="text/javascript" src="/resources/js/chatList.js"></script>
<link href="/resources/vendor/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<link href="/resources/css/adminHeader.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet" />
<link href="/resources/css/chatList.css" rel="stylesheet" />

</head>
<body>
	<%@ include file="/WEB-INF/views/include/adminHeader.jsp"%>
		
		<div class="waiting-box">
            <span id="reload" class="waiting-people">현재 대기중인 고객: <c:out value="${count}"/>명</span>
        </div>
        
		<div class="admin-inquiry-box">
			<div class="inquiry-box-bottom">
				<table id="chatList" class="table admin-table">
					<thead>
						<tr>
							<th scope="col">No.</th>
							<th scope="col">상대 이름</th>
							<th scope="col">제목</th>
							<th scope="col">상태</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<form class="chatingRoom" method="get">
						<c:forEach items="${chatList}" var="list">
						<%-- <input class="aa" type='hidden' name='cuno' value='${list.cuno}'>
						<input class="aa" type='hidden' name='member_id' value='${list.member_id}'>
						<input class="aa" type='hidden' name='chat_title' value='${list.chat_title}'>
						<input class="aa" type='hidden' name='chat_title' value='${list.chat_title}'>
						<input class="aa" type='hidden' name='chat_title' value='${id}'> --%>
							<tr class="admin-tr-list">
								<input class="aa" type='hidden' name='cuno' value='${list.cuno}'/>
								<input class="aa" type='hidden' name='member_id' value='${list.member_id}'/>
								<input class="aa" type='hidden' name='chat_title' value='${list.chat_title}'/>
								<input class="aa" type='hidden' name='status' value='${list.status}'/>
								<input class="aa" type='hidden' name='id' value='${id}'/>
								<td scope="row"><span class="tbody-td"><c:out value="${list.cuno}"/></span></td>
								<td><span class="tbody-td"><c:out value="${list.member_id}"/></span></td>
								<td><span class="tbody-td"><c:out value="${list.chat_title}"/></span></td>
								<td><span class="tbody-td"><c:out value="${list.status}"/></span></td>
								<td class="td-right">
										<button type="submit" class="tbody-btn btn btn-primary" id="openModalBtn" data-toggle="modal" data-cuno ="<c:out value="${list.cuno}"/>">상담하기</button>					
								</td>
								
							</tr>
						</c:forEach>
						</form>
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
	<form id='actionForm' action="/admin/customercenter/chatList" method='get'>
		<input class="pageNum" type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input class="amount" type='hidden' name='amount' value='${pageMaker.cri.amount}'>
		<%-- <input type='hidden' name='qno' value='${registerList.qno}'> --%>
	</form>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>