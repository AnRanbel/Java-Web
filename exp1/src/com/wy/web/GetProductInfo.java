package com.wy.web;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wy.user.ProductInfo;

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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*response.getWriter().append("Served at: ").append(request.getContextPath());*/
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*doGet(request, response);*/
        String flag0=request.getParameter("flag0");
		String flag=request.getParameter("flag");
		String index=request.getParameter("index");
		String search=request.getParameter("search");
		String elements=null;
		String page=request.getParameter("page");
		String sort=request.getParameter("sort");
		
		GetProductInfoPost guip=new GetProductInfoPost();
		List<ProductInfo> infolist=null;
		
		if(search!=null){       //关键字搜索商品
			infolist=guip.GetProductInfo(flag,index,search,page,request,sort);
			request.setAttribute("search",search);
		}else{
			infolist=guip.GetProductInfo(flag,index,page,request,sort);
		}

		//计算各分类商品总数
		GetProductCountPost guip2=new GetProductCountPost();
		/*List<Integer> countlist=guip2.GetProductCount();*/
		int[] countlist=guip2.GetProductCount();

		//计算（分类查看）elements——分页功能
        if(!flag.equals("ALL")&&search==null){      //分类查看
            int base=guip2.getSingleCount(flag0,index);
            elements= String.valueOf(countlist[base]);
            request.setAttribute("elements",elements);
		}

		request.setAttribute("infolist", infolist);
		request.setAttribute("countlist", countlist);
		request.setAttribute("page",page);
		
		request.getRequestDispatcher("/productinfo.jsp").forward(request, response);
	}

}
