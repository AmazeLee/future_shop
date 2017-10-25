package com.sh.dao;


import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import com.sh.domain.Address;
import com.sh.domain.Order;
import com.sh.domain.OrderItem;
import com.sh.domain.Product;
import com.sh.utils.DataSourceUtils;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class OrderDao {
	
	/**
	 * 向orders表插入数据
	 * @param order
	 * @throws SQLException 
	 */
	public void addOrders(Order order) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into orders values(?,?,?,?,?,?,?,?)";
		Connection conn = DataSourceUtils.getConnection();
		runner.update(conn,sql, order.getOid(),order.getOrdertime(),order.getTotal(),order.getState(),
				order.getAddress(),order.getName(),order.getTelephone(),order.getUser().getUid());
	}
	
	/**
	 * 向orderItem表插入数据
	 * @param order
	 * @throws SQLException 
	 */
	public void addOrderItem(Order order) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into orderitem values(?,?,?,?,?)";
		Connection conn = DataSourceUtils.getConnection();
		List<OrderItem> orderItems = order.getOrderItems();
		for(OrderItem item : orderItems){
			runner.update(conn,sql,item.getItemid(),item.getCount(),item.getSubtotal(),item.getProduct().getPid(),item.getOrder().getOid());
		}
	}
	/**
	 * 根据地址ID查询地址
	 * @param add_id
	 * @return
	 * @throws SQLException 
	 */
	public Address findAddressById(String add_id) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from address where add_id=?";
		Address address = runner.query(sql,new BeanHandler<Address>(Address.class),add_id);
		return address;
	}
	/**
	 * 更新订单地址数据
	 * @param order
	 * @throws SQLException 
	 */
	public void updateOrderAdrr(Order order) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "update orders set address=?,name=?,telephone=? where oid=?";
		runner.update(sql, order.getAddress(),order.getName(),order.getTelephone(),order.getOid());
	}
	
	/**
	 * 修改订单状态
	 * @param r6_Order
	 * @throws SQLException 
	 */
	public void updateOrderState(String r6_Order) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "update orders set state=? where oid=?";
		runner.update(sql,1,r6_Order);
		
	}
	
	/**
	 * 查询指定用户的订单集合
	 * @param uid
	 * @return
	 * @throws SQLException 
	 */
	public List<Order> findAllOrders(String uid) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from orders where uid=?";
		return runner.query(sql,new BeanListHandler<Order>(Order.class),uid);
	}
	
	/**
	 * 根据订单id查询订单项集合
	 * @param oid
	 * @return
	 * @throws SQLException 
	 */
	public List<Map<String, Object>> findAllOrdersItemByOid(String oid) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select i.count,i.subtotal,p.pimage,p.pname,p.shop_price from orderitem i,product p where i.pid=p.pid and i.oid=?";
		List<Map<String, Object>> mapList = runner.query(sql, new MapListHandler(), oid);
		return mapList;
	}

}
