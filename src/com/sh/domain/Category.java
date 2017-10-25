package com.sh.domain;
/**
 * 商品种类
 * @author Administrator
 *
 */
public class Category {

	private String cid;//种类ID
	private String cname;//种类名
	
	public Category() {
		// TODO Auto-generated constructor stub
	}
	public Category(String cid, String cname) {
		super();
		this.cid = cid;
		this.cname = cname;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	
	
	
}
