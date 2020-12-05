<%@page import="member.MemberDAO"%>
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
	//한글 인코딩
	request.setCharacterEncoding("utf-8");
	
	//deleteForm.jsp(회원을 삭제하기 위해 비밀번호를 입력하는 화면)에서 입력한 삭제할 아이디, 비밀번호 얻기
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	//삭제할 글번호,입력한 비밀번호를  BoardDAO객체의 deleteBoard메소드 호출시 인수로 전달하여 삭제작업함
	//글삭제에 성공하면 deleteBoard메소드로부터 1을 반환 받고, 삭제에 실패하면 0을 반환받는다.
	MemberDAO mdao = new MemberDAO();
	int check = mdao.deleteMember(id,passwd);
	
	// check == 1 "삭제성공" 메세지창을 띄워주고, notice.jsp 재요청해서 이동
	if(check == 1){
%>	
		<script type="text/javascript">
			alert("삭제성공");
			location.href="../soccer.jsp";
		</script>
<%	
	}else{// check == 0 "비밀번호 틀림" 메세지창을 띄워주고, delete.jsp(비밀번호입력화면) 재요청해서 이동
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