$(document).ready(function () {

	$(document).on("mouseover",".top-category01 a",function () {
		var pointer = $(this).parent();
        var title = $(pointer).data("title");
        $(".bottom-category").css("display", "block");
        $(pointer).each(function () {
            if (title == "member") {
                $(".bottom-category").html("<div>" +
                    "<span class='bottom-title'><a data-title='member' href='/admin/members'>회원목록</a></span>" +
                    "</div>")
            } else if (title == "product") {
                $(".bottom-category").html("<div>" +
                    "<span class='bottom-title'><a data-title='product' href='#'>상품목록</a></span>" +
                    "<span class='bottom-title'><a data-title='product' href='#'>상품등록</a></span>" +

                    "</div>")
            } else if (title == "auction") {
                $(".bottom-category").html("<div>" +
                    "<span class='bottom-title'><a data-title='auction' href='/admin/auctions'>경매목록</a></span>" +
                    "<span class='bottom-title'><a data-title='auction' href='/admin/auctions/register'>경매등록</a></span>" +

                    "</div>")
            } else if(title == "order"){
                $(".bottom-category").html("<div>" +
                    "<span class='bottom-title'><a data-title='order' href='/admin/orders'>주문목록</a></span>" +
                    "<span class='bottom-title'><a data-title='order' href='/admin/orderCancels'>주문취소목록</a></span>" +
                    "</div>")
            }else if(title == "customerCenter"){
                $(".bottom-category").html("<div>" +
                	"<span class='bottom-title'><a class='title-qna' data-title='customerCenter' href='/admin/customercenter/qnaList'>Q&A</a></span>" +
                	"<span class='bottom-title'><a class='title-notice' data-title='customerCenter' href='/admin/customercenter/noticeList'>공지사항</a></span>" +
                    "<span class='bottom-title'><a class='title-inquiry' data-title='customerCenter' href='/admin/customercenter/inquiryList'>문의</a></span>" +
                    "<span class='bottom-title'><a class='title-chat' data-title='customerCenter' href='/admin/customercenter/chatList'>1:1채팅</a></span>" +
                    "</div>")
            }else if(title == "statistics"){
                $(".bottom-category").html("<div>" +
                    "<span class='bottom-title'><a data-title='statistics' href='#'>회원통계</a></span>" +
                    "<span class='bottom-title'><a data-title='statistics' href='#'>매출통계</a></span>" +
                    "<span class='bottom-title'><a data-title='statistics' href='#'>방문통계</a></span>" +
                    "<span class='bottom-title'><a data-title='statistics' href='#'>기타통계</a></span>" +
                    "</div>")
            }
        });
    });//mouseover 끝남

    $(".top-category01 a").each(function (data) {
        $(this).click(function () {
            $(".top-category01 a").removeClass("list-color");
            $(this).addClass("list-color");
        });
    });//.top-category01 click종료
    
    
    	$(document).on("click", ".bottom-category span", function () {
        /*for(var i =0; i<=5; i++) {
        	var title = $(".top-category01 span").eq(i).data("title");
        	i += i;
        }*/
        
        $(this).each(function (data) {
            $(".bottom-category a").removeClass("list-color");
            $(this).children().addClass("list-color");
        })
    });
});
