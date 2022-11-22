//QnA ajax페이지
$(document).ready(function(){

//네비게이션
    $(".qna-nav li a").each(function () {
    	$(this).click(function() {
    		$(".qna-nav li a").removeClass("on");
    		$(this).addClass("on");

    		var parmeter = $(this).data("value");
    		
    		var uri = $(location).attr('pathname')
	
			var replace = uri.split("/");
			if(replace[1] == "admin") {
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
                        str += '<ul class="list admin-list">';
                    	str += '<li class="qna-title qna-admin">';
	                	str += '<div class="qna-top qna-admin">';
	                	str += '<div class="qna-top2">';
	                	str += '<div class="list-category">'+value.category+'</div>';
	                	str += '<div class="list-title">' + value.title + '</div>';
	                	str += '<div class="date">' + '날짜: ' + year + '-' + mouth + '-' + day + '</div>';
	                	str += '<a class=img admin-img>';
	                	str += '</a>';
	                	str += '</div>';
	                	str += '<div class="qna-btn">';
	                	str += '<button type="button" class="update btn btn-primary" data-nno="'+value.nno+'">' +'수정'+'</button>';
	                	str += '<button type="submit" class="delete btn btn-primary" data-nno="'+value.nno+'">' +'제거'+'</button>';
	                	str += '</div>';
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
			
			} else if (replace[1] =="customerCenter") {
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
	                	str += '<div class="qna-top1">';
	                	str += '<div class="list-category">'+value.category+'</div>';
	                	str += '<div class="list-title">' + value.title + '</div>';
	                	str += '<div class="date">' + '날짜: ' + year + '-' + mouth + '-' + day + '</div>';
	                	str += '<a class=img admin-img>';
	                	str += '</a>';
	                	str += '</div>';
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
			
			}
    		
    		
    	});
	});	
});
//QnA ajax페이지 끝