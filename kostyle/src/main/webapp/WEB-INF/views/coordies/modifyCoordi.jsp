<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 

<html>
<head>
<meta charset="UTF-8">
<title>코디 글 수정</title>
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<link href="/resources/css/header.css" rel="stylesheet"/>
<link href="/resources/css/footer.css" rel="stylesheet"/>


<style type="text/css">
 	.container {
 		width: 80% !important;
 		margin-top: 100px;
 		position: relative;
 	}
 	.col-6 {
	    width: 40%;
	    height: 85%;
	    display: inline-block;
	    margin-left: 5%;
 	}
 	#upload-btn{
 		width: 100%; 
 		height: 100%;
 		background-color: rgb(247, 248, 250);
    	border-radius: 4px;
    	text-align: center;
 	}
 	.title{
 		width: 100%;
 		height: 100%;
 	}
 	.content{
 		width: 100%;
 	}
	.col-6-box {
	    position: relative;
	    top: 60px;
    }
    .row-2-btn{
    	margin-top: -110px;
    	margin-left: 80px;
    	background-color: none;
    } 
    #modify-btn {
	    width: 100%;
	    height: 10%;
	    display: block;
	    margin: auto;
	    background-color: #f891aa;
	    border-color:#f891aa;
	    font-weight: bold;
    }
     .thumbnail-btn{
		border: none;
	    background: none;
	    font: inherit;
	    font-size: 14px;
	    line-height: 18px;
	    width: auto;
	    color: #FFFFFF;
    } 
    #remove-btn{
    	background-color: none;
    }
    #tag-btn{
    	background-color: #f891aa;
    	height: 30px;
    	font-weight: bold;
    }
 </style>

</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>


<div class="container">
<form role="form" action="/coordies/modify" method="post">

	


	<div class="row-1">
		
		<!-- 파일 업로드 -->
		<div class="col-6">
			<!-- 업로드 버튼 -->
			<div class="form-group-upload" style="width: 90%; height: 100%;">
				<input id="uploadFile" name="file" type="file" accept="image/*" class="form-control"  
					style="display: none" multiple>
				<button id="upload-btn" class="file-upload-btn" >
						
						<span class="upload-notice" hidden="">코디 사진을 올려주세요</span>
						<span class="upload-notice" hidden="">(*이미지 파일 1장만 가능)</span>	
						
						<!-- span 지우고 썸네일 이미지 덮어씌우기 -->
						<span id="img-result">
							<!-- img -->
							<img class="card-img-top" 
								data-filepath="${coordi.filepath }"
								data-filename="${coordi.filename }" data-uuid="${coordi.uuid }"
								style="width: 100%; height: 100%; border-radius: 15px;" />
						</span>
				</button>
			</div>				
		</div>
		

		<!-- 제목, 내용 -->
		<div class="col-6 col-6-box">
			<div class="form-group" >
			<!-- 제목 -->
				<div class="form-group-title" style="width: 90%; height: 50px;">
					<input title="제목" class="title" name="title" value="${coordi.title}">
				</div>
			<!-- 내용 -->
				<div class="form-group-content"  style="width: 90%; height: 150px; position: relative;  top: 25px;">
					<textarea title="내용" class="content" name="content" style=" overflow-x: hidden; overflow-wrap: break-word; height: 200px; resize: none;">
						${coordi.content}
					</textarea>
				</div>
			</div>
		</div>
		
	</div>	
	
	<!-- 썸네일 버튼 -> 동적 생성 되게? or 숨겼다 보이게-->
	<div class="row-2">
		<div class="form-group-btn row-2-btn">	
	
			<span class="file-tag">
				<!-- tag-btn -->
				<button class="thumbnail-btn" id='tag-btn' type='button' title='상품태그' hidden="" >+ 상품 태그하기</button>
			</span>
				
			<span class="file-remove">	
				<!-- remove-btn (버튼 안에 휴지통 아이콘) -->
				<button class="thumbnail-btn" id='remove-btn' type='button' title='파일삭제' hidden="">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
					  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
					  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
					</svg>
				</button>
			</span>

		</div>
	</div>
	
	<!-- 상품 태그 -->
	<div class="row-3">
	</div>
	
	<!-- 하단 버튼 -->
	<div class="row-4" style="margin-top:100px; margin-bottom: 50px;">
		<div class="form-group-btn row-4-btn">
			<button type="button" class="btn btn-primary btn-lg" id="modify-btn" >수정하기</button>
		</div>
	</div>

	
</form>
</div>
			

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
		 img.setAttribute("style", "width:100%; height:100%;")
		 $("#img-result").empty();
		 document.querySelector("span#img-result").appendChild(img);
		 $(".thumbnail-btn").show();
		 $("span.upload-notice").hide();
	};
	reader.readAsDataURL(event.target.files[0])

}); //end 파일 업로드 on change  
   

//수정하기 버튼
$("#modify-btn").on("click", function () {
	
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