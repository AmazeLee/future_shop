package com.sh.web.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.domain.Category;
import com.sh.domain.Product;
import com.sh.service.CategoryService;
import com.sh.service.ProductService;
/**
 * 进入首页前拿数据
 * @author Administrator
 *
 */
public class IndexServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductService service = new ProductService();
		// 准备热门商品
		List<Product> hotProductList = null;
		try {
			hotProductList = service.findHotProductList();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// 准备最新商品
		List<Product> newProductList = null;
		try {
			newProductList = service.findNewProductList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		/*
		//准备商品分类的数据
		CategoryService service1 = new CategoryService();
		List<Category> categoryList = null;
		try {
			categoryList = service1.findAllCategoryList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		// 将hotProductList、newProductList存到request域
		request.setAttribute("hotProductList", hotProductList);
		request.setAttribute("newProductList", newProductList);
		/*request.setAttribute("categoryList", categoryList);*/
		//转发到首页
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}