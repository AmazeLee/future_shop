package com.sh.service;

import java.sql.SQLException;
import java.util.List;

import com.sh.dao.CategoryDao;
import com.sh.domain.Category;

public class CategoryService {
	/**
	 * 查找所有商品分类
	 * @return
	 * @throws SQLException 
	 */
	public List<Category> findAllCategoryList() throws SQLException {
		CategoryDao dao = new CategoryDao();
		return dao.findAllCategoryList();
	}

}
