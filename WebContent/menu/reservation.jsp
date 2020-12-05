<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>경기장 예약</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../include/top.jsp"/>
<!-- 헤더들어가는 곳 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../soccer.jsp"><img class="" alt="" src="../image/bullet.gif"> 홈</a></li><br>
<li><a href="reservation.jsp"><img class="" alt="" src="../image/bullet.gif"> 경기장 예약</a></li><br>
<li><a href="groundinfo.jsp"><img class="" alt="" src="../image/bullet.gif"> 시설안내</a></li>

</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 게시판 -->
<article>
<h2>경기장 예약</h2>
<br><br>
<form action="sendMail.jsp" method="post">
<table border="0" >
<tr>
	<td align="center">이름</td>
	<td><input type="text" name="name"></td>
</tr>
<tr>
	<td align="center">연락처</td>
	<td><input type="text" name="tel"></td>
</tr>
<tr>
	<td align="center">예약 날짜</td>
	<td><input type="date" name="date"></td>
</tr>
<tr>
	<td align="center">사용 시간 선택</td>
	<td>
		<select name="time">
			<option>AM6:00 ~ AM9:00</option>
			<option>AM11:00 ~ PM13:00</option>
			<option>PM13:00 ~ PM15:00</option>
			<option>PM15:00 ~ PM17:00</option>
			<option>PM17:00 ~ PM19:00</option>
			<option>PM19:00 ~ PM21:00</option>
		</select>
	</td>
</tr>
<tr>
	<td align="center">종목</td>
	<td>
		<select name="title">
			<option>축구</option>
			<option>풋살</option>
			<option>족구</option>
		</select>
	</td>
</tr>
<tr>
	<td align="center">사용 인원 선택</td>
	<td>
		<select name="man">
			<option>1명~5명</option>
			<option>6명~10명</option>
			<option>11명~15명</option>
			<option>16명~20명</option>
			<option>21명~</option>
		</select>
	</td>
</tr>
<tr>
	<td align="center">FROM</td>
	<td><input type="text" name="from" value="choikb22@naver.com"/></td>
</tr>
<tr>
	<td align="center">TO</td>
	<td><input type="hidden" name="to" value="choikb22@naver.com"/></td>
</tr>
<tr>
	<td align="center">SUBJECT</td>
	<td><input type="text" name="subject" /></td>
</tr>
<tr>
	<td align="center">CONTENT</td>
	<td><textarea name="content" style="width:170px; height:200px;"></textarea></td>
</tr>
<tr>
	<td width="200"><input type="submit" value="예약하기"></td>
	<td width="200"><input type="reset" value="다시입력"></td>
</tr>
</table>
</form>
</article>
<!-- 게시판 -->
<br><br>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../include/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</body>
</html>