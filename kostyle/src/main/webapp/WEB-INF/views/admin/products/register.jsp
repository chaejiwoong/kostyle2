<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>Title</title>
<style type="text/css">
	#option1 {
		display: none;
	}
	#option2 {
		display: none;
	}
	#option3 {
		display: none;		
	}
	#option4 {
		display: none;		
	}
	
</style>

<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/adminHeader.js"></script>
<link href="/resources/vendor/bootstrap/css/register.css" rel="stylesheet">
<link href="/resources/css/header.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet" />

</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>



    <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" >
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 이미지</label>
					</div>
					<div class="form_section_content"></div>
					<input type="file" multiple id="fileItem" name='uploadFile'
						accept="image/*" style="height: 30px;">
					<div id="uploadResult"></div>
				</div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="small mb-1"></div>
                        <h1 class="display-5 fw-bolder" name = "pno">상품명 <br> <input id="name" name="name" value="-"> </h1>
                        
                        <label>상품 카테고리</label>

						<div id="select-hidden">
							<select name="pcno" class="form-control empty error"
								id="selectBox">
								<option value="none">상위 카테고리 선택 (필수)</option>
								<option value="1">상의</option>
								<option value="2">아우터</option>
								<option value="3">바지</option>
								<option value="4">원피스 & 스커트</option>
							</select>
							 <select name="scno" class="form-control empty error" hidden="hidden"
								id="option1">
								<option value="none">하위 카테고리 선택 (필수)</option>
								<option value="1">긴팔 티셔츠</option>
								<option value="2">반팔 티셔츠</option>
								<option value="3">블라우스</option>
								<option value="4">셔츠 & 남방</option>
								<option value="5">맨투맨</option>
								<option value="6">후드</option>
								<option value="7">니트 & 스웨터</option>
								<option value="8">슬리브리스(민소매)</option>
							</select>
							<select name="scno" class="form-control empty error"
								hidden="hidden" id="option2">
								<option value="none">하위 카테고리 선택 (필수)</option>
								<option value="9">코트</option>
								<option value="10">패딩</option>
								<option value="11">점퍼</option>
								<option value="12">가디건</option>
								<option value="13">자켓</option>
								<option value="14">베스트(조끼)</option>
								<option value="15">후드집업</option>
							</select>
							<select name="scno" class="form-control empty error"
								hidden="hidden3" id="option3">
								<option value="none">하위 카테고리 선택 (필수)</option>
								<option value="16">데님 팬츠</option>
								<option value="17">코튼 팬츠</option>
								<option value="18">슬랙스</option>
								<option value="19">트레이닝</option>
								<option value="20">숏팬츠</option>
								<option value="21">레깅스</option>
								<option value="22">기타바지</option>
							</select>
							<select name="scno" class="form-control empty error"
								hidden="hidden" id="option4">
								<option value="none">하위 카테고리 선택 (필수)</option>
								<option value="23">미니 원피스</option>
								<option value="24">미디 원피스</option>
								<option value="25">롱 원피스</option>
								<option value="26">미니 스커트</option>
								<option value="27">미디 스커트</option>
								<option value="28">롱 스커트</option>
							</select>
						</div>
						
                        <div class="fs-5 mb-5" name = "price">         
                            <span> 상품 가격 : <input id="price" name="price" value="-" ></span>
                        </div>
                        <div class="fs-5 mb-5" name = "color">
                            <span> 상품 색상 : <input id="color" name="color" value="-"></span>
                        </div>
                        <div class="fs-5 mb-5" name = "gender">
                            <span> 상품 성별 : 
                            <select id="gender"  name="gender" class="form-control empty error">
							<option value= "none">성별선택 (필수)</option>
							<option value="F">F</option>
							<option value="M">M</option>
						</select></span>
                        </div>
                          <div class="fs-5 mb-5" name = "season">
                         <span> 계절 : <select id="season" name="season" class="form-control empty error">
						<option value="none">계절선택 (필수)</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="0">사계절</option>
					</select></span>
                        </div>
                        <div class="fs-5 mb-5" >
                           
                            <div class="form_section">
			<div class="form_section_tile">
				<label>사이즈 및 수량</label>
			</div>
			<div class="form_section_content">
			<div  class="form-control empty error" >
				<div id ="s_size">S</div>
				<input id="s_amount"  name="s_amount"  value="-" >
			
			</div>
			</div>
			<div class="form_section_content">
			<div  class="form-control empty error" >
				<div id ="m_size">M</div>
				<input  id="m_amount" name="m_amount" value="-">
			
			</div>
			</div>
			<div class="form_section_content">
			 <div class="form-control empty error" >
				<div id ="l_size" >L</div>
				<input id="l_amount"  name="l_amount"  value="-">
			
			</div>
			</div>
			<div class="form_section_content">
			<div class="form-control empty error" >
				<div id ="xl_size">XL</div>
				<input id="xl_amount" name="xl_amount"  value="-">
			
			</div>
			</div>
		</div>   
                        </div>
							
                  			<div class="btn_section">
					<button id="cancelBtn" class="btn">취 소</button>
					<button id="enrollBtn" class="btn enroll_btn">등 록</button>
				</div>
                    </div>
                </div>
            </div>
        </section>
        

            
            
            
            <!-- 페이징처리 -->
                <form id="moveForm" method="get">
                	<input type="hidden" name="pno" value='<c:out value="${product.pno }"/>'>
                	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
                	<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>' >
                	<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
                </form>
            
            
            



	<script>
	/* 취소 버튼 */
	$("#cancelBtn").click(function(e) {
		e.preventDefault();
		location.href = "/admin/products/"
	});
	
	$(document).ready(function () {
						var imgList;
						let enrollForm = $("#enrollForm")
						$('#selectBox').change(function() {
							var result = $("select[name='pcno']").val();
							if (result == '1') {
								$('#option1').show();
								$('#option2').hide();
								$('#option3').hide();
								$('#option4').hide();
							} else if (result == '2') {
								$('#option1').hide();
								$('#option2').show();
								$('#option3').hide();
								$('#option4').hide();
							} else if (result == '3') {
								$('#option3').show();
								$('#option1').hide();
								$('#option2').hide();
								$('#option4').hide();
							} else {
								$('#option4').show();
								$('#option1').hide();
								$('#option2').hide();
								$('#option3').hide();
								console.log(result);
							}
						});
						/* 상품 등록 버튼 */
						$("#enrollBtn")
								.on("click",function(e) {
											e.preventDefault();
											
											var result = $("select[name='pcno']").val();
											var scno = 0
											if (result == '1') {
												scno = $('#option1').val()
											} else if (result == '2') {
												scno = $('#option2').val()
											} else if (result == '3') {
												scno = $('#option3').val()
											} else {
												scno = $('#option4').val()
											}
											
											var data = {
												'name' : $('#name').val(),
												'scno' : 	scno,			
												'price' : $('#price').val(),
												'color' : $("#color").val(),
												'season' :$("#season").val(),
												'gender' : $("#gender").val(),
										 'stockList' :[
												{
													'p_size' : $('#s_size').text(),
													'amount':$('.form_section_content').find($('#s_amount')).val()
												},
												{
													'p_size': $('#m_size').text(),
													'amount':$('.form_section_content').find($('#m_amount')).val()
												},
												{
													'p_size': $('#l_size').text(),
													'amount':$('.form_section_content').find($('#l_amount')).val()
												},
												{
													'p_size': $('#xl_size').text(),
													'amount':$('.form_section_content').find($('#xl_amount')).val()
												}
											],
											'imageList' : list}
											
											$.ajax({
														url : '/admin/products/register/',
														data : JSON.stringify(data),
														type : 'post',
														contentType : "application/json; charset=UTF-8",
														success : function(
																result) {
															alert("등록완료");
															location.href = "/admin/products/"
														}
													});
										});
					})
	/* 이미지 업로드 */
	$("input[type='file']").on("change", function(e) {
		
		/* 이미지 존재시 삭제 */
		if($(".imgDeleteBtn").length > 0){
			deleteFile();
		}
		let formData = new FormData();
		let fileInput = $('input[name="uploadFile"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		if (!fileCheck(fileObj.name, fileObj.size)) {
			return false;
		}
		for (let i = 0; i < fileList.length; i++) {
			formData.append("uploadFile", fileList[i]);
		}
		$.ajax({
			url : '/admin/products/upload',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			dataType : 'json',
			success : function(result) {
				list = result;
				alert("제발.............");
				showUploadImage(result);
			},
			error : function(result) {
				alert("이미지 파일이 아닙니다.");
			}
		});
	});
	//조건체크
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //1MB	
	function fileCheck(fileName, fileSize) {
		if (fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
		if (!regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			$('input[name="uploadFile"]').val("");
			return false;
		}
		return true;
	}
	/* 이미지 출력 */
	function showUploadImage(uploadResultArr) {
		/* 전달받은 데이터 검증 */
		if (!uploadResultArr || uploadResultArr.length == 0) {
			return
		}
		let uploadResult = $("#uploadResult");
		let obj = uploadResultArr[0];
		let str = "";
		let fileCallPath = encodeURIComponent(obj.filePath.replace(/\\/g,'/')+ "/s_" + obj.uuid + "_" + obj.fileName);
		console.log(fileCallPath)
		str += "<div id='result_card'>";
		str += "<img src='/member/products/display?fileName=" + fileCallPath + "'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.filePath +"'>";		
		str += "</div>";
		
		console.log(str);
		uploadResult.append(str);
	}
	/* 이미지 삭제 버튼 동작 */
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
		
		deleteFile();
		
	});
	
	//이미지 삭제 매서드
	function deleteFile() {
		let targetFile = $(".imgDeleteBtn").data("file");
		let targetDiv = $("#result_card");
		$.ajax({
			url : '/admin/products/deleteImg',
			data : {
				fileName : targetFile
			},
			dataType : 'text',
			type : 'POST',
			success : function(result) {
				console.log(result);
				targetDiv.remove();
				$("input[type='file']").val("");
			},
			error : function(result) {
				console.log(result);
				alert("파일을 삭제하지 못하였습니다.")
			}
		});
	}
	</script>

</body>
>>>>>>> branch 'master' of https://github.com/chaejiwoong/kostyle2.git
</html>