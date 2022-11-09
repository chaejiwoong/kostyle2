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

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/adminHeader.jsp"%>

	<h1>관리자 경매 목록</h1>
	<div class="container">
			<div class="selectBox">
		<form id='searchForm' class="form-horizontal" action="/admin/auctions" method='get'>
			<div class="form-inline form-group">
				<select class="form-control" name='type'>
					<option value=""
						<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
					<option value="K"
						<c:out value="${pageMaker.cri.type eq 'K'?'selected':''}"/>>경매상품번호</option>
					<option value="N"
						<c:out value="${pageMaker.cri.type eq 'N'?'selected':''}"/>>상품명</option>

				</select>
				<input type='text' id='keyword' name='keyword' class='form-control' value='<c:out value="${pageMaker.cri.keyword}"/>' />
					<button id="search" class='btn btn-default'>Search</button>
					<button id="default" class='btn btn-default'>Default</button>
				
				<span>경매 여부</span>
				<label for="progress">진행</label><input type="radio" id="progress" class="form-control filter" name="filter" value="P"
				<c:out value="${pageMaker.cri.filter eq 'P'?'checked':''}"/>>
				<label for="deadline">마감</label><input type="radio" id="deadline" class="form-control filter" name="filter" value="D"
				<c:out value="${pageMaker.cri.filter eq 'D'?'checked':''}"/>>
			</div>
			
			<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
			<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />

		</form>
		
		
		</div>
		
		<table class="table">
			<thead>
				<tr>
					<th>경매번호</th>
					<th>이미지</th>
					<th>상품명</th>
					<th>입찰시작가</th>
					<th>최고입찰가</th>
					<th>입찰단위</th>
					<th>진행여부</th>
					<th>시작일자</th>
					<th>종료일자</th>
				</tr>
			</thead>

			<c:forEach items="${auctions}" var="auction">
				<tr>
					<td><c:out value="${auction.apno}" /></td>
					<td><img data-filepath ="${auction.imgs[0].filepath}"class="thumb" src='' data-uuid="${auction.imgs[0].uuid}" data-filename="${auction.imgs[0].filename}"></td>
					<td><a href='<c:out value="auctions/${auction.apno}"/>'> <c:out
								value="${auction.name}" /></a></td>
					<td><c:out value="${auction.start_price}" /></td>
					<td><c:out value="${auction.best_bid_price}" /></td>
					<td><c:out value="${auction.bid_unit}" /></td>
					<td><c:out value="${auction.status}" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${auction.start_date}" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${auction.end_date}" /></td>
				</tr>
			</c:forEach>

		</table>
		

		<div class="paging">
	
	
			<ul class="pagination">
			<!-- 페이징 구현 부분 -->
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

		<!-- 페이징 번호 요청 시에 submit되는 form -->
		<form id='actionForm' action="/admin/auctions" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

			<input type='hidden' name='type'
				value='<c:out value="${ pageMaker.cri.type }"/>'> <input
				type='hidden' name='keyword'
				value='<c:out value="${ pageMaker.cri.keyword }"/>'>
			<input type='hidden' name='filter'
				value='<c:out value="${ pageMaker.cri.filter }"/>'>
		</form>
	</div>


<%-- <%@ include file="/WEB-INF/views/include/footer.jsp"%> --%>
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
	
	$(document).ready(function(){
	    var actionForm = $("#actionForm");

	    $(".paginate_button a").on("click", function(e) {

	            e.preventDefault();

	            // 해당 pageNum을 a 태그의 href 속성 값으로 치환
	            actionForm.find("input[name='pageNum']")
	                .val($(this).attr("href"));
	            actionForm.submit();
	        });
	    
	    
	    
	    $(".delivery").on('click', function(e){
	    	e.preventDefault();
	    	
	    	console.log("아이고")
	    	var onoVal = $(this).data('ono')
	    	
	    	$.ajax({
	    		url: "/admin/orders/delivery/" + onoVal,
	    		type: 'post',
	    		success: function(result){
	    			alert(onoVal + " : 배송이 시작되었습니다.")
	    			actionForm.submit();
	    		
	    		},error: function(){
	    			alert("잘못된 요청입니다.")
	    			actionForm.submit();
	    		}
	    			
	    	})

	    })
	    
		var searchForm = $('#searchForm');	    
	    $("#search").on(
					"click",
					// 값이 들어있지 않다면 alert창 호출
					function(e) {
						if(searchForm.find("option:selected").val() == "K" && isNaN(searchForm.find("input[name='keyword']").val())){
							alert("번호를 입력하세요.")
							return false;
						}

						if (!searchForm.find("option:selected")
								.val()) {
							alert("검색종류를 선택하세요");
							return false;
						}

						if (!searchForm.find(
								"input[name='keyword']").val()) {
							alert("키워드를 입력하세요");
							return false;
						}

						// 1페이지로 바꾸고 submit.
						searchForm.find("input[name='pageNum']")
								.val("1");
						e.preventDefault();

						searchForm.submit();

					});
			
			$("#default").on('click', function(e){
				e.preventDefault();
				self.location="/admin/auctions";
			})
			
			
			$("#progress, #deadline").on('change', function(){
				// 1페이지로 바꾸고 submit.
				searchForm.find("input[name='pageNum']")
						.val("1");

				searchForm.submit();
			})
	})
</script>
</body>
</html>
