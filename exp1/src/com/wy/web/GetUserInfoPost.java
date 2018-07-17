package com.wy.web;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.wy.web.ManageMySQL8;
import com.wy.user.UserInfo;

public class GetUserInfoPost {
	
	public UserInfo GetUserInfo(String user_id){
		
		UserInfo userinfo=new UserInfo();
		ManageMySQL8 conn=new ManageMySQL8();
		
		String sql="select * from userinfo where id="+user_id;
		//System.out.println(sql);
		ResultSet rs=conn.executeQuery(sql,null);
		try{
			while(rs.next()){
				userinfo.setUserName(rs.getString("username"));
				userinfo.setUserEmail(rs.getString("email"));
				userinfo.setUserPwd(rs.getString("password"));
				userinfo.setUserSex(rs.getString("sex"));
				userinfo.setUserTel(rs.getString("telephone"));
				userinfo.setUserAdd(rs.getString("address"));
			}
			return userinfo;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			conn.close();
		}
	}

}
