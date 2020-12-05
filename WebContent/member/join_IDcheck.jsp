<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">
		function result(){
			
			opener.document.fr.id.value = document.getElementById("finallyId").value;
			
			opener.document.fr.id.disabled="disabled";
			
			opener.document.getElementById("btn").disabled="disabled";
			
			window.close();
		}

</script>    
    
    
<%
	//1.한글처리
	request.setCharacterEncoding("UTF-8");

	//2.join.jsp의 function winopen()함수에 의해서 전달 받은 userid값(입력한 아이디) 얻기 
	//3.밑의 중복확인 버튼 을 클릭했을때 <form>태그로 부터 전달받은 userid값(다시 입력한 아이디 )얻기
	String id = request.getParameter("userid");
	
	//4.입력한 아이디와  DB에저장되어 있는 아이디를 비교 하기 위해 DB작업 해야함
	MemberDAO mdao = new MemberDAO();
	//아이디 중복 체크 유무 값을 전달 받기 위해  idCheck()메소드 호출시...
	//입려한 아이디를 전달 함.
	int check = mdao.idCheck(id);
	
	//5.응답 받은 값 check == 1 ->  "사용중인 아이디 입니다." <-- 아이디 있음 , 중복
	//           check == 0 -> "사용 가능한  아이디 입니다." <-- 입력한 아이디가  DB에 존재하지 않음
	//														     중복 X
	if(check == 1){
		out.println("사용중인 아이디 입니다.");
	}else{
		out.println("사용가능한 아이디 입니다.");
%>		
		<%--6. 사용가능한 ID이면 사용함 버튼을 눌러서 부모창(join.jsp)에 사용가능한 ID출력해주기 --%>
		<button type="button" onclick="result();">사용함</button>
<%		
	}
%>
	
	<form action="join_IDcheck.jsp">
	
	<%--join.jsp(부모창)에서 입력한 아이디를 request영역에서 얻어 아래의input에 출력 --%>
	아이디 : <input type="text" name="userid" value="<%=id%>"  id="finallyId"/> 
		   <input type="submit" value="중복확인" />
		   
	</form>
	