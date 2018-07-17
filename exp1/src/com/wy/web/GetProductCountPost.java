package com.wy.web;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GetProductCountPost {

	public int[] GetProductCount(){
		
		String sql=null;
		int flag=0;
		List<String> searchlist=new ArrayList<String>();
		//searchlist.add("product_type");
		searchlist.add("1");
		ManageMySQL8 conn=new ManageMySQL8();
		/*List<Integer> countlist=new ArrayList<Integer>();*/
		int[] countlist=new int[19];
		
		//product_type总数(5)
		for(int i=0;i<5;i++){
			sql="select count(*) from (select * from product_info where product_type=?) record";
			//searchlist.set(0,"product_type");
			searchlist.set(0,""+(i+1));
			ResultSet rs=conn.executeQuery(sql,searchlist);
			try{
				while(rs.next()){
					/*countlist.add(Integer.valueOf(rs.getInt(1)));*/
					countlist[flag++]=rs.getInt(1);
				}
			}catch(SQLException e){
				e.printStackTrace();
				conn.close();
				return null;
			}
		}
		//product_brand总数(8)
		for(int i=0;i<8;i++){
			sql="select count(*) from (select * from product_info where product_brand=?) record";
			//searchlist.set(0, "product_brand");
			searchlist.set(0, ""+(i+1));
			ResultSet rs=conn.executeQuery(sql, searchlist);
			try{
				while(rs.next()){
					/*countlist.add(Integer.valueOf(rs.getInt(1)));*/
					countlist[flag++]=rs.getInt(1);
				}
			}catch(SQLException e){
				e.printStackTrace();
				conn.close();
				return null;
			}
		}
		//product_price总数(6)
		for(int i=0;i<6;i++){
			switch (i){
			case 0:
				sql="select count(*) from product_info where new_price<200 and new_price>=0";
				break;
			case 1:
				sql="select count(*) from product_info where new_price>=200 and new_price<400";
				break;
			case 2:
				sql="select count(*) from product_info where new_price>=400 and new_price<600";
				break;
			case 3:
				sql="select count(*) from product_info where new_price>=600 and new_price<800";
				break;
			case 4:
				sql="select count(*) from product_info where new_price>=800 and new_price<1000";
				break;
			default:
				sql="select count(*) from product_info where new_price>=1000";
				break;
			}
			/*//searchlist.set(0, "new_price");
			searchlist.set(0, ""+(i+1));*/
			ResultSet rs=conn.executeQuery(sql, null);
			try{
				while(rs.next()){
					/*countlist.add(Integer.valueOf(rs.getInt(1)));*/
					countlist[flag++]=rs.getInt(1);
				}
			}catch(SQLException e){
				e.printStackTrace();
				conn.close();
				return null;
			}
		}
		
		conn.close();
		return countlist;
	}
}
