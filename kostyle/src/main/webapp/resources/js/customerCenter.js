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

    //noticedetail 페이지 시작
    var operForm = $("#operForm");
    $(".detail-btn button").click(function () {
        operForm.find("#bno").remove();
        operForm.attr("action","/customerCenter/notice")
        operForm.submit();
    })
    //noticedetail 페이지 끝
});
