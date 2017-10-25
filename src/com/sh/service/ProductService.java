package com.sh.service;

import java.sql.SQLException;
import java.util.List;

import com.sh.dao.ProductDao;
import com.sh.domain.PageBean;
import com.sh.domain.Product;

public class ProductService {
	
	/**
	 * 查找热门商品
	 * @return
	 * @throws SQLException 
	 */
	public List<Product> findHotProductList() throws SQLException {
		ProductDao dao = new ProductDao();
		return dao.findHotProductList();
	}
	/**
	 * 查找最新商品
	 * @return
	 * @throws SQLException 
	 */
	public List<Product> findNewProductList() throws SQLException {
		ProductDao dao = new ProductDao();
		return dao.findNewProductList();
	}
	/**
	 * 分页查找
	 * @param cid
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public PageBean findProductListBycid(String cid, int currentPage, int pageSize) {
		ProductDao dao = new ProductDao();
		// 封装一个PageBean 返回web层
		PageBean<Product> pageBean = new PageBean<Product>();
		

		// 1.封装当前页
		pageBean.setCurrentPage(currentPage);
		// 2.封装每页显示的条数
		pageBean.setPageSize(pageSize);
		// 3.封装总条数
		int totalCount = 0;
		try {
			totalCount = dao.getCount(cid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		pageBean.setTotalCount(totalCount);
		//4.封装总页数
		int totalPage = (int) Math.ceil(1.0*totalCount/pageSize);
		pageBean.setTotalPage(totalPage);
		//5.当前页显示的数据
		int index = (currentPage-1)*pageSize;
		List<Product> list = null;
		try {
			list = dao.findProductListBycid(cid,index,pageSize);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		pageBean.setList(list);
		return pageBean;
	}
	/**
	 * 根据关键词进行查找
	 * @param productWord
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	public PageBean findProductListByWord(String productWord, int currentPage, int pageSize) {
		ProductDao dao = new ProductDao();
		// 封装一个PageBean 返回web层
		PageBean<Product> pageBean = new PageBean<Product>();
		

		// 1.封装当前页
		pageBean.setCurrentPage(currentPage);
		// 2.封装每页显示的条数
		pageBean.setPageSize(pageSize);
		// 3.封装总条数
		int totalCount = 0;
		try {
			totalCount = dao.getCountByWord(productWord);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		pageBean.setTotalCount(totalCount);
		//4.封装总页数
		int totalPage = (int) Math.ceil(1.0*totalCount/pageSize);
		pageBean.setTotalPage(totalPage);
		//5.当前页显示的数据
		int index = (currentPage-1)*pageSize;
		List<Product> list = null;
		try {
			list = dao.findProductListByWord(productWord,index,pageSize);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		pageBean.setList(list);
		return pageBean;
	}
	
	/**
	 * 根据pid查询商品
	 * @param pid
	 * @return
	 */
	public Product findProductByPid(String pid) {
		ProductDao dao = new ProductDao();
		Product product = null;
		try {
			product = dao.findProductByPid(pid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return product;
	}
	
	
}
