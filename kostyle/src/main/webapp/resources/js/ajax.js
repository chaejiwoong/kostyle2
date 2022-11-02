//QnA ajax페이지
$(document).ready(function(){

    $(".qna-nav li a").each(function () {
    	$(this).click(function() {
    		$(".qna-nav li a").removeClass("on");
    		$(this).addClass("on");
    		$(this).mouseover(function() {
    			$(this).addClass("on");
    		});
    		var parmeter = $(this).data("value");
    		
    		
    		$.ajax({
	            type: 'get',
	            url: '/customerCenter/qnaPart?category=' + parmeter,
	            dataType:'json',
	             contentType: 'application/json',
	            success: function (result) {
	             	
	                var str="";
	                $.each(result.qna, function(index, value) {
	                var today = new Date(value.created_date);
	                var year = today.getFullYear();
	                var mouth = (today.getMonth())+1;
	                var day = today.getDate();
                        var date = value.
                        str += '<ul class="list">';
                    	str += '<li class="qna-title">';
	                	str += '<div class="qna-top">';
	                	str += '<div class="list-category">'+value.category+'</div>';
	                	str += '<div class="list-title">' + value.title + '</div>';
	                	str += '<div class="date">' + '날짜: ' + year + '-' + mouth + '-' + day + '</div>';
	                	str += '<a class=qna-img>';
	                	str += '</a>';
	                	str += '</div>';
						str += '<div class="qna-bottom">';
						str += '<div class="qna-box">';
						str += '<div class="qna-answer">'+value.content+'</div>';
						str += '</div>';
						str += '</div>';
	                	str += '</li>';
                      	str += '</ul>';
                      	
                   })
	                
                 	$(".list").html(str);
	               
	            },
	            error: function () {
	                alert(parmeter);
	                alert("error");
	            }
    		});
    	});
	});
	
	//1:1실시간 채팅
	
});
//QnA ajax페이지 끝