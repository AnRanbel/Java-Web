<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<!-- 引用java包 -->
<%@ page language="java" import="java.util.*"%>

<!-- 引用JSP标准“核心”标签库(JSTL) -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<base href="<%=basePath%>">

<title>用户信息</title>
<link href="css/product_bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/product_style.css" rel="stylesheet" type="text/css"
	media="all" />

<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

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

<script type='text/javascript'>
	function deleteuser() {
		if(confirm("LOG OFF?")){
			window.location.href = "servlet/QuitUserServlet?condition=delete"; //window.location.href接受相对地址
			return true;
		}else{
			return false;
		}
	}
</script>

<script type="text/javascript">
	//查找商品
	function searchInfo() {
		var url = "http://localhost:8085/exp1/";
		var inputvalue = $("input[name='search']").val();
		url = url + "servlet/GetProductInfo?flag=ALL&search=" + inputvalue;
		window.location.href = url;
	}
</script>

<script type="text/javascript" src="js/login_check.js"></script>
<!-- 检验输入是否正确 -->

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
										<li><a href="#.html">Beach Volleyball</a></li>
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
					<li class="active">Account</li>
				</ol>
			</div>
		</div>
	</div>
	<!--end-breadcrumbs-->
	<!--start-account-->
	<div class="account">
		<div class="container">
			<div class="account-bottom">
				<form action="servlet/ReviseUserInfo" method="post">
					<div class="col-md-6 account-left">
						<div class="account-top heading">
							<h3>
								KEY INFORMATION&nbsp;&nbsp <a class="edit"
									href="javascript:void(0);"
									style="font-weight:normal;font-size:20px;">Edit</a>
							</h3>
						</div>
						<div class="address">
							<span>Username&nbsp;<strong style="color:red;">*</strong></span>
							<input class="main_info" id="username" name="username"
								type="text" value="<c:out value='${userinfo.userName}'></c:out>"
								disabled="disabled" title="username" placeholder="英文字母开头+数字或下划线" />
							<label for="usernameError" id="usernameError"
								style="display:none;color:red;font-size:13px;"></label> 
							<img class="right-icon" id="usernameRight" src="./img/check.png" alt="username-icon" />
						</div>
						<div class="address">
							<span>Email Address&nbsp;<strong style="color:red;">*</strong></span>
							<input class="main_info" id="email" name="email" type="text"
								value="<c:out value='${userinfo.userEmail}'></c:out>"
								disabled="disabled" title="email" placeholder="xxx@xx.com" /> 
							<label for="usernameError" id="emailError"
								style="display:none;color:red;font-size:13px;"></label> 
							<img class="right-icon" id="emailRight" src="./img/check.png" alt="email-icon" />
						</div>
						<div class="address">
							<span>Password&nbsp;<strong style="color:red;">*</strong></span>
							<input class="main_info" id="password" name="pwd" type="text"
								value="<c:out value='${userinfo.userPwd}'></c:out>"
								disabled="disabled" title="password" placeholder="字符长度6~16"/> 
							<label for="usernameError" id="passwordError"
								style="display:none;color:red;font-size:13px;"> </label> 
							<img class="right-icon" id="passwordRight" src="./img/check.png" alt="password-icon" />
						</div>
						<div class="address">
							<span>Telephone&nbsp;<strong style="color:red;">*</strong></span>
							<input class="main_info" id="telephone" name="tel" type="text"
								value="<c:out value='${userinfo.userTel}'></c:out>"
								disabled="disabled" title="telephone" placeholder="11位手机号码"/> 
							<label for="usernameError" id="telephoneError"
								style="display:none;color:red;font-size:13px;"> </label>
							<img class="right-icon" id="telephoneRight" src="./img/check.png" alt="telephone-icon" />
						</div>
						<div class="address">
							<span>Residence Address</span> 
							<input class="main_info" id="address" name="add" type="text"
								value="<c:out value='${userinfo.userAdd}'></c:out>"
								disabled="disabled" />
						</div>
						<div class="address">
							<span>Sex</span> 
							<select class="main_info sex" disabled="disabled" name="sex">
								<option value="other" ${userinfo.userSex=='other'?'selected':''}>请选择</option>
								<option value="Female" ${userinfo.userSex=='Female'?'selected':''}>Female</option>
								<option value="Male" ${userinfo.userSex=='Male'?'selected':''}>Male</option>
							</select>
						</div>
						<div class="address new">
							<input class="main_info submit" id="submit_info" type="submit" value="submit" disabled="disabled" > <!-- 提交按钮的onclick返回false则取消提交 -->
						</div>
					</div>
					<div class="col-md-6 account-right">
						<div class="account-top heading">
							<h3>ADDITIONAL INFORMATION</h3>
						</div>
						<div class="address">
							<span>Real Name</span> 
							<input type="text" class="main_info" name="realname" disabled="disabled" id="realname" value="${userinfo.userRealName}"/>
						</div>
						<div class="address">
							<span>Delivery Address</span> 
							<input type="text" class="main_info" name="deliveryaddress" disabled="disabled" id="deliveryaddress" value="${userinfo.userDeliveryAddress}"/>
						</div>
						<div class="address">
							<span>Birthday</span>
							<input type="date" class="main_info" min="1900-01-01" disabled="disabled" name="birthday" value="${userinfo.userBirthday}"/>
						</div>
						<div class="address">
							<span>Constellation</span> 
							<select class="main_info constellation" name="constellation" disabled="disabled">	<!-- 直接设置selection的 value值不可设置默认值-->
								<option value="other" ${userinfo.userConstellation eq 'other'?'selected':''}>请选择</option>
								<option value="baiyang" ${userinfo.userConstellation eq 'baiyang'?'selected':''}>白羊座</option>
								<option value="jinniu" ${userinfo.userConstellation eq 'jinniu'?'selected':''}>金牛座</option>
								<option value="shuangzi" ${userinfo.userConstellation eq 'shuangzi'?'selected':''}>双子座</option>
								<option value="juxie" ${userinfo.userConstellation eq 'juxie'?'selected':''}>巨蟹座</option>
								<option value="shizi" ${userinfo.userConstellation eq 'shizi'?'selected':''}>狮子座</option>
								<option value="chunv" ${userinfo.userConstellation eq 'chunv'?'selected':''}>处女座</option>
								<option value="tiancheng" ${userinfo.userConstellation eq 'tiancheng'?'selected':''}>天秤座</option>
								<option value="tianxie" ${userinfo.userConstellation eq 'tianxie'?'selected':''}>天蝎座</option>
								<option value="sheshou" ${userinfo.userConstellation eq 'sheshou'?'selected':''}>射手座</option>
								<option value="mojie" ${userinfo.userConstellation eq 'mojie'?'selected':''}>魔羯座</option>
								<option value="shuiping" ${userinfo.userConstellation eq 'shuiping'?'selected':''}>水瓶座</option>
								<option value="shuangyu" ${userinfo.userConstellation eq 'shuangyu'?'selected':''}>双鱼座</option>
							</select>
						</div>
						<div class="address">
							<input type="button" style="margin-left:0px;" value="Log Off" onclick="deleteuser();">
						</div>
					</div>
				</form>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--end-account-->
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
	
	<!-- 设置性别和星座的下拉列表默认值 -->
	<!-- <script type="text/javascript">
		$(document).ready(function(){
			var sex=$(".sex").val();
			var constellation=$(".constellation").val();
			$(".sex option[value=sex]").attr("selected",true);
			$(".constellation option[value=constellation]").attr("selected",true);
		});
	</script> -->
	
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
	
	<!-- 确认提交提示框 -->
	<script type="text/javascript">
		$("#submit_info").click(function(){
			if(confirm("Comfirm modification?")){
				return true;
			}else{
				return false;
			}
		});
	</script>

	<!-- 点击编辑按钮即可编辑 -->
	<script type="text/javascript">
		$(".edit").click(function(){
			$(".main_info").each(function(){
				$(this).removeAttr("disabled");			//去掉disabled属性
			});
		});
	</script>
</body>
<!-- <a href="servlet/GetProductInfo?flag=ALL">进入</a><br > -->
</html>
