//QnA ajax페이지
$(document).ready(function(){
	setInterval(
		'$("#reload").load(window.location.href+" #reload")',1000
	);
	
	//1:1실시간 채팅
	$(".inquiry-btn").click(function() {
		var parmeter = $(".chat-room").serialize();
		alert('customerCenter/register?'+parmeter);
		$.ajax({
			type: 'post',
			url: '/customerCenter/register?' + parmeter,
			dataType: 'json',
			contentType: 'application/json',
			success: function(result) {	
				$("#reload").load(window.location.href+" #reload");
				$(".waiting-people").html("현재 대기중인 고객: "+ result.count+"명");
				//self.location.href = "/customerCenter/register?" + parmeter;
			},
			error: function(error) {
				alert("실패" + error);
			}
			
		})
	});
	
});
