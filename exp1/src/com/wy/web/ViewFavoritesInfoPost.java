package com.wy.web;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wy.user.CartInfo;

public class ViewFavoritesInfoPost {
	public List<CartInfo> ViewFavoritesInfo(String user_id){
		List<CartInfo> favoriteslist =new ArrayList<CartInfo>();
		//List<String> insertinfo=new ArrayList<String>();
		ManageMySQL8 conn=new ManageMySQL8();
		String sql="select b.id favorites_id,a.id product_id,a.product_img,a.product_info,a.old_price,a.new_price,c.username from product_info a,favorites_info b,userinfo c where b.product_id=a.id and b.user_id=c.id and b.user_id="+user_id;
		ResultSet rs=conn.executeQuery(sql, null);
		try{
			while(rs.next()){
				CartInfo cartinfo=new CartInfo();
				cartinfo.setId(rs.getString("favorites_id"));
				cartinfo.setProduct_img(rs.getString("product_img"));
				cartinfo.setProduct_info(rs.getString("product_info"));
				cartinfo.setProduct_id(rs.getString("product_id"));
				cartinfo.setOld_price(rs.getString("old_price"));
				cartinfo.setNew_price(rs.getString("new_price"));
				favoriteslist.add(cartinfo);
			}
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}finally{
			conn.close();
		}
		return favoriteslist;
	}
}
