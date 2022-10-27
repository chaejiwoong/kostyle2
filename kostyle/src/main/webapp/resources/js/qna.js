$(document).ready(function () {
   $(".list .qna-title").each(function (index) {
      $(this).click(function () {
         $(".list .qna-bottom").css("display", "none");
         // $(this).children().children("a").css("background","url('../img/icn_dropdown_on.png')");
         $(this).children().children("img").attr("src","../img/icn_dropdown_on.png");
         $(this).find(".qna-bottom").css("display","block");
      });
   });
});
