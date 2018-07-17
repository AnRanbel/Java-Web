package com.wy.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class InsertToFavorites
 */
@WebServlet("/servlet/InsertToFavorites")
public class InsertToFavorites extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertToFavorites() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*response.getWriter().append("Served at: ").append(request.getContextPath());*/
		
		String product_id=request.getParameter("product_id");
		HttpSession session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		
		List<String> insertinfo=new ArrayList<String>();
		ManageMySQL8 conn=new ManageMySQL8();
		String sql="insert into favorites_info (user_id,product_id) values(?,?)";
		insertinfo.add(user_id);
		insertinfo.add(product_id);
		
		int re=conn.executeUpdate(sql, insertinfo);
		//如果记录已经存在（user_id与product_id为唯一约束）
		if(re==0){
			response.getWriter().print("<script type='text/javascript'>alert('this product has existed in favorites!')</script>");
		}else{
			response.getWriter().print("<script type='text/javascript'>alert('add to favorites successful!')</script>");
		}
		conn.close();	//关闭数据库
		
		response.getWriter().print("<script type='text/javascript'>history.go(-1)</script>");	//回到上一页(保留参数)
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
