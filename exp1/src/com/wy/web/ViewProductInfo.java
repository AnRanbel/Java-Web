package com.wy.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wy.user.ProductInfo;
import com.wy.web.ViewProductInfoPost;

/**
 * Servlet implementation class ViewProductInfo
 */
@WebServlet("/servlet/ViewProductInfo")
public class ViewProductInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewProductInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*response.getWriter().append("Served at: ").append(request.getContextPath());*/
		
		/*request.setAttribute("infolist", infolist);*/
		
		ViewProductInfoPost guip=new ViewProductInfoPost();
		String product_id=request.getParameter("id");
		List<ProductInfo> viewinfo=guip.ViewProductInfo(product_id);
		request.setAttribute("viewinfo", viewinfo);
		
		//获取根路径
		//String url="localhost:8085/exp1/viewproductinfo.jsp?id="+id;
		//String url="http://localhost:8085/exp1/viewproductinfo.jsp?id="+id;
		//response.sendRedirect(url);
		
		HttpSession session=request.getSession();
		session.setAttribute("product_id", product_id);
		request.getRequestDispatcher("/viewproductinfo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
