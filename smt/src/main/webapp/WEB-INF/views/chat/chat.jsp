<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>채팅 화면</title>
    <style>
        /* CSS 스타일 작성 */
        body {
            background-color: #FFFFFF;
            font-family: Jeju Gothic;
        }
        .chat-log {
            max-height: 600px;
            overflow-y: auto;
            background-color: #FFFFFF;
            border-radius: 15px;
            padding: 10px;
            margin-bottom: 10px;
        }
        .chat-message {
            margin: 20px 0;
        }
        .user-message {
            text-align: left;
            color: #FFFFFF;
            background-color: #F56A6A;
            font-size: 24px;
            border-radius: 15px;
            padding: 10px;
            margin-left: 0;
            max-width: 70%;
        }
        .gpt-message {
            text-align: right;
            color: #F56A6A;
            background-color: #FFFFFF;
            font-size: 24px;
            border-radius: 15px;
            padding: 10px;
            margin-left: auto;
            max-width: 70%;
        }
        .chat-input {
            position: fixed;
            bottom: 0;
            width: 70%;
            background-color: white;
            padding: 10px;
        }
        .chat-input .input-group {
            display: flex;
            background-color: #AEC6CF;
        }
        .chat-input .input-group input {
            flex-grow: 1;
        }
        .title {
            font-size: 30px;
            text-align: center;
            margin: 20px 0;
        #login_join {
   			 display: none;
		}
		#header {
   			 display: none;
		}
        
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">  <!-- 구글 폰트 링크 추가 -->
</head>
<body>
    <div class="title">실시간 AI 채팅</div>

    <div id="chat-log" class="chat-log"></div>
    
    <div class="chat-input">
       <label for="chats" class="control-label col-sm-2" id="msg1" style="font-size: 24px;">메시지 입력</label>
        <div class="input-group">
            <input type="text" name="chats" id="chats" class="form-control">
      <button type="button" onclick="sendChat()" class="btn btn-primary send-button">전송</button>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 

   <script>
    const sendChat = function () {
        let userMessage = $('#chats').val(); 

        if(userMessage.trim() === "") return; 

        $('#chat-log').append('<div class="chat-message gpt-message">ChatGPT: ' + userMessage + '</div>');

        $.ajax({
            type: 'POST',
            url: '/chat/chat',
            data: JSON.stringify({ userMessage: userMessage }), 
            contentType: 'application/json; charset=utf-8',
            dataType: 'text', 
            cache: false,
            success: function (response) {
                $('#chat-log').append('<div class="chat-message user-message">User: ' + response + '</div>');
                $('#chats').val(''); 
                // 새로운 메시지가 추가될 때마다 스크롤을 최하단으로 이동
                $('#chat-log').scrollTop($('#chat-log')[0].scrollHeight);
            },
            error: function (error) {
                console.log(error);
            }
        })
    }

    $('#chats').on('keypress',function(e) {
        if(e.which == 13) {
            sendChat();
            $('#chats').val(''); 
        }
    });
</script>
</body>
</html>