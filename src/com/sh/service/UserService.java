package com.sh.service;

import java.sql.SQLException;
import java.util.List;

import com.sh.dao.ProductDao;
import com.sh.dao.UserDao;
import com.sh.domain.Address;
import com.sh.domain.User;

public class UserService {
	/**
	 * 注册
	 * @param user
	 * @return
	 */
	public boolean regist(User user) {

		UserDao dao = new UserDao();
		int row = 0;
		try {
			row = dao.regist(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return row > 0 ? true : false;
	}
	
	/**
	 * 激活
	 * @param activeCode
	 * @return
	 * @throws SQLException
	 */
	public boolean active(String activeCode) throws SQLException {
		UserDao dao = new UserDao();	
		int active = dao.active(activeCode);
		return active>0?true:false;
	}
	/**
	 * 校验用户名是否存在
	 * @param username
	 * @return
	 */
	public boolean checkUsername(String username) {
		UserDao dao = new UserDao();
		Long isExist = 0L;
		try {
			isExist = dao.checkUsername(username);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isExist>0?true:false;
	}

	public User login(String username, String password) throws SQLException {
		UserDao dao = new UserDao();
		User user = dao.login(username,password);
		return user;
	}
	
	/**
	 * 根据用户id查询收货地址
	 * @param uid
	 * @return
	 * @throws SQLException 
	 */
	public List<Address> findAddressListByUid(String uid) throws SQLException {
		UserDao dao = new UserDao();
		return dao.findAddressListByUid(uid);
	}

}
