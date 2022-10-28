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
<link href="/resources/css/productRegister.css" rel="stylesheet" />
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>



	<div>


		<div class="admin_content_main">
			<form action="/admin/products/register" method="post" id="enrollForm">
				<div class="form_section">
				
				
				<!-- 	<div class="form_section_tile">
						<label>상품 카테고리</label>
					</div>

					<div>
						<select name="pcno" class="form-control empty error">
							<option value disabled>상위 카테고리 선택 (필수)</option>
							<option value="0">상의</option>
							<option value="1">아우터</option>
							<option value="2">바지</option>
							<option value="3">원피스 & 스커트</option>
						</select> <select name="scno" class="form-control empty error">
							<option value disabled>하위 카테고리 선택 (필수)</option>
							<option value="0">긴팔 티셔츠</option>
							<option value="1">반팔 티셔츠</option>
							<option value="2">블라우스</option>
							<option value="3">셔츠 & 남방</option>
							<option value="4">맨투맨</option>
							<option value="5">후드</option>
							<option value="6">니트 & 스웨터</option>
							<option value="7">슬리브리스(민소매)</option>
						</select> <select name="scno" class="form-control empty error">
							<option value disabled>하위 카테고리 선택 (필수)</option>
							<option value="0">코트</option>
							<option value="1">패딩</option>
							<option value="2">점퍼</option>
							<option value="3">가디건</option>
							<option value="4">자켓</option>
							<option value="5">베스트(조끼)</option>
							<option value="6">후드집업</option>
						</select> <select name="scno" class="form-control empty error">
							<option value disabled>하위 카테고리 선택 (필수)</option>
							<option value="0">데님 팬츠</option>
							<option value="1">코튼 팬츠</option>
							<option value="2">슬랙스</option>
							<option value="3">트레이닝</option>
							<option value="4">숏팬츠</option>
							<option value="5">레깅스</option>
							<option value="6">기타바지</option>
						</select> <select name="scno" class="form-control empty error">
							<option value disabled>하위 카테고리 선택 (필수)</option>
							<option value="0">미니 원피스</option>
							<option value="1">미디 원피스</option>
							<option value="2">롱 원피스</option>
							<option value="3">미니 스커트</option>
							<option value="4">미디 스커트</option>
							<option value="5">롱 스커트</option>
						</select>


					</div>
				</div>
		</div> -->

	<!-- 	<div class="form_section">
			<div class="form_section_title">
				<label>상품 이미지</label>
			</div>
			<div class="form_section_content"></div>
			<input type="file" multiple id="fileItem" name='uploadFile'
				style="height: 30px;">
			<div id="uploadResult"> -->
<!-- 				<div id="result_card">
					<div class="imgDeleteBtn">x</div>
					<img src="display?fileName=test.jpg">
				</div> -->
			<!-- </div> -->

		</div>

		<div class="form_section">
			<div class="form_section_tile">
				<label>상품 명</label>
			</div>
			<div class="form_section_content">
				<input name="name" value="0">
			</div>
		</div>

		<div class="form_section">
			<div class="form_section_tile">
				<label>상품 가격</label>
			</div>
			<div class="form_section_content">
				<input name="price" value="0">
			</div>
		</div>

		<div class="form_section">
			<div class="form_section_title">
				<label>성별</label>
			</div>

			<select name="gender" class="form-control empty error">
				<option value="F">F</option>
				<option value="M">M</option>
			</select>

		</div>

		<div class="form_section">
			<div class="form_section_title">
				<label>색상</label>
			</div>
			<div class="form_section_content">
				<input name="color">
			</div>
		</div>

<!-- 		<div class="form_section">
			<div class="form_section_tile">
				<label>사이즈 및 수량</label>
			</div>
			<select name="p_size" class="form-control empty error">
				<option value="0">S</option>
				<input name="amount">
			</select> <select name="p_size" class="form-control empty error">
				<option value="0">M</option>
				<input name="amount">
			</select> <select name="pp_size" class="form-control empty error">
				<option value="0">L</option>
				<input name="amount">
			</select> <select name="p_size" class="form-control empty error">
				<option value="0">XL</option>
				<input name="amount">
			</select>
		</div> -->


		<div class="form_section">
			<div class="form_section_tile">
				<label>계절선택</label>
			</div>
			<select name="season" class="form-control empty error">
				<option value disabled>계절선택 (필수)</option>
				<option value="0">1</option>
				<option value="1">2</option>
				<option value="2">3</option>
				<option value="3">4</option>
				<option value="4">5</option>
				<option value="5">6</option>
				<option value="6">7</option>
				<option value="7">8</option>
				<option value="8">9</option>
				<option value="9">10</option>
				<option value="10">11</option>
				<option value="11">12</option>
				<option value="12">사계절</option>
			</select>
		</div>
		</form>

		<div class="btn_section">
			<button id="cancelBtn" class="btn">취 소</button>
			<button id="enrollBtn" class="btn enroll_btn">등 록</button>
		</div>
	</div>

	<script>
		let enrollForm = $("#enrollForm")

		/* 취소 버튼 */
		$("#cancelBtn").click(function() {

			location.href = "/admin/products/"

		});

		/* 상품 등록 버튼 */
		$("#enrollBtn").on("click", function(e) {

			e.preventDefault();

			enrollForm.submit();

		});

		/* 이미지 업로드 */
		$("input[type='file']").on("change", function(e) {

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
				url : '/admin/products/uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					console.log(result);
					showUploadImage(result);
				}
			});

		});

		let regex = new RegExp("(.*?)\.(jpg|png)$");
		let maxSize = 1048576; //1MB

		function fileCheck(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (!regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}

			return true;

		}

	/* 이미지 출력 */
		/* function showUploadImage(uploadResultArr) { */

			/* 전달받은 데이터 검증 */
/* 			if (!uploadResultArr || uploadResultArr.length == 0) {
				return
			}

			let uploadResult = $("#uploadResult");

			let obj = uploadResultArr[0];

			let str = "";

			console.log(obj.filePath);
			console.log(obj.uuid);
			console.log(obj.fileName);

			let fileCallPath = encodeURIComponent(obj.filePath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);

			str += "<div id='result_card'>";
			str += "<img src='/display?fileName=" + fileCallPath + "'>";
			str += "<div class='imgDeleteBtn'>x</div>";
			str += "</div>";
			console.log(fileCallPath);
			uploadResult.append(str);

		}  */
	</script>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
