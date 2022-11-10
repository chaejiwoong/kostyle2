$(function(){
	var pageNum = $(".pageNum").val();
	var amount = $(".amount").val();

	$(".list .qna-title").each(function (index) {
		$(this).find(".update").click(function(){
			var parmeter = $(this).data("nno");
			location.href = "/admin/customercenter/noticedetail?nno=" + parmeter + "&pageNum=" +pageNum + "&amount=" + amount;
		});
		
		$(this).find(".delete").click(function(){
			var parmeter = $(this).data("nno");
			$("#delete").attr("action","/admin/customercenter/noticeList?nno=" + parmeter + "&pageNum=" +pageNum + "&amount=" + amount);
		});
		
		$(".bottom-category").mouseleave(function () {
		    $(".bottom-category").html(html)
		});
		

	});
		$("#write-btn").click(function(e) {
			e.preventDefault();
			location.href = "/admin/customercenter/insertNotice";
		});	
});