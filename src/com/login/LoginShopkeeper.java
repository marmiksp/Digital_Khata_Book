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
import javax.servlet.http.HttpSession;


@WebServlet("/LoginShopkeeper")
public class LoginShopkeeper extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int Sid = Integer.parseInt(request.getParameter("sid"));
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
				String querys = "select name,shopname,phone,AES_DECRYPT(password,'secret') AS Password from sk_list where sid="+Sid+"";
			//	Statement sti = conn.createStatement();
				Statement sts = conn.createStatement();
				//int rsi = sti.executeUpdate(queryi);
				ResultSet rs=sts.executeQuery(querys);  
			//	System.out.println(rsi);
				
				if(rs.next())
				{
				String PasswordR =  rs.getString(4) ;
				String Name = rs.getString(1);
				String Shopname = rs.getString(2);
				String Phone = rs.getString(3);
				
				//String cid1 = "";
				//String s ="";
//		   java.time.LocalDate.now()
				System.out.println(PasswordR);
				
				sts.close();
				conn.close();
				String url1;
			
				if(Password.equals(PasswordR))
				{
					url1 = "SkWelcome.jsp" ;
					HttpSession session = request.getSession(true);
					session.setAttribute("name", Name);
					session.setAttribute("shopname", Shopname);
					session.setAttribute("phone", Phone);
					session.setAttribute("sid", Sid);
					
					
					System.out.println(PasswordR);
					response.sendRedirect(url1);
				}else
				{
					response.sendRedirect("dkblogin.jsp");
					System.out.println(PasswordR);
				}
				}else
				{
					response.sendRedirect("dkblogin.jsp");
					
				}
				
				//String url1 = "Index.jsp?sid="+sid1+"&cid="+cid1;
				
				
			} catch (ClassNotFoundException e) {
				
				e.printStackTrace();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
	}

}
