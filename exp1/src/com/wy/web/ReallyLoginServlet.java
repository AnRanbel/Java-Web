package com.wy.web;

import java.io.IOException;
import java.sql.Connection;
//import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wy.user.UserInfo;
//import com.wy.web.LoginDao;
//import com.wy.user.UserInfo;
import com.wy.web.MySQLDBCon;

@WebServlet("/servlet/ReallyLoginServlet")
public class ReallyLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		
		String name=request.getParameter("name");
		String pwd=request.getParameter("pwd");
		//����PreparedStatement����
		Connection conn=null;	
		conn=MySQLDBCon.getCon();  //�������ݿ�����
		
		try{
			//String sql="select * from userinfo where username=? and password=?";
			//String info[]={name,pwd};
			//PreparedStatement pstmt=conn.prepareStatement(sql);*/
			String sql="select * from userinfo where username='"+name+"' and password='"+pwd+"'";
			
			
			//PreparedStatement pstmt=conn.prepareStatement(sql);	//�����û�����ִ��
			Statement pstmt=conn.createStatement();
			ResultSet rs=pstmt.executeQuery(sql);
			//pstmt.executeUpdate();		//����ִ��insert���
			boolean flag=rs.next();
			if(flag){
				//request.getSession().setAttribute("username", name);
				
				//�����ض���(url��ַ�䵽�ض����ҳ�棻Ч�ʵͣ�������html�еĳ�����)
				//response.sendRedirect("/really_login_success.jsp");
				
				//����session����
				HttpSession session=request.getSession();
				//���û�����ID������session�������
				session.setAttribute("username", name);
				String user_id=Integer.toString(rs.getInt(1));
				session.setAttribute("user_id", user_id);
				
				//���û���Ϣ����Attribute����
				UserInfo userinfo=new UserInfo();
				userinfo.setUserName(rs.getString("username"));
				userinfo.setUserPwd(rs.getString("password"));
				String userSex=rs.getString("sex");
				if(userSex==null){
					userinfo.setUserSex("other");
				}else{
					userinfo.setUserSex(rs.getString("sex"));
				}
				userinfo.setUserTel(rs.getString("telephone"));
				userinfo.setUserEmail(rs.getString("email"));
				userinfo.setUserAdd(rs.getString("address"));
				userinfo.setUserRealName(rs.getString("realname"));
				userinfo.setUserDeliveryAddress(rs.getString("deliveryaddress"));
				userinfo.setUserBirthday(rs.getString("birthday"));
				String userConstellation=rs.getString("constellation");
				if(userConstellation==null){		//ֻ���ÿ�ָ���жϣ�����equals("")
					userinfo.setUserConstellation("other");
				}else{
					userinfo.setUserConstellation(rs.getString("constellation"));
				}
				request.setAttribute("userinfo", userinfo);
				//����ת��ҳ��(url��ַ����)
				request.getRequestDispatcher("/really_login_success.jsp").forward(request, response); 
			}else{
				/*//request.getSession().setAttribute("error_message", "�û�����������������µ�¼!");
				request.getRequestDispatcher("/really_login_errorpage.jsp").forward(request, response); */
				String basePath=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getContextPath() + "/";
				response.sendRedirect(basePath+"really_login_errorpage.jsp");
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
	}

}

/**JSP�Ŵ����ض���
 * request
 * response
 * out
 * session
 * application
 * config
 * page
 * config
 * Exception
 * pageContext
 */

