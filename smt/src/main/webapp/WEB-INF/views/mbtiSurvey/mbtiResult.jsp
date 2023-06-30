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
	var mbtiRes = [["자유로운 영혼의 소유자입니다.", "사교적이며 활동적이고, 주위의 사람이나 일어나는 일에 대해 관심이 많습니다.", "내 이야기를 상대방에게 솔직하게 털어놓는 편입니다.", "혼자 있을 때 외로움을 쉽게 느낍니다.", "조직생활보다는 자유로울 때 진정한 능력을 발휘합니다."],
					["규칙에 잘 따르며 다른 사람들도 그러기를 바랍니다.", "동정심이 많고 다른 사람에게 정성을 쏟으며 나누는 것을 좋아합니다.", "하지만 책임감 때문에 어쩔 수 없이 타인을 챙기는 경우도 있습니다.", "은근 원칙주의자이고, 인정받는 것에 민감합니다.", "스트레스를 받으면 누군가를 만나야 합니다."],
					["개방적이고 사람이나 사물에 대한 선입견이 별로 없습니다.", "순발력이 뛰어나며 많은 사실들을 쉽게 기억합니다.", "내기를 좋아하고 삶을 즐기는 편입니다.", "생각과 행동이 빠르기 때문에 우유부단한 사람들을 답답해 합니다.", "개방적이고 자유를 추구하며, 억압당하는 것을 견디지 못합니다."],
					["효율, 상식, 논리를 중시하는 타입입니다.", "현실 감각이 뛰어나며 일을 조직하고 계획하여 추진시키는 능력이 있습니다.", "타고난 지도자로서 프로젝트의 목표를 설정하고, 지시하는 능력이 있습니다.", "불확실한 미래의 가능성보다 흔들리지 않는 현재의 사실을 추구합니다.", "타인과 자신의 감정을 고려하는 능력이 부족할 수 있습니다."],
					["활기가 넘치며 상상력이 풍부합니다.", "창의적이며 항상 새로운 가능성을 찾고 시도하는 유형입니다.", "관심이 있는 일은 열정적으로 임하지만, 반복되는 일상적인 일은 참지 못합니다.", "자신을 타인과 끊임없이 비교하고 쉽게 우울해질 수 있습니다.", "겉으로 볼 때는 걱정이 없어 보이나 속으로 진지하고 생각이나 고민이 많습니다."],
					["책임감이 강하고 사교성이 풍부하고 동정심이 많습니다.", "대중과 상대방의 분위기를 읽는 공감 능력이 탁월하기에, 유머 감각이 뛰어납니다.", "원만한 인간관계를 유지하는 데 큰 의미를 부여하는 편입니다.", "자기 반성은 잘하지만 남을 비판하는 데 능숙하지 않습니다.", "타인에 대한 관심이 많아 간혹 오지랖이 넓다는 소리를 듣습니다."],
					["다재다능하며 논쟁을 즐기는 토론가 타입입니다.", "외향형이지만 혼자만의 시간도 많이 필요로 하며 중요하게 여깁니다.", "순간적인 재치와 언변이 뛰어난 편입니다.", "호기심이 매우 강하며, 관심이 많을 수록 질문을 많이 합니다.", "눈치가 없는 게 아니라 눈치를 볼 필요가 없다고 판단한 것입니다."],
					["타고난 리더로, 목표를 달성하기 위한 과정을 즐깁니다.", "변화를 위한 계획을 명확히 세우고, 매우 단호하게 이를 수행합니다.", "시간 낭비에 굉장히 예민합니다.", "무언가를 주도하려는 욕심이 굉장히 강합니다.", "야망이 넘치며 권력과 영향력을 얻는 데 관심이 많습니다."],
					["모든 유형 중에서 침대 위에 누워서 아무것도 안 하는 시간이 제일 깁니다.", "말없이 다정하고 내면의 모습을 잘 드러내지 않습니다.", "배려형 개인주의 성격으로 물 흐르듯이 사는 편입니다.", "자신의 생각이나 의견을 잘 말하지 못합니다.", "꾸준히 일을 하기보다는 단기간에 몰아서 하는 편이지만, 평소에 성실하다는 평가도 많이 받습니다."],
					["친구나 가족에게 애정이 가득하고 항상 진솔하려 노력하는 타입입니다.", "사회 통념이나 자신만의 틀에서 벗어난 것을 잘 이해하지 못합니다.", "개인적인 가치에 따라 행동하며 양심적입니다.", "자신의 의무를 다했다고 다른 사람들에게 인정받고 싶지만, 주목을 받는 것은 부담스럽습니다.", "타인을 향한 연민이나 동정심이 있으면서도, 가족이나 친구를 보호해야 할 때는 가차 없는 모습을 보입니다."],
					["말수가 적으며, 객관적이고 합리적으로 인생을 관찰하는 유형입니다.", "마음에 없는 얘기를 상대방 기분 때문에 하지 않습니다.", "가까운 사람에게는 허울없이 대하지만, 그렇지 않은 사람에게는 무관심합니다.", "냉소적이고 차가운 이미지로 비춰질 수 있습니다.", "느낌과 감정, 타인에 대한 마음을 표현하기 어려워합니다."],
					["집중력이 강한 현실 감각을 지녔으며 조직적이고 침착합니다.", "사람에 대한 호불호가 뚜렷하고 선입견이 강합니다.", "낯가림이 심한 편이고, 남들이 속을 모른다고 말합니다.", "예고없이 갑작스러운 변화를 매우 싫어합니다.", "주어진 업무나 책임을 끝까지 완수합니다."],
					["낭만적인 성향으로 보이지만 내적 신념이 깊은 유형입니다.", "개인주의자이며 이상주의자입니다.", "진정성을 중시하며 가식적인 것에 거부감을 느낄 수 있습니다.", "조화롭게 살고자 하며 되도록이면 분쟁을 피하려 합니다.", "대체로 마음이 여린 편이므로 상처를 받거나 우울해지기 쉽습니다."],
					["인내심이 많고 통찰력과 직관력이 매우 뛰어나며 화합을 추구하는 유형입니다.", "이상주의적, 완벽주의적 성향이 있습니다.", "반복적이고 의미 없는 일이나 과도한 업무량, 불편한 인간관계 등에 쉽게 지칩니다.", "상대방의 성향을 읽고 거기에 맞춰주는 카멜레온 같은 유형입니다.", "본인과 맞는 사람과 맞지 않는 사람을 빠르게 마음속으로 판단해서 맞지 않는 사람과는 거리를 둡니다."],
					["조용하고 과묵하며 논리와 분석으로 문제를 해결하기 좋아하는 유형입니다.", "먼저 대화를 시작하지 않는 편이나 관심이 있는 분야에 대해서는 말을 많이 합니다.", "높은 직관력으로 통찰하는 재능과 지적 호기심이 많습니다.", "스스로에 대해 부정적이고 엄격합니다.", "비논리적인 의견을 잘 수긍하지 않으나 논리적으로 맞다고 생각되면 수긍합니다."],
					["예측을 즐기며 논리적인 과정을 통해 결과를 도출합니다.", "결정에 신중한 편이며 긴 시간이 필요합니다.", "보이는 모습은 엄격한 인상이지만, 변화와 혁신을 수용하고 지지하는 유형입니다.", "이해가 안 가는 규율을 맹목적으로 따르기 싫어합니다.", "사람의 본성에 대해 회의적이어서, 대부분 사람들이 자신의 기대에 미치지 못한다고 생각합니다."]]
	
	
	var mbtiImgList = ["/resources/images/mbti/esfp.png",
					"/resources/images/mbti/esfj.png",
					"/resources/images/mbti/estp.png",
					"/resources/images/mbti/estj.png",
					"/resources/images/mbti/enfp.png",
					"/resources/images/mbti/enfj.png",
					"/resources/images/mbti/entp.png",
					"/resources/images/mbti/entj.png",
					"/resources/images/mbti/isfp.png",
					"/resources/images/mbti/isfj.png",
					"/resources/images/mbti/istp.png",
					"/resources/images/mbti/istj.png",
					"/resources/images/mbti/infp.png",
					"/resources/images/mbti/infj.png",
					"/resources/images/mbti/intp.png",
					"/resources/images/mbti/intj.png"]
	
	$(function() {
		for (var i = 0; i < 16; i++) {
			if (mbtiType[i] === result) {				
				
				$('#mbti-type').html(mbtiType[i]);
				$('#mbtiResultImg').attr("src", mbtiImgList[i]);
				
				for (var j = 0; j < 5; j++){
					
					$('#mbti-res'+[j]).html(mbtiRes[i][j]);
				}
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
			<div class="mbti-res-title">
				나의 성향은?
			</div>
			<div>
				<img src="" id="mbtiResultImg"/>
			</div>
			<div id="mbti-type"></div>
			<div class="mbti-res-box">
				<div id="mbti-res0" class="mbti-res"></div>
				<div id="mbti-res1" class="mbti-res"></div>
				<div id="mbti-res2" class="mbti-res"></div>
				<div id="mbti-res3" class="mbti-res"></div>
				<div id="mbti-res4" class="mbti-res"></div>			
			</div>
			
			<button id="mbti-restart">다시 해보기</button>
			<form action="/mbtiResult.do" name="mbtiResultForm" method="post" >
				<input type="hidden" name="result" value="" id="mbtiResult" />
			</form>
		</div>
	</div>
</body>
</html>