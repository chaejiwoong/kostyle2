<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<html>
<head>
<meta charset="UTF-8">
<title>코디 글 목록</title>
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<link href="/resources/css/header.css" rel="stylesheet"/>
<link href="/resources/css/footer.css" rel="stylesheet"/>


<script src="https://kit.fontawesome.com/89998ce003.js" crossorigin="anonymous"></script>

</head>
<body>


<c:forEach items="${getCoordiList}" var="coordi">
	<li class="form-group-li">

			<!-- 글번호 -->
			<div class="feed-no">
				<span>글번호 : ${coordi.cno }</span>
			</div>
			
			<!-- 작성자 -->
			<div class="feed-writer">
				작성자: <a class="" href=""><c:out value="${coordi.email}" /></a>
			</div>
			
				
			<!-- 코디 사진 -->
			<div class="feed-img">
				<img class="thumb" id="${coordi.cno }" data-filepath="${coordi.filepath }" data-filename="${coordi.filename }" data-uuid="${coordi.uuid }"
			 style="width: 400px; height: 400px;">
			</div>
			
			<!-- 좋아요, 댓글, 조회수 -->
			<div class="feed-btn">
			
			
			<!-- c:when test = ${not empty sessionScope.user} -->				
				<div class="" >
							
						<c:if test="${!coordi.like}"><!-- 빈하트일때 -->
							<button class="like-btn" id="${coordi.cno }" type="button">
								<i class="fa-regular fa-heart"></i><!-- svg 하트 아이콘 -->좋아요							
								<span class="like-count"><c:out value="${coordi.lk_count}" /></span>
							</button>
						</c:if>
						
						 <c:if test="${coordi.like}"><!-- 꽉찬 하트일때 -->
							<button class="like-btn" id="${coordi.cno }" type="button">
								<i class="fa-solid fa-heart"></i><!-- svg 하트 아이콘 -->좋아요
								<span class="like-count"><c:out value="${coordi.lk_count}" /></span>
							</button>
						</c:if>									
					
				</div>
		
				<a class="comment-link" href="">
					<!-- svg 댓글 아이콘 -->댓글
					<span class="comment-count"><c:out value="${coordi.c_count}" /></span>
				</a>
				
				<span class="hitcount">
					조회수 <c:out value="${coordi.hitcount}" />
				</span>

			</div>
			
			<!-- 제목 -->
			<div class="feed-title">
				<!-- a링크 혹은 button 타입으로? (오늘의 집은 버튼임) -->
				<a href="/coordies/get?cno=${coordi.cno}" class="feed-title-a">	제목: <c:out value="${coordi.title}" /> </a>
			</div>
		
			====================================================	

	</li>
</c:forEach>

</body>
</html>

