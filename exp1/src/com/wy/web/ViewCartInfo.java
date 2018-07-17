package com.wy.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wy.user.CartInfo;

/**
 * Servlet implementation class ViewCartInfo
 */
@WebServlet("/servlet/ViewCartInfo")
public class ViewCartInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewCartInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*response.getWriter().append("Served at: ").append(request.getContextPath());*/
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*doGet(request, response);*/
		
		HttpSession session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		
		//ÅÐ¶ÏÓÃ»§ÊÇ·ñµÇÂ½
		if(user_id==null){
			String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
			response.sendRedirect(basePath+"index.jsp");
			return;
		}
		
		ViewCartInfoPost guip=new ViewCartInfoPost();
		List<CartInfo> cartlist=guip.ViewCartInfo(user_id);
		
		request.setAttribute("cartlist", cartlist);
		request.getRequestDispatcher("/cartinfo.jsp").forward(request, response);
	}

}
