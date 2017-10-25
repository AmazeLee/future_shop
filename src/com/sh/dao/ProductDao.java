package com.sh.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.sh.domain.Product;
import com.sh.utils.DataSourceUtils;
import com.sun.org.apache.bcel.internal.generic.NEW;
import com.sun.org.apache.bcel.internal.generic.Select;

public class ProductDao {

	/**
	 * 查找热门商品
	 * @return
	 * @throws SQLException 
	 */
	public List<Product> findHotProductList() throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from product where is_hot=? limit ?,?";
		List<Product> hotProductList= runner.query(sql, new BeanListHandler<Product>(Product.class),1,0,8);
		return hotProductList;
	}
	/**
	 * 查找最新商品
	 * @return
	 * @throws SQLException
	 */
	public List<Product> findNewProductList() throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from product order by pdate desc limit ?,?";
		List<Product> newProductList= runner.query(sql, new BeanListHandler<Product>(Product.class),0,3);
		return newProductList;
	}
	/**
	 * 根据cid查找该类商品数量
	 * @param cid
	 * @return
	 * @throws SQLException
	 */
	public int getCount(String cid) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select count(*) from product where cid=?";
		Long query = (Long) runner.query(sql, new ScalarHandler(),cid);
		return query.intValue();
	}
	/**
	 * 根据cid进行搜索分页查找
	 * @param cid
	 * @param index
	 * @param pageSize
	 * @return
	 * @throws SQLException
	 */
	public List<Product> findProductListBycid(String cid, int index, int pageSize) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from product where cid=? limit ?,?";
		List<Product> list = runner.query(sql, new BeanListHandler<Product>(Product.class),cid,index,pageSize);
		return list;
	}
	
	/**
	 * 根据pid查询商品
	 * @param pid
	 * @return
	 * @throws SQLException
	 */
	public Product findProductByPid(String pid) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from product where pid=?";
		Product product = runner.query(sql,new BeanHandler<Product>(Product.class),pid);
		return product;
	}
	/**
	 * 根据关键词查询符合条件商品数量
	 * @param productWord
	 * @return
	 * @throws SQLException 
	 */
	public int getCountByWord(String productWord) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select count(*) from product where pname like ?";
		Long query = (Long) runner.query(sql, new ScalarHandler(),"%"+productWord+"%");
		return query.intValue();
	}
	
	/**
	 * 根据关键词进行搜索分页查找
	 * @param productWord
	 * @param index
	 * @param pageSize
	 * @return
	 * @throws SQLException 
	 */
	public List<Product> findProductListByWord(String productWord, int index, int pageSize) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from product where pname like ? limit ?,?";
		List<Product> list = runner.query(sql, new BeanListHandler<Product>(Product.class),"%"+productWord+"%",index,pageSize);
		return list;
	}
	

}
