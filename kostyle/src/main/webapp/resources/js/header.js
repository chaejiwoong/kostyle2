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
                    "<a href='1'><span>긴팔티셔츠</span></a>" +
                    "<a href='2'><span>반팔티셔츠</span></a>" +
                    "<a href='3'><span>블러우스</span></a>" +
                    "<a href='4'><span>셔츠/남방</span></a>" +
                    "<a href='5'><span>맨투맨</span></a>" +
                    "<a href='6'><span>후드</span></a>" +
                    "<a href='7'><span>니트/스웨터</span></a>" +
                    "<a href='8'><span>슬리브리스(민소매)</span></a>" +
                    "</div>")
            } else if (title == "outerwear") {
                $(".bottom-category").html("<div>" +
                    "<a href='9'><span>코트</span></a>" +
                    "<a href='10'><span>패딩</span></a>" +
                    "<a href='11'><span>점퍼</span></a>" +
                    "<a href='12'><span>가디건</span></a>" +
                    "<a href='13'><span>자켓</span></a>" +
                    "<a href='14'><span>베스트(조끼)</span></a>" +
                    "<a href='15'><span>후드집업</span></a>" +
                    "</div>")
            } else if (title == "pants") {
                $(".bottom-category").html("<div>" +
                    "<a href='16'><span>데님 팬츠</span></a>" +
                    "<a href='17'><span>코튼 팬츠</span></a>" +
                    "<a href='18'><span>슬랙스</span></a>" +
                    "<a href='19'><span>트레이닝</span></a>" +
                    "<a href='20'><span>숏팬츠</span></a>" +
                    "<a href='21'><span>레깅스</span></a>" +
                    "<a href='22'><span>기타바지</span></a>" +
                    "</div>")
            } else if(title == "dress-skirt"){
                $(".bottom-category").html("<div>" +
                    "<a href='23'><span>미니 원피스</span></a>" +
                    "<a href='24'><span>미디 원피스</span></a>" +
                    "<a href='25'><span>롱 원피스</span></a>" +
                    "<a href='26'><span>미니 스커트</span></a>" +
                    "<a href='27'><span>미디 스커트</span></a>" +
                    "<a href='28'><span>롱 스커트</span></a>" +
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