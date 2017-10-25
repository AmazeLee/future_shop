<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/reset.css">
		<link rel="stylesheet" type="text/css" href="css/cart.css">
		<link rel="stylesheet" type="text/css" href="css/order.css">
		<script type="text/javascript" src="js/jquery-1.12.3.js" ></script>
		<script src="js/cart.js"></script>
		<script type="text/javascript">
		function payOrder(){
			/* //获得选择的地址
			var inputs = $("#inputAddress");
			console.log(inputs);
			for(var i=0;i<inputs.length;i++){
				alert(inputs[i]);
				//alert(inputs[i]);
				console.log(i);
			} */
			var address=document.getElementsByName("address");
            var selectvalue=null;   //  selectvalue为radio中选中的值
           	for(var i=0;i<address.length;i++){
                  if(address[i].checked==true) {
                           selectvalue=address[i].value;
                           break;
                 }  
          }	
		location.href = "${pageContext.request.contextPath}/OrderServlet?method=affirmOrder&add_id="+selectvalue;
		}
		
		</script>
	</head>
	<body>
	<!-- 引入header.jsp -->
	<jsp:include page="/header.jsp"></jsp:include>
		<div id="process-warpper">
			<div class="process-inner">
				<ul>
					<li class="first">购物车</li><span></span>
					<span class="active"></span><li class="active">确认订单</li><span class="active"></span>
					<span></span><li>提交订单</li><span></span>
					<span></span><li>确认收货</li><span></span>
					<span></span><li>我的评价</li>
				</ul>
				</div>
		</div>
		<div id="title-warpper">
			<div class="title-inner">
				<h1>收货地址</h1>
				<ul id="add-list">
					<c:forEach items="${addressList}" var="address">
						<li>
						<p class="always"><i class="flag"></i>姓名：${address.name}<input id="inputAddress" type="radio" value="${address.add_id}" name="address"></p>
						<p class="address"><i class="place"></i>地址：${address.address}</p>
						<p class="call"><i class="phone"></i>电话：${address.phone}</p>
					</li>
					</c:forEach>
					<!-- <li class="mr">
						<p class="always"><i class="flag"></i>姓名：麦客子<input type="radio" name="addresss" checked></p>
						<p class="address"><i class="place"></i>地址：上海市长宁区新华路 街道159-5号</p>
						<p class="call"><i class="phone"></i>电话：15996487542</p>
					</li>
					<li>
						<p class="always"><i class="flag"></i>新增收货地址1<input type="radio" name="addresss"></p>
						<p class="address"><i class="place"></i>地址：上海市长宁区新华路 街道159-5号</p>
						<p class="call"><i class="phone"></i>电话：15996487542</p>
					</li>
					<li>
						<p class="always"><i class="flag"></i>新增收货地址1<input type="radio" name="addresss"></p>
						<p class="address"><i class="place"></i>地址：上海市长宁区新华路 街道159-5号</p>
						<p class="call"><i class="phone"></i>电话：15996487542</p>
					</li> -->
					<li>
						<i class="plus"></i>
						<p class="ad"><a href="#">添加收货地址</a></p>
						
					</li>
				</ul>
			</div>
		</div>
		<div id="cart-warpper">
			<div class="cart-inner">
				<div class="shopcart-con">
					<ul class="cart-tit">
						<li class="tit-meg">
							商品信息
						</li>
						<li class="tit-price">
							单价（元）
						</li>
						<li class="tit-quantity">
							数量
						</li>
						<li class="tit-sum">
							金额（元）
						</li>
						<li class="tit-action">
							操作
						</li>
					</ul>
					<c:forEach items="${order.orderItems}" var="orderItem">
						<div class="cart-form">
							<div class="msg">
							<img src="${pageContext.request.contextPath}/${orderItem.product.pimage}">
							<div class="msg-right">
							<p>${orderItem.product.pname}</p>
							</div>
						</div>
						<div class="price">
								￥:${orderItem.product.shop_price}元
						</div>
						<div class="num">
							<span class="count">${orderItem.count}</span></div>
						<div class="totalprice">
							<span class="money">￥:${orderItem.subtotal}元</span>
						</div>
						<div class="delete"><a id="del" href="javascript:;">删除</a></div>
					</div>
					</c:forEach>
					
					
					<div class="cart-bottom">
						<!-- <span>已选商品<i>1</i>件</span> -->
						<span>商品总价<i>${order.total}</i>元</span>
						<a href="javascript:;" onclick="payOrder()">结算</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 引入footer.jsp -->
	<jsp:include page="/footer.jsp"></jsp:include>
	</body>
	
</html>
