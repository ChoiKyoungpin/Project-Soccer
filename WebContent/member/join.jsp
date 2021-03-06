<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<!-- Head 시작-->
<head>
	<link rel="stylesheet" href="../css/style.min.css">
	<link rel="stylesheet" href="../css/modules.css">
	
	<script type="text/javascript">
	function winopen() {
		if(document.fr.id.value == ""){
			alert("아이디를 입력하세요");
			document.fr.id.focus();
			return;
		}
		var fid = document.fr.id.value;
			window.open("join_IDcheck.jsp?userid="+fid, "", "width=400", "height=200");
	}
	
	</script>
	
</head>
<body>
<jsp:include page="../include/top.jsp"/>
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../soccer.jsp"><img class="" alt="" src="../image/bullet.gif"> 홈</a></li><br>
<li><a href="../member/login.jsp"><img class="" alt="" src="../image/bullet.gif"> 로그인</a></li>
<br><br><br><br>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
	<h1>회원가입</h1>
	
	<%-- 
		회원가입을 위해 아래의 디자인에서 가입할 회원정보를 입력받고 회원가입 버튼을 눌렸을때 
		joinPro.jsp서버페이지로 회원가입 요청을 한다.
	--%>
	
	<form action="joinPro.jsp" id="join" method="post" name="fr">
		<fieldset>
			<legend></legend>
			
			<label>아이디</label>
			<input type="text" name="id" class="id" required="required"> * 영문+숫자 6자 이상 *
			<input type="button" id="b" value="아이디중복체크" class="dup" onclick="winopen();"/><br>
			
			<label>비밀번호</label>
			<input type="password" name="passwd" required="required"><br>
			
			<label>비밀번호 재입력</label>
			<input type="password" name="passwd2" required="required"><br>
			
			<label>이름</label>
			<input type="text" name="name" required="required"><br>
			
			<label>나이</label>
			<input type="text" name="age" required="required"><br>
			
			<label>이메일</label>
			<input type="email" name="email" required="required"><br>
			
			<label>이메일 재입력</label>
			<input type="email" name="email2"><br>
			
			<label>주소</label>
			<input type="text" id="sample4_postcode" placeholder="우편번호" required="required">
			<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
			<input type="text" id="sample4_jibunAddress" placeholder="지번주소"><br>
			<span id="guide" style="color:#999;display:none"></span>
			<input type="text" id="sample4_detailAddress" placeholder="상세주소">
			<input type="text" id="sample4_extraAddress" placeholder="참고항목"><br>
			
			<label>휴대폰 번호</label>
			<input type="text" name="tel" required="required"><br>
		</fieldset>
		<div class="clear"></div>
		<br>
		<div id="buttons">
			<input type="submit" value="회원가입" class="submit">
			<input type="reset" value="다시입력" class="cancel">
		</div>
	</form>
</article>
<br>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->
<jsp:include page="../include/bottom.jsp"/>
</body>
</html>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//주소 
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>