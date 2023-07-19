<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>채팅방</h1>
    <div id="chatArea" style="border: 1px solid black; width: 300px; height: 200px; overflow-y: scroll;">
        <!-- 채팅 메시지가 출력되는 부분 -->
    </div>
    <input type="text" id="messageInput" placeholder="메시지를 입력하세요">
    <button onclick="sendMessage()">전송</button>
    
    <script>
        // 웹소켓 연결
        var socket = new WebSocket("ws://localhost:8089/study/chatRoom");

        socket.onmessage = function (event) {
            // 웹소켓 메시지를 받았을 때 처리 로직
            var message = event.data;
            document.getElementById("chatArea").innerText += message + "\n";
        };

        function sendMessage() {
            // 메시지를 전송하는 함수
            var message = document.getElementById("messageInput").value;
            socket.send(message);
            document.getElementById("messageInput").value = "";
        }
    </script>
</body>
</html>