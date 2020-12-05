<%@page import="java.text.SimpleDateFormat"%>
<%@page import="market.MarketBean"%>
<%@page import="market.MarketDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중고 마켓</title>
</head>
<%
	MarketDAO marketDAO = new MarketDAO();

	int count = marketDAO.getMarketCount();

	int pageSize = 5;

	String pageNum = request.getParameter("pageNum");

	if(pageNum == null){
		pageNum = "1";
	}

	int currentPage = Integer.parseInt(pageNum);

	int startRow = (currentPage - 1) * pageSize;

	List<MarketBean> list = null;

	if(count > 0){
		list = marketDAO.getMarketList(startRow,pageSize);
		System.out.println(list.size());   
	}	
%> 
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../include/top.jsp"/>
<!-- 헤더들어가는 곳 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../soccer.jsp"><img class="" alt="" src="../image/bullet.gif"> 홈</a></li><br>
<li><a href="../menu/reservation.jsp"><img class="" alt="" src="../image/bullet.gif"> 경기장 예약</a></li><br>
<li><a href="../menu/notice.jsp"><img class="" alt="" src="../image/bullet.gif"> vs 팀 게시판</a></li>
<br><br><br><br><br><br><br><br><br><br><br>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 [전체글개수 : <%=count%>] -->
<article>
<h2>중고 마켓</h2>
<br>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
<%

if(count > 0){

	for(int i=0; i<list.size(); i++){

		MarketBean bean = list.get(i);
%>
	<tr onclick="location.href='marketcontent.jsp?num=<%=bean.getNum()%>&pageNum=<%=pageNum%>'">
		<td><%=bean.getNum()%></td>
		<td class="left">
<%
		int wid = 0; 

		if(bean.getRe_lev() > 0){
		
			wid = bean.getRe_lev() * 10;
%>
		<img src="../image/level.gif" width="<%=wid%>" height="15">
		<img src="../image/re.gif">
<%
		}
%>
		<%=bean.getSubject()%>
		</td>
		<td><%=bean.getName()%></td>
		<td><%=new SimpleDateFormat("yyyy.MM.dd").format(bean.getDate())%></td>
		<td><%=bean.getReadcount()%></td>
	</tr>
<%		
	}
}else{
%>
	<tr>
		<td colspan="5">게시판 글 없음</td>
	</tr>
<%	
}
%>
</table>
<br>
<%
String id = (String)session.getAttribute("id");


if(id != null){
%>	
<div id="table_search">
	<input type="button" value="글쓰기" class="btn" onclick="location.href='marketwrite.jsp'"/>
</div>
<%}%>

<div id="table_search">
	<input type="text" name="search" class="input_box">
	<input type="button" value="검색" class="btn">
</div>



<div class="clear"></div>
<div id="page_control">
<%
	if(count>0){
		int pageCount = count/pageSize+(count%pageSize==0?0:1);
		
		
		int pageBlock = 2;
		
		
				int startPage= ((currentPage/pageBlock) - (currentPage%pageBlock==0?1:0)) * pageBlock+1;
		
		
		int endPage = startPage + pageBlock - 1;
		
		
			if(endPage > pageCount){
				
				endPage = pageCount;
			}
		
		
		if(startPage > pageBlock){
%>
			<a href="market.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
<%
		}
		
		
		for(int i=startPage;i<=endPage;i++){
%>			
			<a href="market.jsp?pageNum=<%=i%>">[<%=i%>]</a>
<%			
		}		
		
		if(endPage < pageCount){
%>	
			<a href="market.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
<%
		}
	}
%>			
</div>


</article>
<!-- 게시판 -->

<!-- 푸터들어가는 곳 -->
<br><br><br>
<jsp:include page="../include/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</body>
</html>