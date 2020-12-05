<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
		<title>축구 갤러리</title>
		<link rel="stylesheet" href="../css/basic.css" type="text/css" />
		<link rel="stylesheet" href="../css/galleriffic-2.css" type="text/css" />
		<script type="text/javascript" src="../js/jquery-1.3.2.js"></script>
		<script type="text/javascript" src="../js/jquery.galleriffic.js"></script>
		<script type="text/javascript" src="../js/jquery.opacityrollover.js"></script>
		<!-- We only want the thunbnails to display when javascript is disabled -->
		<script type="text/javascript">
			document.write('<style>.noscript { display: none; }</style>');
		</script>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../include/top.jsp"/>
<!-- 헤더들어가는 곳 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="reservation.jsp"><img class="" alt="" src="../image/bullet.gif"> 경기장 예약</a></li><br>
<li><a href="notice.jsp"><img class="" alt="" src="../image/bullet.gif"> vs 팀 게시판</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 게시판 -->
		<div id="page">
			<div id="container">
				<div id="gallery" class="content">
					<div id="controls" class="controls"></div>
					<div class="slideshow-container">
						<div id="loading" class="loader"></div>
						<div id="slideshow" class="slideshow"></div>
					</div>
					<div id="caption" class="caption-container"></div>
				</div>
				<div id="thumbs" class="navigation">
					<ul class="thumbs noscript">
						<li>
							<a class="thumb" name="ji" href="../image/ji_500x500.jpg" title="Title #0">
								<img src="../image/ji_75x75.jpg" alt="Title #0" />
							</a>
							
						</li>
 
						<li>
							<a class="thumb" name="kaka" href="../image/kaka_500x500.jpg" title="Title #1">
								<img src="../image/kaka_75x75.jpg" alt="Title #1" />
							</a>
							
						</li>
 
						<li>
							<a class="thumb" name="bybala" href="../image/bybala_500x500.jpg" title="Title #2">
								<img src="../image/bybala_75x75.jpg" alt="Title #2" />
							</a>
							
						</li>
 
						<li>
							<a class="thumb" name="cha" href="../image/cha_500x500.jpg" title="Title #3">
								<img src="../image/cha_75x75.jpg" alt="Title #3" />
							</a>
							
						</li>
 
						<li>
							<a class="thumb" href="../image/cha2_500x500.jpg" title="Title #4">
								<img src="../image/cha2_75x75.jpg" alt="Title #4" />
							</a>
							
						</li>
 
						<li>
							<a class="thumb" href="../image/mina_500x500.jpg" title="Title #5">
								<img src="../image/mina_75x75.jpg" alt="Title #5" />
							</a>
							
						</li>
 
						<li>
							<a class="thumb" href="../image/kangin_500x500.jpg" title="Title #6">
								<img src="../image/kangin_75x75.jpg" alt="Title #6" />
							</a>
							
						</li>
 
						<li>
							<a class="thumb" href="../image/kangin2_500x500.jpg" title="Title #7">
								<img src="../image/kangin2_75x75.jpg" alt="Title #7" />
							</a>
							
						</li>
 
						<li>
							<a class="thumb" href="../image/leedongguk_500x500.jpg" title="Title #8">
								<img src="../image/leedongguk_75x75.jpg" alt="Title #8" />
							</a>
							
						</li>
 
						<li>
							<a class="thumb" href="../image/leedongguk2_500x500.jpg" title="Title #9">
								<img src="../image/leedongguk2_75x75.jpg" alt="Title #9" />
							</a>
							
						</li>
 
						<li>
							<a class="thumb" href="../image/messi_500x500.jpg" title="Title #10">
								<img src="../image/messi_75x75.jpg" alt="Title #10" />
							</a>
							
						</li>
 
						<li>
							<a class="thumb" href="../image/park_500x500.jpg" title="Title #11">
								<img src="../image/park_75x75.jpg" alt="Title #11" />
							</a>
							
						</li>
 
						<li>
							<a class="thumb" href="../image/park2_500x500.jpg" title="Title #12">
								<img src="../image/park2_75x75.jpg" alt="Title #12" />
							</a>
							
						</li>
 
						<li>
							<a class="thumb" href="../image/park3_500x500.jpg" title="Title #13">
								<img src="../image/park3_75x75.jpg" alt="Title #13" />
							</a>
							
						</li>
 
						<li>
							<a class="thumb" href="../image/park4_500x500.jpg" title="Title #14">
								<img src="../image/park4_75x75.jpg" alt="Title #14" />
							</a>
							
						</li>
 
						<li>
							<a class="thumb" href="../image/pirlo_500x500.jpg" title="Title #15">
								<img src="../image/pirlo_75x75.jpg" alt="Title #15" />
							</a>
							
						</li>
 
						<li>
							<a class="thumb" href="../image/pirlo2_500x500.jpg" title="Title #16">
								<img src="../image/pirlo2_75x75.jpg" alt="Title #16" />
							</a>
							
						</li>
 
						<li>
							<a class="thumb" href="../image/ronaldinho_500x500.jpg" title= "Title #17">
								<img src="../image/ronaldinho_75x75.jpg" alt="Title #17" />
							</a>
							
						</li>
 
						<li>
							<a class="thumb" href="../image/jo_500x500.jpg" title="Title #18">
								<img src="../image/jo_75x75.jpg" alt="Title #18" />
							</a>
							
						</li>
 
						<li>
							<a class="thumb" href="../image/son1_500x500.jpg" title="Title #19">
								<img src="../image/son1_75x75.jpg" alt="Title #19" />
							</a>
							
						</li>
 
						<li>
							<a class="thumb" href="../image/son2_500x500.jpg" title="Title #20">
								<img src="../image/son2_75x75.jpg" alt="Title #20" />
							</a>
							
						</li>
 
						<li>
							<a class="thumb" href="../image/son3_500x500.jpg" title="Title #21">
								<img src="../image/son3_75x75.jpg" alt="Title #21" />
							</a>
						</li>
 
						<li>
							<a class="thumb" href="../image/sungho_500x500.jpg" title="Title #22">
								<img src="../image/sungho_75x75.jpg" alt="Title #22" />
							</a>
							
						</li>
 
						<li>
							<a class="thumb" href="../image/sungu_500x500.jpg" title="Title #23">
								<img src="../image/sungu_75x75.jpg" alt="Title #23" />
							</a>
							
						</li>
					</ul>
				</div>
				<div style="clear: both;"></div>
			</div>
		</div>
		<script type="text/javascript">
			jQuery(document).ready(function($) {
				$('div.navigation').css({'width' : '300px', 'float' : 'left'});
				$('div.content').css('display', 'block');
 
				var onMouseOutOpacity = 0.67;
				$('#thumbs ul.thumbs li').opacityrollover({
					mouseOutOpacity:   onMouseOutOpacity,
					mouseOverOpacity:  1.0,
					fadeSpeed:         'fast',
					exemptionSelector: '.selected'
				});
				
				var gallery = $('#thumbs').galleriffic({
					delay:                     2500,
					numThumbs:                 15,
					preloadAhead:              10,
					enableTopPager:            true,
					enableBottomPager:         true,
					maxPagesToShow:            7,
					imageContainerSel:         '#slideshow',
					controlsContainerSel:      '#controls',
					captionContainerSel:       '#caption',
					loadingContainerSel:       '#loading',
					renderSSControls:          true,
					renderNavControls:         true,
					playLinkText:              'Play Slideshow',
					pauseLinkText:             'Pause Slideshow',
					prevLinkText:              '&lsaquo; Previous Photo',
					nextLinkText:              'Next Photo &rsaquo;',
					nextPageLinkText:          'Next &rsaquo;',
					prevPageLinkText:          '&lsaquo; Prev',
					enableHistory:             false,
					autoStart:                 false,
					syncTransitions:           true,
					defaultTransitionDuration: 900,
					onSlideChange:             function(prevIndex, nextIndex) {
						this.find('ul.thumbs').children()
							.eq(prevIndex).fadeTo('fast', onMouseOutOpacity).end()
							.eq(nextIndex).fadeTo('fast', 1.0);
					},
					onPageTransitionOut:       function(callback) {
						this.fadeTo('fast', 0.0, callback);
					},
					onPageTransitionIn:        function() {
						this.fadeTo('fast', 1.0);
					}
				});
			});
		</script>
<!-- 게시판 -->

<!-- 푸터들어가는 곳 -->
<br><br><br>
<jsp:include page="../include/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</body>
</html>