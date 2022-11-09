$(document).ready(function () {
	//admin bottom카테고리 영역
	var uri = $(location).attr('pathname')
	
	var replace = uri.split("/");
	
	
	if(replace[1] == "admin") {
		if(replace[2] == "members") {
		alert(replace[2]);
			var html = "<div>" +
		    	"<span class='bottom-title'><a class='title-memberList' data-title='member' href='/admin/members'>회원목록</a></span>" +
		        "</div>"
			$(".bottom-category").html(html)
	        
		    $(".bottom-category").mouseleave(function () {
		    	$(".bottom-category").html(html)
			});
		} else if (replace[2] == "auctions") {
			var html = "<div>" +
                    "<span class='bottom-title'><a class='title-auctionList' data-title='auction' href='/admin/auctions'>경매목록</a></span>" +
                    "<span class='bottom-title'><a class='title-auctionInsert' data-title='auction' href='/admin/auctions/register'>경매등록</a></span>" +
	        "</div>"
			$(".bottom-category").html(html)
	        
		    $(".bottom-category").mouseleave(function () {
		    	$(".bottom-category").html(html)
			});
		} else if(replace[2] == "orders" || replace[2] == "orderCancels") {
			$(".bottom-category").html("<div>" +
                    "<span class='bottom-title'><a class='title-orderList' data-title='order' href='/admin/orders'>주문목록</a></span>" +
                    "<span class='bottom-title'><a class='title-orderCansel' data-title='order' href='/admin/orderCancels'>주문취소목록</a></span>" +
            "</div>")
		} else if (replace[3] == "qnaList" || replace[3] == "noticeList" || replace[3] == "inquiryList" || replace[3] == "chatList" || replace[3] == "insertInquiry") {
			var html = "<div>" +
	    	"<span class='bottom-title'><a class='title-qna' data-title='customerCenter' href='/admin/customercenter/qnaList'>Q&A</a></span>" +
	    	"<span class='bottom-title'><a class='title-notice' data-title='customerCenter' href='/admin/customercenter/noticeList'>공지사항</a></span>" +
	        "<span class='bottom-title'><a class='title-inquiry' data-title='customerCenter' href='/admin/customercenter/inquiryList'>문의</a></span>" +
	        "<span class='bottom-title'><a class='title-chat' data-title='customerCenter' href='/admin/customercenter/chatList'>1:1채팅</a></span>" +
	        "</div>"
			$(".bottom-category").html(html)
	        
		    $(".bottom-category").mouseleave(function () {
		    	$(".bottom-category").html(html)
			});
		} 
		
		$(".insert-Inquiry").click(function(){
			var text = $(".content").val();
		
			if(text.replace(/\s| /gi).length == 0) {
				alert("내용을 입력해주세요.");
				var uri = window.location.href;
				$(".content").focus();
				return false;
			}
		});
		
		//admin qnalist 목록 클릭시
	} else if (replace[1] == "customerCenter") {
		$(".insert").click(function(){
			var title = $("#title").val();
			var content = $(".content").val();
			
			if(title.replace(/\s| /gi).length == 0) {
				alert("제목을 입력해주세요.");
				$(".title").focus();
				return false;
			} else if(content.replace(/\s| /gi).length == 0) {
				alert("내용을 입력해주세요.");
				$(".content").focus();
				return false;
			}
		});
	}
	
	
	//admin페이지 끝
    //nav영역
    $(".categorybox a").each(function (index) {
        $(this).click(function () {
            $(".categorybox a").removeClass("default");
            $(this).addClass("default")
        });
    });
    //nav 영역 끝
    //qna-nav 시작
    $(".qna-nav a").each(function (index) {
        $(this).click(function () {
            $(".qna-nav a").removeClass("on");
            $(this).addClass("on");
        });
    });
    //qna-nav 영역 끝

    //detail 페이지 시작
    if(replace[2] == "answerdetail") {
    	var operForm = $("#operForm");
    	$(".detail-btn button").click(function () {
	        operForm.find("#bno").remove();
	        operForm.attr("action","/customerCenter/register")
	        operForm.submit();
   		});
    } else if (replace[2] == "noticedetail") {
    	var operForm = $("#operForm");
    	$(".detail-btn button").click(function () {
	        operForm.find("#bno").remove();
	        operForm.attr("action","/customerCenter/notice")
	        operForm.submit();
   		});
    }
     
    
    //noticedetail 페이지 끝
    //1:1실시간 채팅 영역

    $(".create-btn").click(function () {
       location.href="/customerCenter/insert";
    });
    
    
    
    
    //문의 작성하기버튼 끝
});

