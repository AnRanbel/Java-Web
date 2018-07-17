package com.wy.web;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.wy.web.MySQLDBCon;
import com.wy.user.UserInfo;

/**�����ݿ�����¼**/

public class LoginDao {
	private static LoginDao instance=null;
	
	public static LoginDao getInstance(){
		if(instance==null){
			instance=new LoginDao();
		}
		return instance;
	}
	
	//�����û�ע����Ϣ
	public boolean saveUser(UserInfo user){
 		Connection conn=null;
 		String sql=null;
 		PreparedStatement pstmt=null;
 		int re=0;
 		ResultSet rs=null;
		try{
			conn=MySQLDBCon.getCon();  //�������ݿ�����
			
			//�ж��û����Ƿ���ע��
			sql="select * from userinfo where username='"+user.getUserName()+"'";
			pstmt=conn.prepareStatement(sql);	//�����û�����ִ��
			rs=pstmt.executeQuery(sql);
			if(rs.next()){
				return false;
			}else{
				sql="insert into userinfo(username,password,sex,telephone,email,address) values(?,?,?,?,?,?)";
				pstmt=conn.prepareStatement(sql);	//�����û�����ִ��
				pstmt.setString(1, user.getUserName());
				pstmt.setString(2, user.getUserPwd());
				pstmt.setString(3, user.getUserSex());
				pstmt.setString(4, user.getUserTel());
				pstmt.setString(5, user.getUserEmail());
				pstmt.setString(6, user.getUserAdd());
				re=pstmt.executeUpdate();		//����ִ��insert���
				return true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return false;
	}
}
