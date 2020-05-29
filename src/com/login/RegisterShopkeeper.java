package com.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterShopkeeper")
public class RegisterShopkeeper extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		String Name = request.getParameter("name");
		String Shopname = request.getParameter("shopname");
		String Phone = request.getParameter("phone");
		String Shopadr = request.getParameter("shopadr");
		String City = request.getParameter("city");
		String Password = request.getParameter("password");
		
		String url="jdbc:mysql://localhost:3306/dkb_test";
		String uname="root";
		String pass="";
		
			try {
				Class.forName("com.mysql.jdbc.Driver");

				Connection conn = DriverManager.getConnection(url,uname,pass);
				String queryi = "insert into sk_list(name,shopname,phone,shopadr,city,password,date_) values('"+Name+"','"+Shopname+"','"+Phone+"','"+Shopadr+"','"+City+"',"
					 +"AES_ENCRYPT('"+Password+"',('secret')),'"+java.time.LocalDate.now()+"')" ;
				//System.out.println(queryi);
				String querys = "select sid from sk_list where phone='"+Phone+"'";
				Statement sti = conn.createStatement();
				Statement sts = conn.createStatement();
				int rsi = sti.executeUpdate(queryi);
				ResultSet rs=sts.executeQuery(querys);  
				System.out.println(rsi);
				rs.next();
				String sid1 =  rs.getInt(1) + "" ;
				String cid1 = "";
				//String s ="";
//		   java.time.LocalDate.now()
				String url1 = "dkbsignup.jsp?sid="+sid1+"&cid="+cid1;
				sti.close();
				conn.close();
				response.sendRedirect(url1);
			} catch (ClassNotFoundException e) {
				
				e.printStackTrace();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
	}

}
