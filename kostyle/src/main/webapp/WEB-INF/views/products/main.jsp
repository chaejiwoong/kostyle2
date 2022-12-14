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
                                     <div class="text-center" ><a class="move" href ='<c:out value="${list.pno}"/>'><span class = "btn btn-outline-dark mt-auto" >????????????</span></a></div>
                                    </form>
                                    <br>
                                   ?????? : <fmt:formatNumber value="${list.price}" pattern="#,### ???" />
                                    <br>
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill">
                                        <br>
                                        ?????? : <c:out value="${list.color}"></c:out>
                                        <br>
                                        ????????? : <c:out value="${list.hitCount}" ></c:out>
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
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">??????</div>
                            <img data-filepath="${list.imageList[0].filePath}" class = thumb src='' data-uuid="${list.imageList[0].uuid}" 
	                    			data-filename="${list.imageList[0].fileName}" style="width : 267px; height : 150px;">
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">NO.${list.pno}<br>${list.name}</h5>
                                    
                                    <br>
                                    <form action="" method="get" >
                                     <div class="text-center" ><a class="move" href ='<c:out value="${list.pno}"/>'><span class = "btn btn-outline-dark mt-auto" >????????????</span></a></div>
                                    </form>
                                    <br>
                                   ?????? : <fmt:formatNumber value="${list.price}" pattern="#,### ???" />
                                    <br>
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill">
                                        <br>
                                        ?????? : <c:out value="${list.color}"></c:out>
                                        <br>
                                        ????????? : <c:out value="${list.hitCount}" ></c:out>
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
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">??????</div>
                            <img data-filepath="${list.imageList[0].filePath}" class = thumb src='' data-uuid="${list.imageList[0].uuid}" 
	                    			data-filename="${list.imageList[0].fileName}" style="width : 267px; height : 150px;">
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">NO.${list.pno}<br>${list.name}</h5>
                                    
                                    <br>
                                    <form action="" method="get" >
                                     <div class="text-center" ><a class="move" href ='<c:out value="${list.pno}"/>'><span class = "btn btn-outline-dark mt-auto" >????????????</span></a></div>
                                    </form>
                                    <br>
                                   ?????? : <fmt:formatNumber value="${list.price}" pattern="#,### ???" />
                                    <br>
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill">
                                        <br>
                                        ?????? : <c:out value="${list.color}"></c:out>
                                        <br>
                                        ????????? : <c:out value="${list.hitCount}" ></c:out>
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
				        <span>?????????????????????</span>
	    			</div>
				</div>
           
           </div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c96fa915f494ff8663640498341df240&libraries=services"></script>
<script>

$("#aboutUs").click(function(){
	var position =$("#aboutUs01").offset();
	$("body").stop().animate({scrollTop:position.top}, 500);
	
});

var mapContainer = document.getElementById('map'), // ????????? ????????? div 
    mapOption = {
        center: new kakao.maps.LatLng(37.472224800000, 126.885977400000), // ????????? ????????????
        level: 2, // ????????? ?????? ??????
        scrollwheel: false
    };  

// ????????? ???????????????    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// ??????-?????? ?????? ????????? ???????????????
var geocoder = new kakao.maps.services.Geocoder();

var marker = new kakao.maps.Marker(), // ????????? ????????? ????????? ???????????????
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // ????????? ????????? ?????? ????????? ????????? ????????????????????????

// ?????? ?????? ??????????????? ????????? ???????????? ?????? ?????? ????????? ???????????????
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

// ????????? ???????????? ??? ?????? ?????? ????????? ?????? ??????????????? ??????????????? ???????????? ???????????????
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var detailAddr = !!result[0].road_address ? '<div>??????????????? : ' + result[0].road_address.address_name + '</div>' : '';
            detailAddr += '<div>?????? ?????? : ' + result[0].address.address_name + '</div>';
            
            var content = '<div class="bAddr">' +
                            '<span class="title">????????? ????????????</span>' + 
                            detailAddr + 
                        '</div>';

            // ????????? ????????? ????????? ??????????????? 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);

            // ?????????????????? ????????? ????????? ?????? ????????? ?????? ??????????????? ???????????????
            infowindow.setContent(content);
            infowindow.open(map, marker);
        }   
    });
});

// ?????? ????????? ?????? ????????? ???????????? ??? ?????? ?????? ????????? ?????? ?????? ????????? ??????????????? ???????????? ???????????????
kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});

function searchAddrFromCoords(coords, callback) {
    // ????????? ????????? ?????? ????????? ???????????????
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
    // ????????? ????????? ?????? ?????? ????????? ???????????????
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

// ?????? ??????????????? ?????? ??????????????? ?????? ??????????????? ???????????? ???????????????
function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');

        for(var i = 0; i < result.length; i++) {
            // ???????????? region_type ?????? 'H' ?????????
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
		//????????? ????????? ???????????? ?????? ??????
		var fileCallPath = encodeURIComponent($(obj).data('filepath').replace(/\\/g,'/') + "/s_" + $(obj).data('uuid') + "_" + $(obj).data('filename'));
		// ????????? ????????? ??? ?????? ?????? ???????????? ????????????
		$(obj).attr('src',"/commons/display?fileName=" + fileCallPath);
		})
	})();
	
/*?????? ?????????  */
let moveForm = $('#moveForm');
$(".pageMaker_btn a").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	
	moveForm.submit();
	
});

/* ?????? ?????? ????????? ?????? */
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
