<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
 <h1>채팅방 생성</h1>
    <button id="createButton">채팅방 생성</button>
    
    <script>
        $(document).ready(function() {
            // 채팅방 생성 버튼 클릭 이벤트 핸들러
            $("#createButton").click(function() {
            	
                $.ajax({
                    type: "POST",
                    url: "createChatRoom",
                    success: function(roomId) {
                        // 생성된 채팅방으로 이동합니다.
                        window.location.href = 'chatRoom?roomId=' + roomId;
                    },
                    error: function(xhr, status, error) {
                        alert("채팅방 생성에 실패했습니다.");
                    }
                });
            });
        });
    </script>

</body>
</html>