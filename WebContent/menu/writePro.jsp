<%@page import="board.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");

%>    
<%--
	1. write.jsp 에서 입력한 새글정보(현재jsp로 요청한값)를 request영역에서 얻기
	2. request영역에서 얻은 요청한 값들을 BoardBean객체를 생성해서 각변수에 저장
--%>
	 <jsp:useBean id="bBean" class="board.BoardBean"/>
	 <jsp:setProperty property="*" name="bBean"/>
 
 <%
 
 	//DB에 입력한 새글정보중.. 글작성날짜및 시간을 추가로 BoardBean에 저장
 	bBean.setDate(new Timestamp(System.currentTimeMillis())); 
 	//DB에 새글정보를 입력하는 클라이언트의 IP주소를 추가로 BoardBean에 저장
 	bBean.setIp(request.getRemoteAddr());
 
 	//System.currentTimeMillis() 현재 시스템 시간을 반환
 	//request.getRemoteAddr() 요청한 클라이언트의 IP주소 반환
 	
 	//3. 입력한 새글 정보를 t_board테이블에 INSERT하기 위해 BoardDAO객체를 생상한후 메소드를 호출함
 	BoardDAO bdao = new BoardDAO();
 	 
 	bdao.insertBoard(bBean);
 	
 	//4. 위의 insertBoard()a메소드 내부에서 DB와 연결하어 insert작업을 한후 성공하면 
 	//   게시판의 목록화면으로 이동~
 	// 	  재이동
 	response.sendRedirect("notice.jsp");
 %>



















