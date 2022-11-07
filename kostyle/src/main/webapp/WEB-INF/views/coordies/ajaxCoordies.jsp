<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<c:forEach items="${getCoordiList}" var="coordi">
	<div class="form-group">
		<div class="form-group-feed">
		
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
				<!-- img src="./코디 사진 경로 -->
			</div>
			
			<!-- 좋아요, 댓글, 조회수 -->
			<div class="feed-btn">
			
			
			<!-- c:when test = ${not empty sessionScope.user} -->				
				<div class="" >
							
						<c:if test="${coordi.like}"><!-- 빈하트일때 -->
							<button class="like-btn" id="${coordi.cno }" type="button">
								<!-- svg 하트 아이콘 -->좋아요
								<span class="like-count"><c:out value="${coordi.lk_count}" /></span>
							</button>
						</c:if>
						
						 <c:if test="${!coordi.like}"><!-- 꽉찬 하트일때 -->
							<button class="like-btn" id="${coordi.cno }" type="button">
								<!-- svg 하트 아이콘 -->좋아요
								<span class="like-count"><c:out value="${coordi.lk_count}" /></span>
							</button>
						</c:if>									
					
				</div>
				<!-- 로그인 상태 아닐 때 -> 빈하트, 하트클릭 -> 튕겨져 나감 -->
				<!-- 아싸리 권한 확인으로 튕기기 -->
				<%-- <c:otherwise>
					<!-- 빈하트 이미지 -->
					<button class="like-btn" id="${coordi.cno }" type="button">
							<!-- svg 하트 아이콘 -->좋아요
							<span class="like-count">${coordi.lk_count}</span>
					</button>
				</c:otherwise> --%>
				
				
				
		
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
				<a href="/coordies/get?cno=${coordi.cno}">	제목: <c:out value="${coordi.title}" /> </a>
			</div>
		
			====================================================	
		</div>
		
		
		
		<!-- 로딩이미지? 할까 말까 -->
		<!-- <div class="form-group-loading">
			<div class="back-drop">
			<img src="./로딩이미지 사진 경로"> 
			</div>
		</div> -->
		
		
	</div>	
</c:forEach>		

