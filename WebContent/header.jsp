<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 拼装当前网页的相对路径 -->
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<!-- 是用来表明当前页面的相对路径所使用的根路径的 -->
<base href="<%=basePath%>">

<title>My JSP '1.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/login.css" />
<link rel="stylesheet" type="text/css" href="css/common.css">

</head>

<body>
	<div id="feacher-warpper">
		<div class="feacher-inner">
			<c:if test="${empty user }"><p>亲，欢迎来到未来塔钟商城</p></c:if>
			<c:if test="${!empty user }"><p>Hi,<a href="#">${user.username }</a></p></c:if>
			<div class="feacher-right">
				<c:if test="${empty user }">
					<a href="login.jsp" class="login">登录</a> 
					<a href="register.jsp" class="register">注册</a> 
				</c:if>
				<c:if test="${!empty user }">
					<a href="javascript:void(0)" class="login">${user.username }</a>
					<a href="${pageContext.request.contextPath}/UserServlet?method=logout" class="register">退出</a>
				</c:if>
				<a href="cart.jsp" class="shopcar"><i></i>购物车</a>
				<a href="${pageContext.request.contextPath}/OrderServlet?method=myOrders" class="order">我的订单<i></i></a>
			</div>
		</div>


	</div>
	<div id="header-warpper">
		<div class="header-inner">
			<div class="header-left">
				<div class="logo-search">
					<div class="logo">
						<a href="index.html" title="未来塔钟，时间有度"><h1>未来塔钟</h1></a>
					</div>
					<div class="search">
						<form name="" action="${pageContext.request.contextPath}/ProductServlet?method=findProductListByWord" method="post">
							<input type="text" class="txt" placeholder="请输入搜索关键词" value="${productWord }" name="productWord"> <input
								type="submit" class="sub" value="搜索"><i></i>
						</form>
						<p>关键热词</p>
						<a href="${pageContext.request.contextPath}/ProductServlet?method=findProductListByWord&productWord=欧美">:欧美</a>
						<a href="${pageContext.request.contextPath}/ProductServlet?method=findProductListByWord&productWord=中国风" class="china">中国风</a>
						<a href="${pageContext.request.contextPath}/ProductServlet?method=findProductListByWord&productWord=白色">白色</a>
						<a href="${pageContext.request.contextPath}/ProductServlet?method=findProductListByWord&productWord=金色">金色</a>
					</div>

				</div>
				<div class="nav">
					<div class="nav-left">
						<a class="nav2" href="goods_list.html">全部商品分类<i></i></a>
						<ul>
							<li><p>品牌</p> <a href="#" class="ml30">滴滴嗒</a>/<a href="#">时利恒</a>/<a
								href="#">DIV</a></li>
							<li><p>动力类型</p> <a href="#" class="ml30">电池</a>/<a href="#">自动机械</a>/<a
								href="#">机械</a></li>
							<li><p>风格</p> <a href="#" class="ml30">欧式</a>/<a href="#">简约</a>/<a
								href="#">地中海</a></li>
							<li><p>材质</p> <a href="#" class="ml30">木材</a>/<a href="#">石英</a>/<a
								href="#">大理石</a></li>
							<li class="bbn"><p>刻度</p> <a href="#" class="ml30">数字</a>/<a
								href="#">罗马数字</a></li>
						</ul>
					</div>
					<div class="nav-center">
						<ul id="categoryUl">
							
							<%-- <c:forEach items="${categoryList }" var="category">
								<li><a href="#">${category.cname }</a></li>
							</c:forEach> --%>
						</ul>
					</div>
				</div>
			</div>
			<div class="header-right">
				<img src="images/dr.jpg">
			</div>
		</div>
	</div>
	<script type="text/javascript">
		//header.jsp加载完毕后，去服务器端获得所有的category数据
		$(function(){
			var content="<li><a href='index.jsp'>首页</a></li>";
			$.post(
				"${pageContext.request.contextPath}/CategoryServlet?method=getCategoryList",
				function(data){
					
					//[{"cid":"xxx","cname":xxx},{},{}]
					//动态创建<li><a href="#">${category.cname }</a></li>
					for(var i=0;i<data.length;i++){
						content+="<li><a href='${pageContext.request.contextPath}/ProductServlet?method=findProductListBycid&cid="+data[i].cid+"'>"+data[i].cname+"</a></li>"
					}
					//将拼接好的li放置到ul中
					$("#categoryUl").html(content);
				},
				"json"		
			);
		});
	</script>
</body>
</html>