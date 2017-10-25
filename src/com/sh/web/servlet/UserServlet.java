package com.sh.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.sh.domain.User;
import com.sh.service.UserService;
import com.sh.utils.CommonsUtils;
import com.sh.utils.MailUtils;

import cn.dsna.util.images.ValidateCode;

/**
 * Servlet implementation class UserServlet
 */
public class UserServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 检查用户名是否已存在
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void checkUsername(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获得用户名
		String username = request.getParameter("username");
		// 传递到servise层
		UserService service = new UserService();
		boolean isExist = service.checkUsername(username);
		System.out.println("-------------" + isExist);
		String json = "{\"isExist\":" + isExist + "}";
		response.getWriter().write(json);
	}

	/**
	 * 获取验证码
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void checkCode(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/**
		 * ValidateCode(width, height, codeCount, lineCount) width:宽 height:高
		 * width:72px; height: 21px; codeCount:验证码的个数 lineCount:线的条数(干扰因素)
		 */
		ValidateCode code = new ValidateCode(72, 21, 4, 20);
		// 将验证码内容保存session
		request.getSession().setAttribute("checkcode_session", code.getCode());
		System.out.println(code.getCode());
		/// 拿验证码
		String code2 = code.getCode();
		// 放在共享域里面
		getServletContext().setAttribute("code", code2);
		// 把验证码响应给浏览器
		code.write(response.getOutputStream());
	}

	/**
	 * 注册
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// 获取表单数据
		Map<String, String[]> properties = request.getParameterMap();
		User user = new User();
		try {
			// 映射封装
			BeanUtils.populate(user, properties);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}

		// 将未从表单中接收到的值进行初始化赋值
		// private String uid;
		user.setUid(CommonsUtils.getUUID());
		// private String name;
		user.setName(null);
		// private Date birthday;
		user.setBirthday(null);
		// private String sex;
		user.setSex(null);
		// private int state;//是否激活
		user.setState(0);
		// private String code;//激活码
		String activeCode = CommonsUtils.getUUID();
		user.setCode(activeCode);

		// 将user传递给Service层
		UserService service = new UserService();
		boolean isRegisterSuccess = service.regist(user);
		if (isRegisterSuccess) {
			// 发送激活邮件
			String emailMsg = "恭喜您注册未来钟塔商城会员成功，请点击下面的链接对账户进行激活："
					+ "<a href='http://localhost:8080/FutureShop/ActiveServlet?method=active&activeCode=" + activeCode
					+ "'>" + "http://localhost:8080/FutureShop/ActiveServlet?activeCode=" + activeCode + "</a>";
			try {
				MailUtils.sendMail(user.getEmail(), emailMsg);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			// 跳转到注册成功页面
			response.sendRedirect(request.getContextPath() + "/registerSuccess.jsp");
		} else {
			// 跳转到失败的提示页面
			response.sendRedirect(request.getContextPath() + "/registerFail.jsp");
		}
	}

	/**
	 * 激活用户
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void active(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 获得激活码
		String activeCode = request.getParameter("activeCode");

		// 转发到service层
		UserService service = new UserService();
		boolean active = false;
		try {
			active = service.active(activeCode);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (active) {
			// 激活成功
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		} else {
			// 激活失败
			
		}
	}

	/**
	 * 登录
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();

		// 获取注册页面提交的表单数据
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String logincode = request.getParameter("logincode");

		// System.out.println(username+"-"+password+"-"+logincode);
		String code = getServletContext().getAttribute("code") + "";
		System.out.println(logincode + "-----" + code);
		/**
		 * 进行校验-先进行验证码校验-再进行用户名和密码校验
		 */
		int flag = 0;
		User user = null;
		if (code.equalsIgnoreCase(logincode)) {
			// 验证码输入正确
			UserService service = new UserService();
			try {
				user = service.login(username, password);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if (user != null) {
				flag = 0;
			} else {
				flag = 2;
			}
		} else {
			// 验证码输入错误
			flag = 1;
		}

		switch (flag) {
		case 0:
			// 登陆成功之后，将用户名保存
			// getServletContext().setAttribute("student",student);
			session.setAttribute("user", user);
			// 将用户名和密码保存到cookie
			Cookie cookie_username = new Cookie("cookie_username",user.getUsername());
			Cookie cookie_password = new Cookie("loginpwd", user.getPassword());

			// 设置Cookie的持久化时间
			cookie_username.setMaxAge(60 * 60);
			cookie_password.setMaxAge(60 * 60);
			// 设置Cookie的携带路径
			cookie_username.setPath(request.getContextPath());
			cookie_password.setPath(request.getContextPath());
			// 发送Cookie
			response.addCookie(cookie_username);
			response.addCookie(cookie_password);
			// 重定向到欢迎页面
			response.sendRedirect(request.getContextPath()+"/IndexServlet");

			break;

		case 1:

			// 失败，转发到登录页面 提示验证码输入错误
			request.setAttribute("loginInfo", "验证码输入有误");
			request.getRequestDispatcher("/login.jsp").forward(request, response);

			break;

		case 2:
			// 提示账户和密码错误，3秒后返回到登陆
			/*
			 * response.getWriter().write("账户和密码输入错误3秒后跳回到登陆页面");
			 * response.setHeader("refresh", "3;url=/School/index.jsp");
			 */

			// 失败，转发到登录页面 提示账号或密码输入有误
			request.setAttribute("loginInfo", "账号或密码输入有误");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			break;
		}
	}
	
	/**
	 * 退出登录
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		//从session中将user删除
		session.removeAttribute("user");
		//将存储到客户端的cookie删除掉
		Cookie cookie_username = new Cookie("cookie_username","");
		Cookie cookie_password = new Cookie("loginpwd","");

		// 设置Cookie的持久化时间
		cookie_username.setMaxAge(0);
		cookie_password.setMaxAge(0);
		// 发送Cookie
		response.addCookie(cookie_username);
		response.addCookie(cookie_password);
		response.sendRedirect(request.getContextPath()+"/login.jsp");
	}

}
