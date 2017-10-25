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
		<link rel="stylesheet" type="text/css" href="css/pay.css">
		<script type="text/javascript" src="js/jquery-1.12.3.js"></script>
		<script type="text/javascript">
			function payMoney(){
					//提交表单
					$("#payForm").submit();
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
					<span></span><li>确认订单</li><span></span>
					<span  class="active"></span><li  class="active">提交订单</li><span  class="active"></span>
					<span></span><li>确认收货</li><span></span>
					<span></span><li>我的评价</li>
				</ul>
			</div>
		</div>
		<div id="toast-warpper">
			<div class="toast-inner">
				<img src="images/pay/pay_03.jpg">
				<div class="tip">
				<p>您的订单已生成，请付款</p>
				<span>应付金额:<i>￥${order.total}</i></span><br/>
				<span>应付金额： 请您在提交订单后72小时内付款，否则订单会自动取消</span>
				</div>
			</div>
		</div>
		<div id="pay-warpper">
			<div class="pay-inner">
				<form id="payForm" action="${pageContext.request.contextPath }/OrderServlet?method=payMoney" method="post">
				  <fieldset>	
				    <legend>请选择付款方式</legend>
				    <h1>网银支付</h1>
				    <ul>
				    	<!-- 中国工商银行 -->
				    	<li><a href="javascript:;"><input type="radio" name="pd_FrpId" value="ICBC-NET-B2C"><img src="images/pay/pay_07.jpg"></a></li>
				   		<!-- 中国农业银行 -->
				    	<li><a href="javascript:;"><input type="radio" name="pd_FrpId" value="ABC-NET-B2C"><img src="images/pay/pay_09.jpg"></a></li>
				  		<!-- 中国建设银行 -->
				    	<li><a href="javascript:;"><input type="radio" name="pd_FrpId" value="CCB-NET-B2C"><img src="images/pay/pay_20.jpg"></a></li>
				  		<!-- 交通银行 -->
				    	<li class="nor"><a href="javascript:;"><input type="radio" name="pd_FrpId" value="BOCO-NET-B2C"><img src="images/pay/pay_21.jpg"></a></li>
				  </fieldset>
				  <p><span>支付：￥${order.total}</span></p>
				 <a class="confirm" href="javascript:;" onclick="payMoney()">确认付款</a>
				</form>
				
			</div>	
		</div>
		<!-- 引入footer.jsp -->
	<jsp:include page="/footer.jsp"></jsp:include>
	</body>
</html>
