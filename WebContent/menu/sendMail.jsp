<%@page import="mail.SMTPAuthenticator"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>

<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	//입력값 받음
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String date = request.getParameter("date");
	String time = request.getParameter("time");
	String title = request.getParameter("title");
	String man = request.getParameter("man");
	String from = request.getParameter("from");
	String to = request.getParameter("to");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	Properties p = new Properties(); // 정보를 담을 객체
	
	p.put("mail.smtp.host","smtp.naver.com"); //네이버 SMTP
	
	// SMTP 서버에 접속하기 위한 정보들
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
	
	try{
	    Authenticator auth = new SMTPAuthenticator();
	    Session ses = Session.getInstance(p, auth);
	     
	    ses.setDebug(true);
	    
	    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
	    
	    msg.setSubject(subject); // 제목
	    
	    StringBuffer buffer = new StringBuffer();
	    buffer.append("이름 : ");
	    buffer.append(name+"<br>");
	    buffer.append("연락처 : ");
	    buffer.append(tel+"<br>");
	    buffer.append("날짜 : ");
	    buffer.append(date+"<br>");   
	    buffer.append("시간 : ");
	    buffer.append(time+"<br>");   
	    buffer.append("종목 : ");
	    buffer.append(title+"<br>");
	    buffer.append("인원 : ");
	    buffer.append(man+"<br>");
	    	     
	    Address fromAddr = new InternetAddress(from);
	    msg.setFrom(fromAddr); // 보내는 사람
	     
	    Address toAddr = new InternetAddress(to);
	    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
	     
	    msg.setContent(buffer.toString(), "text/html;charset=UTF-8"); // 내용과 인코딩
	     
	    Transport.send(msg); // 전송
	    
	    
	    
	} catch(Exception e){
	    e.printStackTrace();
	    out.println("<script>alert('신청 실패..');history.back();</script>");
	    // 오류 발생시 뒤로 돌아가도록
	    return;
	}
	 
	out.println("<script>alert('신청 완료!!');location.href='./playapply.jsp';</script>");
	// 성공 시

%>