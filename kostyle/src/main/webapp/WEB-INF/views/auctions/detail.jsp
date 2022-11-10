<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>Title</title>
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<link href="/resources/vendor/bootstrap/css/styles.css" rel="stylesheet">
<link href="/resources/css/header.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet" />



</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>



        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6">
                    <img class="card-img-top mb-5 mb-md-0" >
                    	<div id="uploadReslut">				
                    <img data-filepath ="${auction.imgs[0].filepath}"class="thumb" src='' data-uuid="${auction.imgs[0].uuid}"
            	 data-filename="${auction.imgs[0].filename}" style="width:400px; height:550px;">				
						</div>
                    </div>
            <div id="img-div" class="form-inline form-group" hidden>
				<label for="uploadFile">이미지</label>
				<input  id="uploadFile" name="uploadFile" type="file" accept="image/*" class="form-control" onchange="setThumbnail(event)" multiple>
			</div>
            
                    
                    
                    <div class="col-md-6">
                        <div class="small mb-1"></div>
                        
                      <input type="text" id="apno" name="apno" class="form-control" hidden ="hidden" value="${auction.apno}" readonly/><h1 class="display-5 fw-bolder" >NO.${auction.apno}</h1> <br> 
                        <div class="fs-5 mb-5" name = "name"> 
                           <label for="start_price">상품명</label>
                        <input type="text" id="name" name="name" class="form-control" value="${auction.name}" readonly/> 
                        </div>
                        <div class="fs-5 mb-5" name = "start_price"> 
                           <label for="start_price">입찰시작가</label>
                           <fmt:formatNumber var="start_price" value="${auction.start_price}" type="number"/>
                <input type="text" id="start_price" name="start_price" class="form-control" value="${start_price}" readonly/>
                        </div>
                        <div class="fs-5 mb-5" name = "best_bid_price">
                            <label for="best_bid_price">최고입찰가</label>
                            <fmt:formatNumber var="best_bid_price" value="${auction.best_bid_price}" type="number"/>
                <input type="text" id="best_bid_price" name="best_bid_price" class="form-control" value="${best_bid_price}" readonly/>
                        </div>
                        <div class="fs-5 mb-5" name = "bid_unit">
                           <label for="bid_unit">경매입찰단위</label>
                           <fmt:formatNumber var="bid_unit" value="${auction.bid_unit}" type="number"/>
                <input type="text" id="bid_unit" name="bid_unit" class="form-control" value="${bid_unit}" readonly/>
                        </div>
                          <div class="fs-5 mb-5" name = "start_date">
                            <label for="start_date">경매시작일자</label>
                <input type="text" id="start_date" name="start_date" class="form-control" value="<fmt:formatDate pattern="yyyy-MM-dd/HH-mm-ss" value="${auction.start_date}" />" readonly/>
                        </div>
                        <div class="fs-5 mb-5"name="end_date" >
                           <label for="end_date">경매종료일자</label>
                <input type="text" id="end_date" name="end_date" class="form-control" value="<fmt:formatDate pattern="yyyy-MM-dd/HH-mm-ss" value="${auction.end_date}" />" readonly/>
                        </div>
                          <div class="fs-5 mb-5" name="bid-price" >
                           <label for="bid-price">입찰금액</label>
                <input type="text" id="bid-price" name="bid-price" class="form-control"/><br>
                        </div>
                        
                        
							
                        <div class="d-flex">
                        <button type="button" class="btn btn-primary" id="bid-btn">입찰하기</button>
                <button type="button" class="btn btn-secondary" id="prev-btn">목록으로</button>
                        </div>
                       <br>
                       
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
				<fmt:formatNumber var="price2" value="${bid.price}" type="number"/>
				<td><c:out value="${price2}" /></td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${bid.created_date}" /></td>
			</tr>
		</c:forEach>

	</table>

                    </div>
                </div>
            </div>
        </section>
        
       
      
        

            

            

            
            
            
<%@ include file="/WEB-INF/views/include/footer.jsp"%>            
            
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
