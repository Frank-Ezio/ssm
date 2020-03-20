package com.xiaoshu.entity;

public class GoodsType {
	private String typenum;
	private Integer price;
	public String getTypenum() {
		return typenum;
	}
	public void setTypenum(String typenum) {
		this.typenum = typenum;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public GoodsType() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GoodsType(String typenum, Integer price) {
		super();
		this.typenum = typenum;
		this.price = price;
	}
	
	
}
