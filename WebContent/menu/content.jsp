<%@page import="comment.CommentBean"%>
<%@page import="comment.CommentDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.org.apache.xpath.internal.compiler.Keywords"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
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
	/*글 상세보기 페이지*/
	
	//num pageNum 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	//전달받은 글 num을 이용하여 글을 검색 하기 위해 BoardDAO객체를 생성하고
	BoardDAO dao = new BoardDAO();
	
	//검색하는 하나의 글정보의 조회수를 1증가 시킨다.
	dao.updateReadCount(num);
	
	//하나의 글정보를 검색하여 얻는다.
	BoardBean bBean = dao.getBoard(num);
	
	int DBNum = bBean.getNum(); 			//조회한 글번호 
	int DBReadcount = bBean.getReadcount(); //조회한 조회수
	String DBName = bBean.getName(); 		//조회한 작성자
		
	// 날짜 형식을 조작할수 있는 SimpleDateFormat()객체의 format()메소드 사용
	SimpleDateFormat f = new SimpleDateFormat("yyyy/MM/dd");
	Timestamp DBDate = bBean.getDate();		//조회한 작성일
	String newDate = f.format(DBDate);
	
	String DBContent = "";
	
	if(bBean.getContent() != null){// 조회한 글내용이 존재하면
		
		//조회한 글 내용을 변수에 저장. 단! 작성한 글내용중 엔터키로 줄바꿈 한것들을 똑같이 처리하여 반환
		DBContent = bBean.getContent().replace("\r\n", "<br/>");
		
	}

	String DBSubject = bBean.getSubject();	//조회한 글제목
	
	//답변글에 사용되는 조회한 값들 얻기
	int DBRe_ref = bBean.getRe_ref(); 		//조회한 주글의 그룹번호
	int DBRe_lev = bBean.getRe_lev();		//조회한 주글의 들여쓰기 정도값
	int DBRe_seq = bBean.getRe_seq();		//주글들 내의 조회한 주글의 순서값
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
<li><a href="playapply.jsp"><img class="" alt="" src="../image/bullet.gif"> 용병 신청</a></li><br>
<li><a href="reservation.jsp"><img class="" alt="" src="../image/bullet.gif"> 경기장 예약</a></li>
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
//각각페이지에서 로그인후 현재 페이지로 이동해 올때  session내장객체 메모리에 값이 존재하는지
//존재하지 않는디 판단하여 아래의 search버튼만 보이게 하거나 search버튼과 글쓰기버튼을 모두 보이게 처리 하기

String id = (String)session.getAttribute("id");

//session영역에 값이 저장되어 있으면  글수정, 글삭제, 답글쓰기 버튼 보이게 설정
if(id != null){
%>	
	<input type="button" 
		   value="글수정" 
		   class="btn" 
		   onclick="location.href='update.jsp?num=<%=DBNum %>&pageNum=<%=pageNum %>'">
		   
	<input type="button" 
		   value="글삭제" 
		   class="btn" 
		   onclick="location.href='delete.jsp?num=<%=DBNum %>&pageNum=<%=pageNum %>'">
		   
	<input type="button" 
		   value="답글쓰기" 
		   class="btn" 
		   onclick="location.href='reWrite.jsp?num=<%=DBNum %>&re_ref=<%=DBRe_ref%>&re_lev=<%=DBRe_lev%>&re_seq=<%=DBRe_seq%>'">
<%}%>
	<input type="button" 
		   value="목록보기" 
	       class="btn" 
		   onclick="location.href='notice.jsp?pageNum=<%=pageNum%>'">
</div>
<div class="clear"></div>
<div id="page_control"></div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->

<!-- 댓글 -->
<form action="commentPro.jsp" method="post" border="1px">
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
CommentDAO cdao = new CommentDAO();
ArrayList list= new ArrayList();
list = cdao.selectcomment(num);
%>
<table width="1000px">
<%
for(Object o:list){ CommentBean cbean = (CommentBean)o;
%>
<!--
CommentBean cbean = new sad
 for (int i = 0 ; i <siz ; i++) {
cbean.getId(i)
}
  -->
<div>
<tr align="center"><td>ID</td><th><%=cbean.getId() %></th><th rowspan="2"><%=cbean.getDate()%></th></tr>

<tr align="center"><td>Content</td><th><%=cbean.getContent()%></th></tr>
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





