<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>코디 글 등록</title>
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<link href="/resources/css/header.css" rel="stylesheet"/>
<link href="/resources/css/footer.css" rel="stylesheet"/>


 <style>
 html {
    color: #424242;
    background: #fff;
}
 .modal {
        position: absolute;
        top: 0;
        left: 0;

        width: 100%;
        height: 100%;

        display: none;

        background-color: rgba(0, 0, 0, 0.4);
      }
body, html {
    line-height: 1;
    font-family: OhouseSans,Noto Sans KR,Apple SD Gothic Neo,ë§‘ì€ ê³ ë”•,Malgun Gothic,sans-serif;
    -webkit-font-smoothing: antialiased;
    letter-spacing: -.4px;
    font-size: 15px;
}
      
body, div, form, input, li, ol, textarea, ul {
    margin: 0;
    padding: 0;
}
ol{
    list-style: none;
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
.form-group-div1{
	padding: 0px 0px 40px;
    width:768px
}
.file-upload-btn {
    margin: 0px;
    padding: 0px 0px 60%;
    border: none;
    background: none;
    font: inherit;
    display: block;
    position: relative;
    width: 100%;
    transition: opacity 0.1s ease 0s;
    border-radius: 4px;
    box-sizing: border-box;
}
element.style {
    overflow: hidden;
    overflow-wrap: break-word;
    height: 145px;
}

 </style>






</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<h1>코디 글쓰기</h1>
<ol><li></li></ol>
	
<form class="register-form" role="form" method="post" enctype="multipart/form-data">
	<div class="panel-body">
<ol>
<li>
	<div class="form-group-1">
		<!-- 제목, 내용 -->
		<div class="form-group-1">
		
			<div class="form-group-title">
				<input title="제목" class="" name="title"  placeholder="제목을 입력해주세요(필수)" >
			</div>
			
			<div class="form-group-content">
				<textarea title="내용" rows="6" name="content" placeholder="코디에 대해 설명해주세요" 
					style="overflow: hidden; overflow-wrap: break-word; height: 145px;"></textarea>
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
			
			
			
		<!-- 하단 버튼 -->
		<div class="form-group">
		
			<div class="form-group-btn">
				<button id="register-btn" type="button">
					<span>올리기</span>
				</button>
			</div>
			
		</div>
			
			
	</div>
</form>
	
<script>
$(document).ready(function () {

    var formData;
    var fileInput;
    var files;
    var fileObj;
    
});


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

	
	//썸네일 올라가면 파일 삭제 버튼, 상품태그 버튼 동적 -> 
	//@계속 버튼이 생성되는 문제점 => 썸네일 지울때마다 버튼도 지운다 or 버튼을 숨겼다가 보이게 한다
	//
	/* let tagBtn = "<button id='tag-btn' type='button' title='상품태그'>+ 상품 태그하기</button>";	
	$(".file-tag").append(tagBtn);
	let removeBtn = "<button id='remove-btn' type='button' title='파일삭제'>휴지통</button>";
	$(".file-remove").append(removeBtn); */
	
	

}); //end 파일 업로드 on change



//올리기 버튼 클릭
$("#register-btn").on("click", function () {
	
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
	    dataType:'JSON',
	    success:function(result) {
	    	coordiImg = result; 
	    	coordi={
		        "title" : $("input[name='title']").val(),
		        "content" : $("textarea[name='content']").val(),	
		        "filepath" : coordiImg.filepath,
		        "filename" : coordiImg.filename,
		        "uuid" : coordiImg.uuid
			}
	    	
	    	//코디 게시글 등록
	    	$.ajax({           		  
	    	    url:"/coordies/register",
	    	    type:'post',
	    	    data:JSON.stringify(coordi),
	    	    contentType:"application/json; charset=UTF-8",
	    	    success: function (result, status, xhr) {
	    	        console.log(result);
	    	        alert('코디 등록이 완료되었습니다.');
	    	        self.location="/coordies";
	    	    },
	    	    error: function (xhr, status, er) {
	    	        console.log(xhr)
	    	    }
	    	}); //코디 게시글 등록 ajax 끝    	
	    },
	    error : function(result, xhr) {
	        console.log(xhr)
	    }   
	}); //end 파일 업로드 ajax 
}) //end 올리기 버튼



//휴지통 클릭 -> 썸네일 지우기, @추후 상품 태그 지우기
$(".file-remove").on("click", "button" ,function () {
		console.log("휴지통");
		$("#img-result").empty();
		$(".thumbnail-btn").hide();
		$("span.upload-notice").show();

});




</script>
<script type="text/javascript" src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<%-- <%@ include file="/WEB-INF/views/include/footer.jsp"%> --%>
</body>
</html>


