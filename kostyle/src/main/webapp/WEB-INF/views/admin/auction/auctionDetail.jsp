<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>KoStyle4U</title>
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/adminHeader.js"></script>
<script type="text/javascript" src="/resources/js/customerCenter.js"></script>
<link href="/resources/css/adminHeader.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet" />

<style>


#wrap {
    min-height: 100%;
    position: relative;
    padding-bottom: 100px;
}

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
<div id="wrap">
<%@ include file="/WEB-INF/views/include/adminHeader.jsp"%>

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
                <button type="button" class="btn btn-primary" id="update-btn">수정</button>
                <button type="button" class="btn btn-primary" id="completion-btn">완료</button>
                <button type="button" class="btn btn-secondary" id="prev-btn">이전</button>
                <button type="button" class="btn btn-danger" id="delete-btn">삭제</button>
            </div>
        </form>
		
	</div>

		
	</div>

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
		
		$('#completion-btn').hide();
		
        $('#update-btn').on('click', function () {
            $(form.find("input[name='name']")).attr('readonly', false);
            $(form.find("input[name='bid_unit']")).attr('readonly', false);
            $("#img-div").attr('hidden', false);
            $(this).hide();
            $('#completion-btn').show();
        });

        $('#prev-btn').on('click', function () {
            self.location = "/admin/auctions";
        });

        $('#delete-btn').on('click', function () {
            auctionService.deleteAuction(${auction.apno}, function () {
                alert("상품삭제가 완료되었습니다.");
                self.location = "/admin/auctions";
            });
        });
        
        $("#completion-btn").on("click",function(){
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
        						"apno" : form.find("input[name='apno']").val(),
        	                    "name": form.find("input[name='name']").val(),
        	                    "bid_unit": form.find("input[name='bid_unit']").val(),
        	                    "imgs" : result
        				}
        				auctionService.update(auction, function(result){
        					alert('상품 수정이 완료되었습니다.');
        					self.location="/admin/auctions/" + ${auction.apno};
        				})

				}
			}); //$.ajax
        })
	})
</script>
</body>
</html>
