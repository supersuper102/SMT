<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SMT</title>
<link rel="stylesheet" href="/resources/assets/css/mbti.css" type="text/css" />
<script type="text/javascript">
	
	//mbti 변수
	var ei = 0;
	var sn = 0;
	var ft = 0;
	var pj = 0;
	var eitemp =0;
	var sntemp =0;
	var fttemp =0;
	var pjtemp =0;
	
	//mbti 결과 변수
	var result = '';
	
	var questions = ["Q1. 친구들 사이 나의 포지션은?"
					,"Q2. 영화를 볼 때 내 머릿속은.."
					,"Q3. 너.. T야?"
					,"Q4. 가고 싶었던 맛집이 있는데 문을 닫았을 때"
					,"Q5. 식당에서 벨을 눌렀는데 아무도 오지 않는다."
					,"Q6. 자기 전 잠자리에 누웠을 때.."
					,"Q7. 친구에게 걸려온 전화. 도로 한복판에서 교통사고가 났다고 한다."
					,"Q8. 안부 연락에 나의 답장은?"
					,"Q9. 새로운 장소(모임, 수업, 회사)에 가게 된 나는?"
					,"Q10. 만약 바퀴벌레가 되면 어떻게 할거야? 라는 질문에 나는.."
					,"Q11. 논쟁을 할 때"
					,"Q12. 오늘 할 일을 다 못하고 자야 하는데.."];
	
	var answers = [["누가 봐도 말 많은 애", "알고 보면 말 많은 애"]
					, ["다음에 이렇게 될 것 같은데.", "와.. 나였으면 저기서..(생략)"]
					, ["헉..내가 T처럼 보였나?", "응 나 T야"]
					, ["그냥 눈에 보이는 곳 아무데나", "검색해서 후기 좋은 곳 찾아보자"]
					, ["사장님!!! 여기 주문이요!!!", "한번 더 누르고 기다린다."]
					, ["현실적인 고민, 걱정을 하다 잔다.", "만약에.. 자다가 집이 무너지면? 상상의 나래"]
					, ['괜찮아? 다친덴 없어? 위험하니까 차 빼자.', '어디서 사고 났어? 정신차리고 차부터 빼']
					, ["그래~ 언제 한번 보자!", "그래~ 언제 볼래? 되는 날 말해줘"]
					, ["옆사람에게 먼저 해맑게 인사", "눈이 마주치면 조심스레 인사"]
					, ["(..바퀴벌레가 왜 되는 건데)", "(진심으로 고민 중..)"]
					, ["존중과 배려는 필수다.", "팩트만큼 중요한게 없다."]
					, ["내일 해야징", "찝찝하다 (내일 뭐할지 생각하고 잠)"]];
	
	// progress bar 올라가는 변수
	var pages = 1;
	$(function() {
		$('#question').html(questions[pages-1]);
		$('#answer1').html(answers[pages-1][0]);
		$('#answer2').html(answers[pages-1][1]);
		
		$('.answer-back-button').on('click', function(){
			if (pages === 1) {
				ei = 0;
				sn = 0;
				ft = 0;
				pj = 0;
				document.location.href="/mbtiSurvey.do";
			} else if (pages === 2 || pages === 6 || pages === 10) {					
				pages--;
				ei = eitemp;
				
				$(function() {
					$('.scroll-line').css('width', (pages * 8.5 + '%'))
				})
				$('#question').html(questions[pages-1]);
				$('#answer1').html(answers[pages-1][0]);
				$('#answer2').html(answers[pages-1][1]);
			} else if (pages === 3 || pages === 7 || pages === 11) {
				pages --;
				sn = sntemp;
				$(function() {
					$('.scroll-line').css('width', (pages * 8.5 + '%'))
				})
				$('#question').html(questions[pages-1]);
				$('#answer1').html(answers[pages-1][0]);
				$('#answer2').html(answers[pages-1][1]);				
			} else if (pages === 4 || pages === 8 || pages === 12) {
				pages --;
				ft = fttemp;
				$(function() {
					$('.scroll-line').css('width', (pages * 8.5 + '%'))
				})
				$('#question').html(questions[pages-1]);
				$('#answer1').html(answers[pages-1][0]);
				$('#answer2').html(answers[pages-1][1]);
			} else if (pages === 5 || pages === 9) {
				pages --;
				pj = pjtemp;
				$(function() {
					$('.scroll-line').css('width', (pages * 8.5 + '%'))
				})
				$('#question').html(questions[pages-1]);
				$('#answer1').html(answers[pages-1][0]);
				$('#answer2').html(answers[pages-1][1]);
			}
			
		})
		
		$('.answer-button').on('click', function(){
			if(pages === 1) {
				eitemp = ei;
				if (this.id === 'answer1') {
					ei++;
				} else {
					ei--;
				}
			} else if (pages === 2) {
				sntemp = sn;
				if (this.id === 'answer1') {
					sn++;
				} else {
					sn--;
				}
			} else if (pages === 3) {
				fttemp = ft;
				if (this.id === 'answer1') {
					ft++;
				} else {
					ft--;
				}
			} else if (pages === 4) {
				pjtemp = pj;
				if (this.id === 'answer1') {
					pj++;
				} else {
					pj--;
				}
			} else if (pages === 5) {
				eitemp = ei;
				if (this.id === 'answer1') {
					ei++;
				} else {
					ei--;
				}
			} else if (pages === 6) {
				sntemp = sn;
				if (this.id === 'answer1') {
					sn++;
				} else {
					sn--;
				}
			} else if (pages === 7) {
				fttemp = ft;
				if (this.id === 'answer1') {
					ft++;
				} else {
					ft--;
				}
			} else if (pages === 8) {
				pjtemp = pj;
				if (this.id === 'answer1') {
					pj++;
				} else {
					pj--;
				}
			} else if (pages === 9) {
				eitemp = ei;
				if (this.id === 'answer1') {
					ei++;
				} else {
					ei--;
				}
			} else if (pages === 10) {
				sntemp = sn;
				if (this.id === 'answer1') {
					sn++;
				} else {
					sn--;
				}
			} else if (pages === 11) {
				fttemp = ft;
				if (this.id === 'answer1') {
					ft++;
				} else {
					ft--;
				}
			} else if (pages === 12) {
				pjtemp = pj;
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
				
				$('#mbtiResult').val(result);

				document.mbtiResultForm.submit();
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
			

	});
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
				<button id="answer-back" class="answer-back-button">back</button>
			</div>
			<form action="/mbtiResult.do" name="mbtiResultForm" method="post" >
				<input type="hidden" name="result" value="" id="mbtiResult" />
			</form>
		</div>
	</div>
</body>
</html>