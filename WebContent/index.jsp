<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/index.css">
<script src="js/index.js"></script>
<script type="text/javascript" src="js/jquery-1.12.3.js"></script>
<script src="js/lunbo.js"></script>

<meta charset="UTF-8">
<title>未来塔钟商城</title>
</head>
<body>
	<!-- 引入header.jsp -->
	<jsp:include page="/header.jsp"></jsp:include>

	<div id="banner-warpper">
		<div class="banner-inner">
			<div id="fsc">
				<ul id="list3">
					<li><img src="images/banner6_03.jpg"></li>
					<li><img src="images/banner7_03.jpg"></li>
					<li><img src="images/banner8_03.jpg"></li>
				</ul>
			</div>
			<a id="fsl"></a> <a id="fsr"></a>
			<ul id="list4">
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
	</div>
	<div id="hots-warpper">
		<div class="hots-inner">
			<p>最新推荐</p>
			<a href="#">
				<div class="hots1">
					<strong>售价￥:132</strong> <span>大气简约</span> <i></i>
				</div>
			</a> <a href="#">
				<div class="hots2">
					<strong>售价￥:132</strong> <span>时尚简约</span> <i></i>
				</div>
			</a> <a href="#">
				<div class="hots3">
					<strong>售价￥:132</strong> <span>复古怀旧</span> <i></i>
				</div>
			</a>
		</div>
	</div>
	<div id="burst-warpper">
		<div class="burst-inner" id="baokuan">
			<h1>
				爆款推荐<span>Burst recommendation</span>
			</h1>
			<c:forEach items="${hotProductList }" var="hotPro">
				<div class="burst">
					<a href="${pageContext.request.contextPath}/ProductServlet?method=productDetail&pid=${hotPro.pid}"><img src="${hotPro.pimage }"></a>
					<p>${hotPro.pname }</p>
					<span>￥:${hotPro.shop_price }</span>
				</div>
			</c:forEach>

			<div class="burst-bottom">
				<a href="#" class="hengda"></a>
			</div>
		</div>

	</div>
	<div id="occident-warpper">
		<div class="occident-inner">
			<div class="occident-top">
				<i></i>
				<h1>1F</h1>
				<p>欧美</p>
				<span>occident</span>
			</div>
			<div class="occident-center">
				<div class="occident-left">
					<a href="${pageContext.request.contextPath}/ProductServlet?method=productDetail&pid=1"><div id="img1">
							<div id="img1-inner">
								<span>￥:269</span>
								<p>
									风景钟双面塔钟大堂钟定做室外挂钟交流电机芯<br />塔钟欧式挂钟室外钟
								</p>
							</div>
							<div id="img">
								<p>风景钟</p>
							</div>
						</div></a> <a href="${pageContext.request.contextPath}/ProductServlet?method=productDetail&pid=1"><div id="img2">
							<div id="img2-inner"></div>
						</div> <a href="${pageContext.request.contextPath}/ProductServlet?method=productDetail&pid=1"><div id="img3">
								<div id="img3-inner"></div>
							</div>
				</div>

				<div class="occident-right">
					<a href="${pageContext.request.contextPath}/ProductServlet?method=productDetail&pid=1"><div id="img4"></div></a>
				</div>

			</div>

			<div class="occident-bottom">
				<a href="${pageContext.request.contextPath}/ProductServlet?method=productDetail&pid=1" title="中国风"><img src="images/img_32.jpg"></a>
			</div>
		</div>
	</div>
	<div id="chinese-warpper">
		<div class="chinese-inner">
			<div class="chinese-top">
				<i></i>
				<h1>2F</h1>
				<p>中国风</p>
				<span>Chinese style</span>
			</div>
			<div class="chinese-center">
				<div class="chinese-left">
					<a href="${pageContext.request.contextPath}/ProductServlet?method=productDetail&pid=1"><div id="img5"></div></a>
				</div>

				<div class="chinese-right">
					<a href="${pageContext.request.contextPath}/ProductServlet?method=productDetail&pid=1"><div id="img6">
							<div id="img6-inner">
								<span>￥:269</span>
								<p>
									风景钟双面塔钟大堂钟定做室外挂钟交流电机芯<br />塔钟欧式挂钟室外钟
								</p>
							</div>
							<div id="img10">
								<p>风景钟</p>
							</div>
						</div></a> <a href="${pageContext.request.contextPath}/ProductServlet?method=productDetail&pid=1"><div id="img7">
							<div id="img7-inner"></div>
						</div></a> <a href="${pageContext.request.contextPath}/ProductServlet?method=productDetail&pid=1"><div id="img8">
							<div id="img8-inner"></div>
						</div></a>
				</div>

			</div>

			<div class="chinese-bottom">
				<a href="#" title="家装节"><img src="images/img_38.jpg"></a>
			</div>
		</div>
	</div>
	<div id="sea-warpper">
		<div class="sea-inner">
			<div class="sea-top">
				<i></i>
				<h1>3F</h1>
				<p>地中海</p>
				<span>occident</span>
			</div>
			<div class="sea-center">
				<div class="sea-left">
					<a href="${pageContext.request.contextPath}/ProductServlet?method=productDetail&pid=1"><div id="img12">
							<div id="img12-inner"></div>
						</div></a> <a href="${pageContext.request.contextPath}/ProductServlet?method=productDetail&pid=1"><div id="img13">
							<div id="img13-inner"></div>
						</div></a> <a href="${pageContext.request.contextPath}/ProductServlet?method=productDetail&pid=1"><div id="img11">
							<div id="img11-inner">
								<span>￥:269</span>
								<p>
									风景钟双面塔钟大堂钟定做室外挂钟交流电机芯<br />塔钟欧式挂钟室外钟
								</p>
							</div>
							<div id="img15">
								<p>风景钟</p>
							</div>
						</div></a>
				</div>

				<div class="sea-right">
					<a href="${pageContext.request.contextPath}/ProductServlet?method=productDetail&pid=1"><div id="img14"></div></a>
				</div>

			</div>

			<div class="sea-bottom">
				<a href="#" title="优质创造"><img src="images/img_43.jpg"></a>
			</div>
		</div>
	</div>
	<div id="fnav-warpper">
		<div class="fnav-inner">
			<div class="ul1">
				<h2>新手指南</h2>
				<ul>
					<li>优惠卡使用说明</li>
					<li>购物流程</li>
					<li>客户注册</li>
				</ul>
			</div>
			<div class="ul1">
				<h2>支付说明</h2>
				<ul>
					<li>优惠卡使用说明</li>
					<li>购物流程</li>
					<li>客户注册</li>
				</ul>
			</div>
			<div class="ul1">
				<h2>配送问题</h2>
				<ul>
					<li>优惠卡使用说明</li>
					<li>购物流程</li>
					<li>客户注册</li>
				</ul>
			</div>
			<div class="ul1">
				<h2>售后服务</h2>
				<ul>
					<li>优惠卡使用说明</li>
					<li>购物流程</li>
					<li>客户注册</li>
				</ul>
			</div>
			<div class="ul1">
				<h2>关于我们</h2>
				<ul>
					<li>了解我们</li>
					<li>认识我们</li>
					<li>诚聘英才</li>
				</ul>
			</div>
			<div class="ul2">
				<p>服务热线：（8:00~22::00）</p>
				<span>400-459-1664</span><br />
				<p>服务邮箱：</p>
				<span>8154692473@qq.com</span>

			</div>
		</div>
	</div>
	<!-- 引入footer.jsp -->
	<jsp:include page="/footer.jsp"></jsp:include>
	<!-- 改变动态生成的商品div的class -->
	<script type="text/javascript">
		var Div = document.getElementById("baokuan");
		Div.getElementsByTagName("div")[0].className = "first";
		Div.getElementsByTagName("div")[4].className = "first";
	</script>
</body>
</html>
