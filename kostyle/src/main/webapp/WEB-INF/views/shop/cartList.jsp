<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>aa</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"
></script>
<div class="container" style="text-align: center">
	<!-- 센터 말고 컨테이너만 넣으면 왼쪽 줄 맞춰서 됨 -->

	<div class="row">
		<div align="center" class="col-md-12">
			<!--주문 form 시작===================  -->
			<form name="orderF" id="orderF" action="order" method="post">
				<table class="table table-condensed">
					<thead>
						<tr class="default">
							<th colspan="6" style="text-align: center">
								<h3 class="text-primary">${member.name}[${member.mno}]님의
									장바구니</h3>
							</th>
						</tr>
						<tr>
							<th><lable for="allChk"> <input type="checkbox"
									name="allChk" id="allChk"
								> 번호 </lable></th>
							<th>상품명</th>
							<th>수량</th>
							<th>단가</th>
							<th>금액</th>
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
										<a href="../prodDetail?pno=${cart.pno}" target="_blank"> <%--          <img src="../product_images/${cart.pimage1}" width="100"> --%>
										</a> <br> ${cart.name}
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
									<td>
										<fmt:formatNumber value="${cart.price * cart.amount}"
											pattern="###,###"
										/>
										원<br> ${cart.point} POINT
									</td>
									<td>
										<fmt:formatNumber value="${cart.price * cart.amount}"
											pattern="###,###"
										/>
										원 <br>총 ${(cart.price * cart.amount) * 0.05} POINT
									</td>
									<td>
										<a href="javascript:goDel('${cart.cpno}')">삭제</a>
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<!-- --------------------------- -->
						<tr>
<!-- 							<td colspan="4"> -->
<%-- 								<b>장바구니 총액</b>: <span style="color: blue"><b> <fmt:formatNumber --%>
<%-- 											value="${cart.price * cart.amount}" var="totalPrice" --%>
<%-- 											pattern="###,###" --%>
<%-- 										/>원 ${cart.price * cart.amount} POINT --%>
<!-- 								</b> </span><br> <b>총 포인트</b>: <span style="color: red"><b> -->
<%-- 										<fmt:formatNumber value="${cart.price * cart.amount * 0.05}" --%>
<%-- 											var="totalPoint" pattern="###,###" --%>
<%-- 										/> ${cart.price * cart.amount * 0.05} POINT --%>
<!-- 								</b> </span> -->
<!-- 							</td> -->
							<td colspan="2">
								<button type="button" onclick="goOrder()"
									class="btn btn-primary"
								>주문하기</button>
								<button type="button" onclick="history.go(-2)"
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
<script>
	$(function(){
		$('#allChk').click(function(){
			let chkList=$('input[name="pno"]')
			if($(this).is(":checked")){
				chkList.each(function(i, ck){
					ck.checked=true;
				})
			}else{
				chkList.each(function(i, ck){
					ck.checked=false;
			})
			}
		})
	}) // $() end-------
	
	// 체크박스에 체크한 상품정보(상품번호-pno, 수량-amount)를 가지고 주문폼 페이지로 이동
function goOrder(){
		let chk=orderF.pno; // $('input[name="opnum"]')
		if(chk==null) return;
		// alert(chk.length)
		// 체크박스 1개일 때는 length 속성이 안먹음
		if(!chk.length){
			// 체크박스가 한개 있다면 => checkbox 객체
			if(!chk.checked){
				alert('주문할 상품을 체크하세요')
				chk.focus();
				return;
			}
		}else{
			// 체크박스가 여러개 있다면 => check배열
			let cnt=0;
			for(let i=0; i<chk.length; i++){
				if(!chk[i].checked){
					cnt++; // 체크 안 된 체크박스 개수 세기
					// 체크 안 된 상품이 있다면
					// 해당 상품의 수량이 서버에 전송되지 않도록 해야함.
					$('#amount'+ i).prop('disabled', true)
				}else{
					$('#amount'+ i).prop('disabled', false)
				}
			}// for--
			if(cnt == chk.length){
				alert('주문할 상품을 체크해야해요!');
				$('#amount'+ i).prop('disabled', false)
				return;
			}
		}//else--
		orderF.method='post';
		orderF.submit();
	}

	function goEdit(cpno, index){
		 //alert(index)
		 let amount=$('#amount'+index).val()
		 //alert(amount);
		 
		 editF.cpno.value=cpno;
		 editF.amount.value=amount;
		 editF.submit();
	}//--------------

	function goDel(cpno){
		//alert(cpno);
		let yn = confirm("정말 삭제하실건가요..?")
		if (yn){
			location.href="cartDel?cpno="+cpno;
		}
	}
</script>