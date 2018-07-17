$(document).ready(function() {
	
	$("#login_username").focus(function() {
		$("#login_username").css("background-color", "#FFFFCC");
	});
	
	$("#login_password").focus(function() {
		$("#login_password").css("background-color", "#FFFFCC");
	}); 
	
	$("#address").focus(function() {
		$("#address").css("background-color", "#FFFFCC");
	});
	
	$("#realname").focus(function() {
		$("#realname").css("background-color", "#FFFFCC");
	});
	
	$("#deliveryaddress").focus(function() {
		$("#deliveryaddress").css("background-color", "#FFFFCC");
	});
	
	//username验证
	$("#username").focus(function() {
		$("#username").css("background-color", "#FFFFCC");
	});
	$("#username").blur(function() {
		/*$("#usernameError").show();*/
		var regtitle = /^[a-zA-Z][a-zA-Z0-9_]*$/;
		var uname = $("#username").val();
		$("#username").css("background-color", "white");
		if (uname.length <= 0) {
			$("#usernameRight").hide();
			$("#usernameError").text("请输入用户名");
			$("#usernameError").show();
			/*$("#username").focus();*/
		}else if(!regtitle.test(uname)){
			$("#usernameRight").hide();
			$("#usernameError").text("用户名由英文字母开头+数字或下划线");
			$("#usernameError").show();
		}else {
			$("#usernameRight").show();
			$("#usernameError").hide();
		}
	});
	//password验证
	$("#password").focus(function() {
		$("#password").css("background-color", "#FFFFCC");
	});
	$("#password").blur(function(){
		var upassword = $("#password").val();
		$("#password").css("background-color", "white");
		if (upassword.length > 5 && upassword.length < 17) {
			$("#passwordRight").show();
			$("#passwordError").hide();
			/*$("#password").focus();*/
		} else {
			$("#passwordRight").hide();
			$("#passwordError").text("密码字符长度5~17");
			$("#passwordError").show();
		}
	});
	//password1验证
	$("#confirm-password").focus(function() {
		$("#confirm-password").css("background-color", "#FFFFCC");
	});
	$("#confirm-password").blur(function(){
		var upassword = $("#password").val();
		var upassword1 = $("#confirm-password").val();
		$("#confirm-password").css("background-color", "white");
		if (upassword1.length<=0){
			$("#confirm-passwordRight").hide();
			$("#confirm-passwordError").hide();
		} else if (upassword1 != upassword) {
			$("#confirm-passwordRight").hide();
			$("#confirm-passwordError").text("密码输入不一致");
			$("#confirm-passwordError").show();
			/*$("#confirm-password").focus();*/
		} else {
			$("#confirm-passwordRight").show();
			$("#confirm-passwordError").hide();
		}
	});
	//userphone验证
	$("#telephone").focus(function() {
		$("#telephone").css("background-color", "#FFFFCC");
	});
	$("#telephone").blur(function() {
		var regphone = /^(13[0-9]|15[0-9]|18[0-9]|16[0-9])\d{8}$/;
		var uphone = $("#telephone").val();
		$("#telephone").css("background-color", "white");
		if (uphone.length <= 0) {
			$("#telephoneRight").hide();
			$("#telephoneError").text("请输入手机号");
			$("#telephoneError").show();
			
			/*$("#telephone").focus();*/
		}else if(!regphone.test(uphone)){
			$("#telephoneRight").hide();
			$("#telephoneError").text("手机号输入格式错误");
			$("#telephoneError").show();
		}else {
			$("#telephoneRight").show();
			$("#telephoneError").hide();
		}
	});
	//usereamil验证
	$("#email").focus(function() {
		$("#email").css("background-color", "#FFFFCC");
	});
	$("#email").blur(function() {
		var regemail = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
		var uemail = $("#email").val();
		$("#email").css("background-color", "white");
		if (uemail.length <= 0) {
			$("#emailRight").hide();
			$("#emailError").text("请输入邮箱");
			$("#emailError").show();
			/*$("#email").focus();*/
		}else if(!regemail.test(uemail)){
			$("#emailRight").hide();
			$("#emailError").text("邮箱输入格式:xxx@xx.com");
			$("#emailError").show();
		}else {
			$("#emailRight").show();
			$("#emailError").hide();
		}
	});
});
