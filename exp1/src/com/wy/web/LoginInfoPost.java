package com.wy.web;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.wy.user.UserInfo;

/**�����ݿ�����¼**/

public class LoginInfoPost {
	
	//�����û�ע����Ϣ
	public boolean saveUser(UserInfo user){
 		ManageMySQL8 conn=new ManageMySQL8();
 		String sql=null;
 		int re=0;
 		ResultSet rs=null;
		try{
			//�ж��û����Ƿ���ע��
			sql="select * from userinfo where username='"+user.getUserName()+"'";
			rs=conn.executeQuery(sql,null);
			if(rs.next()){
				return false;
			}else{
				List<String> list=new ArrayList<String>();
				list.add(user.getUserName());
				list.add(user.getUserPwd());
				list.add(user.getUserSex());
				list.add(user.getUserTel());
				list.add(user.getUserEmail());
				list.add(user.getUserAdd());
				sql="insert into userinfo(username,password,sex,telephone,email,address) values(?,?,?,?,?,?)";
				re=conn.executeUpdate(sql,list);
				return true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			conn.close();
		}
		return false;
	}
}
