<%@page import="java.sql.Timestamp"%>
<%@page import="comment.CommentDAO"%>
<%@page import="comment.CommentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
 
CommentBean cbean=new CommentBean();
CommentDAO cdao=new CommentDAO();
cbean.setContent(content);
cbean.setId(id);
cbean.setDate(timedate);
cbean.setNum(num);
cdao. insertComment(cbean);
response.sendRedirect("content.jsp?num="+num+"&pageNum="+num2);

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