<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정</title>
</head>
<body>
<jsp:include page="../include/top.jsp"/>
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../soccer.jsp"><img class="" alt="" src="../image/bullet.gif">홈</a></li><br>
<li><a href="../Modify/updateForm.jsp"><img class="" alt="" src="../image/bullet.gif">회원정보수정</a></li><br>
<li><a href="../Modify/deleteForm.jsp"><img class="" alt="" src="../image/bullet.gif">회원정보삭제</a></li>
<br><br><br><br><br><br><br><br><br>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<article>
<h2>회원삭제</h2>
<br>
<form action="deletePro.jsp" method="post">
아이디: <input type="text" name="id"><br><br>
패스워드: <input type="password" name="passwd"><br><br>
<input type="submit" value="회원삭제"><br><br>
</article>
</form>
<jsp:include page="../include/bottom.jsp"/>
</body>
</html>