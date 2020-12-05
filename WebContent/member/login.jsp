<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

</head>
<body>
<jsp:include page="../include/top.jsp"/>
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../soccer.jsp"><img class="" alt="" src="../image/bullet.gif"> 홈</a></li><br>
<li><a href="../member/join.jsp"><img class="" alt="" src="../image/bullet.gif"> 회원가입</a></li>
<br><br><br><br>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
	<h2>로그인</h2>
	<br>
	<%--loginPro.jsp서버페이지로 로그인 요청을 위해 아래의 아이디와 비밀번호 입력 후 로그인버튼을 클릭함 --%>
	<form action="loginPro.jsp" id="join" method="post">
		<fieldset id="box">
			<legend></legend>
			
			<label>아이디</label>
			<input type="text" name="id" ><br>
			
			<label>비밀번호</label>
			<input type="password" name="passwd" ><br>
		</fieldset>
		<br>
		<div class="clear"></div>
		
		<div id="buttons">
			<input type="submit" value="로그인" class="submit">
			<input type="reset" value="다시작성" class="cancel">
			<br><br><br>
		</div>
	</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>



<jsp:include page="../include/bottom.jsp"/>
</body>
</html>