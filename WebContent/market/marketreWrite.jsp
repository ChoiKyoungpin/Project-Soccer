<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="market.MarketBean"%>
<%@page import="java.util.List"%>
<%@page import="market.MarketDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="../css/style.min.css">
	<link rel="stylesheet" href="../css/modules.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>답글 작성</title>
</head>
<% 
	String id = (String)session.getAttribute("id");
	
	if(id == null){
		response.sendRedirect("../member/login.jsp");
	}
	
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num")); 
	int re_ref = Integer.parseInt(request.getParameter("re_ref")); 
	int re_lev = Integer.parseInt(request.getParameter("re_lev")); 
	int re_seq = Integer.parseInt(request.getParameter("re_seq")); 
%>
<body>
<jsp:include page="../include/top.jsp"/>

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../soccer.jsp"><img class="" alt="" src="../image/bullet.gif"> 홈</a></li><br>
<li><a href="reservation.jsp"><img class="" alt="" src="../image/bullet.gif"> 경기장 예약</a></li><br>
<li><a href="notice.jsp"><img class="" alt="" src="../image/bullet.gif"> vs 팀 게시판</a></li>
<br><br><br><br><br><br><br><br><br><br><br><br>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<article>
	<h1>답글 작성 화면</h1>

<form action="marketreWritePro.jsp" method="post">

	<%-- 입력한 답글 추가 요청시 부모글 번호를 전달함. --%>
	<input type="hidden" name="num" value="<%=num %>">
	<input type="hidden" name="re_ref" value="<%=re_ref %>">
	<input type="hidden" name="re_lev" value="<%=re_lev %>">
	<input type="hidden" name="re_seq" value="<%=re_seq %>">

	<table id="notice">
		 <tr>
			<td>종류</td>
			<td>
			<select>
				<option>삽니다</option>
				<option>팝니다</option>
			</select>
			</td>
		 </tr>
		 <tr>
		 	<td>답글 작성자명</td>
		 	<td><input type="text" name="name"></td>
		 </tr>
		 <tr>
		 	<td>답글 비밀번호</td>
		 	<td><input type="password" name="passwd"></td>
		 </tr>
		 <tr>
		 	<td>답글 제목</td>
		 	<td><input type="text" name="subject" value="[답글]"></td>
		 </tr>
		  <tr>
		 	<td>답글 내용</td>
		 	<td>
			<textarea name="content" rows="13" cols="40"></textarea>
			</td>
		 </tr>
	</table>
	<div id="table_search">
		<input type="submit" value="답글작성" class="btn"> 
		<input type="reset" value="다시작성" class="btn">
		<input type="button" value="목록보기" class="btn" 
			   onclick="location.href='market.jsp'">
	</div>
</form>
<div class="clear"></div>
<div id="page_control"></div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<br><br><br>
<jsp:include page="../include/bottom.jsp"/>
</body>
</html>