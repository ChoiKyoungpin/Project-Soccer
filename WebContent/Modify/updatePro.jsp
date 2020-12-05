<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
 
 	//한글 처리
 	request.setCharacterEncoding("utf-8");

	//수정시 글이 존재하는 글번호 request에서 얻는다
	 
 	//updateForm.jsp에서 수정시 입력한 글정보들을 request내장객체 영역에서 얻어
 	//MemberBean객체를 생성하여 각변수에 저장
 	
 	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
 	String pageNum = request.getParameter("pageNum");
 
%>
	<%-- 액션태그로 작성 --%>
	<jsp:useBean id="mBean" class="member.MemberBean" />
	<jsp:setProperty property="*" name="mBean"/>


<%
 	// MemberDAO객체 작성
	MemberDAO mdao = new MemberDAO();
	
 	// MemberDAO객체의updatemember(MemberBean mBean)메소드 호출시
 	// MemberBean객체를 인자로 전달하여  updatemember메소드 내부에서 update작업함.
 	// 글수정에 성공하면 updatemember메소드 리턴값은 1
 	// 입력한 비밀번호가 DB에 저장된 글의 비밀번호와 다르면? (글 수정에 실패하면)
	// updatemember메소드의 리턴값은 0
 	int check = mdao.updateMember(mBean);
	
	
	if(check == 1){//글 수정에 성공하면 ? "글수정"메세지를 띄워주고 notice.jsp로 이동
%>	
	<script type="text/javascript">
		window.alert("수정성공!!")
		location.href="../soccer.jsp";
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