package com.sh.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.sh.domain.Address;
import com.sh.domain.Product;
import com.sh.domain.User;
import com.sh.utils.DataSourceUtils;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class UserDao {
	
	/**
	 * 注册
	 * @param user
	 * @return
	 * @throws SQLException
	 */
	public int regist(User user) throws SQLException {
		
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "insert into user values(?,?,?,?,?,?,?,?,?,?)";
		int update = runner.update(sql, user.getUid(), user.getUsername(), user.getPassword(), user.getName(),
				user.getEmail(), user.getTelephone(), user.getBirthday(), user.getSex(), user.getState(),
				user.getCode());
		return update;
	}
	/**
	 * 激活
	 * @param activeCode
	 * @throws SQLException 
	 */
	public int active(String activeCode) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "update user set state=? where code=?";
		int update = runner.update(sql,1,activeCode);
		return update;
	}
	
	/**
	 * 校验用户名是否存在
	 * @param username
	 * @return
	 * @throws SQLException 
	 */
	public Long checkUsername(String username) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select count(*) from user where username=?";
		Long query = (Long) runner.query(sql, new ScalarHandler(), username);
		return query;
	}
	
	/**
	 * 查询用户名和密码是否存在进行登录
	 * @param username
	 * @param password
	 * @return
	 * @throws SQLException
	 */
	public User login(String username, String password) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from user where username=? and password=?";
		User user = runner.query(sql, new BeanHandler<User>(User.class), username,password);
		return user;
	}
	/**
	 * 根据用户id查询收货地址
	 * @param uid 
	 * @return
	 * @throws SQLException 
	 */
	public List<Address> findAddressListByUid(String uid) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from address where uid=?";
		List<Address> addressList= runner.query(sql, new BeanListHandler<Address>(Address.class),uid);
		return addressList;
	}
}
