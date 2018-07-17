package com.wy.web;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.wy.user.ProductInfo;

public class ViewProductInfoPost {

public List<ProductInfo> ViewProductInfo(String id){
		
		List<ProductInfo> viewinfo=new ArrayList<ProductInfo>();
		ManageMySQL8 conn=new ManageMySQL8();
		String sql=null;
		
		sql="select * from product_info where id='"+id+"'";
		
		//System.out.println(sql);
		ResultSet rs=conn.executeQuery(sql,null);
		try{
			while(rs.next()){
				ProductInfo info=new ProductInfo();
				info.setId(rs.getString("id"));
				info.setProduct_type(rs.getString("product_type"));
				info.setProduct_name(rs.getString("product_name"));
				info.setOld_price(rs.getString("old_price"));
				info.setNew_price(rs.getString("new_price"));
				info.setProduct_info(rs.getString("product_info"));
				info.setProduct_img(rs.getString("product_img"));
				viewinfo.add(info);
			}
			return viewinfo;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			conn.close();
		}
	}
}
