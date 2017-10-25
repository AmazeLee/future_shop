package com.sh.web.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.domain.PageBean;
import com.sh.domain.Product;
import com.sh.service.ProductService;

public class ProductServlet extends BaseServlet {

	/**
	 * 根据类别id和当前页对产品进行查询
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void findProductListBycid(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cid = request.getParameter("cid");//获得类别id
		String currentPageStr = request.getParameter("currentPage");//获得当前页
		if (currentPageStr == null)
			currentPageStr = "1";
		int currentPage = Integer.parseInt(currentPageStr);
		int pageSize = 8;
		ProductService service = new ProductService();
		PageBean pageBean = service.findProductListBycid(cid, currentPage, pageSize);
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("cid", cid);
		request.setAttribute("productWord", null);
		request.getRequestDispatcher("/goods_list.jsp").forward(request, response);

	}

	/**
	 * 根据关键词对全部商品进行查询
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void findProductListByWord(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productWord = request.getParameter("productWord");
		String currentPageStr = request.getParameter("currentPage");//获得当前页
		if (currentPageStr == null)
			currentPageStr = "1";
		int currentPage = Integer.parseInt(currentPageStr);
		int pageSize = 8;
		ProductService service = new ProductService();
		PageBean pageBean = service.findProductListByWord(productWord, currentPage, pageSize);
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("cid",null);
		request.setAttribute("productWord", productWord);
		request.getRequestDispatcher("/goods_list.jsp").forward(request, response);
	}
	
	/**
	 * 根据商品ID查询商品详情
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void productDetail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获得要查询的商品ID
		String pid = request.getParameter("pid");
		ProductService service = new ProductService();
		Product product = service.findProductByPid(pid);
		request.setAttribute("product", product);
		
		//定义一个记录历史商品信息的集合
		List<Product> historyProductList = new ArrayList<Product>();
		//获得客户端携带cookie---获得名字是pids的cookie
		String pids = pid;
		Cookie[] cookies = request.getCookies();
		if(cookies!=null) {
			for (Cookie cookie : cookies) {
				if("pids".equals(cookie.getName())) {
					pids = cookie.getValue();
					//将pids拆成一个数组
					String[] split = pids.split("-");
					//根据pids查询出历史浏览商品的信息
					for (String proPid : split) {
						Product pro = service.findProductByPid(proPid);
						historyProductList.add(pro);
					}
					List<String> asList = Arrays.asList(split);
					LinkedList<String> list = new LinkedList<String>(asList);
					//判断集合中是否存在当前的pid
					if(list.contains(pid)) {
						//包含当前查看的商品的pid
						list.remove(pid);			
					}
					list.addFirst(pid);
					
					//将更新过的list转换为以-连接
					StringBuffer sb = new StringBuffer();
					for(int i=0;i<list.size()&&i<6;i++) {
						sb.append(list.get(i));
						sb.append("-");
					}
					//去掉多出来的-
					pids = sb.substring(0, sb.length()-1);	
				}
			}
		}
		Cookie cookie_pids = new Cookie("pids", pids);
		response.addCookie(cookie_pids);
		//将历史记录的集合放到域中
		request.setAttribute("historyProductList", historyProductList);
		request.getRequestDispatcher("/detail.jsp").forward(request, response);
	}
}