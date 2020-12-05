<%@page import="marketcomment.MarketCommentDAO"%>
<%@page import="marketcomment.MarketCommentBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%

request.setCharacterEncoding("UTF-8");

String id=(String)session.getAttribute("id");
int num=Integer.parseInt(request.getParameter("num"));
int num2=Integer.parseInt(request.getParameter("num2"));
String content=request.getParameter("comment");
Timestamp timedate=new Timestamp(System.currentTimeMillis());


if(id!=null){
 
MarketCommentBean mcbean=new MarketCommentBean();
MarketCommentDAO mcdao=new MarketCommentDAO();
mcbean.setContent(content);
mcbean.setId(id);
mcbean.setDate(timedate);
mcbean.setNum(num);
mcdao. insertMarketComment(mcbean);
response.sendRedirect("marketcontent.jsp?num="+num+"&pageNum="+num2);

}else{
%>
<script type="text/javascript">
alert("로그인이필요합니다"); 
location.href="../member/login.jsp"; 
</script>
<%
}
%>
</body>
</html>