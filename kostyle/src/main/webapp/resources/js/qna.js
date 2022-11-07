$(document).ready(function () {

	var uri = $(location).attr('pathname')
	
	var replace = uri.split("/");

	if(replace[1] == "customerCenter") {
	
	   $(".list .qna-title").each(function (index) {
	      $(document).on("click", ".qna-title", function () {
	         $(".list .qna-bottom").css("display", "none");
	         $(".qna-title a").css({"background":"url(../resources/img/icn_dropdown.png)", 'background-repeat' : 'no-repeat', 'background-position':'center center'});
	         $(this).find("a").css({"background":"url(../resources/img/icn_dropdown_on.png)", 'background-repeat' : 'no-repeat', 'background-position':'center center'}); 
	         $(this).find(".qna-bottom").css("display","block");
	      });
	   });
	} else if(replace[1] == "admin") {
		var html = "<div>" +
	    	"<span class='bottom-title'><a class='title-qna' data-title='customerCenter' href='/admin/customercenter/qnaList'>Q&A</a></span>" +
	    	"<span class='bottom-title'><a class='title-notice' data-title='customerCenter' href='/admin/customercenter/noticeList'>공지사항</a></span>" +
	        "<span class='bottom-title'><a class='title-inquiry' data-title='customerCenter' href='/admin/customercenter/inquiryList'>문의</a></span>" +
	        "<span class='bottom-title'><a class='title-chat' data-title='customerCenter' href='/admin/customercenter/chatList'>1:1채팅</a></span>" +
	        "</div>"
		$(".bottom-category").html(html)
	
		$(".list .qna-title").each(function (index) {
			$(this).on("click", ".qna-top2",function() {
				$(".list .qna-bottom").css("display", "none");
				$(".qna-title a").css({"background":"url(../../resources/img/icn_dropdown.png)", 'background-repeat' : 'no-repeat', 'background-position':'center center'});
				$(this).find("a").css({"background":"url(../../resources/img/icn_dropdown_on.png)", 'background-repeat' : 'no-repeat', 'background-position':'center center'}); 
				$(this).parent().parent().find(".qna-bottom").css("display","block");
				
			});
			
			$(this).find(".update").click(function(){
			var parmeter = $(this).data("nno");
    		alert(parmeter);
				location.href = "/admin/customercenter/qndetail?nno=" + parmeter;
			});
			
			$(this).find(".delete").click(function(){
				var parmeter = $(this).data("nno");
				$("#delete").attr("action","/admin/customercenter/qnaList?nno=" + parmeter);		
			});
			
			
			$(document).on("click", ".qna-top2", function () {
				$(".list .qna-bottom").css("display", "none");
				$(".qna-title a").css({"background":"url(../../resources/img/icn_dropdown.png)", 'background-repeat' : 'no-repeat', 'background-position':'center center'});
				$(this).find("a").css({"background":"url(../../resources/img/icn_dropdown_on.png)", 'background-repeat' : 'no-repeat', 'background-position':'center center'}); 
				$(this).parent().parent().find(".qna-bottom").css("display","block");
			});
			
			
			$(document).on("click", ".update",function() {
				var parmeter = $(this).data("nno");
				location.href = "/admin/customercenter/qndetail?nno=" + parmeter;
			});
			
			$(document).on("click", ".delete",function() {
				var parmeter = $(this).data("nno");
				$("#delete").attr("action","/admin/customercenter/qnaList?nno=" + parmeter);
			})
			
		});
		$(".bottom-category").mouseleave(function () {
		    $(".bottom-category").html(html)
		});
		
		$(".write-btn").click(function() {
			location.href = "/admin/customercenter/insert";
		});
		
		//문의 답변
		$(".admin-tr-list").each(function(data){
			var parmeter = $(this).find(".td-right").children().data("qno");
			
			$(this).find(".td-right").children().click(function(){
				alert(parmeter);
				location.href = "/admin/customercenter/insertInquiry?qno=" + parmeter;
			});
		});
		
		$(".admin-box").each(function(){
			var parmeter = $(this).find(".answer-btn").data("qno");
			var btn = $(this).find(".answer-btn");
			$(btn).click(function(){
				location.href = "/admin/customercenter/answerdetail?qno=" + parmeter;
			});
		});
		
		$(".detail-btn").click(function(){
			location.href = "/admin/customercenter/inquiryList";
		});
		
		//문의 답변 끝
		
	}
});
