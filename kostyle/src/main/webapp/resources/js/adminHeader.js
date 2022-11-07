$(function () {

    $(document).on("mouseover",".top-category01 span",function () {
        var title = $(this).data("title");
        $(".bottom-category").css("display", "block");
        $(this).each(function () {
            if (title == "member") {
                $(".bottom-category").html("<div>" +
                    "<span><a href='/admin/members'>회원목록</a></span>" +
                    "</div>")
            } else if (title == "product") {
                $(".bottom-category").html("<div>" +
                    "<span><a href='#'>상품목록</a></span>" +
                    "<span><a href='#'>상품등록</a></span>" +

                    "</div>")
            } else if (title == "auction") {
                $(".bottom-category").html("<div>" +
                    "<span><a href='/admin/auctions'>경매목록</a></span>" +
                    "<span><a href='/admin/auctions/register'>경매등록</a></span>" +

                    "</div>")
            } else if(title == "order"){
                $(".bottom-category").html("<div>" +
                    "<span><a href='/admin/orders'>주문목록</a></span>" +
                    "<span><a href='/admin/orderCancels'>주문취소목록</a></span>" +
                    "</div>")
            }else if(title == "customerCenter"){
                $(".bottom-category").html("<div>" +
                    "<span><a href='#'>1:1문의</a></span>" +
                    "<span><a href='#'>채팅</a></span>" +
                    "</div>")
            }else if(title == "statistics"){
                $(".bottom-category").html("<div>" +
                    "<span><a href='#'>회원통계</a></span>" +
                    "<span><a href='#'>매출통계</a></span>" +
                    "<span><a href='#'>방문통계</a></span>" +
                    "<span><a href='#'>기타통계</a></span>" +
                    "</div>")
            }
        });
    });//mouseover 끝남
    $(".top-category01 span").each(function () {
        $(this).click(function () {
            $(".top-category01 a").removeClass("list-color");
            $(this).children().addClass("list-color");
        });
    });//.top-category01 click종료
    $(document).on("click", ".bottom-category span", function () {
        var title = $(".top-category01 span").data("title");
        $(this).each(function () {
            // $(this).parent().css("background", "blue");
            $(".bottom-category a").removeClass("list-color");
            $(this).children().addClass("list-color");
        })
    });

    //mouseenter
    //mouseenter 집어넣는거
    //mouseleave
    //mouseout 두번 반응함

    $(".bottom-category").mouseleave(function () {
        $(".bottom-category").css("display", "none");
    });
    $(".all-category").mouseleave(function () {
        $(".bottom-category").css("display", "none");
    })
})
