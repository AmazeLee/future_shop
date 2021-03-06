<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/reset.css">
		<link rel="stylesheet" type="text/css" href="css/paysuccess.css">
		<script src="js/jquery-1.12.3.js"></script>
	</head>
	<body>
	<!-- 引入header.jsp -->
	<jsp:include page="/header.jsp"></jsp:include>
		<div id="success-warpper">
			<div class="success-inner">
				<div class="success-left">
					<img src="images/pay/paysuccess_03.jpg">
					<div class="tell">
					<p>支付成功，我们会尽快为您发货</p>
					<span>在线支付：￥${r3_Amt}元 | 您的订单正在处理中...</span><br/>
					<a class="contiune">继续购物</a>
					<a class="look">查看订单</a>
					</div>
				</div>
				<div class="success-right">
					<img src="images/pay/payfail_06.jpg">
					<p>扫码下载App</p>
					<span>随时随地查看物流，享受更多优惠与特权</span>
				</div>
			</div>
		</div>
		<a id="back" href="index.jsp">返回首页</a>
		<!-- 引入footer.jsp -->
	<jsp:include page="/footer.jsp"></jsp:include>
	</body>
</html>
