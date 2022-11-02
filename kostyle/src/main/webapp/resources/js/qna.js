$(document).ready(function () {
   $(".list .qna-title").each(function (index) {
      $(document).on("click", ".qna-title", function () {
         $(".list .qna-bottom").css("display", "none");
         
         $(".qna-title a").css({"background":"url(../resources/img/icn_dropdown.png)", 'background-repeat' : 'no-repeat', 'background-position':'center center'});
         $(this).children().children("a").css({"background":"url(../resources/img/icn_dropdown_on.png)", 'background-repeat' : 'no-repeat', 'background-position':'center center'}); 
		

		
         $(this).find(".qna-bottom").css("display","block");
      });
   });
});
