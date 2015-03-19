<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir="ltr" lang="en-US">

<head>
<link rel="shortcut icon" href="img\logo\MyFoodMap icon.ico" />

<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<!-- Document Title
============================================= -->
<title>frontage | java</title>

    <!-- Stylesheets
    ============================================= -->
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="css/style.css" type="text/css" />
    <link rel="stylesheet" href="css/dark.css" type="text/css" />
    <link rel="stylesheet" href="css/font-icons.css" type="text/css" />
    <link rel="stylesheet" href="css/animate.css" type="text/css" />
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />

    <link rel="stylesheet" href="css/responsive.css" type="text/css" />
    
    <style type="text/css">
		.total {
		font-size: 42px;
		font-weight: 600;
		font-family: 'Raleway', sans-serif;
		}		
	</style>
    
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <!--[if lt IE 9]>
        <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->

    <!-- External JavaScripts
    ============================================= -->
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/plugins.js"></script>

    
</head>


<body class="stretched">

        <!-- Top Bar
        ============================================= -->
        <div id="top-bar">

            <div class="container clearfix">

                <div class="col_half nobottommargin clearfix">

                    <!-- Top Links
                    ============================================= -->
                    <div class="top-links">
                        <ul>
                            <li><a href="frontpage.jsp">Home</a></li>

                            <li>
                                <span id="login_y" style="display:${login_y}">
                                        <span id="username">
                                            <b>${name}&nbsp;</b>
                                        </span>
                                &nbsp;您好！&nbsp;
                                <a href="Validateout.do">登出</a>&nbsp;&nbsp;
                                </span>
                            </li>

                            <li>
                                <span id="login_n" style="display:${login_n}">
                                &nbsp;&nbsp;&nbsp;<a href="login.jsp">登入</a>&nbsp;&nbsp;&nbsp;
                                    <div class="top-link-section">
                                        <form id="top-login" role="form">
                                            <div class="input-group" id="top-login-username">
                                                <span class="input-group-addon"><i class="icon-user"></i></span>
                                                <input type="email" class="form-control" placeholder="Email address" required="">
                                            </div>
                                            <div class="input-group" id="top-login-password">
                                                <span class="input-group-addon"><i class="icon-key"></i></span>
                                                <input type="password" class="form-control" placeholder="Password" required="">
                                            </div>
                                            <label class="checkbox">
                                              <input type="checkbox" value="remember-me"> Remember me
                                            </label>
                                            <button class="btn btn-danger btn-block" type="submit">Sign in</button>
                                        </form>
                                    </div>
                                </span>
                            </li>

                            <li><a href="register.jsp" style="display:${login_n}">註冊會員</a></li>

                            <li><a href="revise.jsp" style="display:${login_y}">修改會員資料</a></li>

                        </ul>
                    </div><!-- .top-links end -->

                </div>

                <div class="col_half fright col_last clearfix nobottommargin">

                    <!-- Top Social
                    ============================================= -->
                    <div id="top-social">
                        <ul>
                            <li><a href="#" class="si-facebook"><span class="ts-icon"><i class="icon-facebook"></i></span><span class="ts-text">Facebook</span></a></li>
                            <li><a href="#" class="si-twitter"><span class="ts-icon"><i class="icon-twitter"></i></span><span class="ts-text">Twitter</span></a></li>
                            <li><a href="#" class="si-dribbble"><span class="ts-icon"><i class="icon-dribbble"></i></span><span class="ts-text">Dribbble</span></a></li>
                            <li><a href="#" class="si-github"><span class="ts-icon"><i class="icon-github-circled"></i></span><span class="ts-text">Github</span></a></li>
                            <li><a href="#" class="si-pinterest"><span class="ts-icon"><i class="icon-pinterest"></i></span><span class="ts-text">Pinterest</span></a></li>
                            <li><a href="#" class="si-instagram"><span class="ts-icon"><i class="icon-instagram2"></i></span><span class="ts-text">Instagram</span></a></li>
                            <li><a href="tel:+91.11.85412542" class="si-call"><span class="ts-icon"><i class="icon-call"></i></span><span class="ts-text">+91.11.85412542</span></a></li>
                            <li><a href="mailto:alex@handsome.com" class="si-email3"><span class="ts-icon"><i class="icon-envelope-alt"></i></span><span class="ts-text">alex@handsome.com</span></a></li>
                        </ul>
                    </div><!-- #top-social end -->

                </div>

            </div>

        </div><!-- #top-bar end -->
	
    <!-- Document Wrapper
    ============================================= -->
    <div id="wrapper" class="clearfix">

        <!-- Header
        ============================================= -->
        <header id="header" class="transparent-header full-header" data-sticky-class="not-dark">

            <div id="header-wrap">

                <div class="container clearfix">

                    <div id="primary-menu-trigger"><i class="icon-reorder"></i></div>
                    
                    <!-- Logo
                    ============================================= -->
                    <div id="logo">
                    
                        <a href="frontpage.jsp" class="standard-logo" data-dark-logo="img/logo/Logo2.png"><img src="img/logo/Logo2.png" alt="MyFoodMap Logo"></a>
                        <a href="frontpage.jsp" class="retina-logo" data-dark-logo="img/logo/Logo2.png"><img src="img/logo/Logo2.png" alt="MyFoodMap Logo"></a>
                    </div><!-- #logo end -->

                    <!-- Primary Navigation
                    ============================================= -->
                    <nav id="primary-menu" class="dark">

                        <ul>
                            <li class="current"><a href="frontpage.jsp"><div  style="color:gray;">首頁</div></a></li>
                            <li><a href="search.jsp"><div  style="color:gray;">餐廳查詢</div></a></li>
                            <li class="mega-menu"><a href="recommend.jsp"><div  style="color:gray;">餐廳推薦</div></a></li>
                            <li class="mega-menu"><a href="foodmymap.jsp"><div  style="color:gray;">個人地圖</div></a></li>
                        </ul>

                    </nav><!-- #primary-menu end -->

                </div>

            </div>

        </header><!-- #header end -->

        <section id="slider" class="slider-parallax swiper_wrapper full-screen clearfix">

            <div class="swiper-container swiper-parent">
                <div class="swiper-wrapper">
                    <div class="swiper-slide dark" style="background-image: url('img/bg/bg_m3.jpg');">
                        <div class="container clearfix">
                            <div class="slider-caption slider-caption-center">
                                <h2 data-caption-animate="fadeInUp">Welcome to MyFoodMap</h2>
                                <p data-caption-animate="fadeInUp" data-caption-delay="200">enjoy what you need for your delicious food. Choose from a wide range of resturants &amp; simply put them on your own list.</p>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide dark">
                        <div class="container clearfix">
                            <div class="slider-caption slider-caption-center">
                                <h2 data-caption-animate="fadeInUp">The most delicious</h2>
                                <p data-caption-animate="fadeInUp" data-caption-delay="200">與您的至親 &amp; 最愛 一同享受最棒的美食吧. 生活在都市叢林中的一項小確幸-美食饗宴的感動.</p>
                            </div>
                        </div>
                        <div class="video-wrap">
                            <video poster="images/videos/explore-poster.jpg" preload="auto" loop autoplay muted>
                                <source src='images/videos/explore.mp4' type='video/mp4' />
                                <source src='images/videos/explore.webm' type='video/webm' />
                            </video>
                            <div class="video-overlay" style="background-color: rgba(0,0,0,0.55);"></div>
                        </div>
                    </div>
                    <div class="swiper-slide" style="background-image: url('images/slider/swiper/3.jpg'); background-position: center top;">
                        <div class="container clearfix">
                            <div class="slider-caption">
                                <h2 data-caption-animate="fadeInUp">Great Performance</h2>
                                <p data-caption-animate="fadeInUp" data-caption-delay="200">You'll be surprised to see the Final Results of your Creation &amp; would crave for more.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="slider-arrow-left"><i class="icon-angle-left"></i></div>
                <div id="slider-arrow-right"><i class="icon-angle-right"></i></div>
            </div>

            <script>
                jQuery(document).ready(function($){
                    var swiperSlider = new Swiper('.swiper-parent',{
                        paginationClickable: false,
                        slidesPerView: 1,
                        grabCursor: true,
                        loop: true,
                        onSwiperCreated: function(swiper){
                            $('[data-caption-animate]').each(function(){
                                var $toAnimateElement = $(this);
                                var toAnimateDelay = $(this).attr('data-caption-delay');
                                var toAnimateDelayTime = 0;
                                if( toAnimateDelay ) { toAnimateDelayTime = Number( toAnimateDelay ) + 750; } else { toAnimateDelayTime = 750; }
                                if( !$toAnimateElement.hasClass('animated') ) {
                                    $toAnimateElement.addClass('not-animated');
                                    var elementAnimation = $toAnimateElement.attr('data-caption-animate');
                                    setTimeout(function() {
                                        $toAnimateElement.removeClass('not-animated').addClass( elementAnimation + ' animated');
                                    }, toAnimateDelayTime);
                                }
                            });
                            SEMICOLON.slider.swiperSliderMenu();
                        },
                        onSlideChangeStart: function(swiper){
                            $('[data-caption-animate]').each(function(){
                                var $toAnimateElement = $(this);
                                var elementAnimation = $toAnimateElement.attr('data-caption-animate');
                                $toAnimateElement.removeClass('animated').removeClass(elementAnimation).addClass('not-animated');
                            });
                            SEMICOLON.slider.swiperSliderMenu();
                        },
                        onSlideChangeEnd: function(swiper){
                            $('#slider').find('.swiper-slide').each(function(){
                                if($(this).find('video').length > 0) { $(this).find('video').get(0).pause(); }
                                if($(this).find('.yt-bg-player').length > 0) { $(this).find('.yt-bg-player').pauseYTP(); }
                            });
                            $('#slider').find('.swiper-slide:not(".swiper-slide-active")').each(function(){
                                if($(this).find('video').length > 0) {
                                    if($(this).find('video').get(0).currentTime != 0 ) $(this).find('video').get(0).currentTime = 0;
                                }
                                if($(this).find('.yt-bg-player').length > 0) {
                                    $(this).find('.yt-bg-player').getPlayer().seekTo( $(this).find('.yt-bg-player').attr('data-start') );
                                }
                            });
                            if( $('#slider').find('.swiper-slide.swiper-slide-active').find('video').length > 0 ) { $('#slider').find('.swiper-slide.swiper-slide-active').find('video').get(0).play(); }
                            if( $('#slider').find('.swiper-slide.swiper-slide-active').find('.yt-bg-player').length > 0 ) { $('#slider').find('.swiper-slide.swiper-slide-active').find('.yt-bg-player').playYTP(); }

                            $('#slider .swiper-slide.swiper-slide-active [data-caption-animate]').each(function(){
                                var $toAnimateElement = $(this);
                                var toAnimateDelay = $(this).attr('data-caption-delay');
                                var toAnimateDelayTime = 0;
                                if( toAnimateDelay ) { toAnimateDelayTime = Number( toAnimateDelay ) + 300; } else { toAnimateDelayTime = 300; }
                                if( !$toAnimateElement.hasClass('animated') ) {
                                    $toAnimateElement.addClass('not-animated');
                                    var elementAnimation = $toAnimateElement.attr('data-caption-animate');
                                    setTimeout(function() {
                                        $toAnimateElement.removeClass('not-animated').addClass( elementAnimation + ' animated');
                                    }, toAnimateDelayTime);
                                }
                            });
                        }
                    });

                    $('#slider-arrow-left').on('click', function(e){
                        e.preventDefault();
                        swiperSlider.swipePrev();
                    });

                    $('#slider-arrow-right').on('click', function(e){
                        e.preventDefault();
                        swiperSlider.swipeNext();
                    });
                });
            </script>

        </section>

        <!-- Content
        ============================================= -->
        <section id="content">

            <div class="content-wrap">

                <div class="container clearfix">
                    <div class="row clearfix">

                        <div class="col-lg-5">
                            <div class="heading-block topmargin">
                                <h1>Welcome to MyFoodMap.<br>MultiPurpose Template.</h1>
                            </div>
                            <p class="lead">一個令您尋盡各地美食的網站. 建立一個令您嚮往的美食平台 &amp; much more.</p>
                        </div>

                        <div class="col-lg-7">

                            <div style="position: relative; margin-bottom: -60px;" class="ohidden" data-height-lg="426" data-height-md="567" data-height-sm="470" data-height-xs="287" data-height-xxs="183">
                                <img src="img/image/Rsindex.jpg" style="position: absolute; top: 0; left: 0;" data-animate="fadeInUp" data-delay="100" alt="Chrome">
                                <img src="img/image/spoonknife.png" style="position: absolute; top: 10px; left: 0;" data-animate="fadeInUp" data-delay="400" alt="iPad">
                            </div>

                        </div>

                    </div>
                </div>

                <div class="section nobottommargin">
                    <div class="container clear-bottommargin clearfix">

                        <div class="row topmargin-sm clearfix">

                            <div class="col-md-4 bottommargin">
                                <i class="i-plain color i-large icon-line2-screen-desktop inline-block" style="margin-bottom: 15px;"></i>
                                <div class="heading-block nobottomborder" style="margin-bottom: 15px;">
                                    <span class="before-heading">Scalable on Devices.</span>
                                    <h4>Responsive &amp; Retina</h4>
                                </div>
                                <p>Employment respond committed meaningful fight against oppression social challenges rural legal aid governance. Meaningful work, implementation, process cooperation, campaign inspire.</p>
                            </div>

                            <div class="col-md-4 bottommargin">
                                <i class="i-plain color i-large icon-line2-energy inline-block" style="margin-bottom: 15px;"></i>
                                <div class="heading-block nobottomborder" style="margin-bottom: 15px;">
                                    <span class="before-heading">Smartly Coded &amp; Maintained.</span>
                                    <h4>Powerful Performance</h4>
                                </div>
                                <p>Medecins du Monde Jane Addams reduce child mortality challenges Ford Foundation. Diversification shifting landscape advocate pathway to a better life rights international. Assessment.</p>
                            </div>

                            <div class="col-md-4 bottommargin">
                                <i class="i-plain color i-large icon-line2-equalizer inline-block" style="margin-bottom: 15px;"></i>
                                <div class="heading-block nobottomborder" style="margin-bottom: 15px;">
                                    <span class="before-heading">Flexible &amp; Customizable.</span>
                                    <h4>Truly Multi-Purpose</h4>
                                </div>
                                <p>Democracy inspire breakthroughs, Rosa Parks; inspiration raise awareness natural resources. Governance impact; transformative donation philanthropy, respect reproductive.</p>
                            </div>

                        </div>

                    </div>
                </div>

            </div>

        </section><!-- #content end -->




<!-- Footer
        ============================================= -->
        <footer id="footer" class="dark">

            <div class="container">

                <!-- Footer Widgets
                ============================================= -->
                <div class="footer-widgets-wrap clearfix">

                    <div class="col_two_third">

                        <div class="col_one_third">

                            <div class="widget clearfix">

                                <p>我們堅持 <strong>美味</strong>, <strong>簡單</strong> &amp; <strong>輕鬆</strong> 的享用餐點.</p>

                                <div style="background: url('images/world-map.png') no-repeat center center; background-size: 100%;">
                                    <address>
                                        <strong>主辦單位:</strong><br>
                                        		基河校區：臺北市基河路 130 號 3 樓 <br>
                                       		              台北校區：臺北市中山北路五段 250 號 電話：02-2882-4564<br>
                                    </address>
                                    <abbr title="Phone Number"><strong>Phone:</strong></abbr> 電話：02-2882-4564<br>
                                    <abbr title="Fax"><strong>Fax:</strong></abbr> 傳真:(02)28891626.<br>
                                    <abbr title="Email Address"><strong>Email:</strong></abbr> alex@handsome.com
                                </div>

                            </div>

                        </div>


                        <div class="col_one_third col_last">

                            <div class="widget clearfix">
                                <h4>近期報告</h4>

                                <div id="post-list-footer">
                                    <div class="spost clearfix">
                                        <div class="entry-c">
                                            <div class="entry-title">
                                                <h4><a href="#">可設定連結區域一</a></h4>
                                            </div>
                                            <ul class="entry-meta">
                                                <li>11th March 2015</li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="spost clearfix">
                                        <div class="entry-c">
                                            <div class="entry-title">
                                                <h4><a href="#">可設定連結區域二</a></h4>
                                            </div>
                                            <ul class="entry-meta">
                                                <li>11th March 2015</li>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="spost clearfix">
                                        <div class="entry-c">
                                            <div class="entry-title">
                                                <h4><a href="#">可設定連結區域三</a></h4>
                                            </div>
                                            <ul class="entry-meta">
                                                <li>11th March 2015</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>

                    <div class="col_one_third col_last">

                        <div class="widget clearfix" style="margin-bottom: -20px;">

                            <div class="row">

                                <div class="col-md-6 bottommargin-sm">
                                <!--可用特效 <div class="counter counter-small"><span data-from="50" data-to="150654" data-refresh-interval="80" data-speed="3000" data-comma="true"></span></div> -->
                                    <div class="total"><span>${TotalVisit}</span></div>
                                    <h5 class="nobottommargin">總瀏覽人次</h5>
                                </div>

                                <div class="col-md-6 bottommargin-sm">
                                <!--可用特效 <div class="counter counter-small"><span data-from="100" data-to="9527" data-refresh-interval="50" data-speed="2000" data-comma="true"></span></div> -->
                                    <div class="total"><span>${Online}</span></div>
                                    <h5 class="nobottommargin">在線人數</h5>
                                </div>

                            </div>

                        </div>

                        <div class="widget subscribe-widget clearfix">
                            <h5><strong>Subscribe</strong> to Our Newsletter to get Important News, Amazing Offers &amp; Inside Scoops:</h5>
                            <div id="widget-subscribe-form-result" data-notify-type="success" data-notify-msg=""></div>
                            <form id="widget-subscribe-form" action="include/subscribe.php" role="form" method="post" class="nobottommargin">
                                <div class="input-group divcenter">
                                    <span class="input-group-addon"><i class="icon-email2"></i></span>
                                    <input type="email" id="widget-subscribe-form-email" name="widget-subscribe-form-email" class="form-control required email" placeholder="Enter your Email">
                                    <span class="input-group-btn">
                                        <button class="btn btn-success" type="submit">Subscribe</button>
                                    </span>
                                </div>
                            </form>
                            <script type="text/javascript">
                                jQuery("#widget-subscribe-form").validate({
                                    submitHandler: function(form) {
                                        jQuery(form).find('.input-group-addon').find('.icon-email2').removeClass('icon-email2').addClass('icon-line-loader icon-spin');
                                        jQuery(form).ajaxSubmit({
                                            target: '#widget-subscribe-form-result',
                                            success: function() {
                                                jQuery(form).find('.input-group-addon').find('.icon-line-loader').removeClass('icon-line-loader icon-spin').addClass('icon-email2');
                                                jQuery('#widget-subscribe-form').find('.form-control').val('');
                                                jQuery('#widget-subscribe-form-result').attr('data-notify-msg', jQuery('#widget-subscribe-form-result').html()).html('');
                                                SEMICOLON.widget.notifications(jQuery('#widget-subscribe-form-result'));
                                            }
                                        });
                                    }
                                });
                            </script>
                        </div>

                        <div class="widget clearfix" style="margin-bottom: -20px;">

                            <div class="row">

                                <div class="col-md-6 clearfix bottommargin-sm">
                                    <a href="#" class="social-icon si-dark si-colored si-facebook nobottommargin" style="margin-right: 10px;">
                                        <i class="icon-facebook"></i>
                                        <i class="icon-facebook"></i>
                                    </a>
                                    <a href="#"><small style="display: block; margin-top: 3px;"><strong>Like us</strong><br>on Facebook</small></a>
                                </div>
                                <div class="col-md-6 clearfix">
                                    <a href="#" class="social-icon si-dark si-colored si-rss nobottommargin" style="margin-right: 10px;">
                                        <i class="icon-rss"></i>
                                        <i class="icon-rss"></i>
                                    </a>
                                    <a href="#"><small style="display: block; margin-top: 3px;"><strong>Subscribe</strong><br>to RSS Feeds</small></a>
                                </div>

                            </div>

                        </div>

                    </div>

                </div><!-- .footer-widgets-wrap end -->

            </div>

            <!-- Copyrights
            ============================================= -->
            <div id="copyrights">

                <div class="container clearfix">

                    <div class="col_half">
                        Copyrights &copy; 2015 All Rights Reserved by Onion.<br>
                        <div class="copyright-links"><a href="#">Terms of Use</a> / <a href="#">Privacy Policy</a></div>
                    </div>

                    <div class="col_half col_last tright">
                        <div class="fright clearfix">
                            <a href="#" class="social-icon si-small si-borderless si-facebook">
                                <i class="icon-facebook"></i>
                                <i class="icon-facebook"></i>
                            </a>

                            <a href="#" class="social-icon si-small si-borderless si-twitter">
                                <i class="icon-twitter"></i>
                                <i class="icon-twitter"></i>
                            </a>

                            <a href="#" class="social-icon si-small si-borderless si-gplus">
                                <i class="icon-gplus"></i>
                                <i class="icon-gplus"></i>
                            </a>

                            <a href="#" class="social-icon si-small si-borderless si-pinterest">
                                <i class="icon-pinterest"></i>
                                <i class="icon-pinterest"></i>
                            </a>

                            <a href="#" class="social-icon si-small si-borderless si-vimeo">
                                <i class="icon-vimeo"></i>
                                <i class="icon-vimeo"></i>
                            </a>

                            <a href="#" class="social-icon si-small si-borderless si-github">
                                <i class="icon-github"></i>
                                <i class="icon-github"></i>
                            </a>

                            <a href="#" class="social-icon si-small si-borderless si-yahoo">
                                <i class="icon-yahoo"></i>
                                <i class="icon-yahoo"></i>
                            </a>

                            <a href="#" class="social-icon si-small si-borderless si-linkedin">
                                <i class="icon-linkedin"></i>
                                <i class="icon-linkedin"></i>
                            </a>
                        </div>

                        <div class="clear"></div>

                        <i class="icon-envelope2"></i> alex@handsome.com <span class="middot">&middot;</span> <i class="icon-headphones"></i> (香港)-3345678 <span class="middot">&middot;</span> <i class="icon-skype2"></i> OnionOnSkype
                    </div>

                </div>

            </div><!-- #copyrights end -->

        </footer><!-- #footer end -->

    </div><!-- #wrapper end -->

    <!-- Go To Top
    ============================================= -->
    <div id="gotoTop" class="icon-angle-up"></div>

    <!-- Footer Scripts
    ============================================= -->
    <script type="text/javascript" src="js/functions.js"></script>

</body>
</html>