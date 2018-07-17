<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <base href="<%=basePath%>">
		<title>商品信息</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="Free Style Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
		Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
		
		<link href="css/product_bootstrap.css" rel="stylesheet" type="text/css" media="all" />
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="js/jquery.min.js" type="text/javascript"></script>
		<!-- Custom Theme files -->
		<!--theme-style-->
		<link href="css/product_style.css" rel="stylesheet" type="text/css" media="all" />
	
		<script type="application/x-javascript"> 
		addEventListener("load", function() { 
			setTimeout(hideURLbar, 0); 
			}, false); 
			function hideURLbar(){ 
			window.scrollTo(0,1); } 
		</script>
		
		<link 
		href='http://fonts.useso.com/css?family=Alegreya+Sans+SC:100,300,400,500,700,800,900,100italic,300italic,400italic,500italic,700italic,800italic,900italic' 
		rel='stylesheet' type='text/css'>
		<link href='http://fonts.useso.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
		<!--//fonts-->
		<script type="text/javascript" src="js/move-top.js"></script>
		<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
		<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
		</script>
		<!-- start menu -->
		<link href="css/product_memenu.css" rel="stylesheet" type="text/css" media="all" />
		<script type="text/javascript" src="js/memenu.js"></script>
		<script>$(document).ready(function(){$(".memenu").memenu();});</script>
		
		<script type="text/javascript">
			//编辑购物车商品数量
			function show(arg){
				if(arg=="add"){
					$("#number").val(parseInt($("#number").val())+1);
				}else{
					if($("#number").val()>1){
						$("#number").val(parseInt($("#number").val())-1);
					}
				}
			}
		</script>
		
		<script type="text/javascript">
			//查找商品
			function searchInfo(){		
				var url="http://localhost:8085/exp1/";
				var inputvalue=$("input[name='search']").val();
				url=url+"servlet/GetProductInfo?flag=ALL&search="+inputvalue;
				window.location.href=url;
			}
		</script>
		
	</head>
<body>
<!--top-header-->
<div class="top-header">
		<div class="container">
			<div class="top-header-main">
				<div class="col-md-4 top-header-left">
					<div class="search-bar">
						<input type="text" name="search" value="Search" onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = 'Search';}">
						<input type="button" value="" onclick="searchInfo()">
					</div>
				</div>
				<div class="col-md-4 top-header-middle">
					<img src="img/logo-4.png" alt="" />
				</div>
				<div class="col-md-4 top-header-right">
					<div class="cart box_1">
						<h3>
							<div>您好,
								<c:choose>
									<c:when test="${not empty username}">
										<a href="servlet/GetUserInfo" class="username"><c:out value="${username}"></c:out></a>&nbsp;
										<a href="servlet/QuitUserServlet?condition=quit" class="quit">退出</a>
									</c:when>
									<c:otherwise>
										<a href="<%=basePath%>" class="quit">请登录</a>
									</c:otherwise>
								</c:choose>
							</a>
							</div>
						</h3>
						<a href="servlet/ViewCartInfo">
							<h3>
								<div class="total">
									<span class="simpleCart_total">我的购物车</span>
								</div>
								<img src="img/cart-1.png" alt="" />
							</h3>
						</a>
						<a href="servlet/ViewFavoritesInfo">
							<h3>
								<div class="favorites">
									<span class="simpleCart_total">我的收藏夹</span>
								</div>
								<img src="" alt="" />
							</h3>
						</a>	
						<p>
							<a href="servlet/DeleteCartInfo?delete_id=ALL"
								class="simpleCart_empty" onclick="return clear_cart();">清空购物车</a>		<!-- onclick与href冒泡执行,onclick返回false则阻碍href跳转 -->
						</p>
						<p>
							<a href="servlet/DeleteFavoritesInfo?delete_id=ALL"
								class="simpleCart_empty" onclick="return clear_favorites();">清空收藏夹</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--top-header-->
	<!--bottom-header-->
	<div class="header-bottom">
		<div class="container">
			<div class="top-nav">
				<ul class="memenu skyblue">
					<li class="active"><a href="servlet/GetProductInfo?flag=ALL">Home</a></li>
					<li class="grid"><a href="#">News</a></li>
					<li class="grid"><a href="#">China League</a>
						<div class="mepanel" style="left:38.5%">
							<div class="row">
								<div class="col1 me-one">
									<ul>
										<li><a href="products.html">Women's League</a></li>
										<li><a href="products.html">Men's League</a></li>
									</ul>
								</div>
							</div>
						</div></li>
					<li class="grid"><a href="#">Volleyball</a>
						<div class="mepanel" style="left:52%">
							<div class="row">
								<div class="col1 me-one">
									<ul>
										<li><a href="products.html">Female Volleyball</a></li>
										<li><a href="products.html">Male Volleyball</a></li>
										<li><a href="products.html">Beach Volleyball</a></li>
										<li><a href="products.html">Mass Volleyball</a></li>
									</ul>
								</div>
							</div>
						</div></li>
					<li class="grid"><a href="#">Contact</a></li>
					<li class="grid"><a href="video.jsp">Video</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
<!--bottom-header--> 
<!--start-breadcrumbs-->
<div class="breadcrumbs">
  <div class="container">
    <div class="breadcrumbs-main">
      <ol class="breadcrumb">
        <li>Home</li>
        <li class="active">Product Information</li>
      </ol>
    </div>
  </div>
</div>
<!--end-breadcrumbs--> 
<!--start-single-->
<div class="single contact">
	<div class="container">
    <div class="single-main">
	<div class="col-md-9 single-main-left">
        <div class="sngl-top">
			<div class="col-md-5 single-top-left">
            <div class="flexslider">
            	<ul class="slides">
                	<li data-thumb="img/product/<c:out value="${viewinfo[0].product_img}"></c:out>"> <img src="img/product/<c:out value="${viewinfo[0].product_img}"></c:out>" /> </li>
                	<li data-thumb="img/product/<c:out value="${viewinfo[0].product_img}"></c:out>"> <img src="img/product/<c:out value="${viewinfo[0].product_img}"></c:out>" /> </li>
                	<li data-thumb="img/product/<c:out value="${viewinfo[0].product_img}"></c:out>"> <img src="img/product/<c:out value="${viewinfo[0].product_img}"></c:out>" /> </li>
                	<li data-thumb="img/product/<c:out value="${viewinfo[0].product_img}"></c:out>"> <img src="img/product/<c:out value="${viewinfo[0].product_img}"></c:out>" /> </li>
              	</ul>
            </div>
            <!-- FlexSlider --> 
            <script defer src="js/jquery.flexslider.js"></script>
            <link rel="stylesheet" href="css/product_flexslider.css" type="text/css" media="screen" />
			<script>
			// Can also be used with $(document).ready()
			$(window).load(function() {
			  $('.flexslider').flexslider({
				animation: "slide",
				controlNav: "thumbnails"
			  });
			});
			</script>
         	</div>
         	<c:forEach items="${viewinfo}" var="post" varStatus="status">
         		<form action="servlet/InsertToCart" id="cart_form">
		            <div class="col-md-7 single-top-right">
		            <div class="details-left-info simpleCart_shelfItem">
						<h3>${post.product_name}</h3>
						<p class="availability">Availability: <span class="color">In stock</span></p>
		                <div class="price_single"> <span class="reducedfrom">￥${post.old_price}</span> <span class="actual item_price">￥${post.new_price}</span> </div>
		                <h2 class="quick">Quick Overview:</h2>
		                <p class="quick_desc">${post.product_info}</p>
		                <ul class="product-colors">
		                	<h3>available Colors ::</h3>
		                	<li><a class="color1" href="#"><span> </span></a></li>
		                	<li><a class="color2" href="#"><span> </span></a></li>
		                	<li><a class="color3" href="#"><span> </span></a></li>
		                	<li><a class="color4" href="#"><span> </span></a></li>
		                	<li><a class="color5" href="#"><span> </span></a></li>
		                	<li><a class="color6" href="#"><span> </span></a></li>
		                	<li><a class="color7" href="#"><span> </span></a></li>
		                	<li><a class="color8" href="#"><span> </span></a></li>
		                	<div class="clear"> </div>
		              	</ul>
		                <ul class="size">
		                	<h3>Length</h3>
		                	<li><a href="#">7</a></li>
		                	<li><a href="#">6</a></li>
		              	</ul>
		                <div class="quantity_box">
		                <ul class="product-qty">
		                    <span>Quantity:</span>
		                    <button type="button" id="but1" name="but1" onclick="show('sub')">-</button>
							<input type="text" id="number" name="number" value="1" style="width:25px;"/>
							<button type="button" id="but2" name="but2" onclick="show('add')">+</button>
		                </ul>
		              	</div>
		                <div class="single-but item_add">
		                	<input type="submit"  id="sbm" name="sbm" value="add to cart"/>
		              	</div>
		             </div>
	             </form>
	         </c:forEach>
          </div>
          </div>
      </div>
     </div>
  </div>
</div>
<!--end-single--> 
<!--start-footer--> 

<!--end-footer--> 
<!--end-footer-text-->
<div class="footer-text">
		<div class="container">
			<div class="footer-main">
				<p class="footer-class">
					Copyright &copy; 2018 <a href="https://github.com/AnRanbel/Java-Web"
						target="_blank" title="Wang Ying">Wang Ying</a> All Rights Reserved.
				</p>
			</div>
		</div>
		<script type="text/javascript">
			$(document).ready(function() {
		
				$().UItoTop({
					easingType : 'easeOutQuart'
				});
		
			});
		</script>
		<a href="#home" id="toTop" class="scroll" style="display: block;">
			<span id="toTopHover" style="opacity: 1;"> </span>
		</a>
</div>
<!--end-footer-text-->

<!-- 确认清空购物车提示框 -->
	<script type="text/javascript">
		function clear_cart(){
			if(confirm("Clear all cart?")){
				return true;
			}else{
				return false;
			}
		}
	</script>
	
	<!-- 确认清空收藏夹提示框 -->
	<script type="text/javascript">
		function clear_favorites(){
			if(confirm("Clear all favorites?")){
				return true;
			}else{
				return false;
			}
		}
	</script>

</body>
</html>
