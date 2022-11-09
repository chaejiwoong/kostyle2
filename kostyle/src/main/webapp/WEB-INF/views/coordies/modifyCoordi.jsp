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
			
			
			<!-- 중간 내용 -->
			
			<div class="form-group">
			<label>글번호</label> <input class="form-control" name='cno'
				value='<c:out value="${coordi.cno }"/>' readonly="readonly">
		</div>
			
			
			<ol>
<li>
	<div class="form-group-1">
		<!-- 제목, 내용 -->
		<div class="form-group-1">
		
			<div class="form-group-title">
				<input class="title" name="title" value="${coordi.title}">
			</div>
			
			<div class="form-group-content">
			<textarea class="content" rows="6" name="content" style="overflow: hidden; overflow-wrap: break-word; height: 145px;">${coordi.content}"</textarea>	
			</div>
			
		</div>
		
		<!-- 파일 업로드 -->
		<div class="form-group-1">
			
			<!-- 업로드 버튼 -->
			<div class="form-group-upload">
				<input id="uploadFile" name="file" type="file" accept="image/*" class="form-control"  
					style="display: none" multiple>
				<button id="upload-btn" class="file-upload-btn">
				
					<!-- svg 카메라 아이콘 -->
					<span class="upload-notice">코디 사진을 올려주세요</span>
					<span class="upload-notice">(*이미지 파일 1장만 가능)</span>	
					
					<!-- span 지우고 썸네일 이미지 덮어씌우기 -->
					<span id="img-result">
						<!-- img -->
						<img class="card-img-top" 
								data-filepath="${coordi.filepath }"
								data-filename="${coordi.filename }" data-uuid="${coordi.uuid }"
								style="width: 700px; height: 700px; border-radius: 15px;" />	
					</span>
					
				</button>	
			</div>
			
			
			<!-- 썸네일 버튼 -> 동적 생성 되게? or 숨겼다 보이게-->
			<div class="form-group-btn">
			
				<div class="form-group-inline" >
				<span class="file-tag">
					<!-- tag-btn -->
					<button class="thumbnail-btn" id='tag-btn' type='button' title='상품태그' hidden="" >+ 상품 태그하기</button>
				</span>
				
				<span class="file-remove">	
					<!-- remove-btn (버튼 안에 휴지통 아이콘) -->
					<button class="thumbnail-btn" id='remove-btn' type='button' title='파일삭제' hidden="">휴지통</button>
				</span>
			</div>	
			</div>
			
		</div>
	</div>
</li>
</ol>


		<!-- 상품태그 -->
		<div class="form-group">
				
		</div>
		
		
		
		<!-- 상단 버튼 -->
			<div class="form-group">
					<button class="modify-btn" type="button">
						<span>수정하기</span>
					</button>

			</div>
		
		
			
	
	
	
	</div>
	</form>
	
	
<script>

var cno = '${coordi.cno}';

var thumbnail = (function loadThumbnail() {
	var uploadResultArr = $('.card-img-top');
   
   $(uploadResultArr).each(function (i, obj) {
      //섬네일 파일을 불러오기 위한 경로
      var fileCallPath = encodeURIComponent($(obj).data('filepath').replace(/\\/g,'/') + "/" + $(obj).data('uuid') + "_" + $(obj).data('filename'));
      // 섬네일 눌렀을 때 원본 파일 호출해서 보여주기
      $(obj).attr('src',"/commons/display?fileName=" + fileCallPath);
      })
   })();
   
   
//버튼 클릭시 파일 업로드 실행
$("#upload-btn").on("click", function (e) {
	console.log("업로드 버튼 클릭")
	
	e.preventDefault();
	$("#uploadFile").click();
});


//파일 업로드 on change
$("input[type='file']").on("change", function(e) {
	
	//썸네일 존재시 삭제
	if($("#remove-btn").length > 0){
		console.log("썸네일 존재시 삭제")
		$("#img-result").empty();	
		$(".thumbnail-btn").hide();
		$("span.upload-notice").show();
	}

	//formData; = new FormData();
    fileInput = $('input[name="file"]');
    files = fileInput[0].files;
    fileObj = files[0];

    
  	//파일 확장자 체크
    let regex = new RegExp("(.*?)\.(bmp|jpeg|jpg|gif|png)$"); //정규표현식
    let maxSize = 5242880; //5MB
	
    function fileCheck(fileName, fileSize) {
    	
        if (!regex.test(fileName)) {
        	alert("사진 파일만 업로드할 수 있습니다.");	
        	return false;
        }
        if(fileSize>maxSize){
        	alert("5MB 이하의 크기만 업로드할 수 있습니다.");
        	return false;
        }
        return true;
    }
    if (!fileCheck(fileObj.name, fileObj.fileSize)) {
    	$('input[name="file"]').val("");
    	$("#img-result").empty();
    	$(".thumbnail-btn").hide();
		$("span.upload-notice").show();
       return false;
    }
    

  	//파일 확장자 검사 통과
    //썸네일 이미지
    var reader = new FileReader();
    
    reader.onload = function(event) {
    	var img = document.createElement("img");
		 img.setAttribute("src", event.target.result)
		 img.setAttribute("style", "width:200px; height:300px;")
		 $("#img-result").empty();
		 document.querySelector("span#img-result").appendChild(img);
		 $(".thumbnail-btn").show();
		 $("span.upload-notice").hide();
	};
	reader.readAsDataURL(event.target.files[0])

}); //end 파일 업로드 on change  
   

//수정하기 버튼
$(".modify-btn").on("click", function () {
	
	console.log("수정하기 버튼 클릭")
            
            
          //파일 업로드
        	formData = new FormData();
        	formData.append("file", files[0]);
        	
        	console.log("파일은 " + files[0])
            
        	$.ajax({
			    url:'/coordies/upload',
			    processData:false,
			    contentType:false, //processData, contentType은 반드시 false
			    data:formData,
			    type:'post',
			    success:function(result) {
			    	coordiImg = result; 
			    	coordi={
				        "title" : $("input[name='title']").val(),
				        "content" : $("textarea[name='content']").val(),	
				        "filepath" : coordiImg.filepath,
				        "filename" : coordiImg.filename,
				        "uuid" : coordiImg.uuid
					}
            
			    	console.log("수정하 코드" + coordi.title)
			    	
			    	//코디 게시글 수정
		            $.ajax({
		                url:'/coordies/' + cno,
		                data:JSON.stringify(coordi),
		                type:'put',
		                contentType:"application/json; charest=UTF-8",
		                success:function (result) {
		                    alert("수정이 완료되었습니다");
		                    self.location="/coordies"
		                }
		            })
			    }
        	}); //end 파일 업로드 ajax
        }) //end 수정하기 버튼

      //휴지통 클릭 -> 썸네일 지우기, @추후 상품 태그 지우기
        $(".file-remove").on("click", "button" ,function () {
        		console.log("휴지통");
        		$("#img-result").empty();
        		$(".thumbnail-btn").hide();
        		$("span.upload-notice").show();

        });      
        
        
        
</script>

<%-- <%@ include file="/WEB-INF/views/include/footer.jsp" %> --%>
</body>
</html>