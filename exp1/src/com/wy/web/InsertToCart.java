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
 * Servlet implementation class InsertTOCart
 */
@WebServlet("/servlet/InsertToCart")
public class InsertToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*response.getWriter().append("Served at: ").append(request.getContextPath());*/
		/*doPost(request,response);*/
		
		/*
		 * page��:��ǰҳ��
		 * request��:��������
		 * session��:���˶Ի�
		 * application��:������Ŀ
		 */
		
		String number=request.getParameter("number");
		HttpSession session=request.getSession();
		String product_id=(String)session.getAttribute("product_id");
		String user_id=(String)session.getAttribute("user_id");
		
		//�ж��û��Ƿ��½
		if(user_id==null){
			String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
			response.sendRedirect(basePath+"index.jsp");
			return;
		}
		
		List<String> insertinfo=new ArrayList<String>();
		ManageMySQL8 conn=new ManageMySQL8();
		String sql="insert into cart_info (user_id,product_id,number,batch_no) values(?,?,?,?)";
		insertinfo.add(user_id);
		insertinfo.add(product_id);
		insertinfo.add(number);
		insertinfo.add("20180709");
		
		int re=conn.executeUpdate(sql, insertinfo);
		//�����¼�Ѿ����ڣ�user_id��product_idΪΨһԼ����
		if(re==0){
			sql="update cart_info set number=number+? where product_id=? and user_id=?";
			insertinfo.clear();
			insertinfo.add(number);
			insertinfo.add(product_id);
			insertinfo.add(user_id);
			re=conn.executeUpdate(sql, insertinfo);
			if(re==1){
				response.getWriter().print("<script type='text/javascript'>alert('add to cart successful!')</script>");
			}
		}else{
			response.getWriter().print("<script type='text/javascript'>alert('add to cart successful!')</script>");
		}
		conn.close();	//�ر����ݿ�
		
		response.getWriter().print("<script type='text/javascript'>history.go(-1)</script>");	//�ص���һҳ(��������)
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
