<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SMT</title>
<link rel="stylesheet" href="css/mbti.css" type="text/css" />
<!-- jQuery library -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
		console.log("ㅈㅇㅋㄹ");
		$('#mbtiButton').on('click', function(){
			document.location.href="/mbtiQuestion.do"; // 잘 안쓴다			
		});
	})
	

</script>
</head>
<body>
	<div id="wrap">
		<div class="surveyBox">
			<div class="mbtiTitle">
				<h1>본인의 MBTI를 모른다면 테스트를 시작하세요</h1>
			</div>
			<div class="mbtiContent">
				<p>해당 검사는 본 사이트에서 자체 개발한 무료 검사이며 각 문항마다 평소와 가까운 답을 선택하면 됩니다. 검사를 시작하시려면 시작 버튼을 눌러주세요.				
			</div>
			<div>
				<button id="mbtiButton">테스트 시작!</button>
			</div>			
		</div>
	</div>
</body>
</html>