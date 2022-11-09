<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"
></script>
<title>장바구니</title>
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet"
>
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<link href="/resources/css/header.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet" />

<style>
#wrap {
	min-height: 100%;
	position: relative;
	padding-bottom: 100px;
}

.selected {
	background-color: #f891aa;
	color: white;
	font-weight: bold;
	font-size: 15px;
}

.header-box {
	background-color: #f891aa;
	font-weight: bold;
}

.table-primary th:nth-child(8) {
	width: 190px !important;
}
/* 사이드바 */
#left-sidebar {
	position: absolute;
	left: 0px;
	text-align: center;
	width: 200px;
	border: 1px solid black;
	border-radius: 4px;
	margin-top: 20px;
}

#left-sidebar h1 {
	font-size: 20px;
	font-weight: bold;
	padding: 20px;
	border-bottom: 1px solid black;
}

#left-sidebar li {
	display: block;
	padding: 15px;
	font-weight: bold;
}

#left-sidebar li:hover {
	background-color: #f891aa;
	color: white;
	cursor: pointer;
}

.selected {
	background-color: #f891aa;
	color: white;
}
/* 사이드바 끝 */
</style>


</head>
<body>
	<div id="wrap">
		<%@ include file="/WEB-INF/views/include/header.jsp"%>
		<div class="container" style="text-align: center">

			<div id="left-sidebar">
				<h1>MyPage</h1>

				<ul>
					<li onclick="location.replace('/orders')">주문배송조회</li>
					<li onclick="location.replace('/members')">회원정보수정</li>
					<li onclick="location.replace('/members/address')">배송지관리</li>
					<li onclick="location.replace('/reviews/unwritten')"
						class="selected"
					>리뷰관리</li>
					<li onclick="loaction.replace('/shop/cartList')">장바구니</li>
					<li>위시리스트/코디</li>
					<li onclick="location.replace('/members/bidHistory')">내경매조회</li>
					<li onclick="location.replace('/customerCenter/register')">1:1문의</li>
				</ul>
			</div>
			<!-- 센터 말고 컨테이너만 넣으면 왼쪽 줄 맞춰서 됨 -->

			<div class="row">
				<div align="center" class="col-md-12">
					<!--주문 form 시작===================  -->
					<form name="searchForm" id="searchForm" action="../orders/orderList" method="post">
						<table class="table table-hover">
							<!-- 					<table class="table table-condensed"> -->
							<thead>

								<tr class="default">
									<th colspan="12" style="text-align: center">
										<h3 class="text-primary">${user.name}님의장바구니</h3>
									</th>
								</tr>
								<tr>
								<tr class="table-primary">
									<th><input type="checkbox" name="allChk" id="allChk">
										번호</th>
									<th>상품명</th>
									<th>이미지</th>
									<th>수량</th>
									<th>사이즈</th>
									<th>가격</th>
									<th>적립 포인트</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody>

								<!------------------------------  -->
								<c:if test="${cartList eq null or empty cartList}">
									<tr>
										<td colspan="6">장바구니 상품이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${cartList ne null and not empty cartList}">
									<c:forEach var="cart" items="${cartList}" varStatus="state">
										<!-- 
     	  state.index : 인덱스 번호
     	  state.count : 반복문 횟수
      -->
										<tr>
											<td>
												<input type="checkbox" name="pno" id="pno${state.index}"
													value="${cart.pno}"
												>
												${cart.pno}
											</td>
											<td>
												<a href="../prodDetail?pno=${cart.pno}" target="_blank">
												</a>${cart.name}
											</td>
											<td>
												<%-- <img src="../product_images/" width="100"> --%>
												aa
											</td>
											<td>
												<!--수량--------------  -->
												<input type="number" size="2" name="amount"
													id="amount${state.index}" value="${cart.amount}"
													style="width: 50px"
												>
												<button type="button"
													onclick="goEdit('${cart.cpno}','${state.index}')"
													class="btn btn-default"
												>수정</button>

												<!---------------------  -->
											</td>

											<td>${cart.p_size }</td>
											<td class="totalPrice01" data-value="${cart.totalPrice}">
												<fmt:formatNumber value="${cart.totalPrice}"
													pattern="###,###"
												/>
												원<br>
											</td>
											<td class="totalPrice02"
												data-value="${cart.totalPrice * 0.05}"
											>
												<fmt:formatNumber value="${cart.totalPrice * 0.05}"
													pattern="###,###"
												/>
												POINT

											</td>
											<td>
												<a href="javascript:goDel('${cart.cpno}')"
													class="btn btn-warning"
												>삭제</a>
											</td>
										</tr>
									</c:forEach>
								</c:if>
								<!-- --------------------------- -->
								<tr>
									<td colspan="7">
										<div>
										<b>장바구니 총액</b>: <span style="color: blue"><b> <fmt:formatNumber
													value="${finalTotalPrice }" pattern="###,###"

													/>원 
													</b> </span> <br> <b>총 포인트</b>: <span style="color: red">
											<b> <fmt:formatNumber value="${finalTotalPoint}"
													pattern="###,###"

											/> POINT
										</b>
										
										</span> 
										<br> <b>배송비</b>: <span style="color: yellow"> <b>
												<fmt:formatNumber value="3000" pattern="###,###" /> 원
										</b>
										</span>
										</div>
									</td>

									<td colspan="1">
										<button type="button" onclick="goOrder()"
											class="btn btn-primary"
										>주문하기</button>
										<button type="button" onclick="self.location='/main'"
											class="btn btn-warning"
										>계속쇼핑</button>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<!-- 주문form끝---------------------- -->


					<!-- 수량 수정 form시작----------------------- -->
					<form name="editF" action="cartEdit" method="POST">
						<input type="hidden" name="cpno">
						<input type="hidden" name="amount">
					</form>
					<!--수량 수정 form끝-------------------------  -->
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
<script>
	$(function() {

		$("#allChk").click(function() {
			if ($("#allChk").is(":checked"))
				$("input[name=pno]").prop("checked", true);
			else
				$("input[name=pno]").prop("checked", false);
		});

		$("input[name=pno]").click(function() {
			var total = $("input[name=pno]").length;
			var checked = $("input[name=pno]:checked").length;

			if (total != checked)
				$("#allChk").prop("checked", false);
			else
				$("#allChk").prop("checked", true);
		});

		/* 		$('#allChk').click(function() {
		 let chkList = $('input[name="pno"]')
		 if ($(this).is(":checked")) {
		 chkList.each(function(i, ck) {
		 ck.checked = true;
		 })
		 } else {
		 chkList.each(function(i, ck) {
		 ck.checked = false;
		 })
		 }
		 }) */
	}) // $() end-------

	// 체크박스에 체크한 상품정보(상품번호-pno, 수량-amount)를 가지고 주문폼 페이지로 이동
	function goOrder() {
		let chk = searchForm.pno; // $('input[name="pno"]')
		if (chk == null)
			return;
		// alert(chk.length)
		// 체크박스 1개일 때는 length 속성이 안먹음
		if (!chk.length) {
			// 체크박스가 한개 있다면 => checkbox 객체
			if (!chk.checked) {
				alert('주문할 상품을 체크하세요')
				chk.focus();
				return;
			}
		} else {
			// 체크박스가 여러개 있다면 => check배열
			let cnt = 0;
			for (let i = 0; i < chk.length; i++) {
				if (!chk[i].checked) {
					cnt++; // 체크 안 된 체크박스 개수 세기
					// 체크 안 된 상품이 있다면
					// 해당 상품의 수량이 서버에 전송되지 않도록 해야함.
					$('#amount' + i).prop('disabled', true)
				} else {
					$('#amount' + i).prop('disabled', false)
				}
			}// for--
			if (cnt == chk.length) {
				alert('주문할 상품을 체크해야해요!');
				$('#amount' + i).prop('disabled', false)
				return;
			}
		}//else--
		searchForm.method = 'post';
		searchForm.submit();
	}

	function goEdit(cpno, index) {
		//alert(index)
		let amount = $('#amount' + index).val()
		//alert(amount);

		editF.cpno.value = cpno;
		editF.amount.value = amount;
		editF.submit();
	}//--------------

	function goDel(cpno) {
		//alert(cpno);
		let yn = confirm("정말 삭제하실건가요..?")
		if (yn) {
			location.href = "cartDel?cpno=" + cpno;
		}
	}
</script>