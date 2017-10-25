<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">

<title>未来钟塔商城</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/login.css" />
<link rel="stylesheet" type="text/css" href="css/common.css">
<script src="js/jquery-1.12.3.js"></script>
<!-- <script src="js/login.js"></script> -->
<script type="text/javascript">
	/* 刷新验证码 */
	function changeCodes() {
		var img = document.getElementsByTagName("img")[1];
		img.src = "/FutureShop/UserServlet?method=checkCode&r=" + Math.random();
	}
</script>
</head>
<body>
	<!-- 引入header.jsp -->
	<jsp:include page="/header.jsp"></jsp:include>
	<div id="login-warpper">
		<div class="login-inner">
			<div class="login-left"></div>
			<div class="login-right">
				<div class="user">
					<span>会员登录</span><i></i>
				</div>
				<form action="${pageContext.request.contextPath}/UserServlet?method=login"
					method="post">
					<div class="item">
						登录名:<input type="text" placeholder="请输入登录名" id="dlm" name="username">
					</div>
					<div class="item">
						密码:<input type="password" placeholder="请输入密码" id="mm" name="password">
					</div>
					<div class="item">
						验证码:<input type="text" id="yzm" name=logincode>
						<!-- <input type="button" value="cbky" id="btn">  -->
						<img src="/FutureShop/UserServlet?method=checkCode" value="cbky"
							onclick="changeCodes()" id="btn"> <a
							href="javascript:changeCodes()" id="change">看不清?换一张</a>
					</div>
					<input type="submit" class="btn-img" value="登录" id="button">
					<div class="font">
						<!-- <div id="toast"></div> -->
						<div id="toast"><span style="color:red">${loginInfo }</span></div>
						<a href="register.jsp" class="free">免费注册</a>
					</div>
					<div class="three">
						第三方登录:
						<ul>
							<li><i class="qq"></i><a href="javascript:;">QQ登录</a></li>
							<li><i class="vx"></i><a href="javascript:;">微信登录</a></li>
							<li class="nor"><i class="zfb"></i><a href="javascript:;">支付宝</a></li>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 引入footer.jsp -->
	<jsp:include page="/footer.jsp"></jsp:include>

</body>
</html>
