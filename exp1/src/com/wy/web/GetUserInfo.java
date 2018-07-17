package com.wy.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wy.web.GetUserInfoPost;
import com.wy.user.UserInfo;

/**
 * Servlet implementation class GetUserInfo
 */
@WebServlet("/servlet/GetUserInfo")
public class GetUserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		HttpSession session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		GetUserInfoPost guip=new GetUserInfoPost();
		UserInfo userinfo=guip.GetUserInfo(user_id);
		request.setAttribute("userinfo", userinfo);
		
		request.getRequestDispatcher("//really_login_success.jsp").forward(request, response);
	}

}
