//QnA ajax페이지
$(document).ready(function(){
    // alert("asd");
    $("#purchase").click(function () {
        $.ajax({
            type: 'GET',
            url: '/customerCenter/qna?category=' + $('#purchase').text(),
            dataType: 'text',
            success: function (result) {
                alert("성공");
                // alert(result);
                // $(".feq-box").html("<div>안녕하세요</div>");
            },
            error: function () {
                // console.log("error");
                alert("error");
            }
        })
    })
});
//QnA ajax페이지 끝