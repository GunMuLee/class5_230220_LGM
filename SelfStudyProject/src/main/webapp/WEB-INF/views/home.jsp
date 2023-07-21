<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
<meta name="generator" content="Hugo 0.104.2">
<title>Album example · Bootstrap v5.2</title>

<link rel="canonical"
	href="https://getbootstrap.kr/docs/5.2/examples/album/">





<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/5.2/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon"
	href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg"
	color="#712cf9">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#712cf9">


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}
</style>


</head>
<body>

	<header
		class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
		<a href="/"
			class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
			<svg class="bi me-2" width="40" height="32" role="img"
				aria-label="Bootstrap">
				<use xlink:href="#bootstrap"></use></svg>
		</a>

		<ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
			<li><a href="#" class="nav-link px-2 link-secondary">Home</a></li>
			<li><a href="#" class="nav-link px-2 link-dark">Features</a></li>
			<li><a href="#" class="nav-link px-2 link-dark">Pricing</a></li>
			<li><a href="#" class="nav-link px-2 link-dark">FAQs</a></li>
			<li><a href="#" class="nav-link px-2 link-dark">About</a></li>
		</ul>

		<div class="col-md-3 text-end">
			<c:choose>
				<c:when test="${empty sessionScope.id }">
					<button type="button" class="btn btn-outline-primary me-2"
						onclick="location.href='loginForm'">로그인</button>
					<button type="button" class="btn btn-primary"
						onclick="location.href='singUpForm'">회원가입</button>
				</c:when>
				<c:otherwise>
        	어서오세요 ${sessionScope.id } 님
        	<button type="button" class="btn btn-outline-primary me-2"
						onclick="location.href='logOut'">로그아웃</button>
				</c:otherwise>
			</c:choose>
		</div>


	</header>

	<main>

		<div class="container text-center">
			<div class="row">
				<div class="col">
					<div class="card text-start">
						<div class="card-header"><h2>채팅</h2></div>
						<div class="card-body text-center">
							<h5 class="card-title">웹 소켓을 이용한 채팅</h5>
							<a href="chatList" class="btn btn-primary w-50">시현</a>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<div class="card-header"></div>
						<div class="card-body">
							<h5 class="card-title">Special title treatment</h5>
							<p class="card-text">With supporting text below as a natural
								lead-in to additional content.</p>
							<a href="#" class="btn btn-primary">Go somewhere</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	</main>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>


</body>
</html>

