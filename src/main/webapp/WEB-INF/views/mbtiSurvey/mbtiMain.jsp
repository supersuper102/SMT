<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SMT</title>
<link rel="stylesheet" href="/resources/assets/css/mbti.css" type="text/css" />
<script type="text/javascript">

	$(function(){
		// console.log("ㅈㅇㅋㄹ");
		$('#mbti-start-button').on('click', function(){
			document.location.href="/mbtiQuestion.do"; // 잘 안쓴다			
		});
	})
	

</script>
</head>
<body>
	<div id="wrap">
		<div class="survey-box">
			<div id="mbti-title-box">
				<p id="mbti-title">SAY MY TYPE!<br>MBTI테스트</p>
			</div>
			<div id="mbti-content">
				<p>원활한 사이트 이용을 위해 mbti 검사를 진행해주세요! <br>해당 검사는 본 사이트에서 자체 개발한 무료 검사이며<br>각 문항마다 평소와 가까운 답을 선택하면 됩니다.<br>검사를 시작하시려면 시작 버튼을 눌러주세요.				
			</div>
			<div>
				<button id="mbti-start-button">테스트 시작!</button>
			</div>

		</div>
	</div>
</body>
</html>