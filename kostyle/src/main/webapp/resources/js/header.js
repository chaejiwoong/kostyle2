$(function () {

    var data = $(".nav-ul > li").data("list")
    $(".nav-ul > li").each(function (index) {
        $(this).click(function (e) {
            if (index == "0") {
                $(".all-category").css("display", "block");
                $(".li-list span").removeClass("list-color");
                $(this).find("span").addClass("list-color");
            } else if(index == "1") {
                $(".li-list span").removeClass("list-color");
                $(this).find("span").addClass("list-color");
                $(".all-category").css("display", "none");
            } else if(index =="2") {
                $(".li-list span").removeClass("list-color");
                $(this).find("span").addClass("list-color");
                $(".all-category").css("display", "none");
            } else if(index =="3") {
                $(".li-list span").removeClass("list-color");
                $(this).find("span").addClass("list-color");
                $(".all-category").css("display", "none");
            } else if (index =="4"){
                $(".li-list span").removeClass("list-color");
                $(this).find("span").addClass("list-color");
                $(".all-category").css("display", "none");
            }
        });
    });

    $(document).on("mouseover",".top-category01 span",function () {
        var title = $(this).data("title");
        $(".bottom-category").css("display", "block");
        $(this).each(function () {
            if (title == "clothes") {
                $(".bottom-category").html("<div>" +
                    "<a href='#'><span>긴팔티셔츠</span></a>" +
                    "<a href='#'><span>반팔티셔츠</span></a>" +
                    "<a href='#'><span>블러우스</span></a>" +
                    "<a href='#'><span>셔츠/남방</span></a>" +
                    "<a href='#'><span>맨투맨</span></a>" +
                    "<a href='#'><span>후드</span></a>" +
                    "<a href='#'><span>니트/스웨터</span></a>" +
                    "<a href='#'><span>슬리브리스(민소매)</span></a>" +
                    "</div>")
            } else if (title == "outerwear") {
                $(".bottom-category").html("<div>" +
                    "<a href='#'><span>코트</span></a>" +
                    "<a href='#'><span>패딩</span></a>" +
                    "<a href='#'><span>점퍼</span></a>" +
                    "<a href='#'><span>가디건</span></a>" +
                    "<a href='#'><span>자켓</span></a>" +
                    "<a href='#'><span>베스트(조끼)</span></a>" +
                    "<a href='#'><span>후드집업</span></a>" +
                    "</div>")
            } else if (title == "pants") {
                $(".bottom-category").html("<div>" +
                    "<a href='#'><span>데님 팬츠</span></a>" +
                    "<a href='#'><span>코튼 팬츠</span></a>" +
                    "<a href='#'><span>슬랙스</span></a>" +
                    "<a href='#'><span>트레이닝</span></a>" +
                    "<a href='#'><span>숏팬츠</span></a>" +
                    "<a href='#'><span>레깅스</span></a>" +
                    "<a href='#'><span>기타바지</span></a>" +
                    "</div>")
            } else if(title == "dress-skirt"){
                $(".bottom-category").html("<div>" +
                    "<a href='#'><span>미니 원피스</span></a>" +
                    "<a href='#'><span>미디 원피스</span></a>" +
                    "<a href='#'><span>롱 원피스</span></a>" +
                    "<a href='#'><span>미니 스커트</span></a>" +
                    "<a href='#'><span>미디 스커트</span></a>" +
                    "<a href='#'><span>롱 스커트</span></a>" +
                    "</div>")
            }
        });
    });//mouseover 끝남
    $(".top-category01 a").each(function (index) {
        $(this).click(function () {
            $(".top-category01 a").removeClass("list-color");
            $(this).addClass("list-color");
        });
    });//.top-category01 click종료
    $(document).on("click", ".bottom-category span", function () {
        var title = $(".top-category01 span").data("title");
        $(this).each(function () {
            // $(this).parent().css("background", "blue");
            $(".bottom-category span").removeClass("list-color");
            $(this).addClass("list-color");
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