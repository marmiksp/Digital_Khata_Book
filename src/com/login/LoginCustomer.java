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


@WebServlet("/LoginCustomer")
public class LoginCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int Cid = Integer.parseInt(request.getParameter("cid"));
		String Password = request.getParameter("pass");
		
		String url="jdbc:mysql://localhost:3306/dkb_test";
		String uname="root";
		String pass="";
		System.out.println(Password);
			try {
				
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url,uname,pass);
				
				//String queryi = "insert into sk_list(name,shopname,phone,shopadr,city,password,date_) values('"+Name+"','"+Shopname+"','"+Phone+"','"+Shopadr+"','"+City+"',"
					// +"AES_ENCRYPT('"+Password+"',('secret')),'"+java.time.LocalDate.now()+"')" ;
				//System.out.println(queryi);
				String querys = "select AES_DECRYPT(password,'secret') AS Password from cust_list where cid="+Cid+"";
			//	Statement sti = conn.createStatement();
				Statement sts = conn.createStatement();
				//int rsi = sti.executeUpdate(queryi);
				ResultSet rs=sts.executeQuery(querys);  
			//	System.out.println(rsi);
				rs.next();
				String PasswordR =  rs.getString(1) ;
				//String cid1 = "";
				//String s ="";
//		   java.time.LocalDate.now()
				System.out.println(PasswordR);
				sts.close();
				conn.close();
				String url1;
				if(Password.equals(PasswordR))
				{
					url1 = "dkblogin.jsp" ;
					System.out.println(PasswordR);
					response.sendRedirect(url1);
				}
				//String url1 = "Index.jsp?sid="+sid1+"&cid="+cid1;
				
				
			} catch (ClassNotFoundException e) {
				
				e.printStackTrace();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
	}

}
