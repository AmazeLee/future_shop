package com.sh.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.sh.domain.Category;
import com.sh.domain.Product;
import com.sh.utils.DataSourceUtils;

public class CategoryDao {
	/**
	 * 查询商品类别
	 * @return
	 * @throws SQLException
	 */
	public List<Category> findAllCategoryList() throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from category";
		List<Category> categoryList= runner.query(sql, new BeanListHandler<Category>(Category.class));
		return categoryList;
	}

}
