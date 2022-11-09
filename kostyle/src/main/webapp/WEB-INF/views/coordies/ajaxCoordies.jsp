<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/vendor/bootstrap/css/main.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/header.js"></script>
<link href="/resources/css/header.css" rel="stylesheet" />
<link href="/resources/css/footer.css" rel="stylesheet" />

<link href="/resources/css/coordies.css" rel="stylesheet" />

<script type="text/javascript" src="/resources/vendor/jquery/jquery.js"></script>
</head>
<body>


	<!-- Section-->
	<section class="py-5" style="padding-bottom: 0px !important;">

		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 p row-cols-md-3 row-cols-xl-4 justify-content-center">

				<c:forEach items="${getCoordiList}" var="coordi">
				
				
					<div class="col mb-5"
						style="width: 300px; margin-right: 18px !important;">
						<div class="card h-100 img-box">

							<!-- 코디 사진-->
							<img class="card-img-top" id="${coordi.cno }"
								data-filepath="${coordi.filepath }"
								data-filename="${coordi.filename }" data-uuid="${coordi.uuid }"
								style="width: 300px; height: 300px; border-radius: 15px;" />

							<!-- 코디 피드 하단 내용 -->
							<div class="card-body p-4">
								<div class="text-center">
								
									<!-- 코디 제목 -->
									<h5 class="fw-bolder">
										<a href="/coordies/get?cno=${coordi.cno}" class="feed-title-a"><c:out
												value="${coordi.title}" /> </a>
									</h5>
									<br>

									<!-- 코디 작성자 -->
									<div class="text-center">
										<a class="btn btn-outline-dark mt-auto" href="#"><c:out
												value="${coordi.email}" /></a>
									</div>
									<br>
															
									<!-- 좋아요, 댓글, 조회수 -->
									<div class="feed-btn">
										<ul>
											<li>
												<!-- c:when test = ${not empty sessionScope.user} -->
												<div class="">

													<c:if test="${!coordi.like}">
														<!-- 빈하트일때 -->
														<button class="like-btn" id="${coordi.cno }" type="button">
															<i class="fa-regular fa-heart fa-2x"></i>
															<!-- svg 하트 아이콘 -->
															<span class="like-count"><c:out
																	value="${coordi.lk_count}" /></span>
														</button>
													</c:if>

													<c:if test="${coordi.like}">
														<!-- 꽉찬 하트일때 -->
														<button class="like-btn" id="${coordi.cno }" type="button">
															<i class="fa-solid fa-heart fa-2x"></i>
															<!-- svg 하트 아이콘 -->
															<span class="like-count"><c:out
																	value="${coordi.lk_count}" /></span>
														</button>
													</c:if>

												</div>
											</li>
																			
											<li>
												<a class="comment-link" href="">
													<i class="fa-regular fa-comment-dots fa-2x"></i>
													<span class="comment-count"><c:out value="${coordi.c_count}" /></span>
												</a>
											</li>

										</ul>
									</div>


								</div>
							</div>
							<!-- Product actions-->
							<!-- Sale badge-->
							<div class="badge bg-dark text-white position-absolute"
								style="top: 0.5rem; right: 0.5rem">
								<span class="hitcount"> 조회수 <c:out
										value="${coordi.hitcount}" />
								</span>
							</div>
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							</div>
						</div>



					</div>





				</c:forEach>
			</div>
		</div>

	</section>



</body>
</html>
