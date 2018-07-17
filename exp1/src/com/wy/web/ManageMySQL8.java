package com.wy.web;

import java.sql.DriverManager;		//继承自Object的DriverManager类，管理JDBC驱动程序的基础服务
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class ManageMySQL8 {
	//数据库地址“jdbc:mysql://服务器域名:端口号/数据库名称”
    private String url = "jdbc:mysql://localhost:3306/users?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8";
    //用户名
    private String user = "root";
    //用户密码
    private String pwd = "qw123456";
    //数据库链接对象
    private java.sql.Connection conn;		//Connection接口
    //数据库命令执行对象
    private PreparedStatement pstmt;	//PreparedStatement接口，预编译SQL语句
    //数据库返回结果
    private java.sql.ResultSet rs;	//ResultSet接口，执行数据库查询后返回的结果集，最初光标在第一行
    
    //静态代码块
    static{
        //1、加载驱动
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");	/**1.返回的是一个类
    													*2.要求JVM查找并加载指定的类
    													*也就是说JVM会执行该类的静态
    													*代码段
    													*/
        } catch (ClassNotFoundException e) {
            
            e.printStackTrace();
        }
    }
    
    //2、创建连接
    private void getConnection(){
        if(conn == null){
            try {
                conn = DriverManager.getConnection(url, user, pwd);	//与数据库建立连接
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    //执行读操作方法（查询）
    public java.sql.ResultSet executeQuery(String query,
                    List<String> params){
        getConnection();
        try {
            //3、创建命令执行对象
            pstmt = conn.prepareStatement(query);	//将参数化的SQL语句发送到数据库,返回PreparedStatement
            //4、执行
            //处理占位符?
            if(params!=null && params.size()>0){
                for(int i=0;i<params.size();i++){
                    pstmt.setObject(i+1, params.get(i));
                }
            }
            rs = pstmt.executeQuery();	//执行PreparedStatement对象中的SQL语句，并返回ResultSex对象
        } catch (SQLException e) {
            e.printStackTrace();
        }/*finally{
            //6、释放资源
            this.close();
        }*/
        return rs;
    }
    
    //执行写操作方法（增删改）
    public int executeUpdate(String query,
            List<String> params){
        int result = 0;
        getConnection();
        try {
            //3、创建命令执行对象
            pstmt = conn.prepareStatement(query);
            //4、执行
            if(params!=null && params.size()>0){
                for(int i=0;i<params.size();i++){
                    pstmt.setObject(i+1, params.get(i));//使用给定对象设置指定参数的值
                    
                   /*// 使用占位符的SQl语句
                   String sql = "insert into customers(name,email,birth)"
                            + "values(?,?,?)";
                   // 使用preparedStatement的setXxx方法设置每一个位置上的值
                   preparedStatement = connection.prepareStatement(sql);
                   // 设置name字段
                   preparedStatement.setString(1, "ATGUIGU");
                   // 设置email字段
                   preparedStatement.setString(2, "simale@163.com");
                   // 设置birth字段
                   preparedStatement.setDate(3,
                   new Date(new java.util.Date().getTime()));*/
                }
            }
            //5、处理结果
            result = pstmt.executeUpdate();/**执行PreparedStatement对象中的SQL语句，只能是DML
             								*数据操纵语言的语句（insert,update,delete）;或者什
             								*么都不返回，比如DDL语句。
             								*返回1——DML语句的行数
             								*返回0——nothing
             								*/
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            //6、释放资源
            this.close();
        }
        return result;
    }

    
    //关闭资源
    public void close(){        
            try {
                if(rs!=null){
                    rs.close();			//主动释放此ResultSet对象的数据库和JDBC资源
                    rs = null;
                }
                if(pstmt!=null){
                    pstmt.close();
                    pstmt = null;		//主动释放此Statement对象的数据库和JDBC资源
                }
                if(conn!=null){
                    conn.close();		//主动释放此Connection对象的数据库和JDBC资源
                    conn = null;
                }
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        
        }

}
