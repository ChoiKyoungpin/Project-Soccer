<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>경기장 안내</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../include/top.jsp"/>
<!-- 헤더들어가는 곳 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="reservation.jsp"><img class="" alt="" src="../image/bullet.gif"> 경기장 예약</a></li><br>
<li><a href="groundinfo.jsp"><img class="" alt="" src="../image/bullet.gif"> 시설안내</a></li>
<br><br><br><br>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 게시판 -->
<article>
<main id="contents">
<h2>시설 안내</h2>
<h3 class="titPage">경기장</h3>
<div class="content">
	<div class="h4Section">
		<div class="srcoll-table"><div>
			<table class="tableRow tl">
				<caption>경기장 시설 (시설현황, 시설이용, 이용문의로 구성된 표)</caption>
				<tbody>
					<tr>
						<th scope="row">시설현황</th>
						<td>인조잔디 2면</td>
					</tr>
					
					<tr>
						<th scope="row">시설이용</th>
						<td><ul class="listStyle">
	                    	<li><strong>이용시간</strong>
	                        	<ul>
	                            	<li>조기(새벽) : 06:00 ~ 09:00(무료)</li>
	                                <li>주간·야간 : 09:00 ~ 21:00(유료)</li>
	                            </ul>
	                        </li>
	                        <li><strong>이용요금</strong>
	                        	<ul>
	                            	<li>평일 주간 : 40,000원</li>
	                                <li>토.일요일 및 공휴일, 야간 : 60,000원<br>※ 야간 조명시설 이용료 : 없음</li>
	        					</ul>
	                         </li>
	                         </ul>               
	                                            
	                        </td>
					</tr>
					<tr>
						<th scope="row">이용문의</th>
						<td>구덕운동장(☎051-123-1234~5678)</td>
					</tr>
				</tbody>
			</table>
		</div>
	  </div>
	<img class="mt20" alt="구덕운동장 풋살장" src="../image/gdfoot.jpg">
	</div>
</div>
</main>
</article>
<!-- 게시판 -->

<!-- 푸터들어가는 곳 -->
<jsp:include page="../include/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</body>
</html>