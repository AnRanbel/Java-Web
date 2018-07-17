package com.wy.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BatchDelAndFav
 */
@WebServlet("/servlet/BatchDelAndFav")
public class BatchDelAndFav extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BatchDelAndFav() {
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
		String operate=request.getParameter("operate");
		String sql=null;
		ManageMySQL8 conn=new ManageMySQL8();
		String[] selected=request.getParameterValues("selected");
		String[] selected_fv=request.getParameterValues("selected-fav");
		int sum=selected.length;
		int re;
		if(operate.equals("batch_delete")){		//批量删除
			for(int i=0;i<sum;i++){
				sql="delete from cart_info where id="+selected[i];
				re=conn.executeUpdate(sql, null);
			}
			response.getWriter().print("<script type='text/javascript'>alert('delete from favorites successful!')</script>");
		}else if(operate.equals("batch_delete_fav")){	//从收藏夹批量删除
			for(int i=0;i<sum;i++){
				sql="delete from favorites_info where id="+selected[i];
				re=conn.executeUpdate(sql, null);
			}
			response.getWriter().print("<script type='text/javascript'>alert('delete from favorites successful!')</script>");
		}else{	//批量收藏
			List<String> insertinfo=new ArrayList<String>();
			HttpSession session=request.getSession();
			String user_id=(String)session.getAttribute("user_id");
			insertinfo.add("0");
			insertinfo.add("1");
			for(int i=0;i<sum;i++){
				sql="insert into favorites_info (user_id,product_id) values(?,?)";
				insertinfo.set(0,user_id);
				insertinfo.set(1,selected_fv[i]);
				re=conn.executeUpdate(sql, insertinfo);
			}
			response.getWriter().print("<script type='text/javascript'>alert('add to favorites successful!')</script>");
		}
		
		conn.close();	//关闭数据库
		response.getWriter().print("<script type='text/javascript'>window.location.href=document.referrer;</script>");	//回到上一页并刷新
	}

}
