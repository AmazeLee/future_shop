package com.sh.web.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sh.domain.Category;
import com.sh.service.CategoryService;

public class CategoryServlet extends BaseServlet {

	public void getCategoryList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 准备商品分类的数据
		CategoryService service1 = new CategoryService();
		List<Category> categoryList = null;
		try {
			categoryList = service1.findAllCategoryList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//使用gson将catagoryList转换为json
		Gson gson = new Gson();
		String json = gson.toJson(categoryList);
		System.out.println(json);
		response.getWriter().write(json);
	}
}