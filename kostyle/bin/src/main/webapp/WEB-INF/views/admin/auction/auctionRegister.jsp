<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>KoStyle4U</title>
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/adminHeader.js"></script>
<link href="/resources/css/header.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet" />

</head>
<body>
	<%@ include file="/WEB-INF/views/include/adminHeader.jsp"%>
	<form id=register-form class="form-horizonal">
	<div class="form-inline form-group">
			<label for="name">상품명</label>
		<input id="name" name="name" class="form-control">
	</div>
	
	<div id="img-result">
	</div>
	
	
	<div class="form-inline form-group">
		<label for="uploadFile">파일</label>
		<input id="uploadFile" name="uploadFile" type="file" accept="image/*" class="form-control" onchange="setThumbnail(event)" multiple>
	</div>
	
	
	
	<div class="form-inline form-group">
		<label for="start_price">입찰시작가</label>
		<input id="name" name="start_price" class="form-control">
		
	</div>
	<div class="form-inline form-group">
		<label for="bid_unit">입찰단위</label>
		<input id="name" name="bid_unit" class="form-control">
	</div>


		<button id="register-btn" type="button" class="btn btn-primary">상품등록</button>
		<a href="/admin/auctions" class="btn btn-secondary">목록으로</a>
	</form>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	
<script src="/resources/js/auctionService.js"></script>
<script>
function setThumbnail(event) {
 var reader = new FileReader();

		 reader.onload = function(event) {
		   		var img = document.createElement("img");
		   		img.setAttribute("src", event.target.result)
		   		$("#img-result").empty();
		    	document.querySelector("div#img-result").appendChild(img);
		 };

     reader.readAsDataURL(event.target.files[0]);
 }

		$(document).ready(function(){

			
			var form = $('#register-form');
			
			$('#register-btn').on('click', function(){
				
				var formData = new FormData();					// 가상의 폼 데이터
				var inputFile = form.find("input[name='uploadFile']");	// 얘네들을 담아서 보낸다.
				console.log(inputFile)
				var files = inputFile[0].files;					// name 이 uploadFile 인 input 태그의 첫번째 요소에 담겨있는 파일들
				// console.log(files);

				for (var i = 0; i < files.length; i++) {
					formData.append("uploadFile", files[i]);	// 폼데이터에 데이터 추가
				}
				
				$.ajax({
					url: '/admin/auctions/upload',
					processData: false,		// 반드시 false
					contentType: false,		// 너도 반드시 false
					data: formData,
						type: 'post',
                    dataType: 'json',
						success: function (result) {
							alert("Uploaded");
                            console.log(result);
            				var auction = {
            	                    "name": form.find("input[name='name']").val(),
            	                    "start_price": form.find("input[name='start_price']").val(),
            	                    "bid_unit": form.find("input[name='bid_unit']").val(),
            	                    "imgs" : result
            				}
            				auctionService.register(auction, function(result){
            					alert('상품 등록이 완료되었습니다.');
            					self.location="/admin/auctions";
            				})

					}
				}); //$.ajax

				

			})
			
			
		})
	</script>
</body>
</html>
