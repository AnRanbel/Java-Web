package com.wy.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class QuitUserServlet
 */
@WebServlet("/servlet/QuitUserServlet")
public class QuitUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuitUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*response.getWriter().append("Served at: ").append(request.getContextPath());*/
		String condition=request.getParameter("condition");
		HttpSession session=request.getSession();
		if(condition.equals("quit")){
			session.invalidate(); 	//清空所有属性
			//或者
			//session.removeAttribute("user_id");
			//session.removeAttribute("username");
			String basePath=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getContextPath() + "/";
			response.sendRedirect(basePath);
		}else if(condition.equals("delete")){
			
			String user_id=(String)session.getAttribute("user_id");
			ManageMySQL8 conn=new ManageMySQL8();
			String sql="delete from userinfo where id="+user_id;
			int re=conn.executeUpdate(sql,null);
			if(re==1){
				response.getWriter().print("<script type='text/javascript>alert('quit successful!')</script>");
			}else{
				response.getWriter().print("<script type='text/javascript>alert('quit failed!')</script>");
			}
			session.invalidate(); 	//清空所有属性
			String basePath=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ request.getContextPath() + "/";
			response.sendRedirect(basePath);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
