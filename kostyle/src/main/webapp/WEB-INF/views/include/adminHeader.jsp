<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>


<header>
	<div class="header-box">
		<div class="text-logo">
			<a href="#"><span><i>KoStyle4U</i></span></a>
		</div>

		<div class="ul-box">
			<ul>

				<li>${sessionScope.user.name }님반가워요 !</li>
				<li><a href="/members/myPage"><span>메인페이지</span></a></li>
				<li><a href="/members/myPage"><span>마이페이지</span></a></li>

				<li class="line"></li>
				<li><a id="logout" href="/auth/logout"><span>로그아웃</span></a></li>

			</ul>
		</div>
	</div>
</header>

<div class="all-category">
	<div class="top-category">
		<div class='top-category01'>
			<span class='title' data-title='member'><a href='#'>회원</a></span> <span
				class='title' data-title='product'><a href='#'>상품</a></span> <span
				class='title' data-title='auction'><a href='#'>경매</a></span> <span
				class='title' data-title='order'><a href='#'>주문</a></span> <span
				class='title' data-title='customerCenter'><a href='#'>고객센터</a></span>
			<span class='title' data-title='statistics'><a href='#'>통계</a></span>
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
	})
</script>
