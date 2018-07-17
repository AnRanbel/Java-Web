package com.wy.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteFavoritesInfo
 */
@WebServlet("/servlet/DeleteFavoritesInfo")
public class DeleteFavoritesInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFavoritesInfo() {
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
					sql="delete from favorites_info where user_id="+user_id;
				}else{
					sql="delete from favorites_info where id="+delete_id;
				}
				int re=conn.executeUpdate(sql, null);		//返回的是受影响的行数
				/*if(re==1){
					response.getWriter().print("<script type='text/javascript'>alert('delete from favorites successful!')</script>");
				}else{
					response.getWriter().print("<script type='text/javascript'>alert('delete from favorites failed!')</script>");
				}*/
				response.getWriter().print("<script type='text/javascript'>alert('delete from favorites successful!')</script>");
				conn.close();	//关闭数据库
				
				//response.getWriter().print("<script type='text/javascript'>history.back(-1);location.reload()</script>");	//回到上一页并刷新
				response.getWriter().print("<script type='text/javascript'>window.location.href=document.referrer;</script>");
	}

}
