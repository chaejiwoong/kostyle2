<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<link rel="stylesheet" href="/resources/css/cart.css">

</head>
<body>

	<div class="wrapper">
		<div class="wrap">
			<div class="top_gnb_area">
				<!-- 				<ul class="list"> -->
				<%-- 					<c:if test="${member == null}"> --%>
				<!-- 						로그인 x -->
				<!-- 						<li><a href="/member/login">로그인</a></li> -->
				<!-- 						<li><a href="/member/join">회원가입</a></li> -->
				<%-- 					</c:if> --%>
				<%-- 					<c:if test="${member != null }"> --%>
				<!-- 						로그인 o -->
				<%-- 						<c:if test="${member.adminCk == 1 }"> --%>
				<!-- 							관리자 계정 -->
				<!-- 							<li><a href="/admin/main">관리자 페이지</a></li> -->
				<%-- 						</c:if> --%>
				<!-- 						<li><a id="gnb_logout_button">로그아웃</a></li> -->
				<!-- 						<li>마이룸</li> -->
				<%-- 						<li><a href="/cart/${member.mno}">장바구니</a></li> --%>
				<%-- 					</c:if> --%>
				<!-- 					<li>고객센터</li> -->
				<!-- 				</ul> -->
			</div>
			<div class="top_area">
				<!-- 로고영역 -->
				<div class="logo_area">
					<a href="/main"><img src="/resources/img/mLogo.png"></a>
				</div>
				<div class="search_area">
					<div class="search_wrap">
						<form id="searchForm" action="/search" method="get">
							<div class="search_input">
								<select name="type">
									<option value="T">옷 이름</option>
								</select> <input type="text" name="keyword"
									value="<c:out value="${pageMaker.cri.keyword}"/>">
								<button class='btn search_btn'>검 색</button>
							</div>
						</form>
					</div>
				</div>
				<div class="login_area">

					<!-- 로그인 하지 않은 상태 -->
					<c:if test="${member == null }">
						<div class="login_button">
							<a href="/member/login">로그인</a>
						</div>
						<span><a href="/member/join">회원가입</a></span>
					</c:if>

					<!-- 로그인한 상태 -->
					<c:if test="${ member != null }">
						<div class="login_success_area">
							<span>회원 : ${member.name}</span> <span>포인트 : <fmt:formatNumber
									value="${member.point }" pattern="#,###" />
							</span> <a href="/member/logout.do">로그아웃</a>
						</div>
					</c:if>

				</div>
				<div class="clearfix"></div>
			</div>
			<div class="content_area">

				<div class="content_subject">
					<span>장바구니</span>
				</div>
				<!-- 장바구니 리스트 -->
				<div class="content_middle_section"></div>
				<!-- 장바구니 가격 합계 -->
				<!-- cartInfo -->
				<div class="content_totalCount_section">

					<!-- 체크박스 전체 여부 -->
					<div class="all_check_input_div">
						<input type="checkbox" class="all_check_input input_size_20"
							checked="checked"><span class="all_chcek_span">전체선택</span>
					</div>

					<table class="subject_table">
						<caption>표 제목 부분</caption>
						<tbody>

							<tr>
								<th class="td_width_1"></th>
								<th class="td_width_2"></th>
								<th class="td_width_3">상품명</th>
								<th class="td_width_4">가격</th>
								<th class="td_width_4">수량</th>
								<th class="td_width_4">합계</th>
								<th class="td_width_4">삭제</th>
							</tr>
						</tbody>
					</table>
					<table class="cart_table">
						<caption>표 내용 부분</caption>
						<tbody>
							<c:forEach items="${cartInfo}" var="ci">
								<tr>
									<td class="td_width_1 cart_info_td"><input type="checkbox"
										class="individual_cart_checkbox input_size_20"
										checked="checked"> <input type="hidden"
										class="individual_price_input" value="${ci.price}"> <input
										type="hidden" class="individual_price_input"
										value="${ci.price}"> <input type="hidden"
										class="individual_amount_input" value="${ci.amount}">
										<input type="hidden" class="individual_totalPrice_input"
										value="${ci.price * ci.amount}"> <input type="hidden"
										class="individual_point_input" value="${ci.point}"> <input
										type="hidden" class="individual_totalPoint_input"
										value="${ci.totalPoint}"> <input type="hidden"
										class="individual_pno_input" value="${ci.pno}"></td>

									<td class="td_width_3">${ci.ClothName}</td>
									<td class="td_width_4 price_td"><del>
											정가 :
											<fmt:formatNumber value="${ci.price}" pattern="#,### 원" />
										</del><br> 판매가 : <span class="red_color"><fmt:formatNumber
												value="${ci.price}" pattern="#,### 원" /></span><br> 마일리지 : <span
										class="green_color"><fmt:formatNumber
												value="${ci.point}" pattern="#,###" /></span></td>
									<td class="td_width_4 table_text_align_center">
										<div class="table_text_align_center quantity_div">
											<input type="text" value="${ci.amount}"
												class="quantity_input">
											<button class="quantity_btn plus_btn">+</button>
											<button class="quantity_btn minus_btn">-</button>
										</div> <a class="quantity_modify_btn" data-cpno="${ci.cpno}">변경</a>
									</td>
									<td class="td_width_4 table_text_align_center"><fmt:formatNumber
											value="${ci.price * ci.amount}" pattern="#,### 원" /></td>
									<td class="td_width_4 table_text_align_center">
										<button class="delete_btn" data-cpno="${ci.cpno}">삭제</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<table class="list_table">
					</table>
				</div>
				<!-- 가격 종합 -->
				<div class="content_total_section">
					<div class="total_wrap">
						<table>
							<tr>
								<td>
									<table>
										<tr>
											<td>총 상품 가격</td>
											<td><span class="totalPrice_span">70000</span> 원</td>
										</tr>
										<tr>
											<td>배송비</td>
											<td><span class="delivery_price">3000</span>원</td>
										</tr>
										<tr>
											<td>총 주문 상품수</td>
											<td><span class="totalKind_span"></span>종 <span
												class="totalCount_span"></span>권</td>
										</tr>
									</table>
								</td>
								<td>
									<table>
										<tr>
											<td></td>
											<td></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<div class="boundary_div">구분선</div>
						<table>
							<tr>
								<td>
									<table>
										<tbody>
											<tr>
												<td><strong>총 결제 예상 금액</strong></td>
												<td><span class="finalTotalPrice_span">70000</span> 원</td>
											</tr>
										</tbody>
									</table>
								</td>
								<td>
									<table>
										<tbody>
											<tr>
												<td><strong>총 적립 예상 마일리지</strong></td>
												<td><span class="totalPoint_span">70000</span> 원</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- 구매 버튼 영역 -->
				<div class="content_btn_section">
					<a class="order_btn">주문하기</a>
				</div>

				<!-- 수량 조정 form -->
				<form action="/cart/update" method="post"
					class="quantity_update_form">
					<input type="hidden" name="cpno" class="update_cpno"> <input
						type="hidden" name="amount" class="update_amount"> <input
						type="hidden" name="mno" value="${member.mno}">
				</form>

				<!-- 삭제 form -->
				<form action="/cart/delete" method="post"
					class="quantity_delete_form">
					<input type="hidden" name="cpno" class="delete_cpno"> <input
						type="hidden" name="mno" value="${member.mno}">
				</form>
				<!-- 주문 form -->
				<form action="/order/${member.mno}" method="get" class="order_form">

				</form>


			</div>

			<script>
				$(document).ready(function() {

					/* 종합 정보 섹션 정보 삽입 */
					setTotalInfo();

				});

				/* 체크여부에따른 종합 정보 변화 */
				$(".individual_cart_checkbox").on("change", function() {
					/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
					setTotalInfo($(".cart_info_td"));
				});

				/* 체크박스 전체 선택 */
				$(".all_check_input").on("click", function() {

					/* 체크박스 체크/해제 */
					if ($(".all_check_input").prop("checked")) {
						$(".individual_cart_checkbox").attr("checked", true);
					} else {
						$(".individual_cart_checkbox").attr("checked", false);
					}

					/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
					setTotalInfo($(".cart_info_td"));

				});

				/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
				function setTotalInfo() {

					let totalPrice = 0; // 총 가격
					let totalCount = 0; // 총 갯수
					let totalKind = 0; // 총 종류
					let totalPoint = 0; // 총 마일리지
					let deliveryPrice = 0; // 배송비
					let finalTotalPrice = 0; // 최종 가격(총 가격 + 배송비)

					$(".cart_info_td").each(
							function(index, element) {

								if ($(element)
										.find(".individual_cart_checkbox").is(
												":checked") === true) { //체크여부
									// 총 가격
									totalPrice += parseInt($(element).find(
											".individual_totalPrice_input")
											.val());
									// 총 갯수
									totalCount += parseInt($(element).find(
											".individual_amount_input").val());
									// 총 종류
									totalKind += 1;
									// 총 마일리지
									totalPoint += parseInt($(element).find(
											".individual_totalPoint_input")
											.val());
								}

							});

					/* 배송비 결정 */
					if (totalPrice >= 30000) {
						deliveryPrice = 0;
					} else if (totalPrice == 0) {
						deliveryPrice = 0;
					} else {
						deliveryPrice = 3000;
					}

					finalTotalPrice = totalPrice + deliveryPrice;

					/* ※ 세자리 컴마 Javscript Number 객체의 toLocaleString() */

					// 총 가격
					$(".totalPrice_span").text(totalPrice.toLocaleString());
					// 총 갯수
					$(".totalCount_span").text(totalCount);
					// 총 종류
					$(".totalKind_span").text(totalKind);
					// 총 마일리지
					$(".totalPoint_span").text(totalPoint.toLocaleString());
					// 배송비
					$(".delivery_price").text(deliveryPrice);
					// 최종 가격(총 가격 + 배송비)
					$(".finalTotalPrice_span").text(
							finalTotalPrice.toLocaleString());
				}

				/* 수량버튼 */
				$(".plus_btn").on("click", function() {
					let quantity = $(this).parent("div").find("input").val();
					$(this).parent("div").find("input").val(++quantity);
				});
				$(".minus_btn").on("click", function() {
					let quantity = $(this).parent("div").find("input").val();
					if (quantity > 1) {
						$(this).parent("div").find("input").val(--quantity);
					}
				});

				/* 수량 수정 버튼 */
				$(".quantity_modify_btn").on("click", function() {
					let cpno = $(this).data("cpno");
					let amount = $(this).parent("td").find("input").val();
					$(".update_cpno").val(cpno);
					$(".update_amount").val(amount);
					$(".quantity_update_form").submit();

				});

				/* 장바구니 삭제 버튼 */
				$(".delete_btn").on("click", function(e) {
					e.preventDefault();
					const cpno = $(this).data("cpno");
					$(".delete_cpno").val(cpno);
					$(".quantity_delete_form").submit();
				});

				/* 주문 페이지 이동 */
				$(".order_btn")
						.on(
								"click",
								function() {

									let form_contents = '';
									let orderNumber = 0;

									$(".cart_info_td")
											.each(
													function(index, element) {

														if ($(element)
																.find(
																		".individual_cart_checkbox")
																.is(":checked") === true) { //체크여부

															let pno = $(element)
																	.find(
																			".individual_pno_input")
																	.val();
															let amount = $(
																	element)
																	.find(
																			".individual_amount_input")
																	.val();

															let pno_input = "<input name='orders[" + orderNumber + "].pno' type='hidden' value='" + pno + "'>";
															form_contents += pno_input;

															let amount_input = "<input name='orders[" + orderNumber + "].amount' type='hidden' value='" + amount + "'>";
															form_contents += amount_input;

															orderNumber += 1;

														}
													});

									$(".order_form").html(form_contents);
									$(".order_form").submit();

								});
			</script>
		</div>
	</div>

</body>
</html>