<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<!-- Core theme CSS (includes Bootstrap)-->
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<link href="/resources/vendor/bootstrap/css/main.css" rel="stylesheet">
<link href="/resources/css/header.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet" />

<style type="text/css">
.products {
	color: #35C5F0;
}
.scrollToTop{
    width:auto; 
    height:auto;
    padding:10px; 
    text-align:center; 
    background: whiteSmoke;
    font-weight: bold;
    color: #444;
    text-decoration: none;
    position:fixed;
    top:70%;
    right:40px;
    display:none;
    z-index: 99999;
	/* background: url('../resources/img/icn_dropdown_on.png') no-repeat 38px 50px; */
	background: url('../resources/img/icn_dropdown_on.png') no-repeat  0;
}

/* display: flex;
    flex-direction: row; */
/* .map_wrap {position:relative;width:100%;height:350px;} */
.map_wrap {
display: flex;
    flex-direction: row;
}
.title {font-weight:bold;display:block;}
.hAddr {position:relative;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;width: 50%;text-align: center;}
#centerAddr {
	display:block;
	margin-top:2px;
	font-weight: normal;
}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
    .h1 {
        text-align: center;
    font-size: 30px;
    font-weight: bold;
    padding: 40px 0;
    }
</style>

</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
       
       <div style="height: 1000px;">
       		<a href="#" class="scrollToTop"></a>
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Kostyle</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With Shopping</p>
                </div>
            </div>
        </div>
        
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                
               
               <c:forEach  items="${product}" var="list" >
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Best</div>
                            <img data-filepath="${list.imageList[0].filePath}" class = thumb src='' data-uuid="${list.imageList[0].uuid}" 
	                    			data-filename="${list.imageList[0].fileName}" style="width : 267px; height : 150px;">
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">NO.${list.pno}<br>${list.name}</h5>
                                    
                                    <br>
                                    <form action="" method="get" >
                                     <div class="text-center" ><a class="move" href ='<c:out value="${list.pno}"/>'><span class = "btn btn-outline-dark mt-auto" >상세보기</span></a></div>
                                    </form>
                                    <br>
                                   가격 : <fmt:formatNumber value="${list.price}" pattern="#,### 원" />
                                    <br>
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill">
                                        <br>
                                        색상 : <c:out value="${list.color}"></c:out>
                                        <br>
                                        조회수 : <c:out value="${list.hitCount}" ></c:out>
                                        <br>
                                    	
                                    	
                                 
	                    				</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
               </c:forEach>   
				
                <c:forEach  items="${hitImg}" var="list" >
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">추천</div>
                            <img data-filepath="${list.imageList[0].filePath}" class = thumb src='' data-uuid="${list.imageList[0].uuid}" 
	                    			data-filename="${list.imageList[0].fileName}" style="width : 267px; height : 150px;">
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">NO.${list.pno}<br>${list.name}</h5>
                                    
                                    <br>
                                    <form action="" method="get" >
                                     <div class="text-center" ><a class="move" href ='<c:out value="${list.pno}"/>'><span class = "btn btn-outline-dark mt-auto" >상세보기</span></a></div>
                                    </form>
                                    <br>
                                   가격 : <fmt:formatNumber value="${list.price}" pattern="#,### 원" />
                                    <br>
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill">
                                        <br>
                                        색상 : <c:out value="${list.color}"></c:out>
                                        <br>
                                        조회수 : <c:out value="${list.hitCount}" ></c:out>
                                        <br>
                                    	
                                    	
                                 
	                    				</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
               </c:forEach>
               
               
               <c:forEach  items="${day}" var="list" >
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">최신</div>
                            <img data-filepath="${list.imageList[0].filePath}" class = thumb src='' data-uuid="${list.imageList[0].uuid}" 
	                    			data-filename="${list.imageList[0].fileName}" style="width : 267px; height : 150px;">
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">NO.${list.pno}<br>${list.name}</h5>
                                    
                                    <br>
                                    <form action="" method="get" >
                                     <div class="text-center" ><a class="move" href ='<c:out value="${list.pno}"/>'><span class = "btn btn-outline-dark mt-auto" >상세보기</span></a></div>
                                    </form>
                                    <br>
                                   가격 : <fmt:formatNumber value="${list.price}" pattern="#,### 원" />
                                    <br>
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill">
                                        <br>
                                        색상 : <c:out value="${list.color}"></c:out>
                                        <br>
                                        조회수 : <c:out value="${list.hitCount}" ></c:out>
                                        <br>
                                    	
                                    	
                                 
	                    				</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
               </c:forEach>
               
                   
                   
                     <form id="moveForm" action="/main" method="get" >
 						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                	</form>
                                
                          
                    
                </div>
            </div>
           <div id="aboutUs01">
           		<h1 class="h1">About Us</h1>
            	<div class="map_wrap">
			    <div id="map" style="width:50%;height:400px;position:relative;overflow:hidden;"></div>
				    <div class="hAddr">
				        <span class="title"></span>
				        <span id="centerAddr"></span>
				        <span>호서대벤처타워</span>
	    			</div>
				</div>
           
           </div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c96fa915f494ff8663640498341df240&libraries=services"></script>
<script>

$("#aboutUs").click(function(){
	var position =$("#aboutUs01").offset();
	$("body").stop().animate({scrollTop:position.top}, 500);
	
});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.472224800000, 126.885977400000), // 지도의 중심좌표
        level: 2, // 지도의 확대 레벨
        scrollwheel: false
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
            
            var content = '<div class="bAddr">' +
                            '<span class="title">법정동 주소정보</span>' + 
                            detailAddr + 
                        '</div>';

            // 마커를 클릭한 위치에 표시합니다 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);

            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, marker);
        }   
    });
});

// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});

function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');

        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                break;
            }
        }
    }    
}
</script>
	
	
           <%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script type="text/javascript">
 $(document).ready(function(){	    
		$(window).scroll(function(){
	        if ($(this).scrollTop() > 300) {
	            $('.scrollToTop').fadeIn();
	            console.log()
	        } else {
	        	$(".aboutUs span").removeClass("li-list");
	            $('.scrollToTop').fadeOut();
	        }
	    });


	    $('.scrollToTop').click(function(){
	        $('html, body').animate({scrollTop : 0}, 100);
	        return false;
	    });

	});

var aa = (function loadThumbnail() {
	var uploadResultArr = $('.thumb');
	
	$(uploadResultArr).each(function (i, obj) {
		//섬네일 파일을 불러오기 위한 경로
		var fileCallPath = encodeURIComponent($(obj).data('filepath').replace(/\\/g,'/') + "/s_" + $(obj).data('uuid') + "_" + $(obj).data('filename'));
		// 섬네일 눌렀을 때 원본 파일 호출해서 보여주기
		$(obj).attr('src',"/commons/display?fileName=" + fileCallPath);
		})
	})();
	
/*상품 페이지  */
let moveForm = $('#moveForm');
$(".pageMaker_btn a").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	
	moveForm.submit();
	
});

/* 상품 상세 페이지 이동 */
$(".move").on("click", function(e){
	
	
	e.preventDefault();
	
	
	
	
	moveForm.append("<input type='hidden' name='pno' value='"+ $(this).attr("href") + "'>");
	
	//alert(moveForm.html());
	
	
	moveForm.attr("action", "/main/product");
	
	moveForm.submit();
	
});




</script>
       

    </body>
</html>
