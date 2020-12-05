<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
 
 	//한글 처리
 	request.setCharacterEncoding("utf-8");

	//수정시 글이 존재하는 글번호 request에서 얻는다
	

 
 	//update.jsp에서 수정시 입력한 글정보들을 request내장객체 영역에서 얻어
 	//BoardBean객체를 생성하여 각변수에 저장
 	int num = Integer.parseInt(request.getParameter("num"));
 	String pageNum = request.getParameter("pageNum");
	String passwd = request.getParameter("passwd");
 
%>
	<%-- 액션태그로 작성 --%>
	<jsp:useBean id="bBean" class="board.BoardBean" />
	<jsp:setProperty property="*" name="bBean"/>


<%
 	// BoardDAO객체 작성
	BoardDAO bdao = new BoardDAO();
	
 	// BoarDAO객체의updateBoard(BoardBean bBean)메소드 호출시
 	// BoardBean객체를 인자로 전달하여  updateBoard메소드 내부에서 update작업함.
 	// 글수정에 성공하면 updateBoard메소드 리턴값은 1
 	// 입력한 비밀번호가 DB에 저장된 글의 비밀번호와 다르면? (글 수정에 실패하면)
	// updateBoard메소드의 리턴값은 0
 	int check = bdao.updateBoard(bBean);
	
	
	if(check == 1){//글 수정에 성공하면 ? "글수정"메세지를 띄워주고 notice.jsp로 이동
%>	
	<script type="text/javascript">
		window.alert("수정성공!!")
		location.href="notice.jsp?pageNum=<%=pageNum %>";
	</script>

<%
	}else{//글 수정에 실패하면 ? "글수정 실패"메세지를 띄워주고 update.jsp로 이동
%>
	<script type="text/javascript">
	alert("수정실패!!\n")
	history.back();
	</script>
<%
	}
 
%>