<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.ContextPath }/resources/js/jquery-3.7.0.js"></script>
<script type="text/javascript">
	
	$(function () {
		connectWs();
	});
	
	function connectWs(){
		var ws = new SockJS("http://localhost:8080/echo");
		sock = ws;

		ws.onopen = function() {
			console.log("연결완료");
	 		ws.send($('#socketuserID').val());
		};

		ws.onmessage = function(event) {
			/* 받을 알람이 있을 때 */
			console.log(event.data);
		};

		ws.onclose = function() {
		    console.log('close');
		};

	};

	
</script>
</head>
<body>

</body>
</html>