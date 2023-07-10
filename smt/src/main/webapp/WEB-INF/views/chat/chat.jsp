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
            position: relative;
        }
        .user-name {
            position: absolute;
            top: -30px;
            left: 0;
            font-size: 16px;
            font-weight: bold;
            margin-left: 97.2%; 
           /*  float: left; */
        }
          .gpt-name {
            position: absolute;
            top: -30px;
            left: 0;
            font-size: 16px;
            font-weight: bold;
            margin-left: 1%; 
        }
		.user-message {
		    text-align: right;
		    color: #FFFFFF;
		    background-color: #F56A6A;
		    font-size: 24px;
		    border-radius: 15px;
		    padding: 10px;
		    margin-left: 75%;
		    display: block;
		    min-width: auto;
		}
        .gpt-message {
            text-align: left;
            color: #F56A6A;
            background-color: #FFFFFF;
            font-size: 24px;
            border-radius: 15px;
            padding: 10px;
            margin-right: auto;
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
            
        }

        .title {
            font-size: 30px;
            text-align: center;
            margin: 20px 0;
        }
    	.chat-log::-webkit-scrollbar {
        display: none;
   		 }
 	    .btn-primary.send-button {
        	background-color: transparent;  
        	border-color: #F56A6A;  
        	color: #F56A6A; 
        	border: 2px #F56A6A;
    	}
    
        #login_join {
            display: none;
        }
        #header {
            display: none;
        }
        #chats {
   		 border: 2px solid #F56A6A;
		}
		#msg2 {
  		order: 2px solid #F56A6A;
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
        <label for="mbti" class="mbti" id="msg2" style="font-size: 24px;">MBTI 유형 선택</label>
        <div class="input-group">
            <select id="mbti" class="form-control">
				<option value="">선택하지 않음</option>
				<option value="ISTJ">ISTJ</option>
				<option value="ISFJ">ISFJ</option>
				<option value="INFJ">INFJ</option>
				<option value="INTJ">INTJ</option>
				<option value="ISTP">ISTP</option>
				<option value="ISFP">ISFP</option>
				<option value="INFP">INFP</option>
				<option value="INTP">INTP</option>
				<option value="ESTP">ESTP</option>
				<option value="ESFP">ESFP</option>
				<option value="ENFP">ENFP</option>
				<option value="ENTP">ENTP</option>
				<option value="ESTJ">ESTJ</option>
				<option value="ESFJ">ESFJ</option>
				<option value="ENFJ">ENFJ</option>
				<option value="ENTJ">ENTJ</option>

                <!-- 여기에 다른 MBTI 유형을 추가하세요 -->
            </select>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        const sendChat = function () {
            let userMessage = $('#chats').val(); 
            let userMBTI = $('#mbti').val(); 

            if(userMessage.trim() === "") return;

            $('#chat-log').append('<div class="chat-message"><div class="user-message">' + userMessage + '</div><div class="user-name">${member.nick_name}</div></div>');

            $.ajax({
                type: 'POST',
                url: '/chat/chat',
                data: JSON.stringify({
                    userMessage: userMessage,
                    userMBTI: userMBTI  // MBTI 유형 추가
                }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'text',
                cache: false,
                success: function (response) {
                    $('#chat-log').append('<div class="chat-message"><div class="gpt-message">' + response + '</div><div class="gpt-name">ChatGPT</div></div>');
                    $('#chats').val('');
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