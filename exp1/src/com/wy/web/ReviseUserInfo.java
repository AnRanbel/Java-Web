package com.wy.web;

import java.io.IOException;
import java.sql.ResultSet;
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
 * Servlet implementation class ReviseUserInfo
 */
@WebServlet("/servlet/ReviseUserInfo")
public class ReviseUserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviseUserInfo() {
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
		
		request.setCharacterEncoding("UTF-8");	//����Ҫ������request.getParameter������Ϊ����
		
		String username=request.getParameter("username");
		String email=request.getParameter("email");
		String pwd=request.getParameter("pwd");
		String tel=request.getParameter("tel");
		
		String add=request.getParameter("add");
		String sex=request.getParameter("sex");
		if(sex.equals("other")){
			sex=null;		//null��""���ɻ��ã�
		}
		String realname=request.getParameter("realname");
		String deliveryaddress=request.getParameter("deliveryaddress");
		String birthday=request.getParameter("birthday");
		String constellation=request.getParameter("constellation");
		if(constellation.equals("other")){
			constellation=null;
		}
		
		//��ȡ��¼�û�ID���û���
		HttpSession session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");		//�������ݿ��ĸ��²�����where+�����ֶ�
		String current_username=(String)session.getAttribute("username");
		String sql=null;
		ManageMySQL8 conn=new ManageMySQL8();
		//�ж��û����Ƿ��Ѿ�ע��
		sql="select * from userinfo where username='"+username+"'";
		ResultSet rs=conn.executeQuery(sql, null);
		try{
			if((!username.equals(current_username))&&rs.next()){	//�û��������Ҳ�Ϊ��ǰ�û�
				conn.close();
				response.getWriter().print("<script type='text/javascript'>alert('usename has existed!')</script>");
				response.getWriter().print("<script type='text/javascript'>history.back(-1);</script>");	//�ص���һҳ��ˢ��
				return;
			}
		}catch(SQLException e){
			conn.close();
			e.printStackTrace();
		}
		
		//�޸����ݱ�
		sql="update userinfo set username=?,password=?,sex=?,telephone=?,email=?,address=?,realname=?,deliveryaddress=?,birthday=?,constellation=? where id=?";
		List<String> insertinfo=new ArrayList<String>();
		insertinfo.add(username);
		insertinfo.add(pwd);
		insertinfo.add(sex);
		insertinfo.add(tel);
		insertinfo.add(email);
		insertinfo.add(add);
		insertinfo.add(realname);
		insertinfo.add(deliveryaddress);
		insertinfo.add(birthday);
		insertinfo.add(constellation);
		insertinfo.add(user_id);
		int re=conn.executeUpdate(sql, insertinfo);
		conn.close();
		
		//�ص���¼�������µ�¼
		session.invalidate();
		response.getWriter().print("<script type='text/javascript'>alert('revise successful!please login again!')</script>");
		String url=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
		response.sendRedirect(url);
	}

}
