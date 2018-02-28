<!-- 购物车 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/cart.css">
<script src="js/jquery-1.12.3.js"></script>
<script type="text/javascript">
	/* 添加商品 */
	function addCart() {
		//获得购买的商品的id
		var pid = $("#productId").val();
		location.href = "${pageContext.request.contextPath }/CartServlet?method=addProductToCart&pid="
				+ pid + "&buyNum=1";
	}
	/* 减少商品 */
	function lessCart() {
		//获得购买的商品的id
		var pid = $("#productId").val();
		location.href = "${pageContext.request.contextPath }/CartServlet?method=addProductToCart&pid="
				+ pid + "&buyNum=-1";
	}
	/* 删除单个商品 */
	function delProFromCart(pid) {
		if (confirm("您是否要删除该商品?")) {
			location.href = "${pageContext.request.contextPath }/CartServlet?method=delProFromCart&pid="
					+ pid;
		}
	}
	/* 清空购物车 */
	function clearCart(pid) {
		if (confirm("您是否要清空购物车?")) {
			location.href = "${pageContext.request.contextPath }/CartServlet?method=clearCart";
		}
	}
</script>
</head>
<body>
	<!-- 引入header.jsp -->
	<jsp:include page="/header.jsp"></jsp:include>
	<!-- 判断购物车是否有商品 -->
	<c:if test="${empty cart.cartItems }">
		<div>
			<img alt="" src="${pageContext.request.contextPath }/images/cart_empty.png">
			<a href="${pageContext.request.contextPath}">返回首页</a>
		</div>
	</c:if>
	<c:if test="${!empty cart.cartItems }">
		<div id="process-warpper">
			<div class="process-inner">
				<ul>
					<li class="first active">购物车</li>
					<span class="active"></span>
					<span></span>
					<li>确认订单</li>
					<span></span>
					<span></span>
					<li>提交订单</li>
					<span></span>
					<span></span>
					<li>确认收货</li>
					<span></span>
					<span></span>
					<li>我的评价</li>
				</ul>
			</div>
		</div>
		<div id="cart-warpper">
			<div class="cart-inner">
				<div class="shopcart-con">
					<ul class="cart-tit">
						<li class="tit-check"><input type="checkbox"
							checked="checked" class="check"></li>
						<li class="tit-meg">商品信息</li>
						<li class="tit-price">单价（元）</li>
						<li class="tit-quantity">数量</li>
						<li class="tit-sum">金额（元）</li>
						<li class="tit-action">操作</li>
					</ul>
					<c:forEach items="${cart.cartItems }" var="entry">
						<c:if test="${entry.value.buyNum>0 }">
							<div class="cart-form">
								<div class="checks">
									<input type="checkbox" checked="checked">
								</div>
								<div class="msg">
									<img
										src="${pageContext.request.contextPath }/${entry.value.product.pimage}">
									<div class="msg-right">
										<p>${entry.value.product.pname}</p>
									</div>
								</div>
								<div class="price">￥:${entry.value.product.shop_price}元</div>
								<div class="num">

									<input type="button" id="less" value="-" onclick="lessCart()">
									<input type="text" id="productId"
										value="${entry.value.product.pid }" style="display: none">
									<input type="text" value="${entry.value.buyNum }" id="val">
									<input type="button" id="add" value="+" onclick="addCart()">
								</div>
								<div class="totalprice">￥:${entry.value.subtotal }元</div>
								<div class="delete">
									<!-- 添加点击触发，进行删除商品 -->
									<a id="del" href="javascript:;"
										onclick="delProFromCart('${entry.value.product.pid }')">删除</a>
								</div>
							</div>
						</c:if>

					</c:forEach>



					<div class="cart-bottom">
						<span><a href="javascript:;" onclick="clearCart()">清空购物车</a>
						</span> <span>商品总价<i>${cart.total }</i>元
						</span> <a href="${pageContext.request.contextPath }/OrderServlet?method=submitOrder">去结算</a>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<!-- 引入footer.jsp -->
	<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>
