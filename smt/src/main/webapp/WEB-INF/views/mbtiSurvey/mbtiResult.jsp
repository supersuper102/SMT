<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SMT</title>
<link rel="stylesheet" href="/resources/assets/css/mbti.css" type="text/css" />
<script type="text/javascript">
	var result = "${result}";
	var mbtiType = ["esfp",
					"esfj",
					"estp",
					"estj",
					"enfp",
					"enfj",
					"entp",
					"entj",
					"isfp",
					"isfj",
					"istp",
					"istj",
					"infp",
					"infj",
					"intp",
					"intj"]
	var mbtiRes = ["esfp특징~",
					"esfj특징",
					"estp특징~",
					"estj특징~",
					"enfp특징~",
					"enfj특징~",
					"entp특징~",
					"entj특징~",
					"isfp특징~",
					"isfj특징~",
					"istp특징~",
					"istj특징~",
					"infp특징~",
					"infj특징~",
					"intp특징~",
					"intj특징~"]
	
	$(function() {
		for (var i = 0; i < 16; i++) {
			if (mbtiType[i] === result) {				
				$('#mbti-type').html(mbtiType[i])
				$('#mbti-res').html(mbtiRes[i])				
			}
		}
		$('#mbti-restart').on('click', function() {
			document.location.href="/mbtiSurvey.do";
		})
		// 뒤로가기 막는 코드
		history.pushState(null, null, location.href); 
		window.onpopstate = function() { 
			history.go(1); 
		}
	})
	

	
</script>
</head>
<body>
	<div id="wrap3">
		<div class="survey-box">		
			<div>
				mbti 결과
			</div>
			<div>
				<img alt="" src="">
			</div>
			<div id="mbti-type"></div>
			<div id="mbti-res"></div>
			<button id="mbti-restart">다시 해보기</button>
		</div>
	</div>
</body>
</html>