<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="market.MarketBean"%>
<%@page import="java.util.List"%>
<%@page import="market.MarketDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<%
	String id = (String)session.getAttribute("id");
	
	if(id == null){
		response.sendRedirect("../member/login.jsp");
	}
	
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");

	MarketDAO dao = new MarketDAO();
	MarketBean marketBean = dao.getMarket(num);

	int DBnum = marketBean.getNum();
	String DBName = marketBean.getName(); 
	String DBSubject = marketBean.getSubject();
	String DBContent = "";
	
	if(marketBean.getContent() != null){
		DBContent = marketBean.getContent().replace("\r\n", "<br/>");
	}

%> 
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../include/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../soccer.jsp"><img class="" alt="" src="../image/bullet.gif"> 홈</a></li><br>
<li><a href="../menu/reservation.jsp"><img class="" alt="" src="../image/bullet.gif"> 경기장 예약</a></li><br>
<li><a href="../menu/notice.jsp"><img class="" alt="" src="../image/bullet.gif"> vs 팀 게시판</a></li>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->

<article>
	<h2>글 수정</h2>
<%-- 수정할 글내용을 다시 입력후 글 수정버튼 클릭했을때 update.jsp로 글수정 요청을 함 --%>
<form action="marketupdatePro.jsp?pageNum=<%=pageNum%>" method="post">

	<%-- 수정할 글번호 전달 --%>
	<input type="hidden" name="num" value="<%=num %>">

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
		 	<td>이름</td>
		 	<td><input type="text" name="name" value="<%=DBName %>"></td>
		 </tr>
		 <tr>
		 	<td>비밀번호</td>
		 	<td><input type="password" name="passwd"></td>
		 </tr>
		 <tr>
		 	<td>글제목</td>
		 	<td><input type="text" name="subject" value="<%=DBSubject %>"></td>
		 </tr>
		  <tr>
		 	<td>글내용</td>
		 	<td>
			<textarea name="content" rows="13" cols="40"><%=DBContent %></textarea>
			</td>
		 </tr>
	</table>
	<div id="table_search">
		<input type="submit" value="글수정" class="btn"> 
		<input type="reset" value="다시작성" class="btn">
		<input type="button" value="목록보기" class="btn" onclick="location.href='market.jsp'">
	</div>
</form>
<div class="clear"></div>
<div id="page_control"></div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<br><br><br>
<jsp:include page="../include/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>





