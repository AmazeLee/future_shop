<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/user.css">
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/cart.css">
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
					<li><a href="javasript:;">修改登录密码</a></li>
				</ul>
			</div>
			<div class="user-right">
				<div class="welcome">
					<img src="images/user/touxiang.jpg">
					<div class="welcome-right">
						<p>您好!冷风吹你,欢迎来到会员中心</p>
						<a href="javasript:;">待付款(<span>5</span>)
						</a> <a href="javasript:;">待发货(<span>2</span>)
						</a> <a href="javasript:;">待收货(<span>3</span>)
						</a> <a href="javasript:;">待评价(<span>3</span>)
						</a> <a href="javasript:;">管理收货地址</a>
					</div>
				</div>
				<div class="allorder">
					<p class="al">全部订单</p>
					<div class="cart-form">
						<div class="msg">
							<img src="images/cart/cart_03.jpg">
							<div class="msg-right">
								<p>爱时达复古塔钟玫瑰钟表欧式石英钟创意 静音挂钟客厅时尚时钟</p>
								<span>尺寸：18英寸</span> <span>颜色:白色</span>
							</div>
						</div>
						<div class="price">￥:359元</div>
						<div class="totalprice">
							<span class="money">订单号：36048624919024651</span>
						</div>
						<div class="delete">
							<a id="del" href="javascript:;">删除</a>
						</div>
					</div>
					<div class="cart-form">
						<div class="msg">
							<img src="images/cart/cart_03.jpg">
							<div class="msg-right">
								<p>爱时达复古塔钟玫瑰钟表欧式石英钟创意 静音挂钟客厅时尚时钟</p>
								<span>尺寸：18英寸</span> <span>颜色:白色</span>
							</div>
						</div>
						<div class="price">￥:359元</div>
						<div class="totalprice">
							<span class="money">订单号：36048624919024651</span>
						</div>
						<div class="delete">
							<a id="del" href="javascript:;">删除</a>
						</div>
					</div>
					<div class="cart-form">
						<div class="msg">
							<img src="images/cart/cart_03.jpg">
							<div class="msg-right">
								<p>爱时达复古塔钟玫瑰钟表欧式石英钟创意 静音挂钟客厅时尚时钟</p>
								<span>尺寸：18英寸</span> <span>颜色:白色</span>
							</div>
						</div>
						<div class="price">￥:359元</div>
						<div class="totalprice">
							<span class="money">订单号：36048624919024651</span>
						</div>
						<div class="delete">
							<a id="del" href="javascript:;">删除</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 引入footer.jsp -->
	<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>
