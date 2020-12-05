<%@page import="market.MarketDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
 	request.setCharacterEncoding("utf-8");

 	int num = Integer.parseInt(request.getParameter("num"));
 	String pageNum = request.getParameter("pageNum");
	String passwd = request.getParameter("passwd");
 
%>
	<jsp:useBean id="mBean" class="market.MarketBean" />
	<jsp:setProperty property="*" name="mBean"/>
<%
 	MarketDAO mdao = new MarketDAO();

 	int check = mdao.updateMarket(mBean);
	
	
	if(check == 1){
%>	
	<script type="text/javascript">
		window.alert("수정성공!!")
		location.href="market.jsp?pageNum=<%=pageNum %>";
	</script>

<%
	}else{
%>
	<script type="text/javascript">
	alert("수정실패!!\n")
	history.back();
	</script>
<%
	}
 
%>