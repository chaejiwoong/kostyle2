<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 

<html>
<head>
<meta charset="UTF-8">
<title>코디 글 수정</title>
<!-- <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<link href="/resources/css/header.css" rel="stylesheet"/>
<link href="/resources/css/footer.css" rel="stylesheet"/>

</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<h1>글 수정</h1>	
	<form role="form" action="/coordies/modify" method="post">
		<div class="panel-body">
			<!-- 상단 버튼 -->
			<div class="form-group">
				<div class="modify-btn">
					<button class="modify-btn" type="button">
						<span>수정하기</span>
					</button>
				</div>
			</div>
			
			<!-- 중간 내용 -->
			<div class="form-group">
				<ol>
					<li>
						<div>글번호 : <input class="" name="title" value="${coordi.cno}" readonly="readonly"></div>
						<div>
							<button class="file-upload-btn" type="button">
								<div class="file-upload-btn-div">
									<span>코디 사진을 올려주세요</span>
									<span>(*이미지 파일 1장만 가능)</span>								
								</div>															
							</button>
						</div>
						
						<div>
							<div class="title">
								 <input class="title" name="title" value="${coordi.title}">
							</div>
								
							<div class="content">
								<textarea class="content" rows="6" name="content" style="overflow: hidden; overflow-wrap: break-word; height: 145px;">${coordi.content}"</textarea>						
							</div>
						</div>
					
					</li>
				</ol>
			</div>
			
			<!-- 상품태그 -->
			<div class="form-group">
				
			</div>
			
		</div>
	
	</form>
	
	
<script>
    $(document).ready(function () {
        
    	//수정하기 버튼
        $(".modify-btn").on("click", function (e) {
            e.preventDefault();
            
            var data ={
            		title:$(".title").children('input').val(),
            		content:$(".content").children('textarea')
            }
            
            $.ajax({
                url:'/coordies/' + ${coordi.cno} ,
                data:JSON.stringify(data),
                type:'put',
                contentType:"application/json; charest=UTF-8",
                success:function (result) {
                    alert("수정이 완료되었습니다");
                    self.location="/coordies"
                }

            })
        }) //수정하기 버튼







    })
</script>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>