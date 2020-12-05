<%@page import="market.MarketDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

%>    
	 <jsp:useBean id="mBean" class="market.MarketBean"/>
	 <jsp:setProperty property="*" name="mBean"/>
 
 <%
 	mBean.setDate(new Timestamp(System.currentTimeMillis())); 
 
 	mBean.setIp(request.getRemoteAddr());

 	MarketDAO mdao = new MarketDAO();
 	 
 	mdao.insertMarket(mBean);
 	
 	response.sendRedirect("market.jsp");
 %>



















