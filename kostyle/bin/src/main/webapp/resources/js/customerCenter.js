$(document).ready(function () {
	//admin bottom카테고리 영역
	var uri = $(location).attr('pathname')
	
	var replace = uri.split("/");
	
	if(replace[1] == "admin") {
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
		
		//admin qnalist 목록 클릭시
		
	};
	
	
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

    //noticedetail 페이지 시작
        
    var operForm = $("#operForm");
    $(".detail-btn button").click(function () {
        operForm.find("#bno").remove();
        operForm.attr("action","/customerCenter/notice")
        operForm.submit();
    });
     
    
    //noticedetail 페이지 끝
    //1:1실시간 채팅 영역

    $(".create-btn").click(function () {
       location.href="/customerCenter/insert";
    });
    
    
    
    
    //문의 작성하기버튼 끝
});

