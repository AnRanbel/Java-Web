package com.wy.web;

import java.sql.DriverManager;		//�̳���Object��DriverManager�࣬����JDBC��������Ļ�������
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class ManageMySQL8 {
	//���ݿ��ַ��jdbc:mysql://����������:�˿ں�/���ݿ����ơ�
    private String url = "jdbc:mysql://localhost:3306/users?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8";
    //�û���
    private String user = "root";
    //�û�����
    private String pwd = "qw123456";
    //���ݿ����Ӷ���
    private java.sql.Connection conn;		//Connection�ӿ�
    //���ݿ�����ִ�ж���
    private PreparedStatement pstmt;	//PreparedStatement�ӿڣ�Ԥ����SQL���
    //���ݿⷵ�ؽ��
    private java.sql.ResultSet rs;	//ResultSet�ӿڣ�ִ�����ݿ��ѯ�󷵻صĽ�������������ڵ�һ��
    
    //��̬�����
    static{
        //1����������
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");	/**1.���ص���һ����
    													*2.Ҫ��JVM���Ҳ�����ָ������
    													*Ҳ����˵JVM��ִ�и���ľ�̬
    													*�����
    													*/
        } catch (ClassNotFoundException e) {
            
            e.printStackTrace();
        }
    }
    
    //2����������
    private void getConnection(){
        if(conn == null){
            try {
                conn = DriverManager.getConnection(url, user, pwd);	//�����ݿ⽨������
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    //ִ�ж�������������ѯ��
    public java.sql.ResultSet executeQuery(String query,
                    List<String> params){
        getConnection();
        try {
            //3����������ִ�ж���
            pstmt = conn.prepareStatement(query);	//����������SQL��䷢�͵����ݿ�,����PreparedStatement
            //4��ִ��
            //����ռλ��?
            if(params!=null && params.size()>0){
                for(int i=0;i<params.size();i++){
                    pstmt.setObject(i+1, params.get(i));
                }
            }
            rs = pstmt.executeQuery();	//ִ��PreparedStatement�����е�SQL��䣬������ResultSex����
        } catch (SQLException e) {
            e.printStackTrace();
        }/*finally{
            //6���ͷ���Դ
            this.close();
        }*/
        return rs;
    }
    
    //ִ��д������������ɾ�ģ�
    public int executeUpdate(String query,
            List<String> params){
        int result = 0;
        getConnection();
        try {
            //3����������ִ�ж���
            pstmt = conn.prepareStatement(query);
            //4��ִ��
            if(params!=null && params.size()>0){
                for(int i=0;i<params.size();i++){
                    pstmt.setObject(i+1, params.get(i));//ʹ�ø�����������ָ��������ֵ
                    
                   /*// ʹ��ռλ����SQl���
                   String sql = "insert into customers(name,email,birth)"
                            + "values(?,?,?)";
                   // ʹ��preparedStatement��setXxx��������ÿһ��λ���ϵ�ֵ
                   preparedStatement = connection.prepareStatement(sql);
                   // ����name�ֶ�
                   preparedStatement.setString(1, "ATGUIGU");
                   // ����email�ֶ�
                   preparedStatement.setString(2, "simale@163.com");
                   // ����birth�ֶ�
                   preparedStatement.setDate(3,
                   new Date(new java.util.Date().getTime()));*/
                }
            }
            //5��������
            result = pstmt.executeUpdate();/**ִ��PreparedStatement�����е�SQL��䣬ֻ����DML
             								*���ݲ������Ե���䣨insert,update,delete��;����ʲ
             								*ô�������أ�����DDL��䡣
             								*����1����DML��������
             								*����0����nothing
             								*/
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            //6���ͷ���Դ
            this.close();
        }
        return result;
    }

    
    //�ر���Դ
    public void close(){        
            try {
                if(rs!=null){
                    rs.close();			//�����ͷŴ�ResultSet��������ݿ��JDBC��Դ
                    rs = null;
                }
                if(pstmt!=null){
                    pstmt.close();
                    pstmt = null;		//�����ͷŴ�Statement��������ݿ��JDBC��Դ
                }
                if(conn!=null){
                    conn.close();		//�����ͷŴ�Connection��������ݿ��JDBC��Դ
                    conn = null;
                }
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        
        }

}
