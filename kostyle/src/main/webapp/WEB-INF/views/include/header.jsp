<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="wrap">
<header>
	<div class="header-box">
		<div class="text-logo">
			<a href="/main"><span><i>KoStyle4U</i></span></a>
		</div>
		<div class="search-form-box">
			<div>
				<form method="get">
					<input class="search" type="search" name="search" placeholder="검색">
				</form>
			</div>
		</div>
		<div class="ul-box">
			<ul>
				<c:if test="${empty sessionScope.user}">
					<li><a href="/auth/login"><span>로그인</span></a></li>
					<li class="line"></li>
					<li><a href="/auth/register"><span>회원가입</span></a></li>
				</c:if>
				<c:if test="${not empty sessionScope.user}">
				<li>${sessionScope.user.name }님 반가워요 ! </li>
					<c:if test="${sessionScope.user.authority eq 'ROLE_ADMIN' }">
						<li><a href="/admin/members"><span>관리자페이지</span></a></li>
					</c:if>
					<li><a href="/members/myPage"><span>마이페이지</span></a></li>
					
					<li class="line"></li>
					<li><a id="logout" href="/auth/logout"><span>로그아웃</span></a></li>
				</c:if>

			</ul>
		</div>
	</div>
</header>
<nav>
	<div>
		<ul class="nav-ul">
			<li class="li-list" data-list="shop"><a href="/main"><span
					class="products">상품</span></a></li>
			<li class="li-list"><a href="/coordies"><span class="coordies">코디</span></a></li>
			<li class="li-list"><a href="/auctions"><span class="auctions">경매</span></a></li>
			<li class="li-list"><a class="customerCenter"
				href="/customerCenter/qna?category=all"><span>고객센터</span></a></li>
			<li class="li-list"><a href="#"><span>About Us</span></a></li>
		</ul>
	</div>
</nav>

<div class="all-category">
	<div class="top-category">
		<div class='top-category01'>
			<span class='title-name' data-title='clothes'><a class="title"
				href='1'>상의</a></span> <span class="title-name" data-title='outerwear'><a
				class="title" href='2'>아우터</a></span> <span class="title-name"
				data-title='pants'><a class="title" href='3'>바지</a></span> <span
				class="title-name" data-title='dress-skirt'><a class="title"
				href='4'>원피스/스커트</a></span>
		</div>
	</div>
	<div class="bottom-category"></div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$('#logout').on('click', function(e) {
			e.preventDefault();
			$.ajax({
				type : 'post',
				url : '/auth/logout',
				success : function(result, status, xhr) {
					
					alert('로그아웃이 완료되었습니다..')
					self.location='/auth/login'
				}
			})

		})
		
		$('.top-category01 a').on('click', function(e){
			e.preventDefault();
			console.log($(this).attr('href'))
			location.href="/main?pcno=" + $(this).attr('href')

			
		})
		
		$(document).on('click','.bottom-category a', function(e){
			e.preventDefault();
			console.log($(this).attr('href'))
			location.href="/main?scno=" + $(this).attr('href')
		})
	})
</script>
