package com.sh.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.ResourceBundle;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.sh.domain.Address;
import com.sh.domain.Cart;
import com.sh.domain.CartItem;
import com.sh.domain.Order;
import com.sh.domain.OrderItem;
import com.sh.domain.Product;
import com.sh.domain.User;
import com.sh.service.OrderService;
import com.sh.service.UserService;
import com.sh.utils.CommonsUtils;
import com.sh.utils.PaymentUtil;

public class OrderServlet extends BaseServlet {

	/**
	 * 提交订单
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void submitOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		// 判断用户是否已经登录
		User user = (User) session.getAttribute("user");
		if (user == null) {
			// 没有登录，跳到登录页面
			response.sendRedirect(request.getContextPath() + "/login.jsp");
			return;
		}
		// 封装好一个Order对象
		Order order = new Order();
		// 1、private String oid;//该订单的订单号
		String oid = CommonsUtils.getUUID();
		order.setOid(oid);
		// 2、private Date ordertime;//下单时间
		order.setOrdertime(new Date());
		// 3、private double total;//该订单的总金额
		// 获得session中的购物车
		Cart cart = (Cart) session.getAttribute("cart");
		double total = cart.getTotal();
		order.setTotal(total);
		// 4、private int state;//订单支付状态 1代表已付款 0代表未付款
		order.setState(0);
		// 5、private String address;//收货地址
		order.setAddress(null);
		// 6、private String name;//收货人
		order.setName(null);
		// 7、private String telephone;//收货人电话
		order.setTelephone(null);
		// 8、private User user;//该订单属于哪个用户
		order.setUser(user);
		// 9该订单中有多少订单项List<OrderItem> orderItems = new ArrayList<OrderItem>();
		// 获得购物车中购物项的集合Map
		Map<String, CartItem> cartItems = cart.getCartItems();
		for (Entry<String, CartItem> entry : cartItems.entrySet()) {
			// 取出每一个购物项
			CartItem cartItem = entry.getValue();
			// 创建新的订单项
			OrderItem orderItem = new OrderItem();
			// private String itemid;//订单项的id
			orderItem.setItemid(CommonsUtils.getUUID());
			// private int count;//订单项内商品的购买数量
			orderItem.setCount(cartItem.getBuyNum());
			// private double subtotal;//订单项小计
			orderItem.setSubtotal(cartItem.getSubtotal());
			// private Product product;//订单项内部的商品
			orderItem.setProduct(cartItem.getProduct());
			// private Order order;//该订单项属于哪个订单
			orderItem.setOrder(order);

			// 将该订单项添加到订单项集合中
			order.getOrderItems().add(orderItem);
		}
		// order对象封装完毕

		// 传递数据到service层
		OrderService service = new OrderService();
		UserService userService = new UserService();
		service.submitOrder(order);
		List<Address> addressList = null;
		try {
			// 根据用户id查询到所有的收货地址
			addressList = userService.findAddressListByUid(user.getUid());
			for (Address address : addressList) {
				System.out.println(address);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// 将order和addresseList存到session域
		session.setAttribute("order", order);
		session.setAttribute("addressList", addressList);
		// 页面跳转
		response.sendRedirect(request.getContextPath() + "/order.jsp");
	}

	/**
	 * 确认订单
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void affirmOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		HttpSession session = request.getSession();
		String add_id = request.getParameter("add_id");
		// 根据ID查出地址
		OrderService service = new OrderService();
		Address address = null;
		try {
			address = service.findAddressById(add_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Order order = (Order) session.getAttribute("order");
		// 更新信息
		order.setAddress(address.getAddress());
		order.setName(address.getName());
		order.setTelephone(address.getPhone());

		service.updateOrderAdrr(order);
		session.setAttribute("order", order);
		// 页面跳转
		response.sendRedirect(request.getContextPath() + "/pay.jsp");
		/* request.getRequestDispatcher("/pay.jsp"); */
	}

	/**
	 * 在线支付
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void payMoney(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		HttpSession session = request.getSession();
		Order order = (Order) session.getAttribute("order");
		// 接入一个接口，这个接口已经集成了所有的银行接口，这个接口是第三方支付平台提供的
		// 接入的是易宝支付
		// 获得 支付必须基本数据
		String orderid = order.getOid() + "";
		/* String money = order.getTotal()+"";//支付金额 */
		String money = "0.01";// 支付金额
		// 银行
		String pd_FrpId = request.getParameter("pd_FrpId");

		// 发给支付公司需要哪些数据
		String p0_Cmd = "Buy";
		String p1_MerId = ResourceBundle.getBundle("merchantInfo").getString("p1_MerId");
		String p2_Order = orderid;
		String p3_Amt = money;
		String p4_Cur = "CNY";
		String p5_Pid = "";
		String p6_Pcat = "";
		String p7_Pdesc = "";
		// 支付成功回调地址 ---- 第三方支付公司会访问、用户访问
		// 第三方支付可以访问网址
		String p8_Url = ResourceBundle.getBundle("merchantInfo").getString("callback");
		String p9_SAF = "";
		String pa_MP = "";
		String pr_NeedResponse = "1";
		// 加密hmac 需要密钥
		String keyValue = ResourceBundle.getBundle("merchantInfo").getString("keyValue");
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc,
				p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse, keyValue);

		String url = "https://www.yeepay.com/app-merchant-proxy/node?pd_FrpId=" + pd_FrpId + "&p0_Cmd=" + p0_Cmd
				+ "&p1_MerId=" + p1_MerId + "&p2_Order=" + p2_Order + "&p3_Amt=" + p3_Amt + "&p4_Cur=" + p4_Cur
				+ "&p5_Pid=" + p5_Pid + "&p6_Pcat=" + p6_Pcat + "&p7_Pdesc=" + p7_Pdesc + "&p8_Url=" + p8_Url
				+ "&p9_SAF=" + p9_SAF + "&pa_MP=" + pa_MP + "&pr_NeedResponse=" + pr_NeedResponse + "&hmac=" + hmac;

		// 重定向到第三方支付平台
		response.sendRedirect(url);

	}

	/**
	 * 查看我的订单
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void myOrders(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		HttpSession session = request.getSession();
		// 判断用户是否已经登录
		User user = (User) session.getAttribute("user");
		if (user == null) {
			// 没有登录，跳到登录页面
			response.sendRedirect(request.getContextPath() + "/login.jsp");
			return;
		}

		// 查询该用户所有的订单
		OrderService service = new OrderService();
		// 查询该用户所有的订单信息（单表查询orders表）
		// 集合中的每一个Order对象的数据是不完整的，缺少List<OrderItem> OrderItem数据
		List<Order> orderList = service.findAllOrders(user.getUid());
		// 循环所有订单项 为每个订单填充订单项集合信息
		if (orderList != null) {
			for (Order order : orderList) {
				// 获得每一个订单的oid
				String oid = order.getOid();
				// 查询该订单的所有的订单项---mapList封装的是多个订单项和该订单项总商品的信息
				List<Map<String, Object>> mapList = service.findAllOrderItemByOid(oid);
				// 将mapList转换为List<OrderItem> orderItems
				for (Map<String, Object> map : mapList) {

					try {
						// 从map中取出count subtotal 封装到OrderItem中
						OrderItem item = new OrderItem();
						// item.setCount(Integer.parseInt(map.get("count").toString()));
						BeanUtils.populate(item, map);
						// 从map中取出pimage pname shop_price 封装到Product中
						Product product = new Product();
						BeanUtils.populate(product, map);
						// 将product封装到OrderItem
						item.setProduct(product);
						// 将orderitem封装到order中的orderItemList中
						order.getOrderItems().add(item);
					} catch (IllegalAccessException e) {
						e.printStackTrace();
					} catch (InvocationTargetException e) {
						e.printStackTrace();
					}
				}
			}
		}
		// orderList封装完整了
		request.setAttribute("orderList", orderList);

		request.getRequestDispatcher("/myorder.jsp").forward(request, response);
	}

}