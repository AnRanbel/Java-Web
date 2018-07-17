package com.wy.web;

import java.io.IOException;
//import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wy.web.LoginDao;
import com.wy.user.UserInfo;


@WebServlet("/servlet/LoginServlet") 
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID=1L;

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		
		String name=request.getParameter("name");
		String pwd=request.getParameter("pwd");
		String sex=request.getParameter("sex");
		String tel=request.getParameter("tel");
		/*int userAge=0;
		if(age!=null&&!age.equals("")){
			userAge=Integer.parseInt(age);
		}*/
		String email=request.getParameter("email");
		String add=request.getParameter("add");
		
		UserInfo user=new UserInfo();
		user.setUserName(name);
		user.setUserPwd(pwd);
		user.setUserSex(sex);
		user.setUserTel(tel); 
		user.setUserEmail(email);
		user.setUserAdd(add);
		boolean flag=LoginDao.getInstance().saveUser(user);
		if(flag){
			request.getSession().setAttribute("userName", user.getUserName());
			request.getRequestDispatcher("/login_success.jsp").forward(request, response); 
		}else{
			//response.getWriter().print("<script type='text/javascript'>alert('usename has existed!')</script>");
			String basePath=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getContextPath() + "/";
			response.sendRedirect(basePath+"login_errorpage.jsp");
		}
	}

}
