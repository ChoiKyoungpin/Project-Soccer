<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 삭제</title>
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
	
	String num1 = request.getParameter("num");
	int num = Integer.parseInt(num1); 	
	
	String pageNum = request.getParameter("pageNum");
	
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

	<h1>글 삭제</h1>

	<form action="marketdeletePro.jsp?pageNum=<%=pageNum %>" method="post">
	
		<input type="hidden" name="num" value="<%=num%>">
		
		<table id="notice">
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd"></td>
			</tr>
		</table>
		<div id="table_search">
			<input type="submit" value="글삭제" class="btn">
			<input type="reset" value="다시입력" class="btn">
			<input type="button" value="글목록요청" class="btn" onclick="location.href='market.jsp?pageNum=<%=pageNum%>'">
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