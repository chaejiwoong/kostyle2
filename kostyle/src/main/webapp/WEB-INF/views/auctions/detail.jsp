<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>KoStyle4U</title>
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/adminHeader.js"></script>
<link href="/resources/css/header.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet" />
<style>

h1{
margin-top: 25px;
margin-bottom: 25px;
font-size: 30px;
font-weight: bold;
 text-align: center;
        }
        
 .selectBox{
	text-align: center;
}
.paging {
	text-align: center;
}

.detail-section{
	display:flex;
	justify-content: center;
}

label{
	width: 100px;
}

        button{
            margin: 20px;
        }
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<h1>관리자 경매 상세</h1>
	<div class="container">
	<div class="detail-section">
	        <form id="auction-form" class="form-horizontal">
            <div class="form-inline form-group">
                <label for="apno">경매상품번호</label>
                <input type="text" id="apno" name="apno" class="form-control" value="${auction.apno}" readonly/><br>
            </div>
            
            <div class="form-inline form-group">
                <label for="name">상품명</label>
                <input type="text" id="name" name="name" class="form-control" value="${auction.name}" readonly/><br>
            </div>
         	<div class="form-inline form-group">
         	    <label>상품 이미지</label>
            	<div class="img-result">
            	    <img data-filepath ="${auction.imgs[0].filepath}"class="thumb" src='' data-uuid="${auction.imgs[0].uuid}"
            	 data-filename="${auction.imgs[0].filename}" style="width:300px; height:200px;">
            	</div>        	
         	</div>

            
            <div id="img-div" class="form-inline form-group" hidden>
				<label for="uploadFile">이미지</label>
				<input  id="uploadFile" name="uploadFile" type="file" accept="image/*" class="form-control" onchange="setThumbnail(event)" multiple>
			</div>
            
            <div class="form-inline form-group">
                <label for="start_price">입찰시작가</label>
                <input type="text" id="start_price" name="start_price" class="form-control" value="${auction.start_price}" readonly/><br>
            </div>
            
            <div class="form-inline form-group">
                <label for="best_bid_price">최고입찰가</label>
                <input type="text" id="best_bid_price" name="best_bid_price" class="form-control" value="${auction.best_bid_price}" readonly/><br>
            </div>

            <div class="form-inline form-group">
                <label for="bid_unit">경매입찰단위</label>
                <input type="text" id="bid_unit" name="bid_unit" class="form-control" value="${auction.bid_unit}" readonly/><br>
            </div>

            <div class="form-inline form-group">
                <label for="start_date">경매시작일자</label>
                <input type="text" id="start_date" name="start_date" class="form-control" value="<fmt:formatDate pattern="yyyy-MM-dd/HH-mm-ss" value="${auction.start_date}" />" readonly/><br>
            </div>
            <div class="form-inline form-group">
                <label for="end_date">경매종료일자</label>
                <input type="text" id="end_date" name="end_date" class="form-control" value="<fmt:formatDate pattern="yyyy-MM-dd/HH-mm-ss" value="${auction.end_date}" />" readonly/><br>
            </div>
            <div class="form-inline form-group">
                <label for="bid-price">입찰금액</label>
                <input type="text" id="bid-price" name="bid-price" class="form-control"/><br>
            </div>
            <div class="form-inline form-group">
                <button type="button" class="btn btn-primary" id="bid-btn">입찰하기</button>
                <button type="button" class="btn btn-secondary" id="prev-btn">목록으로</button>
            </div>
        </form>
		
	</div>
	<h1>최근 입찰내역</h1>
		<table class="table">
		<thead>
			<tr>
				<th>랭킹</th>
				<th>이메일</th>
				<th>입찰가격</th>
				<th>입찰일자</th>
			</tr>
		</thead>

		<c:forEach items="${bids}" var="bid">
			<tr>
				<td><c:out value="${bid.rank}" /></td>
				<td><c:out value="${bid.email}" /></td>
				<td><c:out value="${bid.price}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${bid.created_date}" /></td>
			</tr>
		</c:forEach>

	</table>
		
	</div>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script src="/resources/js/auctionService.js"></script>
<script>
function setThumbnail(event) {
	 var reader = new FileReader();

	 reader.onload = function(event) {
	   		var img = document.createElement("img");
	   		img.setAttribute("src", event.target.result)
	   		img.setAttribute("style", "width:300px; height:200px")
	   		$(".img-result").empty();
	    	document.querySelector("div.img-result").appendChild(img);
	 };

reader.readAsDataURL(event.target.files[0]);
}

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
		
		var form = $("#auction-form")
		
		$('#bid-btn').on('click', function(e){
			e.preventDefault();
			
			var price= parseInt($('#bid-price').val())
			var bestBidPrice = parseInt($('#best_bid_price').val())
			var bidUnit = parseInt($('#bid_unit').val())
			
			// 자바에서 받아온 Date를 js Date 객체로 변환
			var endDate = $('#end_date').val()
			endDate = new Date(endDate.split("/")[0]+ " " + endDate.split("/")[1].replaceAll("-",":"))

			var now = new Date()
			console.log(now)
			console.log(endDate)
			console.log(price)
			console.log(bestBidPrice)

			// 입찰금액 검증, 입찰단위 검증, 입찰시간 검증
			if(price <= bestBidPrice){
				alert("입찰금액은 최고입찰가보다 커야 합니다.");
				return false;
			}else if((price - bestBidPrice) % bidUnit != 0 ){
				alert("입찰은 " + bidUnit + "포인트 단위로 가능합니다.");
				return false;
			}else if(now > endDate){
				alert("입찰이 마감된 상품입니다.")
				return false;
			}
			
			var bid = {
					'apno': $('#apno').val(),
					'price': price
			}
			
			$.ajax({
				url:"/bids/" + ${auction.apno},
				type:'post',
				data:JSON.stringify(bid),
                contentType : "application/json; charset=UTF-8",
                success: function (result, status, xhr) {
                	console.log(result.message)
                	if(result.message == undefined){
                		alert('로그인이 필요한 서비스입니다.')
                		self.location="/auth/login"
                	}else{
     					alert("입찰이 완료되었습니다.")
    					self.location = "/auctions/" + ${auction.apno}
                	}

                },error:function(xhr){
                	alert(xhr.responseJSON.message)
                }
			})
			
		})
		
		$('#prev-btn').on('click', function(e){
			e.preventDefault()
			
			self.location="/auctions"
		})

	})
</script>
</body>
</html>
