<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="../css/style.min.css">
	<link rel="stylesheet" href="../css/modules.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 수정</title>
</head>
<% 
	// 글 수정을 위한 글상세보기 화면
	
	// 세션값 가져오기
	String id = (String)session.getAttribute("id");
	
	// 세션값이 존재하지 않으면 login.jsp로 가서 로그인 하삼
	if(id == null){
		response.sendRedirect("../member/login.jsp");
	}
	
	//content.jsp에서 답변쓰기 버튼을 클릭해서 전달 하여 넘어온 데이터 얻기
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num")); //답변글 작성시 부모글번호 전달받기
	int re_ref = Integer.parseInt(request.getParameter("re_ref")); // 부모글 + 답글 : 한쌍표현
	int re_lev = Integer.parseInt(request.getParameter("re_lev")); // 부모글 들여쓰기
	int re_seq = Integer.parseInt(request.getParameter("re_seq")); // 글의 순서 (select때 사용가능)
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
<%--아래 디자인 화면에서  답글 내용을 입력한 후 reWritePro.jsp로 요청! --%>	
<form action="reWritePro.jsp" method="post">

	<%-- 입력한 답글 추가 요청시 부모글 번호를 전달함. --%>
	<input type="hidden" name="num" value="<%=num %>">
	<input type="hidden" name="re_ref" value="<%=re_ref %>">
	<input type="hidden" name="re_lev" value="<%=re_lev %>">
	<input type="hidden" name="re_seq" value="<%=re_seq %>">

	<table id="notice">
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
			   onclick="location.href='notice.jsp'">
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