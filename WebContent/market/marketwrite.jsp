<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<link rel="stylesheet" href="../css/style.min.css">
	<link rel="stylesheet" href="../css/modules.css">
</head>

<%
	String id = (String)session.getAttribute("id");

	if(id == null){
		response.sendRedirect("../member/login.jsp");
%>	
	


<%	
	}

%>



<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../include/top.jsp"/>
<!-- 헤더들어가는 곳 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../soccer.jsp"><img class="" alt="" src="../image/bullet.gif"> 홈</a></li><br>
<li><a href="../market/market.jsp"><img class="" alt="" src="../image/bullet.gif"> 중고 마켓</a></li><br>
<li><a href="notice.jsp"><img class="" alt="" src="../image/bullet.gif"> vs 팀 게시판</a></li>
<br><br><Br><br>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->
<!-- 게시판 -->
<article>
	<h1>새글 쓰기</h1>
	<form action="marketwritePro.jsp" method="post">
		<table id="notice">
			<tr>
				<td>종류</td>
				<td>
				<select>
					<option value="[삽니다]">삽니다</option>
					<option value="[팝니다]">팝니다</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=id %>" readonly></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<td>글제목</td>
				<td><input type="text" name="subject" ></td>
			</tr>
			<tr>
				<td>글내용</td>
				<td><textarea name="content" rows="13" cols="40"></textarea></td>
			</tr>
		</table>
		<div id="table_search"> 
			<input type="submit" value="글쓰기" class="btn">
			<input type="reset" value="다시작성" class="btn">
			<input type="button" value="글목록" class="btn" onclick="location.href='market.jsp'">	
		</div>
	</form>
	<div class="clear"></div>
	<div id="page_control"></div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<br><br><br>
<jsp:include page="../include/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html> 