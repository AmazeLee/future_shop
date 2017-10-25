<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/register.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<script src="js/jquery-1.12.3.js"></script>
<script src="js/login.js"></script>
<!-- 引入表单校验jQuery插件 -->
<script src="js/jquery.validate.min.js" type="text/javascript"></script>
<!-- <script src="js/register.js"></script> -->
<style type="text/css">
.error {
	color: red;
}

.item {
	display: inline-block;
}
</style>

<script type="text/javascript">
	/* 刷新验证码 */
	function changeCodes() {
		var img = document.getElementsByTagName("img")[1];
		img.src = "/FutureShop/UserServlet?method=checkCode&r=" + Math.random();
	}
	//自定义校验规则
	$.validator.addMethod(
	//规则的名称
	"checkUsername",
	//校验的函数
	function(value, element, params) {

		//定义一个标志
		var flag = false;

		//value:输入的内容
		//element:被校验的元素对象
		//params：规则对应的参数值
		//目的：对输入的username进行ajax校验
		$.ajax({
			"async" : false,
			"url" : "${pageContext.request.contextPath}/UserServlet?method=checkUsername",
			"data" : {
				"username" : value
			},
			"type" : "POST",
			"dataType" : "json",
			"success" : function(data) {
				flag = data.isExist;
			}
		});
		//返回false代表该校验器不通过
		return !flag;
	}

	);

	$(function() {
		$("#myform").validate({
			rules : {
				"username" : {
					"required" : true,
					"checkUsername" : true
				},
				"telephone" : {
					"required" : true,
					"rangelength" : [ 11, 11 ]
				},
				"password" : {
					"required" : true,
					"rangelength" : [ 6, 12 ]
				},
				"repassword" : {
					"required" : true,
					"rangelength" : [ 6, 12 ],
					"equalTo" : "#mm"
				},
				"email" : {
					"required" : true,
					"email" : true
				},
				"checkcode" : {
					"required" : true
				}
			},
			messages : {
				"username" : {
					"required" : "用户名不能为空",
					"checkUsername" : "用户名已存在"
				},
				"telephone" : {
					"required" : "手机号不能为空",
					"rangelength" : "请输入11位手机号码"
				},
				"password" : {
					"required" : "密码不能为空",
					"rangelength" : "密码长度6-12位"
				},
				"repassword" : {
					"required" : "密码不能为空",
					"rangelength" : "密码长度6-12位",
					"equalTo" : "两次密码不一致"
				},
				"email" : {
					"required" : "邮箱不能为空",
					"email" : "邮箱格式不正确"
				},
				"checkcode" : {
					"required" : "验证码不能为空"
				}
			}
		});
	});
</script>
</head>
<body>
	<!-- 引入header.jsp -->
	<jsp:include page="/header.jsp"></jsp:include>

	<div id="register-warpper">
		<div class="register-inner">
			<div class="register-left"></div>
			<div class="register-right">
				<div class="register">
					<span>会员注册</span><i></i>
				</div>
				<!-- post方式提交到RegisterServlet进行处理 -->
				<form id="myform"
					action="${pageContext.request.contextPath}/UserServlet?method=register"
					method="post">
					<div class="item">
					用户名:<input type="text" placeholder="请输入用户名"
							id="yhm" name="username" style="vertical-align:middle;">
					</div>
					<div class="item">
						手机号:<input type="text" placeholder="请输入手机号" id="sjh"
							name="telephone">
					</div>
					<div class="item">
						密码:<input type="password" placeholder="请输入6位以上密码" id="mm"
							name="password">
					</div>
					<div class="item">
						确认密码:<input type="password" placeholder="再次输入您的密码" id="qrmm"
							name="repassword">
					</div>
					<div class="item">
						邮箱:<input type="text" placeholder="请输入邮箱" id="yx" name="email">
						<!-- <input type="button" value="获取验证码" id="btn"> -->
						<!-- <img src="images/dr.jpg" id="btn"> -->
						<img src="/FutureShop/UserServlet?method=checkCode" onclick="changeCodes()"
							id="btn" />
					</div>
					<div class="item">
						验证码:<input type="text" placeholder="请输入验证码" id="yzm"
							name="checkcode">
					</div>
					<div class="font">
						<input type="checkbox" id="ty" name="agree" value="agree"></input>
						<span>我已阅读并同意<a href="javascript:;">用户服务协议</a></span>
					</div>
					<input type="submit" value="免费注册" id="button">
				</form>
			</div>
		</div>
	</div>
	<!-- 引入footer.jsp -->
	<jsp:include page="/footer.jsp"></jsp:include>

</body>
</html>
