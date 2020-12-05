<%@page import="market.MarketDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String passwd = request.getParameter("passwd");

	MarketDAO bdao = new MarketDAO();
	int check = bdao.deleteMarket(num,passwd);
	
	if(check == 1){
%>	
		<script type="text/javascript">
			alert("삭제성공");
			location.href="notice.jsp?pageNum=<%=pageNum%>";
		</script>
<%	
	}else{
%>		
		<script type="text/javascript">
			alert("비밀번호틀림");
			history.back();
		</script>
<%
	}
%>
</body>
</html>