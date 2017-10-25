package com.sh.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.sh.dao.OrderDao;
import com.sh.domain.Address;
import com.sh.domain.Order;
import com.sh.domain.OrderItem;
import com.sh.utils.DataSourceUtils;

public class OrderService {
	/**
	 * 提交订单
	 * 将订单数据和订单项数据存储到数据库中
	 * @param order
	 */
	public void submitOrder(Order order) {
		OrderDao dao = new OrderDao();
		try {
			//1、开启事务
			DataSourceUtils.startTransaction();
			//2、调用dao存储order表数据的方法
			dao.addOrders(order);
			//3、调用dao存储orderItem表数据的方法
			dao.addOrderItem(order);
		} catch (SQLException e) {
			//回滚
			try {
				DataSourceUtils.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			//提交并关闭资源
			try {
				DataSourceUtils.commitAndRelease();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 根据地址id查询地址
	 * @param add_id 
	 * @return
	 * @throws SQLException 
	 */
	public Address findAddressById(String add_id) throws SQLException {
		OrderDao dao = new OrderDao();
		return dao.findAddressById(add_id);
	}
	
	/**
	 * 更新订单地址数据
	 * @param order
	 */
	public void updateOrderAdrr(Order order) {
		OrderDao dao = new OrderDao();
		try {
			dao.updateOrderAdrr(order);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 修改订单状态
	 * @param r6_Order
	 */
	public void updateOrderState(String r6_Order) {
		OrderDao dao = new OrderDao();
		try {
			dao.updateOrderState(r6_Order);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 获得指定用户的订单集合
	 * @param uid
	 * @return
	 */
	public List<Order> findAllOrders(String uid) {
		OrderDao dao = new OrderDao();
		List<Order> orderList = null;
		try {
			orderList = dao.findAllOrders(uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderList;
	}
	
	/**
	 * 根据订单ID查询订单项集合
	 * @param oid
	 * @return
	 */
	public List<Map<String, Object>> findAllOrderItemByOid(String oid) {
		OrderDao dao = new OrderDao();
		List<Map<String, Object>> mapList = null;
		try {
			mapList = dao.findAllOrdersItemByOid(oid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mapList;
	}

}
