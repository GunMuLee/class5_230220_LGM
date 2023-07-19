<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Simple Chat</title>
</head>
<body>
    <div>
        <button type="button" onclick="openSocket();">대화방 참여</button>
        <button type="button" onclick="closeSocket();">대회방 나가기</button>
    	<br/><br/><br/>
  		메세지 입력 : 
        <input type="text" id="sender" value="${sessionScope.id}" style="display: none;">
        <input type="text" id="messageinput">
        <button type="button" onclick="send();">메세지 전송</button>
        <button type="button" onclick="javascript:clearText();">대화내용 지우기</button>
    </div>
    <!-- Server responses get written here -->
    <div id="messages">
    </div>
    <!-- websocket javascript -->
    <script type="text/javascript">
        var ws;
        var messages = document.getElementById("messages");
        
        function openSocket(){
            if(ws !== undefined && ws.readyState !== WebSocket.CLOSED){
                writeResponse("WebSocket is already opened.");
                return;
            }
            //웹소켓 객체 만드는 코드
            ws = new WebSocket("ws://" + location.host + "/study/chatRoom/${param.roomId}");
            
	            ws.onopen = function(event){
	                if(event.data === undefined){
	              		return;
	                }
	                writeResponse(event.data);
	            };
            
            ws.onmessage = function(event){
                console.log('writeResponse');
                console.log(event.data)
                writeResponse(event.data);
            };
            
            ws.onclose = function(event){
                writeResponse("대화 종료");
            }
            
        }
        
        function send(){
            var message = document.getElementById("messageinput").value;
            var sender = document.getElementById("sender").value;
            var roomId = "${param.roomId}";
            var text = message + "," + sender + "," + roomId;
            ws.send(text);
            document.getElementById("messageinput").value = "";
        }

        
        function closeSocket(){
            ws.close();
        }
        
        function writeResponse(text){
            messages.innerHTML += "<br/>"+text;
        }

        function clearText(){
            console.log(messages.parentNode);
            messages.parentNode.removeChild(messages)
      	}
        

        
  </script>
</body>
</html>