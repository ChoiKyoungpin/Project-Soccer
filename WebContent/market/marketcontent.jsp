<%@page import="marketcomment.MarketCommentBean"%>
<%@page import="marketcomment.MarketCommentDAO"%>
<%@page import="market.MarketBean"%>
<%@page import="market.MarketDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.org.apache.xpath.internal.compiler.Keywords"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<link rel="stylesheet" href="../css/style.min.css">
		<link rel="stylesheet" href="../css/modules.css">

<meta charset="UTF-8">
<title>글 상세보기</title>

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
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");

	MarketDAO dao = new MarketDAO();
	
	dao.updateReadCount(num);
	
	MarketBean mBean = dao.getMarket(num);
	
	int DBNum = mBean.getNum(); 			
	int DBReadcount = mBean.getReadcount(); 
	String DBName = mBean.getName(); 		
		
	SimpleDateFormat f = new SimpleDateFormat("yyyy/MM/dd");
	Timestamp DBDate = mBean.getDate();		
	String newDate = f.format(DBDate);
	
	String DBContent = "";
	
	if(mBean.getContent() != null){
		
		DBContent = mBean.getContent().replace("\r\n", "<br/>");
		
	}

	String DBSubject = mBean.getSubject();	
	
	int DBRe_ref = mBean.getRe_ref(); 		
	int DBRe_lev = mBean.getRe_lev();		
	int DBRe_seq = mBean.getRe_seq();		
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
<li><a href="../menu/playapply.jsp"><img class="" alt="" src="../image/bullet.gif"> 용병 신청</a></li><br>
<li><a href="../menu/reservation.jsp"><img class="" alt="" src="../image/bullet.gif"> 경기장 예약</a></li>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<article>
<h2>게시판</h2>
	<table id="notice">
		<tr>
			<td>글번호</td>	
			<td><%=DBNum %></td>	
			<td>조회수</td>	
			<td><%=DBReadcount %></td>	
		</tr> 
		<tr>
			<td>작성자</td>	
			<td><%out.print(DBName);%></td>	
			<td>작성일</td>	
			<td><%out.print(newDate);%></td>	
		</tr> 
		<tr>
			<td>글제목</td>	
			<td colspan="3"><%=DBSubject %></td>	
		</tr> 
		<tr>
			<td>글내용</td>	
			<td colspan="3"><%=DBContent %></td>	
		</tr> 
	</table>
	

<div id="table_search">

<%
String id = (String)session.getAttribute("id");

if(id != null){
%>	
	<input type="button" 
		   value="글수정" 
		   class="btn" 
		   onclick="location.href='marketupdate.jsp?num=<%=DBNum %>&pageNum=<%=pageNum %>'">
		   
	<input type="button" 
		   value="글삭제" 
		   class="btn" 
		   onclick="location.href='marketdelete.jsp?num=<%=DBNum %>&pageNum=<%=pageNum %>'">
		   
	<input type="button" 
		   value="답글쓰기" 
		   class="btn" 
		   onclick="location.href='marketreWrite.jsp?num=<%=DBNum %>&re_ref=<%=DBRe_ref%>&re_lev=<%=DBRe_lev%>&re_seq=<%=DBRe_seq%>'">
<%}%>
	<input type="button" 
		   value="목록보기" 
	       class="btn" 
		   onclick="location.href='market.jsp?pageNum=<%=pageNum%>'">
</div>
<div class="clear"></div>
<div id="page_control"></div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->

<!-- 댓글 -->
<form action="marketcommentPro.jsp" method="post" border="1px">
<input type="hidden" name="num" value="<%=DBNum%>">
<input type="hidden" name="num2" value="<%=pageNum%>">
<br><br><br><br>
아이디 : <input type="text" value="<%=id %>" disabled="disabled" border="3px soild">
<br>
댓글
<textarea name="comment" cols="40" rows="8"></textarea><br>
<input type="submit" value="확인">
<input type="reset" value="다시작성">
</form>
<br><br>
<%
MarketCommentDAO mcdao = new MarketCommentDAO();
ArrayList list= new ArrayList();
list = mcdao.selectMarketComment(num);
%>
<table width="1000px">
<%
for(Object o:list){ MarketCommentBean mcbean = (MarketCommentBean)o;
%>

<div>
<tr align="center"><td>ID</td><th><%=mcbean.getId() %></th><th rowspan="2"><%=mcbean.getDate()%></th></tr>

<tr align="center"><td>Content</td><th><%=mcbean.getContent()%></th></tr>
</div>
<hr>
<%
}
%>
</table>
<!-- 댓글 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<br><br><br>
<jsp:include page="../include/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>





