<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료실</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../include/top.jsp"/>
<!-- 헤더들어가는 곳 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../soccer.jsp"><img class="" alt="" src="../image/bullet.gif"> 홈</a></li><br>
<li><a href="../menu/notice.jsp"><img class="" alt="" src="../image/bullet.gif"> vs팀 게시판</a></li><br>
<li><a href="../menu/gallery.jsp"><img class="" alt="" src="../image/bullet.gif"> 축구 갤러리</a></li>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

	<%--
		스토리 설명:
		여러개의 파일을 업로드 할수 있도록 여러개의 <input type="file">태그를 만드는데..
		이왕이면 딱 정해진 개수를 만드는 것 보다.. 사용자가 업로드할 파일개수를 정해서 입력받아
		<input>태그의 개수를 동적으로 늘려서 파일을 업로드 해보자.
	 --%>
	 
	<%
		//1번 form태그에서 요청한 데이터 한글처리
		request.setCharacterEncoding("UTF-8");
	%>
	
	<%!
		//1번 form태그의 input태그의 value=""에서 요청하는 메소드 만들기
		public String getParam(HttpServletRequest request, String param){
		 	//매개변수 reques로 전달 받은??????	
			//request내장객체 영역에 입력받은 정보가 존재 하면?
		     if(request.getParameter(param) != null){
		    	 
		    	 return request.getParameter(param);
		     
		     }else{//1번 form에서 입력 받은 정보가 없으면  ""공백을 리턴 함
		    		
		    	 return "";
		     }		
	    }//getParam메소드 끝
	%>
	<%--1번 form태그 : 업로드할 파일수를 입력받는 곳 --%>	
	<article>
	<h2>자료 업로드</h2><br>
	<form action="multi.jsp" method="post">
	<table border="0">
	<tr>
		<td>이름 : </td>
		<td><input type="text" name="name" value='<%=getParam(request, "name")%>'/></td>
	</tr>
	<tr>	
		<td>이메일 : </td>
		<td><input type="text" name="email" value='<%=getParam(request,"email")%>'/><td>
	</tr>
	<tr>
		<td>전화번호 : </td>
		<td><input type="text" name="tel" value='<%=getParam(request,"tel")%>'/></td>
	</tr>
	<tr>
		<td>요청사항 : </td>
		<td><textarea  rows="3" cols="70" name="note"><%=getParam(request, "note")%></textarea></td>
	</tr>
	<tr>
		<td>업로드할 파일수 : </td>
		<td><input type="text" name="add" size="2"/><input type="submit" value="확인"/></td>
	</tr>
	</table>
	</form>
	
	<%
		//업로드하기 위해 입력한 파일 개수를 저장할 변수
		int filecnt = 0;
	
		//1번 form태그 내부의  <input>태그의 name속성값이 add인 요청값이 있으면?
		if(request.getParameter("add")  != null){
			//입력 받은 파일수 저장
			filecnt = Integer.parseInt( request.getParameter("add") );
		}
	
	%>
	<%--
		 2번 form
		 -> 1번 form태그 내부에서 입력한 업로드할 파일수를 전달 받아..
		    업로드할 파일 개수 만큼 for문을 이용하여 <input type="file">태그를 만들어서
		   2번 form태그를 이용하여  multi_pro.jsp페이지로  다중파일 업로드 요청함.
	 --%>
	 <form action="multi_pro.jsp" enctype="multipart/form-data" method="post" >
	 	<input type="hidden" name="name" value='<%=getParam(request, "name")%>'>
	 	<input type="hidden" name="addr" value='<%=getParam(request, "addr")%>'>
	  	<input type="hidden" name="note" value='<%=getParam(request, "note")%>'>
	  
	 	<%
	 		//for문을 이용하여 입력받은 파일 개수 만큼  <input type="file">인 태그를 만들어 준다.
	 		for(int i=0; i<filecnt; i++){
	 	%>					<%-- 파일업로드시 input태그의 name속성값을 모두 달리 해 주어야함 --%>
	 		 <%=i+1%>번째 파일 선택 : <input type="file" name="upFile<%=i%>"/> <br>
	 	<%	
	 		}
	 	%>
	 	 	<input type="button" value="업로드 요청" onclick="Check(this.form);"/>
	 </form>
	 </article>
	 
	 <script type="text/javascript">
		// 위 2번 form태그에 저희는 업로드될 파일 개수를 사용자에 의해서 동적으로 입력 받기 때문에
		// 2번  form태그 내부에 for문을 이용하여 <input type="file">태그가 동적으로 만들어 짐.
		// 동적으로 만들어진 <input>태그중에서 업로드할 파일 경로를 지정하지 않은 곳이 있다면..
		// x번째 파일 정보가 누락 되었습니다<---- 경고 메세지창을 띄워주고 
		// 사용자가 업로드시 모든 파일을 선택할수 있게 유도 해야 함.
		 function Check(f) {
			/*2번 form에 접근 하여 form태그 내부에 있는 모든 input태그 수 구하기*/
			//forms[] 배열 : <form>태그에 접근하는 방법
			//elements : <form>태그 내부에 있는 모든 <input>태그들을 말함
			//length : 개수 , 길이
		   var cnt	= f.elements.length;
		   /*
		   		위 cnt변수에 들어갈 <input>태그의 개수에 대한 설명!!!
		   		-> 2번 form태그에 고정된 <input type="hidden"> 3개,
		   		                     <input type="button>" 1개 이므로 총 고정 4개 이다.
		   */
		   
		   var filecnt = 1;//누락된 파일 업로드 위치를 나타낼 변수
		   /*
		   	(설명)
		   	 2번 form에 저희는 업로드될 파일 개수를 사용자에 의해서 동적으로 입력 받기 떄문에..
		   	 2번 form안의 for문을 이용하여 <input type="file">태그가 동적으로 만들어진다.
		   	 동적으로 만들어진 <input type="file">태그중에서 업로드할 파일경로를 지정하지 않은???
		   	 <input>태그가 있다면 .. x번째 파일정보가 누락되었습니다 라고 경고 창을 띄워야 한다 
		   */
		   //2번 form태그안에 있는 모든 <input>태그 개수 만큼 반복
		   for(i=0;  i<cnt; i++){
			    //조건 : 만약 2번 form태그 내부에 <input>태그중에서 type="file"인 태그라면?
			    if(f.elements[i].type == "file"){
			    	//조건 : 만약 <input type="file">태그중에서..
			    	//업로드할 파일을 지정하지 않았다면?
			    	if(f.elements[i].value == ""){
			    		var msg = filecnt + "번째 파일정보가 누락되었습니다.\n올바른 선택을 해주세요";
			    		alert(msg);
			    		//업로드할 파일을 지정 하지 않은 <input type="file">인 영역에 포커스 주기
			    		f.elements[i].focus();
			    		return;
			    	}//안쪽 if
			    	//<input type="file">일떄만... 1증가 
			    	filecnt++;//1증가
			    }//바깥 if
		   }//for 반복문 
		   
			//2번 form 전송 요청!
			f.submit();
		   
		}//Check()함수 
	 
	 </script>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../include/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->

</body>
</html>




