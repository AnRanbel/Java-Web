package com.wy.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wy.user.ProductInfo;
import com.wy.web.GetProductInfoPost;

/**
 * Servlet implementation class GetProductInfo
 */
@WebServlet("/servlet/GetProductInfo")
public class GetProductInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetProductInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*response.getWriter().append("Served at: ").append(request.getContextPath());*/
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*doGet(request, response);*/
		String flag=request.getParameter("flag");
		String index=request.getParameter("index");
		String search=request.getParameter("search");
		
		GetProductInfoPost guip=new GetProductInfoPost();
		List<ProductInfo> infolist=null;
		
		if(search!=null){
			infolist=guip.GetProductInfo(flag,index,search);
		}else{
			infolist=guip.GetProductInfo(flag,index);
		}
		
		GetProductCountPost guip2=new GetProductCountPost();
		/*List<Integer> countlist=guip2.GetProductCount();*/
		int[] countlist=guip2.GetProductCount();
		
		request.setAttribute("infolist", infolist);
		request.setAttribute("countlist", countlist);
		
		request.getRequestDispatcher("/productinfo.jsp").forward(request, response);
	}

}
