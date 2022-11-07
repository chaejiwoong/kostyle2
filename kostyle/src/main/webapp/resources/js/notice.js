$(function(){
	$(".list .qna-title").each(function (index) {
		$(this).find(".update").click(function(){
			var parmeter = $(this).data("nno");
			location.href = "/admin/customercenter/noticedetail?nno=" + parmeter;
		});
		
		$(this).find(".delete").click(function(){
			var parmeter = $(this).data("nno");
			$("#delete").attr("action","/admin/customercenter/noticeList?nno=" + parmeter);
		});
		
		$(".bottom-category").mouseleave(function () {
		    $(".bottom-category").html(html)
		});
		
		$(".write-btn").click(function() {
			location.href = "/admin/customercenter/insertNotice";
		});
	});
});