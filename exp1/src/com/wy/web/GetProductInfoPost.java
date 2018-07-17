package com.wy.web;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.wy.user.ProductInfo;

public class GetProductInfoPost {

public List<ProductInfo> GetProductInfo(String flag,String index){
		
		List<ProductInfo> infolist=new ArrayList<ProductInfo>();
		ManageMySQL8 conn=new ManageMySQL8();
		String sql=null;
		ResultSet rs=null;
		List<String> searchlist=new ArrayList<String>();
		searchlist.add("0");
		//System.out.println(sql);
		
		
		if(flag.equals("ALL")){
			sql="select * from product_info";
			rs=conn.executeQuery(sql,null);
		}else{
			/*String[] flag_re=flag.split("-");*/
			if(flag.equals("Volleyball")||flag.equals("Volleyball Court")||flag.equals("Sport Shoes")||flag.equals("Sport Suit")||flag.equals("Categories_Other")){
				sql="select * from product_info where product_type=?;";
				searchlist.set(0, index);
				rs=conn.executeQuery(sql,searchlist);
			}else if(flag.equals("Mikasa")||flag.equals("ASICS")||flag.equals("NIKE")||flag.equals("Adidas")||flag.equals("Li-Ning")||flag.equals("ANTA")||flag.equals("XTEP")||flag.equals("Brands_Other")){
				sql="select * from product_info where product_brand=?;";
				searchlist.set(0, index);
				rs=conn.executeQuery(sql,searchlist);
			}else if(flag.equals("0$-200$")||flag.equals("200$-400$")||flag.equals("400$-600$")||flag.equals("600$-800$")||flag.equals("800$-1000$")||flag.equals("1000以上")){
				int price=Integer.valueOf(index);
				switch(price){
				case 1:
					sql="select * from product_info where new_price<200 and new_price>=0";
					break;
				case 2:
					sql="select * from product_info where new_price>=200 and new_price<400";
					break;
				case 3:
					sql="select * from product_info where new_price>=400 and new_price<600";
					break;
				case 4:
					sql="select * from product_info where new_price>=600 and new_price<800";
					break;
				case 5:
					sql="select * from product_info where new_price>=800 and new_price<1000";
					break;
				default:
					sql="select * from product_info where new_price>=1000";
					break;
				}
				rs=conn.executeQuery(sql,null);
			}
		}
		try{
			while(rs.next()){
				ProductInfo info=new ProductInfo();
				//通过索引或列名获得结果集中某列的值
				info.setId(rs.getString("id"));
				info.setProduct_type(rs.getString("product_type"));
				info.setProduct_brand(rs.getString("product_brand"));
				info.setProduct_name(rs.getString("product_name"));
				info.setOld_price(rs.getString("old_price"));
				info.setNew_price(rs.getString("new_price"));
				info.setProduct_info(rs.getString("product_info"));
				info.setProduct_img(rs.getString("product_img"));
				
				infolist.add(info);
			}
			return infolist;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			conn.close();
		}
	}

public List<ProductInfo> GetProductInfo(String flag,String index,String search){
	
	List<ProductInfo> infolist=new ArrayList<ProductInfo>();
	ManageMySQL8 conn=new ManageMySQL8();
	String sql=null;
	ResultSet rs=null;
	List<String> searchlist=new ArrayList<String>();
	searchlist.add("0");
	//System.out.println(sql);
	
	
	if(flag.equals("ALL")){
		sql="select * from product_info where product_info like '%"+search+"%';";
		rs=conn.executeQuery(sql,null);
	}else{
		/*String[] flag_re=flag.split("-");*/
		if(flag.equals("Volleyball")||flag.equals("Volleyball Court")||flag.equals("Sport Shoes")||flag.equals("Sport Suit")||flag.equals("Categories_Other")){
			sql="select * from product_info where product_type=? and product_info like '%"+search+"%';";
			searchlist.set(0, index);
			rs=conn.executeQuery(sql,searchlist);
		}else if(flag.equals("Mikasa")||flag.equals("ASICS")||flag.equals("NIKE")||flag.equals("Adidas")||flag.equals("Li-Ning")||flag.equals("ANTA")||flag.equals("XTEP")||flag.equals("Brands_Other")){
			sql="select * from product_info where product_brand=? and product_info like '%"+search+"%';";
			searchlist.set(0, index);
			rs=conn.executeQuery(sql,searchlist);
		}else if(flag.equals("0$-200$")||flag.equals("200$-400$")||flag.equals("400$-600$")||flag.equals("600$-800$")||flag.equals("800$-100$")||flag.equals("1000以上")){
			int price=Integer.valueOf(index);
			switch(price){
			case 1:
				sql="select * from product_info where new_price<200 and new_price>=0 and product_info like '%"+search+"%';";
				break;
			case 2:
				sql="select * from product_info where new_price>=200 and new_price<400 and product_info like '%"+search+"%';";
				break;
			case 3:
				sql="select * from product_info where new_price>=400 and new_price<600 and product_info like '%"+search+"%';";
				break;
			case 4:
				sql="select * from product_info where new_price>=600 and new_price<800 and product_info like '%"+search+"%';";
				break;
			case 5:
				sql="select * from product_info where new_price>=800 and new_price<1000 and product_info like '%"+search+"%';";
				break;
			default:
				sql="select * from product_info where new_price>=1000 and product_info like '%"+search+"%';";
				break;
			}
			rs=conn.executeQuery(sql,null);
		}
	}
	try{
		while(rs.next()){
			ProductInfo info=new ProductInfo();
			//通过索引或列名获得结果集中某列的值
			info.setId(rs.getString("id"));
			info.setProduct_type(rs.getString("product_type"));
			info.setProduct_brand(rs.getString("product_brand"));
			info.setProduct_name(rs.getString("product_name"));
			info.setOld_price(rs.getString("old_price"));
			info.setNew_price(rs.getString("new_price"));
			info.setProduct_info(rs.getString("product_info"));
			info.setProduct_img(rs.getString("product_img"));
			
			infolist.add(info);
		}
		return infolist;
	}catch(Exception e){
		e.printStackTrace();
		return null;
	}finally{
		conn.close();
	}
}
}
