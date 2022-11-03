<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
 <script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<link href="/resources/css/header.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet" />
<link href="/resources/css/productGet.css" rel="stylesheet" />


</head>
<body>

<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>상품 상세</span></div>
                    <div class="admin_content_main">
 
                    
                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>상품 번호</label>
                   			</div>
                   			<div class="form_section_content">
                   				<input class="input_block" name="pno" readonly="readonly" value="<c:out value='${product.pno }'></c:out>">
                   			</div>
                   		</div>      
                   		
                   		
                   		
                   		
                   		
                   		
                   		              
                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>상품 이름</label>
                   			</div>
                   			<div class="form_section_content">
                   				<input class="input_block" name="name" readonly="readonly" value="<c:out value='${product.name }'></c:out>" >
                   			</div>
                   		</div>
                   		
                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>색상</label>
                   			</div>
                   			<div class="form_section_content">
                   				<textarea class="input_block" name="color" readonly="readonly"><c:out value='${product.color }'/></textarea>
                   			</div>
                   		</div>
                   		
                   		<div class="form_section">
                   			<div class="form_section_title">
                   				<label>성별</label>
                   			</div>
                   			<div class="form_section_content">
                   				<textarea class="input_block" name="gender" readonly="readonly"><c:out value='${product.gender }'/></textarea>
                   			</div>
                   		</div>
        				<div class="form_section">
                   			<div class="form_section_title">
                   				<label>가격</label>
                   			</div>
                   			<div class="form_section_content">
                   				<textarea class="input_block" name="price" readonly="readonly"><c:out value='${product.price }'/></textarea>
                   			</div>
                   		</div>

                   		
  						<div class="form_section">
                   			<div class="form_section_title">
                   				<label>사이즈 및 수량</label>
                   			</div>
                   			<c:forEach items="${product.stockList }" var = "stock">
                   			<div class="form_section_content">
                   				<textarea class="input_block" name="p_size" readonly="readonly"><c:out value='${stock.p_size }'/></textarea>
                   				<textarea class="input_block" name="amount" readonly="readonly"><c:out value='${stock.amount}'/></textarea>
                   			</div>
                   			</c:forEach>
                   		</div>
                   		
                   		
						<div class="form_section">
                   			<div class="form_section_title">
                   				<label>계절</label>
                   			</div>
                   			<div class="form_section_content">
                   				<textarea class="input_block" name="season" readonly="readonly"><c:out value='${product.season }'/></textarea>
                   			</div>
                   		</div>
                   		
                   		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 이미지</label>
                    			</div>
                    			<div class="form_section_content">

									<div id="uploadReslut">
																		
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
                   		 <div class="form_section">
                   			<div class="form_section_title">
                   				<label>수정 날짜</label>
                   			</div>
                   			<div class="form_section_content">
                   				<input class="input_block" type="text" readonly="readonly" value="<fmt:formatDate value="${product.last_modified_date}" pattern="yyyy-MM-dd"/>">
                   			</div>
                   		</div>
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">상품 목록</button>
	                    		<button id="modifyBtn" class="btn modify_btn">수 정</button>
	                    	</div> 
                    </div>                    
                </div>
                
                <form id="moveForm" method="get">
                	<input type="hidden" name="pno" value='<c:out value="${product.pno }"/>'>
                	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
                	<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>' >
                	<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
                </form>

<script type="text/javascript">

let moveForm = $("#moveForm");

/* 상품 관리 페이지 이동 버튼 */
$("#cancelBtn").on("click", function(e){
	
	e.preventDefault();
	
	$("input[name=pno]").remove();
	moveForm.attr("action", "/admin/products")
	moveForm.submit();
	
});

/* 상품 수정 페이지 이동 버튼 */
$("#modifyBtn").on("click", function(e){
	
	e.preventDefault();
	let addInput = '<input type="hidden" name="pno" value="${product.pno}">';
	$("#moveForm").append(addInput);
	$("#moveForm").attr("action", "/admin/products/modify");
	$("#moveForm").submit();
	
});

/* 수정 성공 이벤트 */
let modify_result = '${modify_result}';

if(modify_result == 1){
	alert("수정 완료");
}	
$(document).ready(function() {
	let pno = '<c:out value="${product.pno }"/>';
	let uploadReslut = $("#uploadReslut");
	
	console.log("ddddddddddddddddddddddddddddddddddddddddddddddddd");
	
	$.getJSON("/member/products/getImgList", {pno : pno}, function(arr){	
		let str = "";
		let obj = arr[0];
		
		console.log("CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC");
		
		if(arr.length === 0){	
			let str = "";
			str += "<div id='result_card'>";
			str += "<img src='/resources/img/noimg.png'>";
			str += "</div>";
			
			uploadReslut.html(str);	
			return;
		}	
		
		let fileCallPath = encodeURIComponent(obj.filePath.replace(/\\/g,'/')+ "/s_" + obj.uuid + "_" + obj.fileName);
		str += "<div id='result_card'";
		str += "data-path='" + obj.filePath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
		str += ">";
		str += "<img src='/member/products/display?fileName=" + fileCallPath + "'>";
		str += "</div>";		
		console.log("경롱ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ"+fileCallPath);
		
		uploadReslut.html(str);		
	});	
	
})


</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
