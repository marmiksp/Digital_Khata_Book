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


@WebServlet("/AddItem")
public class AddItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
		int Price = Integer.parseInt(request.getParameter("price"));
		String Itemname = request.getParameter("itemname");
		
		HttpSession session = request.getSession(false);
		int Sid = (int)session.getAttribute("sid");
		
		String url="jdbc:mysql://localhost:3306/dkb_test";
		String uname="root";
		String pass="";
		//System.out.println(Password);
			try {
				
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url,uname,pass);
			
				String querys = "insert into item_list(sid,itemname,price,Date_) "
						+ "values('"+Sid+"','"+Itemname+"','"+Price+"','"+java.time.LocalDate.now()+"')";
				Statement sti = conn.createStatement();
				
				int rsi = sti.executeUpdate(querys);
				
				sti.close();
				conn.close();
			    if(rsi>0){
					String url1 = "dkbskadditem.jsp" ;
					response.sendRedirect(url1);
				}
				
				
				
			} catch (ClassNotFoundException e) {
				
				e.printStackTrace();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		
		
	}

}
