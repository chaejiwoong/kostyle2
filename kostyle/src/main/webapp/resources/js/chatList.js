$(document).ready(function() {
	setInterval(
			'$("#chatList").load(window.location.href+" #chatList")',1000
	);
 	setInterval(
			'$("#reload").load(window.location.href+" #reload")',1000
	);
	
	$(".btn-primary").each(function(index){
		$("#chatList").on("click", ".btn-primary", function() {
			var chat_Id_Room = $(this).data("cuno");
			//var information = $(this).parent().parent().find("td span").text();
			var parmeter = $(".aa").serialize();
			console.log(information);
			alert(parmeter);

			});
	});
});