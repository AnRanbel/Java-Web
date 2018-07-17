package com.wy.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteCartInfo
 */
@WebServlet("/servlet/DeleteCartInfo")
public class DeleteCartInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCartInfo() {
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
		
		//判断用户是否登陆
		HttpSession session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		if(user_id==null){
			String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
			response.sendRedirect(basePath+"index.jsp");
			return;
		}
		
		String delete_id=request.getParameter("delete_id");
		ManageMySQL8 conn=new ManageMySQL8();
		String sql=null;
		if(delete_id.equals("ALL")){	//全部删除
			sql="delete from cart_info where user_id="+user_id;
		}else{
			sql="delete from cart_info where id="+delete_id;
		}
		int re=conn.executeUpdate(sql, null);
		response.getWriter().print("<script type='text/javascript'>alert('delete from cart successful!')</script>");
		/*if(re==1){
			response.getWriter().print("<script type='text/javascript'>alert('delete from cart successful!')</script>");
		}else{
			response.getWriter().print("<script type='text/javascript'>alert('delete from cart failed!')</script>");
		}*/
		conn.close();	//关闭数据库
		
		//response.getWriter().print("<script type='text/javascript'>history.back(-1);location.reload()</script>");	//回到上一页并刷新
		response.getWriter().print("<script type='text/javascript'>window.location.href=document.referrer;</script>");
	}

}
