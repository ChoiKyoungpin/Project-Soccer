<%@page import="market.MarketBean"%>
<%@page import="market.MarketDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%	request.setCharacterEncoding("UTF-8");

	int num = Integer.parseInt(request.getParameter("num")); 
	int re_ref = Integer.parseInt(request.getParameter("re_ref"));
	int re_lev = Integer.parseInt(request.getParameter("re_lev"));
	int re_seq = Integer.parseInt(request.getParameter("re_seq"));
	String name = request.getParameter("name");
	String passwd = request.getParameter("passwd");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	MarketBean mBean  = new MarketBean();
	mBean.setNum(num);
	mBean.setRe_ref(re_ref);
	mBean.setRe_lev(re_lev);
	mBean.setRe_seq(re_seq);
	mBean.setName(name);
	mBean.setPasswd(passwd);
	mBean.setSubject(subject);
	mBean.setContent(content);
	mBean.setIp(request.getRemoteAddr());
	mBean.setDate(new Timestamp(System.currentTimeMillis()));

	MarketDAO mdao = new MarketDAO();
	mdao.reInsertMarket(mBean);

    response.sendRedirect("market.jsp");

%>



