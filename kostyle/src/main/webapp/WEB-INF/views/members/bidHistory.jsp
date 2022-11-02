<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>KoStyle4U</title>
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
        
 .selectBox{
	text-align: center;
}
.paging {
	text-align: center;
}

 
    .auction{
    	border-bottom : 1px solid #ebebeb;
    	text-align: center;
    	vertical-align: center;
    }
    
    .auction-title{
    	font-weight: bold;
    	font-size: 20px;
    	padding-bottom: 20px;
    }
    
    .auction-content{
    	margin-bottom: 30px;
    	font-size: 18px;
    	vertical-align: center;
    }
    
    .bid-result{
    	border-bottom : 1px solid #ebebeb;
    }
    
    .bid-title{
    	font-weight: bold;
    	font-size: 18px;
    	margin-bottom: 20px;
    }
    
    .bid-content{
    	margin-bottom: 30px;

    }
    
    .bid-result{
     	text-align: center;
    }
    
    .auction-content span:not(:first-of-type){
    	padding-top : 50px;
    }    

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>


<div class="container">
    	<h1>입찰내역</h1>
    	<div class="row auction-title auction">
    				<span class="col-md-3">이미지</span>
					<span class="col-md-3">상품명</span>
					<span class="col-md-2">최고입찰가</span>
					<span class="col-md-2">진행여부</span>
					<span class="col-md-2">입찰내역</span>					
    	</div>
     	<c:forEach items="${auctions}" var="auction">
    	<div class="row auction-content auction">
    		<span class="col-md-3"><img data-filepath ="${auction.imgs[0].filepath}"class="thumb" src='' data-uuid="${auction.imgs[0].uuid}" data-filename="${auction.imgs[0].filename}"></span>
    		<span class="col-md-3"><a href='<c:out value="/auctions/${auction.apno}"/>'> <c:out value="${auction.name}" /></a></span>
    		<fmt:formatNumber var="best_bid_price" value="${auction.best_bid_price }" type="number"/>
    		<span class="col-md-2"><c:out value="${best_bid_price}" /></span>
    		<span class="col-md-2"><c:out value="${auction.status}" /></span>

    		<span class="col-md-2"><a href='<c:out value="${auction.apno}"/>' class="btn btn-primary bid-detail">상세보기</a></span>
    		<span class="col-md-2" hidden="hidden"><a href='<c:out value="${auction.apno}"/>' class="btn btn-primary bid-close">상세닫기</a></span>
    	</div>
    	<div id="${auction.apno}" class="bid-result">

    	</div>
      </c:forEach> 
</div>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>
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
		
		// 상세보기 클릭시 ajax로 해당 상품의 입찰내역 가져오기
		$('.bid-detail').on("click", function(e){
			e.preventDefault();
			var apno = $(this).attr('href');
			
			console.log("apno : " + apno)
			
			$.ajax({
				url: "/members/bidHistory/" + apno,
				type: 'get',
                contentType : "application/json; charset=UTF-8",
                success: function(data){
                	
                	console.log(data)

    	
                	var title = '<div class="row bid-title bid">' +
                		'<span class="col-md-3">번호</span>' + 
                	    '<span class="col-md-3">상품명</span>' +
                		'<span class="col-md-3">입찰금액</span>' +
                		'<span class="col-md-3">입찰시간</span>' +
                		'</div>'

                	$('#' + apno).append(title)

                	$.each(data, function(index, item){
                    	var result = "";
                    	result += '<div class="row bid-content bid">'
                    	result += '<span class="col-md-3">' + item.rank + '</span>';
                		result += '<span class="col-md-3">' + item.name + '</span>';
                		result += '<span class="col-md-3">' + item.price + '</span>';
                		result += '<span class="col-md-3">' + new Date(item.created_date).toISOString().replace('T', ' ').replace(/\..*/, '') + '</span>';
                		result += '</div>'
                		
                		$('#' + apno).append(result);
                	})
                
                }

			})
        	$(this).parent().next().show();
        	$(this).parent().hide();
			
		})
		
		// 상세 닫기
		$('.bid-close').on('click', function(e){
			e.preventDefault();
			var apno = $(this).attr('href');
        	$('#' + apno).empty();
        	$(this).parent().prev().show();
        	$(this).parent().hide();
		})
		

	})
	
</script>
</body>
</html>
