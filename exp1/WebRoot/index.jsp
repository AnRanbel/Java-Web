<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>VOLLEYBALL</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta name="keywords" content="keyword1,keyword2,keyword3">
<meta name="description" content="This is my page" />


<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,700"
	rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->

<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.css">

<!-- Theme style  -->
<link rel="stylesheet" href="css/style.css">

<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>


<script type="text/javascript" src="js/login.js"></script>

<script type="text/javascript">
	function isSignUp(){
		if($("#usernameError").is(':visible')||$("#passwordError").is(':visible')||$("#confirm-passwordError").is(':visible')||$("#telephoneError").is(':visible')||$("#emailError").is(':visible')){
			alert("请先正确填写信息.");
			return false;
		}else if($("#usernameRight").is(':hidden')||$("#passwordRight").is('hidden')||$("#confirm-passwordRight").is('hidden')||$("#telephoneRight").is('hidden')||$("#emailRight").is('hidden')){
            alert("请先填写信息(*星号为必填项).");
            return false;
		} else{
			return true;
		}
	}
</script>

<script type="text/javascript">
	function isLogin(){
	    if($("#login_username").val()==""||$("#login_password").val()==""){
            alert("请先填写信息.");
            return false;
		}else{
	        return true;
		}
	}
</script>

<script type="text/javascript">
	//登录——绑定回车
    $(document).keydown(function (event) {
        if(event.keyCode==13){
            $("#myloginform").submit();
        }
    });
</script>

<script type="text/javascript">
	//注册——绑定回车
	$(document).keydown(function (event) {
		if (event.keyCode == 13) {
			$("#myform").submit();
		}
	});
</script>

</head>

<body>

	<div class="gtco-loader"></div>

	<div id="page">
		<div class="page-inner">
			<nav class="gtco-nav" role="navigation">
			<div class="gtco-container">
				<div class="row">
					<div class="col-xs-8 text-right menu-1" style="float:right">
						<ul>
							<li><a href="#">News</a></li>
							<li class="has-dropdown"><a href="#">China
									League</a>
								<ul class="dropdown">
									<li><a href="#">Women's League</a></li>
									<li><a href="#">Men's League</a></li>
								</ul></li>
							<li class="has-dropdown"><a href="#">Volleyball</a>
								<ul class="dropdown">
									<li><a href="#">Female Volleyball</a></li>
									<li><a href="#">Male Volleyball</a></li>
									<li><a href="#">Beach Volleyball</a></li>
									<li><a href="#">Mass Volleyball</a></li>
								</ul></li>
							<li><a href="servlet/GetProductInfo?flag=ALL&page=1">Product</a></li>
							<li><a href="#">Contact</a></li>
							<li class="btn-cta"><a href="video.jsp"><span>video</span></a></li>
						</ul>
					</div>
				</div>

			</div>
			</nav> <header id="gtco-header" class="gtco-cover" role="banner"
				style="background-image: url(img/main_background.jpg)">
			<div class="overlay"></div>
			<div class="gtco-container">
				<div class="row">
					<div class="col-md-12 col-md-offset-0 text-left">
						<div class="row row-mt-15em">
							<div class="col-md-7 mt-text animate-box"
								data-animate-effect="fadeInUp">
								<span class="intro-text-small">Welcome to VOLLEYBALL CLUB</span>
								<h1>Hello~ Welcome to VOLLEYBALL CLUB</h1>
							</div>
							<div class="col-md-4 col-md-push-1 animate-box"
								data-animate-effect="fadeInRight">
								<div class="form-wrap">
									<div class="tab">
										<ul class="tab-menu">
											<li class="active gtco-first"><a href="#"
												data-tab="signup">Sign up</a></li>
											<li class="gtco-second"><a href="#" data-tab="login">Login</a></li>
										</ul>
										<div class="tab-content">
											<div class="tab-content-inner active" data-content="signup">
												<form action="servlet/LoginServlet" method="post"
													id="myform" onsubmit="return isSignUp();">
													<div class="row form-group">
														<div class="col-md-12">
															<label for="username">Username</label> <span
																style="color:red;">*</span>
															<div>
																<input type="text" class="form-control inputClass"
																	id="username" name="name" title="username"
																	placeholder="英文字母开头+数字或下划线"/> 
																<label
																	for="usernameError" id="usernameError"
																	style="display:none;color:red;font-size:13px;">
																</label>
																<img class="right-icon" id="usernameRight" src="./img/check.png"  alt="username-icon" />
															</div>
														</div>
													</div>
													<div class="row form-group">
														<div class="col-md-12">
															<label for="Email">Email</label> <span style="color:red;">*</span>
															<div>
																<input type="text" class="form-control inputClass"
																	id="email" name="email" title="email"
																	placeholder="xxx@xx.com"/> 
																<label
																	for="usernameError" id="emailError"
																	style="display:none;color:red;font-size:13px;">
																</label>
																<img class="right-icon" id="emailRight" src="./img/check.png"  alt="email-icon" />
															</div>
														</div>
													</div>
													<div class="row form-group">
														<div class="col-md-12">
															<label for="password">Password</label> <span
																style="color:red;">*</span>
															<div>
																<input type="password" class="form-control inputClass"
																	id="password" name="pwd" title="password"
																	placeholder="字符长度6~16"/> 
																<label
																	for="usernameError" id="passwordError"
																	style="display:none;color:red;font-size:13px;">
																</label>
																<img class="right-icon" id="passwordRight" src="./img/check.png"  alt="password-icon" />
															</div>
														</div>
													</div>
													<div class="row form-group">
														<div class="col-md-12">
															<label for="confirm-password">Confirm Password</label> <span
																style="color:red;">*</span>
															<div>
																<input type="password" class="form-control inputClass"
																	id="confirm-password" name="pwd2"
																	title="confirm-password" placeholder="字符长度6~16">
																<label for="usernameError" id="confirm-passwordError"
																	style="display:none;color:red;font-size:13px;">
																</label>
																<img class="right-icon" id="confirm-passwordRight" src="./img/check.png"  alt="confirm-password-icon" />
															</div>
														</div>
													</div>
													<div class="row form-group" style="margin-bottom:5px;">
														<div class="col-md-12">
															<label for="Telephone">Telephone</label> <span
																style="color:red;">*</span>
															<div>
																<input type="text" class="form-control inputClass"
																	id="telephone" name="tel" title="telephone"
																	placeholder="11位手机号码"> 
																<label
																	for="usernameError" id="telephoneError"
																	style="display:none;color:red;font-size:13px;">
																</label>
																<img class="right-icon" id="telephoneRight" src="./img/check.png"  alt="telephone-icon" />
															</div>
														</div>
													</div>
													<div class="row form-group" style="margin-bottom:0px;">
														<div class="col-md-12">
															<label for="sex">Sex</label>
															<div class="sex_input">
																<input type="radio" id="sex" name="sex" value="Male" title="sex" />Male
															</div>
															<div class="sex_input">
																<input type="radio" name="sex" value="Female"
																	title="sex" />Female
															</div>
														</div>
													</div>
													<div class="row form-group">
														<div class="col-md-12">
															<label for="address">Address</label>
															<div>
																<input type="text" class="form-control inputClass"
																	id="address" name="add" title="address">
															</div>
														</div>
													</div>

													<div class="row form-group" style="margin-bottom:0px">
														<div class="col-md-12">
															<input type="submit" id="signup_button" class="btn btn-primary"
																value="Sign up">
														</div>
													</div>
												</form>
											</div>

											<div class="tab-content-inner" data-content="login">
												<form action="servlet/ReallyLoginServlet" method="post"
													id="myloginform" onsubmit="return isLogin();">
													<div class="row form-group">
														<div class="col-md-12">
															<label for="username">Username or Email</label>
															<div>
																<input type="text" class="form-control"
																	id="login_username" name="name" title="username">
															</div>
														</div>
													</div>
													<div class="row form-group">
														<div class="col-md-12">
															<label for="password">Password</label>
															<div>
																<input type="password" class="form-control"
																	id="login_password" name="pwd" title="password">
															</div>
														</div>
													</div>

													<div class="row form-group" style="margin-bottom:0px">
														<div class="col-md-12">
															<input type="submit" id="login_button" class="btn btn-primary"
																value="Login">
														</div>
													</div>
												</form>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</header>

		</div>

	</div>


	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="js/jquery.countTo.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>

	<script type="text/javascript" src="js/login_check.js"></script>

</body>
</html>
