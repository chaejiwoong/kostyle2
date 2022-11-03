<%--
  Created by IntelliJ IDEA.
  User: cowld
  Date: 2022-10-22
  Time: 오전 3:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Title</title>
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
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
        
	.btn-section a{
		margin: 5px;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">
		<div class="row col-md-12"><h1>마감임박 상품</h1></div>
			<div class = "row">		
			<c:forEach items="${auctionDeadlineList}" var="auction">
					<div class="col-md-3">
						<img data-filepath ="${auction.imgs[0].filepath}"class="thumb" src='' data-uuid="${auction.imgs[0].uuid}" data-filename="${auction.imgs[0].filename}"
							style="width: 180px; height: 200px;">
						<div><a href='<c:out value="auctions/${auction.apno}"/>'> <c:out value="상품명 : ${auction.name}" /></a></div>
						<div>최고입찰가 : <c:out value="${auction.best_bid_price}" /></div>
						<div class="btn-section">
							<a class="btn btn-primary" href='<c:out value="/auctions/${auction.apno}"/>'>상세보기</a>
							<c:if test="${auction.attention}">
								<a class="btn btn-default attention" href="/auctions/attention/${auction.apno}">관심해제</a>
							</c:if>
							<c:if test="${!auction.attention}">
								<a class="btn btn-default attention" href="/auctions/attention/${auction.apno}">관심등록</a>
							</c:if>
						</div>
					</div>
		
			</c:forEach>
		</div>
		
		<div class="row col-md-12"><h1>전체 경매 상품</h1></div>
			<div class = "row">		
			<c:forEach items="${auctionProgressList}" var="auction">
					<div class="col-md-3">
						<img data-filepath ="${auction.imgs[0].filepath}"class="thumb" src='' data-uuid="${auction.imgs[0].uuid}" data-filename="${auction.imgs[0].filename}"
							style="width: 180px; height: 200px;">
						<div><c:out value='상품명 : ${auction.name}' /></div>
						<div>최고입찰가 : <c:out value="${auction.best_bid_price}" /></div>
						<div class="btn-section">
							<a class="btn btn-primary" href='<c:out value="/auctions/${auction.apno}"/>'>상세보기</a>
							<c:if test="${auction.attention}">
								<a class="btn btn-default attention" href="/auctions/attention/${auction.apno}">관심해제</a>
							</c:if>
							<c:if test="${!auction.attention}">
								<a class="btn btn-default attention" href="/auctions/attention/${auction.apno}">관심등록</a>
							</c:if>
						</div>				
					</div>
		
			</c:forEach>
		</div>		
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script>
	var display = (function loadThumbnail() {
		var uploadResultArr = $('.thumb');
		
		$(uploadResultArr).each(function (i, obj) {
			//섬네일 파일을 불러오기 위한 경로
			var fileCallPath = encodeURIComponent($(obj).data('filepath') + "/s_" + $(obj).data('uuid') + "_" + $(obj).data('filename'));
			// 섬네일 눌렀을 때 원본 파일 호출해서 보여주기
			$(obj).attr('src',"/commons/display?fileName=" + fileCallPath);
			})
		})();
	
	// 관심등록 버튼 눌렀을 때 관심등록
	$(document).ready(function(){
		$('.attention').on("click", function(e){
			e.preventDefault();
			var btn = $(this)
			
 			$.ajax({
				url:$(this).attr('href'),
				type:'put',
				success:function(data){
					if(btn.text() =='관심등록'){
						btn.text('관심해제')
					}else{
						btn.text('관심등록')
					}					
				},error:function(){
					alert("로그인이 필요한 서비스입니다.");
					self.location="/auth/login";
				}
			})
			

		})
	})
</script>
</body>
</html>
