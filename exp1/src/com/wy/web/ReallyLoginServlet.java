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
		//建立PreparedStatement对象
		Connection conn=null;	
		conn=MySQLDBCon.getCon();  //建立数据库连接
		
		try{
			//String sql="select * from userinfo where username=? and password=?";
			//String info[]={name,pwd};
			//PreparedStatement pstmt=conn.prepareStatement(sql);*/
			String sql="select * from userinfo where username='"+name+"' and password='"+pwd+"'";
			
			
			//PreparedStatement pstmt=conn.prepareStatement(sql);	//创建用户操作执行
			Statement pstmt=conn.createStatement();
			ResultSet rs=pstmt.executeQuery(sql);
			//pstmt.executeUpdate();		//编译执行insert语句
			boolean flag=rs.next();
			if(flag){
				//request.getSession().setAttribute("username", name);
				
				//处理重定向(url地址变到重定向的页面；效率低，类似于html中的超链接)
				//response.sendRedirect("/really_login_success.jsp");
				
				//创建session对象
				HttpSession session=request.getSession();
				//把用户名和ID保存在session域对象中
				session.setAttribute("username", name);
				String user_id=Integer.toString(rs.getInt(1));
				session.setAttribute("user_id", user_id);
				
				//把用户信息存入Attribute域中
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
				if(userConstellation==null){		//只能用空指针判断，不能equals("")
					userinfo.setUserConstellation("other");
				}else{
					userinfo.setUserConstellation(rs.getString("constellation"));
				}
				request.setAttribute("userinfo", userinfo);
				//处理转发页面(url地址不变)
				request.getRequestDispatcher("/really_login_success.jsp").forward(request, response); 
			}else{
				/*//request.getSession().setAttribute("error_message", "用户名或密码错误，请重新登录!");
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

/**JSP九大隐藏对象
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

