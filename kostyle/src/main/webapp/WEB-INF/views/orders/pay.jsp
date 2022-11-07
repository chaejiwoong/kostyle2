<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <head>
        <title>KoStyle4U</title>
        <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
        <script type="text/javascript" src="/resources/js/header.js"></script>
        
        
        <link href="/resources/css/header.css" rel="stylesheet"/>
        <link href="/resources/css/footer.css" rel="stylesheet"/>
		
		<!-- 모달창 스크립트 -->
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        
        
<style>


.order-title{
	text-align: center;
    font-size : 25px;
    margin: 30px;
    font-weight:bold;
    margin-bottom: 50px;
}

label{
	width:100px;
}

.address-section{
/*  	display:flex;
	justify-content:center;  */ 
	margin:0 auto;
}

.detail-section{
/* 	margin:0 auto;
	text-align:center; */
	vertical-align: middle;

}

#address-info{
	width:300px;
}

/* modal */
dl{
	margin: 10px;
	padding:10px;
}

dl:hover{
	background: #fff7f9;
}
.is_default{
	width:20px;
}
#Y{
	margin-right:50px;
}

#register-btn{
    color:white;
    display: inline-block;
    padding: 6px 12px;
	line-height: 1.42857143;    	
	border-radius: 4px;        	
    width:80px;
    margin-bottom:10px;
    font-size:15px;
    font-weight:bold;
    background-color:#f891aa;
    border:1px solid #ebebeb;
    margin-right: 30px;
    margin-left: 100px;
    cursor: pointer;
}

#cancel-btn{
	width:80px;
    display: inline-block;
    padding: 6px 12px;
	line-height: 1.42857143;    	
	border-radius: 4px;        	
    width:80px;
    margin-bottom:10px;
    font-size:15px;
    font-weight:bold;
    border:1px solid #ebebeb;
    cursor: pointer;
}
</style>
    </head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<div class="container">
    <h1 class="order-title">주문 신청</h1>
    
    	<div class="address-section">
            <form id="address-form" class="form-horizontal">
            <input id="ano" name="ano" type="hidden" value="${address.ano }">
            <div class="form-inline form-group">
                <label for="name">배송지명</label>
                <input type="text" id="name" name="name" class="form-control" value="${address.name }" readonly>
            </div>
            
            <div class="form-inline form-group">
                <label for="address-num">배송지 주소</label>
                <input type="text" id="address-num" name="address-num" class="form-control" style="width:100px;" readonly>
                <button id="changeAddress" type="button" class="btn btn-secondary">배송지변경</button>
                <button id="registerAddress" type="button" class="btn btn-secondary">배송지추가</button>
            </div>
            
            <div class="form-inline form-group">
                <label for="address-info"></label>
                <input type="text" id="address-info" name="address-info" class="form-control" readonly>
                <input type="text" id="address-detail" name="address-detail" class="form-control" readonly>
            </div>
            
            <div class="form-inline form-group">

                
            </div>
            
                                                
            <div class="form-inline form-group">
                <label for="tel">휴대폰번호</label>
                <input id="tel" type="text" name="tel" class="form-control"  readonly>
                <label for="recipient">수령인</label>
                <input id="recipient" type="text" class="form-control" name="recipient" value="${address.recipient }" readonly>
            </div>
            <div class="form-inline form-group">

            </div>
        </form>    	

    </div>
    <div class="detail-section">
        <div class="row">
        	<span class="col-md-2">이미지</span>
         	<span class="col-md-2">상품명</span>
         	<span class="col-md-2">사이즈</span>
          	<span class="col-md-2">수량</span>
        	<span class="col-md-2">가격</span>
		</div>
		<c:forEach items="${details }" var="detail">
			<div class="row">
				<span class="col-md-2"><img data-filepath ="${detail.product.img.filepath}"class="thumb" src='' data-uuid="${detail.product.img.uuid}" data-filename="${detail.product.img.filename}"
							style="width: 100px; height: 100px;"></span>
				<span class="col-md-2">${detail.product.name }</span>
				<span class="col-md-2">${detail.p_size }</span>
				<span class="col-md-2">${detail.amount }</span>
				<fmt:formatNumber var="price" value="${detail.price}" type="number"/>
				<span class="col-md-2 price">${price }</span>
			</div>
		</c:forEach>

    </div>
    
    <div class="total-section">
    <h1>결제정보</h1>
    	<form class="form-horizonal">
    		<div id="sub-total">주문 금액 : </div>
    		<div id="delivery-price">배송비 : </div>
    		<div id="accumulate-point">적립 포인트 : </div>
    		<div class="form-inline form-group">
    			<label>포인트</label>
    			<input id="point" type="text" class="form-control" value="0">
    			<button id="useAll" type="button" class="btn btn-default">전액 사용</button>
    			<span>(사용가능한 포인트 : </span>
    			<fmt:formatNumber var="point" value="${member.point}" type="number"/>
    			<span id="availablePoint">${point}</span>
    			<span>)</span>
    		</div>
    		<div id="total">결제 금액 : </div>
    	</form>
    </div>

	<div class="pay-section">
		<h1>결제수단</h1>
    	<form class="form-horizonal">
    		<div class="form-inline form-group"> 	
    			<label>포인트</label>    
    			<input type="radio" name="pay" value="point" checked>
    			<label>신용카드</label>
    			<input type="radio" name="pay" value="card">
    		</div>
    		<div id="card" hidden="hidden">
    			<div class="form-inline form-group">
    				<label for="cardCategory">카드종류</label>
    				<select id="cardCategory" class="form-control">
    					<option value="KB국민카드">KB국민카드</option>
    					<option value="신한카드">신한카드</option>
	    				<option value="하나카드">하나카드</option>
    					<option value="롯데카드">롯데카드</option>
    					<option value="BC카드">BC카드</option>
    					<option value="NH농협카드">NH농협카드</option>
    					<option value="삼성카드">삼성카드</option>
    					<option value="현대카드">현대카드</option>
    				</select>
    				<label for="installment">할부개월</label>
    				<select id="Installment" class="form-control">
    					<option value="1">일시불</option>
	    				<option value="2">2개월</option>
    					<option value="3">3개월</option>
    					<option value="6">6개월</option>
    					<option value="12">12개월</option>
    				</select>      		 		
    				
    			</div>
  				<div class="form-inline form-group">
  				<label for="card-num">카드번호</label>
    				<input id="card-num" name="card-num" type="text" class="form-control" style="width:60px" maxlength='4'> - <input type="text" name="card-num" class="form-control" style="width:60px" maxlength='4'> - <input type="text" name="card-num" class="form-control" style="width:60px" maxlength='4'> - <input type="text" name="card-num" class="form-control" style="width:60px" maxlength='4'>
  				</div>
    		</div>
    		
    		<div class="form-inline form-group">
    			<button id="order-btn" type="button" class="btn btn-primary">주문하기</button>
    			<button id="orderCancel-btn" type="button" class="btn btn-default">주문취소</button>    		
    		</div>
    	</form>		
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">내 배송지 목록</h4>
      </div>
      <div class="modal-body">
		
      </div>
      <div class="modal-footer">
      </div>          
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
</div>
<%-- <%@ include file="/WEB-INF/views/include/footer.jsp"%> --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
var display = (function loadThumbnail() {
	var uploadResultArr = $('.thumb');
	
	$(uploadResultArr).each(function (i, obj) {
		//섬네일 파일을 불러오기 위한 경로
		var fileCallPath = encodeURIComponent($(obj).data('filepath') + "/" + $(obj).data('uuid') + "_" + $(obj).data('filename'));
		// 섬네일 눌렀을 때 원본 파일 호출해서 보여주기
		$(obj).attr('src',"/commons/display?fileName=" + fileCallPath);
		})
	})();

$(document).ready(function(){
	

	
	
	var total = 0;
	var delivery = 0;

	// 결제 금액 계산
	var calcPrice = (function changeEvent() {
		
		var subTotal = document.querySelector("#sub-total");
		var deliveryPrice = document.querySelector("#delivery-price");
		var totalPrice = document.querySelector("#total");
		

		var list = $('.price')
				
			    
		 $.each(list, function(index, item){
			 total += parseInt($(item).text().replaceAll(",",""));
		 })
		 
		if(total < 30000){
			delivery=3000;
		}
		deliveryPrice.innerText = "배송비 :" + parseInt(delivery) + "원";
		
		totalPrice.innerText=  "결제금액 : "+(parseInt(total + delivery)).toLocaleString()+ "원";		 
		$('#accumulate-point').text("적립 포인트 : " + Math.ceil(total/20).toLocaleString() + "포인트")		
		subTotal.innerText = "주문 금액:" +total.toLocaleString()+"원";

		})();

	
	// 전액 사용 버튼 클릭
	$('#useAll').on('click', function(e){
		e.preventDefault();
		
		if(total + delivery <= ${member.point}){
			$('#point').val(total+delivery)
		}else{
			$('#point').val(${member.point})
		}
		
		$("#total").text("결제금액 : "+(parseInt(total) + parseInt(delivery) - parseInt($('#point').val())).toLocaleString()+ "원")
	})
	
	$('#point').on('change', function(e){
		e.preventDefault();
		var pattern=new RegExp('[0-9]+')
		
		// 포인트 값 숫자 검증
		if(!pattern.test($(this).val) || $(this).val() < 0){
			alert("포인트는 숫자만 입력 가능합니다.")
			$(this).val("")
			return false;
		}
		
		var point = $(this).val()
		console.log()
		console.log(delivery)
		console.log(point)
		
		$("#total").text("결제금액 : "+(parseInt(total) + parseInt(delivery) - parseInt(point)).toLocaleString()+ "원")
	})

	
	function getAddress(ano){
    	$.ajax({
    		url: "/members/address/ajax/" + ano,
    		type:'get',
    		success: function(result){
    			
    			$('#ano').val(result.ano);
    			
    			$('#name').val(result.name);
    			
    			$('#recipient').val(result.recipient);
    			
    			
    			$('#tel').val(result.tel)
    			
    			var address = result.address;
    			$('#address-num').val(address.substr(1, 5));
    			console.log(address)

    			$('#address-info').val(address.split('/')[0].substr(7));
    			$('#address-detail').val(address.split('/')[1]);

    		}
    	})
	}
	
	
	// 변환해서 폼에 데이터 넣기
	var tel = '<c:out value="${address.tel}"/>';
	$('#tel').val(tel)
	
	var address = '<c:out value="${address.address}"/>';
	$('#address-num').val(address.substr(1, 5));
	console.log(address)

	$('#address-info').val(address.split('/')[0].substr(7));
	$('#address-detail').val(address.split('/')[1]);
	
	// 우편번호 조회
	$(document).on('click', '#findAddress', function(e){
		e.preventDefault();
	    new daum.Postcode({
	        oncomplete: function(data) {

	            $('#modalAddress-num').val(data.zonecode).attr('readonly',true);
	            $('#modalAddress-info').val(data.address).attr('readonly',true);
	        }
	    }).open();
	})

	
    var modal = $(".modal");


    
    // 배송지 변경
    $("#changeAddress").on("click", function (e) {

	// 모달 보여주기
	  $('.modal-title').val("내 배송지 목록")
	  $('.modal-body').empty();
      $(".modal").modal("show");
      
      $.ajax({
    	url:"/members/address/ajax",
    	type:'get',
    	success:function(result){
    		
    		console.log(result)
    		
    		$('.modal-body').append("<ul>");
    		

    		$.each(result, function(index, item){
    			var str = "<dl>" +
    			"<dt>" + item.recipient + "</dt>" + 
    			"<dd>" + item.tel + "</dd>" + 	
    			"<dd>" + item.address + "</dd>" + 
				'<dd><button class="btn btn-default addressDetail" type="button" style="margin-top:10px;" data-ano="' + item.ano +'">선택</button></dd>'
				"</dl>" + 

    			$('.modal-body').append(str);
    		})
    		
    		$('.modal-body').append("</ul>");
    	}
      })

    });
    
    // 모달 창 닫기
    $(document).on("click","#cancel-btn",function(e){

		modal.modal('hide')

    })
    
    // 배송지 추가 선택
    $('#registerAddress').on('click', function(e){
    	// 모달 보여주기
  	  	$('.modal-title').val("내 배송지 목록")
  	 	$('.modal-body').empty();
        $(".modal").modal("show");
        
        var str = '<div class="form-inline form-group">'+
            '<label for="modalName">배송지명</label>' +
            '<input type="text" id="modalName" name="modalName" class="form-control">' +
        '</div>' +     
        '<div class="form-inline form-group">' +
            '<label for="modalAddress-num">배송지 주소</label>' +
            '<input type="text" id="modalAddress-num" name="modalAddress-num" class="form-control" style="width:100px; margin-right:20px;">' +
            '<button id="findAddress" type="button" class="btn btn-secondary">우편번호</button>' +
        '</div>' +     
        '<div class="form-inline form-group">' +
            '<label for="modalAddress-info"></label>' +
            '<input type="text" id="modalAddress-info" name="modalAddress-info" class="form-control" style="width:300px;">' +
        '</div>' +
        '<div class="form-inline form-group">' +
        	'<label for="modalAddress-detail"></label>' +
        	'<input type="text" id="modalAddress-detail" name="modalAddress-detail" class="form-control" style="width:300px;" placeholder="상세주소를 입력하세요.">' +
    	'</div>' +                                          
        '<div class="form-inline form-group">' +
            '<label for="modalTel">휴대폰번호</label>' +
            '<input id="modalTel" type="text" name="modalTel" class="form-control" placeholder="- 빼고 입력" >' +
        '</div>' +
        '<div class="form-inline form-group">' +
        	'<label for="modalRecipient">수령인</label>' +
        	'<input id="modalRecipient" type="text" class="form-control" name="modalRecipient">' +
        '</div>' +
             '<div class="form-inline form-group">' +
        	'<label>기본배송지</label>' +
        	'<label for="Y" class="is_default">Y</label>' +
        	'<input id="Y" type="radio"  name="is_default" value="1" checked>' +
        	'<label for="N" class="is_default">N</label>' +
        	'<input id="N" type="radio"  name="is_default" value="0">' +
        '</div>' +            
   		'<div class="form-group form-inline">' +
            '<button id="register-btn" type="button">등록</button>' +
        	'<button id="cancel-btn" class="btn-secondary" type="button">취소</button>' +
        '</div>'   
        $('.modal-body').append(str)
        
    })
    
    $(document).on('click', '#register-btn', function(e){
    	e.preventDefault();
    	
		var address = {
				name : $('#modalName').val(),
				address : "[" + $('#modalAddress-num').val() +"]" + $('#modalAddress-info').val() + "/" + $('#modalAddress-detail').val(),
				tel : $('#modalTel').val().substr(0,3) + "-" + $('#modalTel').val().substr(3,4) + "-" + $('#modalTel').val().substr(7),
				recipient : $('#modalRecipient').val(),
				is_default: $('input[name="is_default"]:checked').val()==1?true:false
		}
		
		$.ajax({
			url:"/members/address/register",
			type:'post',
			data: JSON.stringify(address),
			contentType: 'application/json; charset=UTF-8',
			success: function(result){
				console.log(result)
				alert('배송지 등록이 완료되었습니다.')
				getAddress(result);
				modal.modal('hide')
			}
		})
    })
    
    // 배송지 선택
    $(document).on("click",".addressDetail",function(e){
    	e.preventDefault();
    	var ano = $(this).data('ano')
    	getAddress(ano);
		modal.modal('hide')

    })
    
    // 결제수단 포인트
    $('input[name="pay"]').on('click', function(){
    	if($(this).val() == "card"){
    		$('#card').show();
    	}else{
    		$('#card').hide();
    	}
    })
    
    // 주문버튼
    $('#order-btn').on('click', function(e){
    	e.preventDefault();
    	
    	// 카드번호 렌더링
    	var cardNum= $('input[name="card-num"]');
    	var number = "";
    	$.each(cardNum, function(index, item){
    		number += $(item).val();
    		if(index < 3){
        		number += "-";
    		}

    	})
		// orderDetails 생성
		var orderDetails = new Array();
		<c:forEach items="${details}" var="detail">
			orderDetails.push({p_size: "${detail.p_size}", amount: "${detail.amount}", price: "${detail.price}", pno:${detail.product.pno}});
		</c:forEach>
    	
    	var testString = $('#accumulate-point').text();	// 원래 문자열
		var regex = /[^0-9]/g;				// 숫자가 아닌 문자열을 선택하는 정규식
		var accumulate = testString.replace(regex, "");	// 원래 문자열에서 숫자가 아닌 모든 문자열을 빈 문자로 변경
		console.log(accumulate);				// 결과 출력
		
		
    	var orderRequest = {
    			pay: $('input[name="pay"]:checked').val(),
    			ano: $('#ano').val(),
    			point: $('#point').val(),
    			accumulate: accumulate,
    			card:{
    				category: $('#cardCategory').val(),
    				month: $('#Installment').val(),
    				cardNum : number
    			},
    			orderDetails : orderDetails
    	}
    	
    	
    	
    	$.ajax({
    		url:"/orders/pay",
    		type:"post",
    		data: JSON.stringify(orderRequest),
    		contentType:"application/json; charset=UTF-8",
    		success:function(result){
    			alert("주문이 완료되었습니다.")
    			self.location="/orders"
    		},error: function(xhr){
    			alert(xhr.responseJSON.message)
    		}
    	})
    })
   

})


</script>
</body>
</html>