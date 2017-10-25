package com.sh.domain;

public class Address {
	private String add_id;//地址编号
	private String uid;//用户id
	private String name;//收货人
	private String address;//收货地址
	private String phone;//联系方式
	
	public Address() {
		// TODO Auto-generated constructor stub
	}
	public Address(String add_id, String uid, String name, String address, String phone) {
		super();
		this.add_id = add_id;
		this.uid = uid;
		this.name = name;
		this.address = address;
		this.phone = phone;
	}
	public String getAdd_id() {
		return add_id;
	}
	public void setAdd_id(String add_id) {
		this.add_id = add_id;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "Address [add_id=" + add_id + ", uid=" + uid + ", name=" + name + ", address=" + address + ", phone="
				+ phone + "]";
	}
	
	
}
