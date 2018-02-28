<!-- 尾部 -->
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

<title>My JSP '1.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/login.css" />
<link rel="stylesheet" type="text/css" href="css/common.css">

</head>
<body>
	<footer id="footer-warpper">
	<div class="footer-inner">
		<div class="footer-top">
			<a href="#"><img src="images/img_46.jpg"></a> <a href="#"><img
				src="images/img_48.jpg"></a> <a href="#"><img
				src="images/img_49.jpg"></a> <a href="#"><img
				src="images/img_50.jpg"></a> <a href="#"><img
				src="images/img_51.jpg"></a> <a href="#"><img
				src="images/img_52.jpg"></a>
		</div>
		<div class="footer-bottom">
			<p>苏ICP备14036959号-6 | 法律声明 | 知识产权 | copyright©2017-2036
				weilai.com 版权所有</p>
		</div>
	</div>
	</footer>

</body>
</html>