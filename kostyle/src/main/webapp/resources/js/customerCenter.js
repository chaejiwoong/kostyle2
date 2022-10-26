$(document).ready(function () {
    //nav영역
    $(".categorybox a").each(function (index) {
        $(this).click(function () {
            $(".categorybox a").removeClass("default");
            $(this).addClass("default")
        });
    });
    //nav 영역 끝
    //qna-nav 시작
    $(".qna-nav a").each(function (index) {
        $(this).click(function () {
            $(".qna-nav a").removeClass("on");
            $(this).addClass("on");
        });
    });
    //qna-nav 영역 끝
});
