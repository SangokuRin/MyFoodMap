<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html dir="ltr" lang="en-US">

<head>
<link rel="shortcut icon" href="img\logo\MyFoodMap icon.ico" />

<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<!-- Document Title
============================================= -->
<title>result | java</title>

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
		#map{
		margin-left:60px;
		height: 100%;
		float:left;
		text-align:left;
		}
		#result{
		overflow-x:hidden;
		overflow-y:auto;	
		overflow:auto;
		width: 34%; 
		height: 100%;
		float:right;
		border-style:solid;
		}
		#resultls{
		padding:0px;
		width: 100%; 
		border-bottom-style:solid
		}
		#classM{
		margin:5px;
		width: 900px; 
		height: 500px;
		}
		table{
		width:100%;
		}
		#rsinfo{
		float:center;
		padding:0;
		margin-right:60px;
		text-align:center;	
		}
		#clear{
		clear:both;
		}
		#endlist{
		list-style-type:none;
		}	
		.endli{
		display: inline;
		}
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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script src="js/jquery.js"></script>
<script type="text/javascript" src="js/plugins.js"></script>
<script src="js/jquery.tinyMap.min.js"></script>
<script src="js/jqmap.js"></script>
<script src="js/json2.js"></script>


<script>

$(document).ready( function() 
{
	
	
	$.ajax({
		
	    url:"CheckVote?RSID=<%= request.getParameter("RSID") %>",
	    type:"GET",
	    async: false,
	    dataType: "JSON",
		
	    success:function(data)
	    {
	    	var dt = new Date();	    	
	    	dt = dt.getFullYear() + "-" + (dt.getMonth()>9?"":"0") +  (dt.getMonth() +  + 1) + "-" + dt.getDate();
    	
	    	//抓取餐廳的資料
	    	var RName = data.rName;
	    	var RAdd = data.rAdd;
	    	var RTel = data.rTel;
	    	var RRuntime = data.rRuntime;
	    	var RMeautime = data.rMeautime;
	    	var RWeb = data.rWeb;
	    	var RInfo = data.rInfo;
	    	var RRank_a = data.rRank_a;
	    	var RRank_n = data.rRank_n;
	    	
	    	var RCoor = data.rCoor;
	    	
	    	var hisran = data.hisran;
	    	var hiseat = data.hiseat;
	    	var hisdate = data.hisdate;
	    	
	    	//更新網頁上的資訊
	    	$('#RName').html(RName);
	    	$('#RAdd').html(RAdd);
	    	$('#RTel').html(RTel);
	    	$('#RRuntime').html(RRuntime);
	    	$('#RMeautime').html(RMeautime);
	    	$('#RWeb').html(RWeb);
	    	$('#RInfo').html(RInfo);
	    	$('#RRank_a').html(RRank_a);
	    	$('#RRank_n').html(RRank_n);
	    	
	    	//將座標指向迷你地圖
	    	$(function() {
	    		$('#map').tinyMap({
	    			center : RCoor,
	    			zoom : 16,
	    			marker:[{
	    		          addr: RAdd,
	    		          text:   "店名：" + RName + "<br>"
	    		          		+ "電話：" + RTel ,
	    		          },{}]
	    		});
	    		
	    	})
	    	

	    	//判斷歷史紀錄
	    	switch(hisran)
	    	{
	    		case 1 :
	    			$("#ran_1").attr("checked",true);
	    			break;
	    		case 2 :
	    			$("#ran_2").attr("checked",true);
	    			break;
	    		case 3 :
	    			$("#ran_3").attr("checked",true);
	    			break;
	    		default :
	    			
	    			break;
	    	}
	    	
	    	//已吃過為1時，將以吃過打勾
	    	if(hiseat == 1){ $("#iseat").attr("checked",true); }
	    	
	    	//無人評分過時，將評分人數修改
	    	if(RRank_n.match("無資料"))
	    	{
	    		$("#RRank_z").html("(尚未有人評分)");
	    	}
	    	
	    	//如果日期為1900-01-01，將日期清空
	    	//時間要求清空時，不顯示歷史日期
	    	if(hisdate.match("1900-01-01"))
	    	{
	    		hisdate = "default";
	    		//DoNothing!
	    	}
	    	else
	    	{
	    		$('#eatT').val(hisdate); 
	    	}	    	
    	
	    	//判斷是否登入	
	    	if(data.islogin == "true")
	    	{
	    		
	    		if(data.isnew == "nv")
	    		{
	    			//沒有紀錄
	    			$('#list_word').css({display: "none"});
	    			$('#list2').css({display: "inline"});
	    			$('#list3').css({display: "none"});
	    			$('#RYouRank').css({display: "none"});
	    		}
	    		else if(data.isnew == "v")
	    		{
	    			//已有紀錄，但是沒評分
	    			$('#list_word').css({display: "none"});
	    			$('#list2').css({display: "none"});
	    			$('#list3').css({display: "inline"});
	    			$('#RYouRank').css({display: "none"});
	    		}
	    		else if(data.isnew == "u")
	    		{
	    			//已有紀錄，已有評分
	    			$('#list_word').css({display: "none"});
	    			$('#list2').css({display: "none"});
	    			$('#list3').css({display: "inline"});
	    			$('#RYouRank').css({display: "inline"});
	    			$('#RYouRank_R').html(hisran);
	    			$('#RToRank').html("更新評分：");
	    		}
	    		else
	    		{
	    			alert("是否評分的錯誤...");
	    		}
	    				    		
	    	}
	    	else if(data.islogin == "false")
	    	{
	    		//沒登入
    			$('#list_word').css({display: "inline"});
    			$('#list2').css({display: "none"});
    			$('#list3').css({display: "none"});
    			$('#RYouRank').css({display: "none"});
    			$('#RToRank').css({display: "none"});
    			$('#RToRank_c').css({display: "none"});
    			$('#iseat_n').css({display: "none"});
    			$('#iseat_t').css({display: "none"});
	    	}
	    	else
	    	{
	    		alert("登入判斷的錯誤...");
	    	}
	    	
	    },
	    
	    error:function(response , xml)
		{
			alert("大問題！");
		},
		
	});
	
//---返回上一頁--------------------------------
	
	$("#list1").click( function(){
		
		window.history.back();
	
	})
	
/*	
 *	votetype:評分類型(n:新增進地圖,nv新增且評分,u更新資料)
 *	ran:評分
 *	iseat:是否吃過
 *	ew:吃過的時間 
 */
	
//---只加入地圖--------------------------------
//---加入且進行評分--------------------------------
	
	$("#list2").click( function(){
		
		var s=0;
		var iseat=0;
				
		if($('#ran_1').prop("checked")){ s=1; }		
		if($('#ran_2').prop("checked")){ s=2; }		
		if($('#ran_3').prop("checked")){ s=3; }		
		if($('#iseat').prop("checked")){ iseat=1; }
				
		$.ajax({
		    url:"RankVote",
		    type:"POST",
		    async: false,
		    dataType: "JSON",
		    	    
		     data: { rsid:<%= request.getParameter("RSID") %>,
		    	 	 votetype:"nv",
		    	 	 ran:s,
		    	 	 iseat:iseat,
					 tw:$('#eatT').val(),		     
		     				},
		     								
		    success:function(data)
		    {
		    	
		    	if(data.islogin == "true")
		    	{
		    		
		    		if(data.isvote == "true")
		    		{
		    			alert("評分建立完成!");
		    			location.reload();
		    		}
		    		else if(data.isvote == "false")
		    		{
		    			alert("評分建立失敗!");
		    		}
		    		else
		    		{
		    			alert("評分建立的錯誤...");
		    		}
		    				    		
		    	}
		    	else if(data.islogin == "false")
		    	{
		    		alert("請先登入會員!");
		    		window.location.href = 'login.jsp';
		    	}
		    	else
		    	{
		    		alert("登入狀態有誤，請重新登入");
		    		window.location.href = 'login.jsp';
		    	}
		    	
		    },
		    error:function(response)
		    {
				alert("新增地圖失敗!?");
		    },
		    
		  });
	
	})
	
//---已加入後，進行更新--------------------------------
	
	$("#list3").click( function(){
			
		var s=0;
		var iseat=0;
				
		if($('#ran_1').prop("checked")){ s=1; }		
		if($('#ran_2').prop("checked")){ s=2; }		
		if($('#ran_3').prop("checked")){ s=3; }		
		if($('#iseat').prop("checked")){ iseat=1; }
				
		$.ajax({
		    url:"RankVote",
		    type:"POST",
		    async: false,
		    dataType: "JSON",
		    	    
		     data: { rsid:<%= request.getParameter("RSID") %>,
		    	 	 votetype:"u",
		    	 	 ran:s,
		    	 	 iseat:iseat,
					 tw:$('#eatT').val(),		     
		     				},
		 
		    success:function(data)
		    {
		    	
		    	if(data.islogin == "true")
		    	{
		    		
		    		if(data.isvote == "true")
		    		{
		    			alert("評分更新完成!");
		    			location.reload();
		    		}
		    		else if(data.isvote == "false")
		    		{
		    			alert("評分更新失敗!");
		    		}
		    		else
		    		{
		    			alert("評分更新的錯誤...");
		    		}
		    				    		
		    	}
		    	else if(data.islogin == "false")
		    	{
		    		alert("請先登入會員!");
		    		window.location.href = 'login.jsp';
		    	}
		    	else
		    	{
		    		alert("登入狀態有誤，請重新登入");
		    		window.location.href = 'login.jsp';
		    	}
		    	
		    },
		    error:function(response)
		    {
				alert("更新資料失敗!?");
		    },
		    
		  });
	
	})
	
	
})


</script>
	
</head>

<body class="stretched">
    	
    <!-- Document Wrapper
    ============================================= -->
    <div id="wrapper" class="clearfix">

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

        <!-- Header
        ============================================= -->
        <header id="header" class="full-header">

            <div id="header-wrap">

                <div class="container clearfix">

                    <div id="primary-menu-trigger"><i class="icon-reorder"></i></div>

                    <!-- Logo
                    ============================================= -->
                    <div id="logo">
                        <a href="index.jsp" class="standard-logo" data-dark-logo="img/logo/Logo2.png"><img src="img/logo/Logo2.png" alt="MyFoodMap Logo"></a>
                        <a href="index.jsp" class="retina-logo" data-dark-logo="img/logo/Logo2.png"><img src="img/logo/Logo2.png" alt="MyFoodMap Logo"></a>
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

        <!-- Page Title
        ============================================= -->
        <section id="page-title"  style="background-image: url('img/bg/bg_m3.jpg');">

            <div class="container clearfix">
                <h1>個人評價</h1>
            </div>

        </section><!-- #page-title end -->

        <!-- Content
        ============================================= -->
        <section id="content">
			           
					<div style="width:100%;height:100%">
				    <div id="map" style="width:40%; height:600px;float:left;" ></div>
				    
				    <div id="rsinfo" style="width:48%; height:100%;float:right;">
				    	<p>餐廳名稱：<span id="RName">(讀取中...)</span></p>
				    	<p>餐廳地址：<span id="RAdd">(讀取中...)</span></p>
				    	<p>餐廳電話：<span id="RTel">(讀取中...)</span></p>
				        <p>營業時間：<span id="RRuntime">(讀取中...)</span></p>
				        <p>最後點餐時間：<span id="RMeautime">(讀取中...)</span></p>
				        <p>餐廳網站：<span id="RWeb">(讀取中...)</span></p>
				        <p>餐廳介紹：<span id="RInfo">(讀取中...)</span></p>
				        <p>餐廳平均分數：<span id="RRank_a">(讀取中...)</span></p>
				        <p>餐廳評比分數：<span id="RRank_n">(讀取中...)</span></p> 
				        <p><span id="RYouRank">你的評比分數：<span id="RYouRank_R">(讀取中...)</span></span></p>
				        <p><span id="RToRank">為餐廳評分：</span>
				            	<span id="RToRank_c">普通<input type="radio" name="ran" id="ran_1" value="1"/>
				    			好<input type="radio" name="ran" id="ran_2" value="2"/>
				    			非常好<input type="radio" name="ran" id="ran_3" value="3"/></span></p>       
				        <p><span id="iseat_n">是否已用餐：<input type="checkbox" name="iseat" id="iseat"/></span></p>
				        <p><span id="iseat_t">用餐時間：<input type="date" name="eatT" id="eatT"/></span></p>
				    
				<!--  <form action="RankVote" method="post" style="background-color: #b0c4de;">
				<ul id="endlist" >

				    <li class="endli"><span id="list_word" style="display: inline">如需評分，請先進行<a href="login.jsp" style="color:#00F;width:100%;">登入</a>才能進行&nbsp;</span></li>
				    <li class="endli"><input type="button" value="回搜尋結果" id="list1"/></li>
				    <li class="endli"><input type="button" value="加入個人地圖" id="list2" style="display: none"/></li>
				    <li class="endli"><input type="button" value="更新個人地圖" id="list3" style="display: none"/></li>
				</ul>
				</form>-->
	</div>		
</div>			

        </section><!-- #content end -->
        
        
        <center>
			<form action="RankVote" method="post" style="background-color: #b0c4de;">
				<ul id="endlist" >

				    <li class="endli"><span id="list_word" style="display: inline">如需評分，請先進行<a href="login.jsp" style="color:#00F;width:100%;">登入</a>才能進行&nbsp;</span></li>
				    <li class="endli"><input type="button" value="回搜尋結果" id="list1"/></li>
				    <li class="endli"><input type="button" value="加入個人地圖" id="list2" style="display: none"/></li>
				    <li class="endli"><input type="button" value="更新個人地圖" id="list3" style="display: none"/></li>
				</ul>
			</form>
		</center>
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