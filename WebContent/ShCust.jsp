<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page import=" java.sql.Connection" %> 
<%@ page import="java.sql.*" %>
<%@ page isErrorPage="true" %>  
  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
  text-align:center;
}
</style>
<title>ShCust</title>
</head>
<body>
       <%
		  String name = (String)session.getAttribute("name");
		  String shopname = (String)session.getAttribute("shopname");
			String phone = (String)session.getAttribute("phone");
			if(session.getAttribute("name")==null)
			{
				response.sendRedirect("Index.jsp");
			}
  		
  		String url="jdbc:mysql://localhost:3306/dkb_test";
		String uname="root";
		String pass="";
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url,uname,pass);
		PreparedStatement ps=conn.prepareStatement("select * from cust_list");  
		ResultSet rs=ps.executeQuery();  
		ResultSetMetaData rsmd=rs.getMetaData(); 
  		
		
  		 if(exception != null)
  		 { 
  		 %>
		  <h3>Sorry an exception occured!</h3>  
		  	  
		  Exception is: <%= exception %>
		<%} 
		
  		int id = Integer.parseInt(request.getParameter("det"));
		%> 
		  Welcome... <%="" + session.getAttribute("name")%> _ <%= id %>
		  <br>
		  <br>
		  
		  
		  <table style="width:80%">
		  <tr>
		  <% 
		  int i;
		     
		  for(i=1;i<=rsmd.getColumnCount();i++)
			{
		    	 if(i==2 || i==3 || i==5 || i==7)
		    	 {
				  %> 
			    <th><%=rsmd.getColumnName(i) %></th> 
			   <% } 
		    	 
			}  %>
		   
		  </tr>
		 <%  i=0;
		 while( rs.next())
			  {
			    String dat =  "" + rs.getDate(7);
			  %> 
		  <tr>
		    
		   
		    <td><%= (String)rs.getString(2) %></td>
		    <td><%= (String)rs.getString(3) %></td>
		    <td><%= (String)rs.getString(5) %></td>
		    <td><%= dat %></td>
		  </tr>
		<%} %>
		</table>
		  
		  <br><br>
		  <form action="Logout">
			<input type="submit" value="Logout1">
			</form>
		  
</body>
</html>