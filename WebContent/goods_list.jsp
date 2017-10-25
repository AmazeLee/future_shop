<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/goodslist.css">
<script type="text/javascript" src="js/jquery-1.12.3.js"></script>
</head>
<body>

	<!-- 引入header.jsp -->
	<jsp:include page="/header.jsp"></jsp:include>

	<div id="crumbs-warpper">
		<div class="crumbs-inner">
			当前位置： <a href="index.html" title="首页">首页</a>
			<code>></code>
			<a href="goods_list.html" title="商品分类">商品分类</a>
			<code>></code>
			<a href="#" title="欧式" style="color: #c6a978">欧式</a>
		</div>
	</div>
	<!-- <div id="choice-warpper">
		<div class="choice-inner">
			<ul>
				<li class="first">您已选择：<a class="choose">compass/康巴丝<i
						class="close"></i></a><a class="choose2">收起筛选<i class="arrow"></i></a></li>
				<li>品牌：
					<div class="choice">
						<a>时利恒</a>
					</div>
				</li>
				<li>动力类型：<a>外接电源 </a><a>自动机械</a><a>电池</a></li>
				<li>风格：
					<div class="choice">
						<a>欧式 </a><a> 北欧</a><a>现代简约</a><a>地中海 </a>
					</div>
				</li>
				<li>家居饰品：<a>挂钟 </a><a>墙钟</a><a>落地钟</a><a>台钟 </a></li>
				<li>筛选条件：<a>尺寸 </a><a>相关分类</a></li>
				<li><a>8英寸</a><a>10英寸</a><a>12英寸</a><a>14英寸</a><a>16英寸</a><a>20英寸</a></li>
			</ul>
			<div class="sort">
				<a>综合排序</a> <a>人气</a> <a>销量</a> <a>价格</a> <input id="price"
					type="text" placeholder="￥"> - <input id="price"
					type="text" placeholder="￥"> <input type="button"
					value="确定" id="btn">
				<form>
					<input type="text" placeholder="关键字搜索" id="txt"> <input
						type="submit" value="确定" id="btn2">
				</form>
			</div>
		</div>
	</div> -->
	<div id="goods-warpper">
		<div class="goods-inner" id="prolist">
			<c:forEach items="${pageBean.list }" var="pro">
				<div class="box">
					<a href="${pageContext.request.contextPath}/ProductServlet?method=productDetail&pid=${pro.pid}"> <img
						src="${pageContext.request.contextPath}/${pro.pimage}"
						style="width: 284px, height:284px">
						<div class="three">
							<span class="price"><i>¥:</i>${pro.shop_price }</span> <em
								class="sale"><i>¥:</i>${pro.market_price }</em> <span
								class="people"> 已付款<i>3697人</i>
							</span>
						</div>
						<p class="box-tit">${pro.pname }</p>
					</a>
				</div>
			</c:forEach>



			<div id="jump">
				<!-- 上一页 -->
				<!-- 判断是否是第一页 -->
				<c:if test="${pageBean.currentPage==1 }">
					<a class="last" href="javascript:void(0)">上一页</a> 
				</c:if>
				<c:if test="${pageBean.currentPage!=1 }">
					<a class="last" href="${pageContext.request.contextPath}/ProductServlet?method=findProductListBycid&cid=${cid}&productWord=${productWord }&currentPage=${pageBean.currentPage-1}">上一页</a> 
				</c:if>
				<!-- 显示每一页 -->
				<c:forEach begin="1" end="${pageBean.totalPage }" var="page">
					<c:if test="${page==pageBean.currentPage }">
						<a href="javascript:void(0)">${page}</a> 
					</c:if>
					<c:if test="${page!=pageBean.currentPage }">
						<a href="${pageContext.request.contextPath}/ProductServlet?method=findProductListBycid&cid=${cid}&productWord=${productWord }&currentPage=${page}">${page}</a> 
					</c:if>
				</c:forEach>
				<!-- 下一页 -->
				<!-- 判断是否是下一页 -->
				<c:if test="${pageBean.currentPage==pageBean.totalPage }">
					<a class="last" href="javascript:void(0)">下一页</a> 
				</c:if>
				<c:if test="${pageBean.currentPage!=pageBean.totalPage }">				
				<a class="next" href="${pageContext.request.contextPath}/ProductServlet?method=findProductListBycid&cid=${cid}&productWord=${productWord }&currentPage=${pageBean.currentPage+1}">下一页</a>
				</c:if>
				
				<!-- 跳转到 <input type="text" class="page"> 页 <a href='#'
					class="confirm">确定</a> --> 共${pageBean.currentPage}/${pageBean.totalPage }页
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
	<script type="text/javascript">
		var Div = document.getElementById("prolist");
		Div.getElementsByTagName("div")[6].style.marginRight = '0px';
		Div.getElementsByTagName("div")[14].style.marginRight = '0px';
	</script>
</body>
</html>
