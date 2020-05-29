<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ page import=" java.sql.Connection" %> 
      <%@  page import="java.sql.*" %>
    <%@ page isErrorPage="true" %>  
  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <script src=" https://code.jquery.com/jquery-3.3.1.js"></script>
   <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
  
 
<style>

</style>
<title>Insert title here</title>
</head>
<body>
  <%
  		String st = (String)session.getAttribute("username");
  		if(session.getAttribute("username")==null)
  		{
  			//response.sendRedirect("Login.jsp");
  		}
  		
  		String url="jdbc:mysql://localhost:3306/vgec_dbms_sql";
		String uname="root";
		String pass="";
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url,uname,pass);
		PreparedStatement ps=conn.prepareStatement("select * from deposit");  
		ResultSet rs=ps.executeQuery();  
		ResultSetMetaData rsmd=rs.getMetaData();
  		
  		
  %>
  <% if(exception != null){ %>
  <h3>Sorry an exception occured!</h3>  
  	  
  		Exception is: <%= exception %> <%} %> 
  Welcome... <c:out value="<%=st %>"></c:out>
  <%="" + session.getAttribute("username")%><br><br>
  <div class="row">
  <div class="col-sm-2"></div>
  <div class="col-sm-8">
     
  <table id="example" class="row-border hover order-column" style="width:100%;">
  <thead>
  <tr>
  <% int i;
     for(i=1;i<=rsmd.getColumnCount();i++)
	  {
	  %> 
    <th><%=rsmd.getColumnName(i) %></th> 
    <%} %>
   
  </tr>
  </thead>
  <tbody>
 <%  i=0;
 while(rs.next())
	  {
	    String dat =  "" + rs.getDate(5);
	  %> 
  <tr>
    
    <td><%= (int)rs.getInt(1) %></td>
    <td><%= (String)rs.getString(2) %></td>
    <td><%= (String)rs.getString(3) %></td>
    <td><%= (int)rs.getInt(4) %></td>
    <td><%= dat %></td>
  </tr>
  <% } %>
  </tbody>

<tfoot>
  <tr>
  <% 
     for(i=1;i<=rsmd.getColumnCount();i++)
	  {
	  %> 
    <th><%=rsmd.getColumnName(i) %></th> 
    <%} %>
   
  </tr>
  </tfoot>
</table>
  
  </div>
  <div class="col-sm-2"></div>
</div>
 
  <br><br>
  <form action="Logout">
	<input type="submit" value="Logout1">
	</form>
  
  
  <script >
  $(document).ready(function() {
	    var table = $('#example').DataTable();
	     
	    $('#example tbody')
	        .on( 'mouseenter', 'td', function () {
	            var colIdx = table.cell(this).index().column;
	 
	            $( table.cells().nodes() ).removeClass( 'highlight' );
	            $( table.column( colIdx ).nodes() ).addClass( 'highlight' );
	        } );
	} );
  </script>
  
  
</body>
</html>