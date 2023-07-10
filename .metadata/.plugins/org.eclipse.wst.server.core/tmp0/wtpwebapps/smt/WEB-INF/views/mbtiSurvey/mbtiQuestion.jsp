<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SMT</title>
<link rel="stylesheet" href="css/mbti.css" type="text/css" />
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script type="text/javascript">
	
	//mbti 변수
	var ei = 0;
	var sn = 0;
	var ft = 0;
	var pj = 0;
	
	//mbti 결과 변수
	var result = '';
	
	var questions = ["질문1"
					,"질문2"
					,"질문3"
					,"질문4"
					,"질문5"
					,"질문6"
					,"질문7"
					,"질문8"
					,"질문9"
					,"질문10"
					,"질문11"
					,"질문12"];
	
	var answers = [["e답1", "i답1"]
					, ["s답1", "n답1"]
					, ["f답1", "t답1"]
					, ["p답1", "j답1"]
					, ["e답2", "i답2"]
					, ["s답2", "n답2"]
					, ["f답2", "t답2"]
					, ["p답2", "j답2"]
					, ["e답3", "i답3"]
					, ["s답3", "n답3"]
					, ["f답3", "t답3"]
					, ["p답3", "j답3"]];
	
	// progress bar 올라가는 변수
	var pages = 1;
	$(function() {
			
		$('#question').html(questions[pages-1]);
		$('#answer1').html(answers[pages-1][0]);
		$('#answer2').html(answers[pages-1][1]);		
		
		$('.answer-button').on('click', function(){
			if(pages === 1) {
				if (this.id === 'answer1') {
					ei++;
				} else {
					ei--;
				}
			} else if (pages === 2) {
				if (this.id === 'answer1') {
					sn++;
				} else {
					sn--;
				}
			} else if (pages === 3) {
				if (this.id === 'answer1') {
					ft++;
				} else {
					ft--;
				}
			} else if (pages === 4) {
				if (this.id === 'answer1') {
					pj++;
				} else {
					pj--;
				}
			} else if (pages === 5) {
				if (this.id === 'answer1') {
					ei++;
				} else {
					ei--;
				}
			} else if (pages === 6) {
				if (this.id === 'answer1') {
					sn++;
				} else {
					sn--;
				}
			} else if (pages === 7) {
				if (this.id === 'answer1') {
					ft++;
				} else {
					ft--;
				}
			} else if (pages === 8) {
				if (this.id === 'answer1') {
					pj++;
				} else {
					pj--;
				}
			} else if (pages === 9) {
				if (this.id === 'answer1') {
					ei++;
				} else {
					ei--;
				}
			} else if (pages === 10) {
				if (this.id === 'answer1') {
					sn++;
				} else {
					sn--;
				}
			} else if (pages === 11) {
				if (this.id === 'answer1') {
					ft++;
				} else {
					ft--;
				}
			} else if (pages === 12) {
				if (this.id === 'answer1') {
					pj++;
				} else {
					pj--;
				}
			}
			
			pages += 1;
			if(pages === 13){
				if (ei > 0) {
					result += 'e';
				} else {
					result += 'i';
				}
				
				if (sn > 0) {
					result += 's';
				} else {
					result += 'n';
				}
				
				if (ft > 0) {
					result += 'f';
				} else {
					result += 't';
				}
				
				if (pj > 0) {
					result += 'p';
				} else {
					result += 'j';
				}
				console.log(result);
				// document.location.href="/mbtiResult.do";
			} else {
				
				console.log(pages)
				$('#question').html(questions[pages-1]);
				$('#answer1').html(answers[pages-1][0]);
				$('#answer2').html(answers[pages-1][1]);
				
				
			
				$(function() {
					$('.scroll-line').css('width', (pages * 8.5 + '%'))
				})
			}
		
		});
			

	})
</script>
</head>
<body>
	<div id="wrap2">
		<div class="survey-box">
			<div class="scroll-box">			
				<div class="scroll-line"></div>
			</div>
			<div id="question" class="question-box"></div>
			<div class="answer-box">
				<button id="answer1" class="answer-button"></button>
				<button id="answer2" class="answer-button"></button>
			</div>
		</div>
	</div>
</body>
</html>