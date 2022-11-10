<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>Title</title>
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<link href="/resources/css/header.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet" />
<link href="/resources/css/productModify.css" rel="stylesheet" />
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>상품 상세</span>
		</div>
		
	
		
		
		
		<div class="admin_content_main">
			<form id="modifyForm" action="/admin/products" method="post">
			
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 번호</label>
					</div>
					<div class="form_section_content">
						<c:out value='${product.pno }'></c:out>
					</div>
				</div>
				
					<div class="form_section">
					<div class="form_section_tile">
						<label>상품 카테고리</label>
						<div id="select-hidden">
							<select name="pcno" class="form-control empty error"
								id="selectBox">
								<option value="none">상위 카테고리 선택 (필수)</option>
								<option value="1" ${product.scno <= '8' ? 'selected="selected"' : '' }>상의</option>
								<option value="2"${product.scno >= '9' && product.scno <= '15'? 'selected="selected"' : '' }>아우터</option>
								<option value="3"${product.scno >= '16' && product.scno<='22' ? 'selected="selected"' : '' }>바지</option>
								<option value="4"${product.scno >= '28' && product.scno<='28' ? 'selected="selected"' : '' }>원피스 & 스커트</option>
							</select>
							 <select name="scno" class="form-control empty error"
								id="option1">
								<option value="none">하위 카테고리 선택 (필수)</option>
								<option value="1" ${product.scno == '1' ? 'selected="selected"' : '' }>긴팔 티셔츠</option>
								<option value="2"${product.scno == '2' ? 'selected="selected"' : '' }>반팔 티셔츠</option>
								<option value="3"${product.scno == '3' ? 'selected="selected"' : '' }>블라우스</option>
								<option value="4"${product.scno == '4' ? 'selected="selected"' : '' }>셔츠 & 남방</option>
								<option value="5"${product.scno == '5' ? 'selected="selected"' : '' }>맨투맨</option>
								<option value="6"${product.scno == '6' ? 'selected="selected"' : '' }>후드</option>
								<option value="7"${product.scno == '7' ? 'selected="selected"' : '' }>니트 & 스웨터</option>
								<option value="8"${product.scno == '8' ? 'selected="selected"' : '' }>슬리브리스(민소매)</option>
							</select>
							<select name="scno" class="form-control empty error"
								hidden="hidden" id="option2">
								<option value="none">하위 카테고리 선택 (필수)</option>
								<option value="9"${product.scno == '9' ? 'selected="selected"' : '' }>코트</option>
								<option value="10"${product.scno == '10' ? 'selected="selected"' : '' }>패딩</option>
								<option value="11"${product.scno == '11' ? 'selected="selected"' : '' }>점퍼</option>
								<option value="12"${product.scno == '12' ? 'selected="selected"' : '' }>가디건</option>
								<option value="13"${product.scno == '13' ? 'selected="selected"' : '' }>자켓</option>
								<option value="14"${product.scno == '14' ? 'selected="selected"' : '' }>베스트(조끼)</option>
								<option value="15"${product.scno == '15' ? 'selected="selected"' : '' }>후드집업</option>
							</select>
							<select name="scno" class="form-control empty error"
								hidden="hidden3" id="option3">
								<option value="none">하위 카테고리 선택 (필수)</option>
								<option value="16" ${product.scno == '16' ? 'selected="selected"' : '' }>데님 팬츠</option>
								<option value="17"${product.scno == '17' ? 'selected="selected"' : '' }>코튼 팬츠</option>
								<option value="18"${product.scno == '18' ? 'selected="selected"' : '' }>슬랙스</option>
								<option value="19"${product.scno == '19' ? 'selected="selected"' : '' }>트레이닝</option>
								<option value="20"${product.scno == '20' ? 'selected="selected"' : '' }>숏팬츠</option>
								<option value="21"${product.scno == '21' ? 'selected="selected"' : '' }>레깅스</option>
								<option value="22"${product.scno == '22' ? 'selected="selected"' : '' }>기타바지</option>
							</select>
							<select name="scno" class="form-control empty error"
								hidden="hidden" id="option4">
								<option value="none">하위 카테고리 선택 (필수)</option>
								<option value="23"${product.scno == '23' ? 'selected="selected"' : '' }>미니 원피스</option>
								<option value="24"${product.scno == '24' ? 'selected="selected"' : '' }>미디 원피스</option>
								<option value="25"${product.scno == '25' ? 'selected="selected"' : '' }>롱 원피스</option>
								<option value="26"${product.scno == '26' ? 'selected="selected"' : '' }>미니 스커트</option>
								<option value="27"${product.scno == '27' ? 'selected="selected"' : '' }>미디 스커트</option>
								<option value="28"${product.scno == '28' ? 'selected="selected"' : '' }>롱 스커트</option>
							</select>
						</div>
					</div>
				</div>
		
				
				
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 이름</label>
					</div>
					<div class="form_section_content">
						<input id ="name" name="name" value="<c:out value='${product.name }'></c:out>"> 
						<span id="name_warn" class = "ck_warn">수정할 이름을 입력하세요.</span>
					</div>
				</div>



				<div class="form_section">
					<div class="form_section_title">
						<label>색상</label>
					</div>
					<div class="form_section_content">
						<input id ="color" name="color" value="<c:out value ='${product.color }' ></c:out>">
						<span id="color_warn" class = "ck_warn" >수정할 색상을 입력하세요.</span>
					</div>
				</div>
				
				
		<div class="form_section">
			<div class="form_section_title">
				<label>성별</label>
			</div>
			<div class="form_section_content">
			<select id ="gender" name="gender" class="form-control empty error">
				<option value= "none">성별선택 (필수)</option>
				<option value="F" ${product.gender == "F" ? 'selected="selected"' : '' }>F</option>
				<option value="M" ${product.gender == "M" ? 'selected="selected"' : '' }>M</option>
			</select>
			<span id="gender_warn" class = "ck_warn" >수정할 성별을 선택하세요.</span>
			</div>
		</div>
				

			
			
				<div class="form_section">
					<div class="form_section_title">
						<label>가격</label>
					</div>
					<div class="form_section_content">
						<input id ="price" name="price" value="<c:out value ='${product.price }' ></c:out>">
						<span id="price_warn" class = "ck_warn" >수정할 가격을 입력하세요.</span>
					</div>
				</div>
				
				
							<div class="form_section">
                   			<div class="form_section_title">
                   				<label>사이즈 및 수량</label>
                   			</div>
                   			<span id="size_warn">수정할 사이즈 및 수량을 입력하세요.</span>
                   			<c:forEach items="${product.stockList }" var = "stock">
                   			<div class="form_section_content">
                   			
                   				<textarea class="input_block" name="p_size" readonly="readonly"><c:out value='${stock.p_size }'/></textarea>
                   				<input name="amount" value="<c:out value ='${stock.amount }' ></c:out>">
                   			</div>
                   			</c:forEach>
                   		</div>
		
		</div>  
				

				<div class="form_section">
			<div class="form_section_tile">
				<label>계절</label>
			</div>
			<div class="form_section_content">
			<select id ="season" name="season" class="form-control empty error">
			<span id="season_warn" class = "ck_warn" >수정할 계절을 입력하세요.</span>
				<option value="none">계절선택 (필수)</option>
				<option value="1" ${product.season == '1' ? 'selected="selected"' : '' }>1</option>
				<option value="2" ${product.season == '2' ? 'selected="selected"' : '' }>2</option>
				<option value="3" ${product.season == '3' ? 'selected="selected"' : '' }>3</option>
				<option value="4" ${product.season == '4' ? 'selected="selected"' : '' }>4</option>
				<option value="5" ${product.season == '5' ? 'selected="selected"' : '' }>5</option>
				<option value="6" ${product.season == '6' ? 'selected="selected"' : '' } >6</option>
				<option value="7" ${product.season == '7' ? 'selected="selected"' : '' }>7</option>
				<option value="8" ${product.season == '8' ? 'selected="selected"' : '' }>8</option>
				<option value="9" ${product.season == '9' ? 'selected="selected"' : '' }>9</option>
				<option value="10" ${product.season == '10' ? 'selected="selected"' : '' }>10</option>
				<option value="11" ${product.season == '11' ? 'selected="selected"' : '' }>11</option>
				<option value="12" ${product.season == '12' ? 'selected="selected"' : '' }>12</option>
				<option value="0" ${product.season == '0' ? 'selected="selected"' : '' }>사계절</option>
			</select>
			</div>
		</div>
		
		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 이미지</label>
                    			</div>
                    			<div class="form_section_content">
									<input type="file" id ="fileItem" name='uploadFile' style="height: 30px;">
									<div id="uploadResult">
																		
									</div>									
                    			</div>
                    		</div>

				<div class="form_section">
					<div class="form_section_title">
						<label>등록 날짜</label>
					</div>
					<div class="form_section_content">
						<input class="input_block" type="text" readonly="readonly" value="<fmt:formatDate value="${product.created_date}" pattern="yyyy-MM-dd"/>">
					</div>
				</div>



				<div class="btn_section">
					<button id="cancelBtn" class="btn" >취소</button>
					<button id="modifyBtn" class="btn modify_btn" type="button">수 정</button>
					<button id="deleteBtn" class="btn delete_btn" type="button">삭 제</button>
				</div>
			</form>
		</div>
	</div>

	<form id="moveForm" method="get">
		<input type="hidden" name="pno" value='<c:out value="${product.pno }"/>'> 
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'> 
		<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
	</form>

	<script type="text/javascript">
	$(document).ready(function() {
				
		var list;
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
				
			/* 기존 이미지 출력 */
			let pno = '<c:out value="${product.pno}"/>';
			let uploadResult = $("#uploadResult");
			
			$.getJSON("/member/products/getImgList", {pno : pno}, function(arr){
				
				console.log(arr);
				
				
				let str = "";
				let obj = arr[0];
				
				let fileCallPath = encodeURIComponent(obj.filePath.replace(/\\/g,'/')+ "/s_" + obj.uuid + "_" + obj.fileName);
				str += "<div id='result_card'";
				str += "data-path='" + obj.filedPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
				str += ">";
				str += "<img src='/member/products/display?fileName=" + fileCallPath + "'>";
				str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
				str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
				str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
				str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.filePath +"'>";				
				str += "</div>";
				
				uploadResult.html(str);			
				
			});// GetJSON
				
			});
	
	
	/* 취소 버튼 */
	$("#cancelBtn").on("click", function(e){
		e.preventDefault();
		$("#moveForm").submit();
		location.href ="/admin/products/get?pno="+${product.pno}
	});
	
	/* 수정 버튼 */
	$("#modifyBtn").on("click",function(e){
		
		e.preventDefault();
		
 		/* 체크 변수 */
		let nameCk = false;
		let colorCk = false;
		let genderCk = false;
		let seasonCk = false;
		let priceCk = false; 
		
		/* 체크 대상 변수 */
 		let name = $('#name').val();
		let color= $('#color').val();
		let gender = $("#gender").val();
		let season = $("#season").val();
		let price = $("#price").val(); 
		
		/* 공란 체크 */
 		if(name){
			$("#name").css('display','none');
			nameCk = true;
		} else {
			$("#name").css('display','block');
			nameCk = false;
		} 
		
		
	 	if(color){
			$(".color_warn").css('display','none');
			colorCk = true;
		} else {
			$(".color_warn").css('display','block');
			colorCk = false;
		}	
		
		if(gender !='none'){
			$(".gender_warn").css('display','none');
			genderCk = true;
		} else {
			$(".gender_warn").css('display','block');
			genderCk = false;
		}
		
		if(season != 'none'){
			$(".season_warn").css('display','none');
			seasonCk = true;
		} else {
			$(".season_warn").css('display','block');
			seasonCk = false;
		}	
		
		if(price!= 'none'){
			$(".price_warn").css('display','none');
			priceCk = true;
		} else {
			$(".price_warn").css('display','block');
			priceCk = false;
		}	 
		
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
		'scno' : 	scno,	
		'name' : $('.form_section_content').find($('#name')).val(),
		'price' : $('.form_section_content').find($('#price')).val(),
		'color' : $('.form_section_content').find($("#color")).val(),
		'season' : $('.form_section_content').find($("#season")).val(),
		'gender' :$('.form_section_content').find($("#gender")).val(),
		 'stockList' :[
				{
					'p_size' :$('.form_section_content').find($('textarea[name="p_size"]')[0]).val(),
					'amount':$('.form_section_content').find($('input[name="amount"]')[0]).val()
				},
				{
					'p_size':$('.form_section_content').find($('textarea[name="p_size"]')[1]).val(),
					'amount':$('.form_section_content').find($('input[name="amount"]')[1]).val()
				},
				{
					'p_size': $('.form_section_content').find($('textarea[name="p_size"]')[2]).val(),
					'amount':$('.form_section_content').find($('input[name="amount"]')[2]).val()
				},
				{
					'p_size': $('.form_section_content').find($('textarea[name="p_size"]')[3]).val(),
					'amount':$('.form_section_content').find($('input[name="amount"]')[3]).val()
				}
			],
			'imageList' : list}
		
		
		console.log("수정데이터............................."+data)
		
		 $.ajax({
				url : '/admin/products/'+${product.pno},
				data : JSON.stringify(data),
				type : 'PUT',
				contentType : "application/json; charset=UTF-8",
				success : function(result) {
					alert("수정완료");
					location.href = "/admin/products/get?pno="+${product.pno}
				}
			});
		
	});
	/* 이미지 삭제 버튼 동작 */
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
		
		deleteFile();
		
	});
	
	/* 파일 삭제 메서드 */
	function deleteFile(){
		
		
		
		let targetFile = $(".imgDeleteBtn").data("file");
		
		let targetDiv = $("#result_card");
		
		$.ajax({
			url: '/admin/products/deleteImg',
			data : {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function(result){
				console.log(result);
				
				targetDiv.remove();
				$("input[type='file']").val("");
				
			},
			error : function(result){
				console.log(result);
				
				alert("파일을 삭제하지 못하였습니다.")
			}
		}); 
	}
	
	
	/* 글 삭제 버튼 */
 	$("#deleteBtn").on("click", function(e){
		e.preventDefault();
            $.ajax({
                url: "/admin/products/"+${product.pno},
                type : "DELETE",
                success: function (data) {
                	alert("삭제완료");
                	location.href = "/admin/products/"
                		
                }
	});
	}); 
 	/* 이미지 다시 업로드 */
	$("input[type='file']").on("change", function(e) {
		
		/* 이미지 존재시 삭제 */
		if($("#result_card").length > 0){
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
	
	
	
	
	
 	</script>				



	
</body>
</html>