<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/detail.css">
<script type="text/javascript" src="js/jquery-1.12.3.js"></script>
<script src="js/detail.js"></script>
<script type="text/javascript">
	function addCart(){
		//获得购买的商品的数量
		var buyNum = $("#numinput").val();
		location.href="${pageContext.request.contextPath }/CartServlet?method=addProductToCart&pid=${product.pid}&buyNum="+buyNum;
	}

</script>
</head>
<body>
	<!-- 引入header.jsp -->
	<jsp:include page="/header.jsp"></jsp:include>

	<div id="crumbs-warpper">
		<div class="crumbs-inner">
			当前位置： <a href="index.html" title="首页">首页</a>
			<code>></code>
			<a href="index.html" title="商品分类">商品分类</a>
			<code>></code>
			<a href="index.html" title="欧式">欧式</a>
			<code>></code>
			${product.pname}
		</div>
	</div>
	<div id="key-warpper">
		<div class="key-inner">
			<div class="gallery">
				<div class="small-box">
					<img src="${pageContext.request.contextPath }/${product.pimage}">
					<span class="hover"></span>
				</div>
				<div class="thumbnail-box">
					<div class="list">
						<ul class="wrapper">
							<li><img
								src="${pageContext.request.contextPath }/${product.pimage}"
								alt="#"></li>
							<li><img
								src="${pageContext.request.contextPath }/${product.pimage}"
								alt="#"></li>
							<li><img
								src="${pageContext.request.contextPath }/${product.pimage}"
								alt="#"></li>
							<li><img
								src="${pageContext.request.contextPath }/${product.pimage}"
								alt="#"></li>
							<li><img
								src="${pageContext.request.contextPath }/${product.pimage}"
								alt="#"></li>
						</ul>
					</div>
				</div>
				<div class="big-box">
					<img src="images/detail/detail_03.gif" alt="#" id="bigImg">
				</div>
			</div>
			<div class="parameter">
				<form>
					<h1 class="title">${product.pname}</h1>
					<div class="decription">静音无声机芯，金属不锈钢边框，十年包换新</div>
					<div class="price-box">
						<ul>
							<li><span class="label">商品原价:</span> <span class="price"><i>￥</i>${product.shop_price}</span></li>
							</li>
							<li class="mb"><span class="price-label">店铺价格:</span><span
								class="price"><i>￥</i>${product.market_price}</span></li>
						</ul>
					</div>
					<div class="height">
						商品重量:<span class="nheight">20.00千克(kg)</span>
					</div>
					<div class="trasition">
						<span class="traslate">物流运费:</span><span>上海市<i></i> 至 深圳市<i></i></span><a
							class="promise">包邮</a>
					</div>
					<div class="color">
						<span>颜色分类:</span>
						<ul>
							<li><img
								src="${pageContext.request.contextPath }/${product.pimage}"></li>
							<li><img
								src="${pageContext.request.contextPath }/${product.pimage}"></li>
						</ul>
					</div>
					<div class="size">
						<span>选择尺寸:</span>
						<ul>
							<li>8英寸</li>
							<li>12英寸</li>
							<li>16英寸</li>
						</ul>
					</div>
					<div class="choice-buy">
						<div class="number">
							<span class="ch">选择数量:</span><span class="nbox"> <a
								href="javascript:;" id="lessbtn">-</a> 
								<input type="text" class="l" id="numinput" value="1"> 
								<a href="javascript:;" id="addbtn">+</a>
							</span> <span class="lastnum">库存11件</span>
						</div>
					</div>
					<div class="just-buy">
						<a herf="#" class="just">立即购买</a> 
						<a herf="javascript:void(0);" onclick="addCart()" class="addcart"><i></i>加入购物车</a>
					</div>
				</form>
			</div>
			<div class="store">
				<h1>未来钟塔旗舰店</h1>
				<div class="logo">
					<img src="images/detail/detail_06.gif">
					<dl>
						<dt>未来钟塔旗舰店</dt>
						<dd>
							<span>信誉:</span><i></i><i></i><i></i><i></i><br /> 好评率:100%
						</dd>
					</dl>
				</div>
				<div class="action">
					<h2>动态评价</h2>
					<ul>
						<li><span>描述相符</span><br /> <span class="score">4.9<i></i></span></li>
						<li><span>服务态度</span><br /> <span class="score">4.9<i></i></span></li>
						<li class="nor"><span>发货速度</span><br /> <span class="score">4.9<i></i></span></li>
					</ul>
				</div>
				<div class="information">
					<h3>店铺信息</h3>
					<ul>
						<li>创店时间：2016-6-15</li>
						<li>店铺地址：江苏省 无锡市159-5号</li>
						<li>店铺掌柜：厉害了</li>
						<li>店铺收藏：5484人</li>
						<li>联系我们：<img src="images/detail/detail_25.gif"></li>
						<li>店铺资质：<img src="images/detail/detail_29.jpg"></li>
					</ul>
				</div>
			</div>
		</div>
</body>
<div id="good-warpper">
	<div class="good-inner">
		<div class="recom">
			<ul>
				<c:forEach items="${historyProductList }" var="historyPro">
					<li>
						<p class="title">浏览记录</p> 
						<img src="${pageContext.request.contextPath }/${historyPro.pimage}">
						<span>￥${historyPro.market_price}</span>
						<p>${historyPro.pname }</p>
					</li>

				</c:forEach>
			</ul>
		</div>
		<div class="sum">
			<ul class="list-top">
				<li class="goods-detail">商品详情</li>
				<li class="sum-recom">累计评价(658)</li>
			</ul>
			<div class="detail">
				<div class="detail-top">
					<h1>商品参数</h1>
					<ul>
						<li>品牌参数</li>
						<li>品牌：Aisda/爱仕达</li>
						<li>表盘材质：PVC</li>
						<li>动力类型：电池</li>
						<li>颜色分类：金属黑框 拉丝银框 金属白框</li>
					</ul>
					<ul>
						<li>货号：A-278</li>
						<li>外壳材质：金属</li>
						<li>机芯品牌：太阳机芯</li>
						<li>售后服务：店铺三包</li>
					</ul>
					<ul>
						<li>形状：圆形</li>
						<li>镜面材质：玻璃</li>
						<li>机芯类型：扫秒机芯</li>
						<li>风格：欧式</li>
					</ul>
					<div class="introduce">
						<h1>尺寸介绍</h1>
						<div class="introduce-top">
							<span>尺寸：20英寸（直径50.5厘米）</span> <span class="style">外壳材质：实木</span>
							<p>1、尺寸选项里的(英寸/直径厘米)及详情页上方的参数有淘宝系统自动生成，雨宝贝儿
								实际参数存在偏差，请以宝贝详情页尺寸及内容为淘宝自动生成</p>
						</div>
					</div>
					<div class="must">
						<h1>买家 须知</h1>
						<div class="must-top">
							<p>1、所有包邮活动：新疆、西藏、内蒙、青海、海南、甘肃等地区均不参与。
								2禁止使用大、碱性电池以免损坏机芯，建议使用：双鹿、东芝</p>
						</div>
					</div>
				</div>
				<!---场景展示，默认可以不换--->
				<img src="images/detail/detail_14.jpg"> <img
					src="${pageContext.request.contextPath }/images/${product.pimage}">
				<!---场景展示，默认可以不换--->
				<img src="images/detail/detail_16.jpg"> <img
					src="${pageContext.request.contextPath }/images/${product.pimage}">
				<!---场景展示，默认可以不换--->
				<img src="images/detail/detail_18.jpg"> <img
					src="${pageContext.request.contextPath }/images/${product.pimage}">
			</div>
		</div>
	</div>

</div>
</html>
