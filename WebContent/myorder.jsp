<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/user.css">
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/myOrder.css">
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
					<li><a href="javasript:;" class="active">我的订单</a></li>
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
			<div class="user-order">
				<ul class="order-status">
					<li class="active">所有订单</li>
					<li>待付款</li>
					<li>待发货</li>
					<li>待收货</li>
					<li>待评价</li>
					<li>已完成</li>
				</ul>
				<div class="search">
					订单号：<input type="text" class="txt"> 下单时间：<input type="text"
						class="txt">-<input type="text" class="txt"> 订单状态：<input
						type="text" class="txt1"> <input type="button" value="搜索"
						class="ser">
				</div>
				<div class="shopcart-con">
					<!-- 对订单进行循环 -->
					<c:forEach items="${orderList}" var="order">
						<ul class="cart-tit">
							<li class="tit-meg">订单号：${order.oid}</li>
							<li class="tit-person">收货人：${order.name}</li>
							<li class="tit-time">时间：${order.ordertime}</li>
						</ul>

						<!-- 对订单项进行循环 -->
						<c:forEach items="${order.orderItems}" var="orderItem">
							<div class="cart-form">
							<div class="msg">
								<img src="${pageContext.request.contextPath}/${orderItem.product.pimage}">
								<div class="msg-right">
									<p>${orderItem.product.pname}</p>

									<span>数量：${orderItem.count}</span>
								</div>
							</div>
							<div class="price">￥:${orderItem.subtotal}元</div>
							<div class="pay">
								<a href="javascript:;" class="payorder">${order.state==0?"未付款":"已付款"}</a>
								<c:if test="${order.state==0}">
									<a href="javascript:;">取消订单</a>
								</c:if>			
							</div>
							<div class="delete">
								<a id="del" href="javascript:;">订单详情>></a>
							</div>
						</div>
						</c:forEach>
						
					</c:forEach>




				</div>
			</div>
		</div>
	</div>
	<!-- 引入footer.jsp -->
	<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>
