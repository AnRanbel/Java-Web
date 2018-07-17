<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>购物车</title>

<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="css/product_bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/product_style.css" rel="stylesheet" type="text/css"
	media="all" />
<script type="application/x-javascript">addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);
	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
<!--fonts-->
<link
	href='http://fonts.useso.com/css?family=Alegreya+Sans+SC:100,300,400,500,700,800,900,100italic,300italic,400italic,500italic,700italic,800italic,900italic'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.useso.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic'
	rel='stylesheet' type='text/css'>
<!--//fonts-->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>
<!-- start menu -->
<!-- <script src="js/simpleCart.min.js"> </script> -->
<link href="css/product_memenu.css" rel="stylesheet" type="text/css"
	media="all" />
<script type="text/javascript" src="js/memenu.js"></script>
<script>$(document).ready(function() {
		$(".memenu").memenu();
	});
</script>


<script type="text/javascript">
	//查找商品
	function searchInfo() {
		var url = "http://localhost:8085/exp1/"; <!--js中不能使用java语句basePath-->
		var inputvalue = $("input[name='search']").val();
		url = url + "servlet/GetProductInfo?flag=ALL&search=" + inputvalue;
		window.location.href = url;
	}
</script>
<!-- <script type="text/javascript" src="js/test.js"></script> -->

</head>
<body>
	<!--top-header-->
	<div class="top-header">
		<div class="container">
			<div class="top-header-main">
				<div class="col-md-4 top-header-left">
					<div class="search-bar">
						<input type="text" name="search" value="Search"
							onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = 'Search';}" /> <input
							type="button" value="" onclick="searchInfo();" />
					</div>
				</div>
				<div class="col-md-4 top-header-middle">
					<img src="img/logo-4.png" alt="" />
				</div>
				<div class="col-md-4 top-header-right">
					<div class="cart box_1">
						<h3>
							<div>
								您好,
								<c:choose>
									<c:when test="${not empty username}">
										<a href="servlet/GetUserInfo" class="username"><c:out
												value="${username}"></c:out></a>&nbsp;
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
						</a> <a href="servlet/ViewFavoritesInfo">
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
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="clearfix"></div>
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
										<li><a href="#">Women's League</a></li>
										<li><a href="#">Men's League</a></li>
									</ul>
								</div>
							</div>
						</div></li>
					<li class="grid"><a href="#">Volleyball</a>
						<div class="mepanel" style="left:52%">
							<div class="row">
								<div class="col1 me-one">
									<ul>
										<li><a href="#">Female Volleyball</a></li>
										<li><a href="#">Male Volleyball</a></li>
										<li><a href="#">Beach Volleyball</a></li>
										<li><a href="#">Mass Volleyball</a></li>
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
					<li class="active">Cart</li>
				</ol>
			</div>
		</div>
	</div>
	<!--end-breadcrumbs-->
	<!--start-ckeckout-->
	<div class="ckeckout">
		<div class="container">
			<div class="ckeckout-top">
				<div class=" cart-items heading">
					<h3>My Shopping Bag</h3>
					<div class="in-check">
						<ul class="unit">
							<li style="margin-left:5.5em;"><span>Item</span></li>
							<li><span>Product Name</span></li>
							<li><span>Unit Price</span></li>
							<li><span>Number</span></li>
							<li><span>Price</span></li>
							<li></li>
							<div class="clearfix"></div>
						</ul>
						<!-- 商品循环开始 -->
						<form action="servlet/BatchDelAndFav" method="post"
							id="del_fav_form">
							<c:forEach items="${cartlist}" var="post" varStatus="status">
								<ul class=" cart-header1">
									<a href="servlet/DeleteCartInfo?delete_id=${post.id}"><div
											class="close0"></div></a>
									<input type="checkbox" name="select_cart"
										value="${post.new_price}" style="zoom:2;" />
									<!-- 仅用于后台传递数据 -->
									<input type="text" class="sel_flag" name="none-selected"
										value="${post.id}" style="display:none;" />
									<input type="text" class="fav_flag" name="none-selected-fav"
										value="${post.product_id}" style="display:none;" />
									<!-- 仅用于后台传递数据 -->
									<li class="ring-in"><a
										href="servlet/ViewProductInfo?id=${post.product_id}"> <img
											src="img/product/${post.product_img}" class="img-responsive"
											alt="找不到图片" style="width:100px;"></a></li>
									<li><span>${post.product_info}</span></li>
									<li class="unite_price"><span class="reducedfrom"
										style="margin-top:1.2em;">￥${post.old_price}</span> <span
										class="actual item_price" style="margin-top:1.2em;">￥${post.new_price}</span>
									</li>
									<li><span>
											<button type="button" id="but1" name="but1">-</button> <input
											type="text" id="number" name="number" value="${post.number}"
											style="width:25px;" />
											<button type="button" id="but2" name="but2">+</button>
									</span></li>
									<li><span class="actual count_price"></span></li>
									<li><a
										href="servlet/InsertToFavorites?product_id=${post.product_id}"
										class="add-cart cart-check">ADD TO FAVORITES</a></li>
									<div class="clearfix"></div>
								</ul>
							</c:forEach>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--end-ckeckout-->
	<!--start-footer-->

	<!--end-footer-->
	<!--end-footer-text-->
	<div class="footer-text">
		<div class="container">
			<div class="footer-main">
				<p class="footer-class">
					Copyright &copy; 2018 <a
						href="https://github.com/AnRanbel/Java-Web" target="_blank"
						title="Wang Ying">Wang Ying</a> All Rights Reserved.
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
	<div class="charge">
		<div class="charge-left">
			<input type="checkbox" id="selectall" name="selectall" /><span>全选</span>
			<span><a href="javascript:void(0);" onclick="batch_delete();">删除</a></span>
			<span><a href="javascript:void(0);"
				onclick="batch_favorites();">移入收藏夹</a></span>
			<!-- <span><a href="javascript:void(0);">分享</a></span> -->
		</div>
		<form action="javascript:void(0)" method="post">
			<div class="charge-right">
				<span>已选商品&nbsp;<strong class="number">0</strong>&nbsp;件
				</span> <span>合计（不含运费）：<span style="margin:0px;color:#ff6600">￥</span><strong
					class="price">0.00</strong></span> <input type="submit" value="结 算" />
			</div>
		</form>
	</div>
	
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

	<!-- 批量收藏 -->
	<script type="text/javascript">
		function batch_favorites() {
			var url = "servlet/BatchDelAndFav?operate=batch_favorites";
			$("#del_fav_form").attr("action", url);
			$("#del_fav_form").submit();
		}
	</script>

	<!-- 批量删除 -->
	<script type="text/javascript">
		function batch_delete() {
			var url = "";
			if ($("input[name='selectall']").is(":checked")) { //如果全选
				url = "servlet/DeleteCartInfo?delete_id=ALL";
			} else {
				url = "servlet/BatchDelAndFav?operate=batch_delete";
			}
			$("#del_fav_form").attr("action", url);
			$("#del_fav_form").submit();
		}
	</script>

	<!-- 更新购物车商品数量和价格-->
	<script type="text/javascript">
		$("button[name='but1']").click(function() {
			//更新数量
			var $input = $(this).next();
			if ($input.val() > 1) {
				$input.val(parseInt($input.val()) - 1);
	
				//更新价格
				var count_price = parseInt($("input[name='select_cart']").val());
				var $parent = $(this).parent();
				var $grandparent = $parent.parent();
				var $count_price = $grandparent.prevAll("input[name='select_cart']");
				var count_price = parseInt($count_price.val());
				var $unite_price = $grandparent.prev();
				var $new_price = $unite_price.children(".item_price").text();
				var new_price = parseInt($new_price.substring(1));
				var $show_price = $grandparent.next().children('.count_price');
				var count_price = count_price - new_price;
				$show_price.text("￥" + count_price);
				$count_price.val(count_price);
	
				if ($count_price.is(":checked")) {
					var price = parseInt($(".charge-right .price").text());
					price = price - new_price;
					$(".charge-right .price").text(price);
				}
			}
		});
	</script>

	<script type="text/javascript">
		$("button[name='but2']").click(function() {
			//更新数量
			var $input = $(this).prev();
			$input.val(parseInt($input.val()) + 1);
	
			//更新价格
			var count_price = parseInt($("input[name='select_cart']").val());
			var $parent = $(this).parent();
			var $grandparent = $parent.parent();
			var $count_price = $grandparent.prevAll("input[name='select_cart']");
			var count_price = parseInt($count_price.val());
			var $unite_price = $grandparent.prev();
			var $new_price = $unite_price.children(".item_price").text();
			var new_price = parseInt($new_price.substring(1));
			var $show_price = $grandparent.next().children('.count_price');
			var count_price = count_price + new_price;
			$show_price.text("￥" + count_price);
			$count_price.val(count_price);
	
			if ($count_price.is(":checked")) {
				var price = parseInt($(".charge-right .price").text());
				price = price + new_price;
				$(".charge-right .price").text(price);
			}
		});
	</script>

	<!-- 计算总价 -->
	<script type="text/javascript">
		$(document).ready(function() {
			var count_number = $(".cart-header1").children("input[name='select_cart']").length;
			var single_price = new Array(count_number);
			var number = new Array(count_number);
			var count_price = new Array(count_number);
			var i = 0;
			var j = 0;
			var k = 0;
			$("input[name='select_cart']").each(function() {
				single_price[i] = parseInt($(this).val());
				i++;
			});
			$("input[name='number']").each(function() {
				number[j] = parseInt($(this).val());
				j++;
			});
	
			$(".count_price").each(function() {
				count_price[k] = single_price[k] * number[k];
				$(this).text("￥" + count_price[k]);
				k++;
			});
			k = 0;
			$("input[name='select_cart']").each(function() {
				$(this).val(count_price[k]);
				k++;
			});
		});
	</script>
	<!-- 单选 -->
	<script type="text/javascript">
		$("input[name='select_cart']").click(function() {
			var number = parseInt($(".charge-right .number").text());
			var count_price = parseInt($(".charge-right .price").text());
			var single_price = this.value;
			single_price = parseInt(single_price);
			if ($(this).is(":checked")) {
				//数量
				number = number + 1;
				$(".charge-right .number").text(number);
				//价格
				count_price += single_price;
				$(".charge-right .price").text(count_price);
				//批量删除或收藏前期准备
				$(this).next().attr("name", "selected");
				$(this).next().next().attr("name","selected-fav");
			} else {
				//数量
				number = number - 1;
				$(".charge-right .number").text(number);
				//价格
				count_price -= single_price;
				$(".charge-right .price").text(count_price);
				//批量删除或收藏前期准备
				$(this).next().attr("name", "none-selected");
				$(this).next().next().attr("name","none-selected-fav");
			}
		});
	</script>

	<!-- 全选or取消 -->
	<script type="text/javascript">
		$("input[name='selectall']").click(function(){
			if($(this).is(":checked")){
				//全选
				$("input[name='select_cart']").prop("checked",true);
				//数量
				var number=$(".cart-header1").children("input[name='select_cart']").length;
				$(".charge-right .number").text(number);
				//价格
				var price=0;
				var substr="";
				$("input[name='select_cart']").each(function(){
					price+=parseInt($(this).val());
				});
				$(".charge-right .price").text(price);
				//批量删除或收藏前期准备
				$(".cart-header1").children(".sel_flag").each(function(){
					$(this).attr("name","selected");
				});
				$(".cart-header1").children(".fav_flag").each(function(){
					$(this).attr("name","selected-fav");
				});
			}else{
				//取消
				$("input[name='select_cart']").prop("checked",false);
				//数量
				$(".charge-right .number").text("0");
				//价格
				$(".charge-right .price").text("0.00");
				//批量删除或收藏前期准备
				$(".cart-header1").children(".sel_flag").each(function(){
					$(this).attr("name","none-selected");
				});
				$(".cart-header1").children(".fav_flag").each(function(){
					$(this).attr("name","none-selected-fav");
				});
			}
		});
	</script>

</body>
</html>
