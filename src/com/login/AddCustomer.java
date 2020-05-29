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


@WebServlet("/AddCustomer")
public class AddCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		int Cid = Integer.parseInt(request.getParameter("cid"));
		String Phone = request.getParameter("phone");
		HttpSession session = request.getSession(false);
		int Sid = (int)session.getAttribute("sid");
		
		String url="jdbc:mysql://localhost:3306/dkb_test";
		String uname="root";
		String pass="";
		//System.out.println(Password);
			try {
				
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url,uname,pass);
				
				String queryi ;
				//System.out.println(queryi);
				String querys = "select phone,cid from cust_list where cid="+Cid+"";
				Statement sti = conn.createStatement();
				Statement sts = conn.createStatement();
				int rsi ;
				ResultSet rs=sts.executeQuery(querys);  
				
				rs.next();
				String PhoneR =  rs.getString(1) ;
				//String cid1 = "";
				//String s ="";
//		   java.time.LocalDate.now()
			//	System.out.println(PasswordR);
				
				String url1;
				System.out.println("hello");
				System.out.println(Phone);
				System.out.println(PhoneR);
				if(Phone.equals(PhoneR))
				{
					System.out.println(Phone);
					System.out.println(PhoneR);
					queryi = "insert into sk_cust(sid,cid) values("+Sid+","+Cid+")" ;
					rsi = sti.executeUpdate(queryi);
					System.out.println(rsi);
					url1 = "SkWelcome.jsp" ;
					System.out.println(Phone);
					//System.out.println(PasswordR);
					sts.close();
					sti.close();
					conn.close();
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
