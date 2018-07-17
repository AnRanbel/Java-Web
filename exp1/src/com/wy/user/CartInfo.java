package com.wy.user;

public class CartInfo {
	private String product_img;
	private String product_info;
	private String product_id;
	private String old_price;
	private String new_price;
	private String number;
	private String id;
	
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public String getProduct_info() {
		return product_info;
	}
	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getOld_price() {
		return old_price;
	}
	public void setOld_price(String old_price) {
		this.old_price = old_price;
	}
	public String getNew_price() {
		return new_price;
	}
	public void setNew_price(String new_price) {
		this.new_price = new_price;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "CartInfo [product_img=" + product_img + ", product_info=" + product_info + ", product_id=" + product_id
				+ ", old_price=" + old_price + ", new_price=" + new_price + ", number=" + number + ", id=" + id + "]";
	}
	
	
}
