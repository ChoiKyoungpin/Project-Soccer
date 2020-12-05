<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<!-- Head 시작-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>축구 커뮤니티</title>
	
	<link rel="stylesheet" href="css/modules.css" type="text/css">
	<link rel="stylesheet" href="css/style.min.css" type="text/css">
	<link href="https://fonts.googleapis.com/css2?family=Gugi&display=swap" rel="stylesheet">
  
	      <script type="text/javascript">

function time() {
	var d = new Date();
	
	var dd=["일요일","월요일","화요일","수요일","목요일","금요일","토요일"];
	
	var d1 = d.getDay(); 
	
	var h = d.getHours(); 
	
	var m = d.getMinutes(); 
	
	var s = d.getSeconds(); 
	
	
	m = dasi(m);
	s = dasi(s);
	
	document.getElementById("test").innerHTML = dd[d1]+" " + h + ":" + m + ":" + s;
	var t = setTimeout(function(){time()},1000);
}
 function dasi(i){
	if(i<10){
		i = "0" + i;
	}
	return i;
}
	</script>

</head>
<!--Head 끝-->
<body onload="time()">
<!-- header 시작 -->
<div>
<header class="MOD_HEADER1" >
<%
String id = (String)session.getAttribute("id");
if(id==null){
%>
<div data-layout="_r">
    <div data-layout="al16 de10" class="MOD_HEADER1_Title">
       <h1 class="MOD_HEADER1_TextLogo"><a href="soccer.jsp"><img src="./image/soccer.gif"></a></h1>
    </div>
    <div data-layout="al16 de6" class="MOD_HEADER1_Details">
      <!-- <p class="MOD_HEADER1_Phone">Phone: 010 1234 5678</p> -->
      <!-- Search -->
      <form name="Header1" action="" method="">
        <input id="MOD_HEADER1_Search" class="MOD_HEADER1_Search" type="search" placeholder="Search"></input>
        <label for="MOD_HEADER1_Search">Search</label>
      <div id="login">
	      <!-- 홈 화면 -->
	      <a href="soccer.jsp">홈</a>
	      <!-- 로그인 -->
	      <a href="./member/login.jsp" class="smIcon">로그인</a>
	      <!-- 회원가입 -->
	      <a href="./member/join.jsp" class="smIcon">회원가입</a>
	      <div id="test"></div>
      </div>
      </form>
     </div>
    </div>
<%
}else{
%>
 

<div data-layout="_r">
    <div data-layout="al16 de10" class="MOD_HEADER1_Title">
       <h1 class="MOD_HEADER1_TextLogo"><a href="soccer.jsp"><img src="./image/soccer.gif"></a></h1>
    </div>
    <div data-layout="al16 de6" class="MOD_HEADER1_Details">
      <!-- Search -->
      <form name="Header1" action="" method="">
        <input id="MOD_HEADER1_Search" class="MOD_HEADER1_Search" type="search" placeholder="Search"></input>
        <label for="MOD_HEADER1_Search">Search</label>        
        <div id="login" >
	<%=id %>님 로그인중...
	<a href="./soccer.jsp">홈</a>
	<a href="./member/logout.jsp">로그아웃</a>
	<a href="./Modify/updateForm.jsp">회원정보수정</a>
	      <div id="test"></div>
</div>
      </form>
      </div>
      </div>
<%
}
%>

<div class="clear"></div>
<!-- header 끝 -->

<!-- MenuBar 시작 -->
<section class="MOD_MENU" data-theme="_bgp">
  <div data-layout="_r" class="nopadding">
    <nav class="MOD_MENU_Nav">
      <p class="MOD_MENU_Title">Menu</p>
      <svg class="MOD_MENU_Button" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="30px" height="30px" viewBox="0 0 30 30" enable-background="new 0 0 30 30" xml:space="preserve">
        <rect width="30" height="6"/>
        <rect y="24" width="30" height="6"/>
        <rect y="12" width="30" height="6"/>
      </svg>
      <ul class="AP_Menu_List">
        <li>
          <a href="./menu/playapply.jsp" data-theme="_bgp">축구&풋살 용병 신청</a>
        </li>
        <li>
          <a href="./menu/reservation.jsp" data-theme="_bgp">경기장 예약</a>
          <ul>
            <li>
              <a href="./menu/groundinfo.jsp" data-theme="_bgpd">시설 안내</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="./menu/notice.jsp" data-theme="_bgp"> vs 팀 게시판</a>
          <ul>
            <li>
              <a href="./market/market.jsp" data-theme="_bgpd">중고 마켓</a>
            </li>
          </ul>
        </li>
        <li>
          <a href="./menu/gallery.jsp" data-theme="_bgp">축구 갤러리</a>
        </li>
        <li>
          <a href="./Fileupload/multi.jsp" data-theme="_bgp">자료실</a>
        </li>
      </ul>
    </nav>
  </div>
</section>
<!-- MenuBar 끝 -->
</header>
<!-- center section 시작 -->
<section class="MOD_LIGHTBOXIMGX4BACKGROUND" data-theme="_bgp">
  <div data-layout="_r">
    <div data-layout="al8 de4">
      <a href="./menu/gallery.jsp" class="AP_lightbox" aria-haspopup="true">
        <figure>
          <img src="./image/son1_500x500.jpg" alt="son1" data-theme="_is2">
          <figcaption>Fig1. Image Caption</figcaption>
        </figure>
      </a>
    </div>
    <div data-layout="al8 de4">
      <a href="./menu/gallery.jsp" class="AP_lightbox" aria-haspopup="true">
        <figure>
          <img src="./image/son2_500x500.jpg" alt="son2" data-theme="_is2">
          <figcaption>Fig2. Image Caption</figcaption>
        </figure>
      </a>
    </div>
    <div data-layout="al8 de4">
      <a href="./menu/gallery.jsp" class="AP_lightbox" aria-haspopup="true">
        <figure>
          <img src="./image/sungu_500x500.jpg" alt="sungu" data-theme="_is2">
          <figcaption>Fig3. Image Caption</figcaption>
        </figure>
      </a>
    </div>
    <div data-layout="al8 de4">
      <a href="./menu/gallery.jsp" class="AP_lightbox" aria-haspopup="true">
        <figure>
          <img src="./image/park_500x500.jpg"  alt="park" data-theme="_is2">
          <figcaption>Fig4. Image Caption</figcaption>
        </figure>
      </a>
    </div>
  </div>
</section>
<!-- center section 시작 -->

<!--notice section 시작 -->
<section>
  <div data-layout="_r">
    <div data-layout="ch-half">
    <h4><a href="./menu/playapply.jsp">용병  신청</a></h4>
      <table>
		<tr><td class="contxt"><a href="#">풋살용병 신청</a></td>
		    <td>2020.11.09</td></tr>
		<tr><td class="contxt"><a href="#">축구용병 신청</a></td>
		    <td>2020.07.20</td></tr>
		<tr><td class="contxt"><a href="#">축구용병 신청</a></td>
		    <td>2020.07.05</td></tr>
		<tr><td class="contxt"><a href="#">풋살용병 신청</a></td>
		    <td>2020.05.08</td></tr>
		<tr><td class="contxt"><a href="#">족구용병 신청</a></td>
		    <td>2020.01.15</td></tr>
		</table>
    </div>
    
    <div data-layout="ch-half">
    <h4><a href="./menu/notice.jsp">vs팀 게시판</a></h4>
     <table>
		<tr><td class="contxt"><a href="#">20.11.14 축구팀구함</a></td>
		    <td>2020.11.09</td></tr>
		<tr><td class="contxt"><a href="#">20.07.25 풋살팀구함</a></td>
		    <td>2020.07.20</td></tr>
		<tr><td class="contxt"><a href="#">20.07.11 풋살팀구함</a></td>
		    <td>2020.07.05</td></tr>
		<tr><td class="contxt"><a href="#">20.05.16 축구팀구함</a></td>
		    <td>2020.05.08</td></tr>
		<tr><td class="contxt"><a href="#">20.01.18 축구팀구함</a></td>
		    <td>2020.01.15</td></tr>
	</table>
    </div>
  </div>
</section>
<!-- notice section 시작 -->

<!--Footer 시작-->
<footer>
  <div class="MOD_FOOTER1" data-theme="_bgd">
    <div data-layout="_r">
      <div data-layout="ch8 ec4">
        <h3>About us</h3>
        <p><a href="#">스포츠 조선</a></p>
        <p><a href="#">스포츠 서울</a></p>
        <p><a href="#">스포츠 동아</a></p>
        <p><a href="#">네이버 스포츠</a></p>
      </div>
      <div data-layout="al16 ch8 ec4 ec-n4">
        <h3>Links</h3>
        <nav>
          <ul>
            <li><a href="#">뭉쳐야찬다 신청</a></li>
            <li><a href="#">프리스타일</a></li>
            <li><a href="#">족구협회</a></li>
          </ul>
        </nav>
      </div>
      <div data-layout="ch8 ec4">
        <h3>Contact Details</h3>
        <p>Email: <a href="mailto:#">soccer@itwillbs.com</a></p>        
        <address>
        	109, Dongcheon-ro 7F<br>
            Busanjin-gu, Busan<br>
            Republic of Korea<br>
          </address>
      </div>
    </div>
  </div>
  <div class="MOD_FOOTER1_Copyright" data-theme="_bgvd">
    <div data-layout="_r" class="nopadding">
      <div data-layout="al16">
        <p>Copyright &copy; 2020 Soccer Community</p>
      </div>
    </div>
  </div>
</footer>
<!-- footer 끝 -->
<script src="assets/js/index.js"></script>
</div>
</body>
</html>