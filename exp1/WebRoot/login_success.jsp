<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>成功注册</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="refresh" content="3;url='<%=basePath%>';">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<h3>恭喜您，注册成功！</h3><br />
 	<span class="spinner-text"><h2 id="spinner"></h2></span>
 	
 	<script language="javascript">
  		var count=3;
  		var interval=window.setInterval("timeout()",1000);
  		function timeout(){
  			var s=document.getElementById("spinner");
  			s.innerHTML="页面将在"+count+"秒后跳转到登录页面";
  			if(count>0)
  			{
  				count--;
  			}	
  		}
  	</script>
  </body>
</html>
