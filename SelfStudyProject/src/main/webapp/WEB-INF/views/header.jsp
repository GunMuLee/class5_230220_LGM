<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
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
					<button type="button" id="position" class="btn position-relative"
						data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="countReset()">
						<i class="bi bi-bell"></i>
					</button>
        	어서오세요 ${sessionScope.id } 님
        	<button type="button" class="btn btn-outline-primary me-2"
						onclick="location.href='logOut'">로그아웃</button>
				</c:otherwise>
			</c:choose>
		</div>
	</header>


	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">알림</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" onclick="countReset()"></button>
				</div>
				<div class="modal-body"></div>
			</div>
		</div>
	</div>

	<script
		src="${pageContext.request.contextPath }/resources/js/jquery-3.7.0.js"></script>
	<script type="text/javascript">
		//전송 버튼 누르는 이벤트
			var count = 0;

		$(function() {
			var sock = new SockJS('http://localhost:8089/study/echo');
			sock.onmessage = onMessage;
			sock.onclose = onClose;
			sock.onopen = onOpen;


		});

		//서버에서 메시지를 받았을 때
		function onMessage(msg) {
			
			if(count == 0){
				
				$("#position").append(
				'<span id="count" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">'
				+'</span>'
				);
			}

			var data = msg.data;
			var sessionId = null; //데이터를 보낸 사람
			var message = null;

			var arr = data.split(",");

			for (var i = 0; i < arr.length; i++) {
				console.log('arr[' + i + ']: ' + arr[i]);
			}

			count+=1;

			message = arr[0];
			url = arr[1];

			$(".modal-body").after("<a href="+ url +">" + message + "</a>");

			$("#count").empty();
			$("#count").append(count);


			//로그인 한 클라이언트와 타 클라이언트를 분류하기 위함

		}
		//채팅창에서 나갔을 때
		function onClose(evt) {

		}
		//채팅창에 들어왔을 때
		function onOpen(evt) {

		}
		
		function countReset(){
			count = 0;
			$("#count").remove();
			
		}
	</script>
</body>
</html>