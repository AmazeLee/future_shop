<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/user.css">
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/myOrder.css">
<link rel="stylesheet" type="text/css" href="css/psd.css">
<script type="text/javascript" src="js/jquery-1.12.3.js"></script>
</head>
<body>
	<!-- 引入header.jsp -->
	<jsp:include page="/header.jsp"></jsp:include>
	<div id="crumbs-warpper">
		<div class="crumbs-inner">
			<a href="index.html" title="首页">首页</a>
			<code>></code>
			<a href="goods_list.html" title="商品分类">会员中心</a>
		</div>
	</div>
	<div id="user-warpper">
		<div class="user-inner">
			<div class="user-nav">
				<h1>个人中心</h1>
				<ul>
					<li><a href="javasript:;">我的订单</a></li>
					<li><a href="javasript:;">我的收藏</a></li>
					<li><a href="javasript:;">系统消息</a></li>
					<li><a href="javasript:;">待收货</a></li>
					<li><a href="javasript:;">待付款</a></li>
					<li><a href="javasript:;">待评价</a></li>
					<li><a href="javasript:;">已买到的宝贝</a></li>
					<li><a href="javasript:;">管理收货地址</a></li>
				</ul>
				<h1>账户信息</h1>
				<ul>
					<li><a href="javasript:;">个人资料</a></li>
					<li><a href="javasript:;" class="active">修改登录密码</a></li>
				</ul>
			</div>
			<div class="modifypsd">
				<label>修改登录密码：</label><input type="text" class="txt"> <a
					href="javascript">确认修改</a>
			</div>
		</div>
		<!-- 引入footer.jsp -->
		<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>