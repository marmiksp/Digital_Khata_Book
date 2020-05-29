
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import=" java.sql.Connection" %> 
  <%@  page import="java.sql.*" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>SK Add Item</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src=" https://code.jquery.com/jquery-3.3.1.js"></script>

<link rel="stylesheet" href="CSS/dkbheader.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" >
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>


<script>
            function openNav() {
            document.getElementById("mySidenav").style.width = "220px";
            }
            
            function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
            }
            
            function cldrp()
            {
            document.getElementById("mySidenav").style.width = "0";
            }
            
           

</script>


</head>
<body>

<%
    String name = (String)session.getAttribute("name");
    String shopname = (String)session.getAttribute("shopname");
    String phone = (String)session.getAttribute("phone");
    int sid = (int)session.getAttribute("sid");
    if(session.getAttribute("name")==null)
    {
         response.sendRedirect("dkblogin.jsp");
    }
%>

<div class="container-fluid" >

      <div class="row">
                <div class="col-sm-12" style="background-color:#e6fff2;  height:50px; "   onclick="cldrp()">
                
              <center><b style="padding-top:10px; font-size:27px ; color: #00331a;">Digital Khata Book </b>
                <i class="material-icons" style="font-size: 36px; vertical-align:top;">
                menu_book
                </i></center>
                </div>
      </div>

 
 

<div class="row">
<div class="col-sm-1"  style="background-color: #66ffb3;">

    <div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>



  <a href="SkWelcome.jsp"><b >Home</b></a>
  <a href="dkbshowcust.jsp"><b style="color:#c65353;">Show Customers</b></a>
  <a href="dkbaddcust.jsp"><b>Add Customers</b></a>
  <a href="#"><b>Add Items</b></a>
  
</div>


<span style="font-size:30px;cursor:pointer; color:black;" onclick="openNav()">&#9776; </span>

</div>

<div class="col-sm-9"  style="background-color: #66ffb3;" onclick="cldrp()" >
<p  style="font-size:17px;"> <b style=" padding-left:300px;">Shopname</b> : <%=shopname%>    
<b style="padding-left:15px;">Name</b> : <%= name %>    <b style="padding-left:15px;">Phone</b> : <%= phone %>

</p>
          
         
</div>
<div class="col-sm-2"  style="background-color: #66ffb3;" onclick="cldrp()" >
<form action="Logout" style="padding-top:3px; padding-left:100px;"><button type="submit" class="btn btn-primary" >LOGOUT</button></form>        
         
</div>
</div>


    
    <%
    String st = (String)session.getAttribute("username");
    if(session.getAttribute("username")==null)
    {
        //response.sendRedirect("Login.jsp");
    }
    
    String url="jdbc:mysql://localhost:3306/dkb_test";
    String uname="root";
    String pass="";
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url,uname,pass);
    String qry = "select itemid as ItemId, itemname as ItemName, price as Price, Date_ as UpdateDate from item_list where sid="+ sid ;
    PreparedStatement ps=conn.prepareStatement(qry);  
    ResultSet rs=ps.executeQuery();  
  
    
    ResultSetMetaData rsmd=rs.getMetaData();
    
    
    %>
    
   
    <div class="row" style=" padding-top:10px; ">
    <div class="col-sm-5" style="border-right:2px solid black;">

    <div style="margin-left:25px; margin-top:20px;">
    <h3 style="text-align:center; ">Add Item</h3>    <br>
     <form action="AddItem" onsubmit=" return true;">
     <table>
     
     <tr><td>Item Name :</td>
     
     <td> <input type="text" size=30 name="itemname" required></td></tr>
 
     <tr ><td style="padding-top:15px;">Price :</td><td style="padding-top:15px;"> 
     
     <input type="number" size=40 name="price" required></td></tr>
         
     </table>
     <button type="submit" class="btn btn-success"  style="margin-top:10px;float:right;margin-right:60px;">
     ADD</button>
     </form>
     </div>
     <br>
     <br>
     <hr>
     
     <div style="margin-left:25px;">
    <h3 style="text-align:center; ">Remove Item</h3>    <br>
     <form action="RemoveItem" onsubmit=" return true;">
     <table>
     
     <tr >
     <td style="padding-top:15px;">Item ID :</td>
     <td style="padding-top:15px;">  <input type="number" size=40 name="itemid" required></td>
     
     
     </tr>
         
     </table>
     <button type="submit" class="btn btn-danger"  style="margin-top:10px;float:right;margin-right:60px;">
     Remove</button>
     </form>
     </div>
      <br>
     <br>
     <hr>

        
    </div>
    <div class="col-sm-7" style="height:450px;">
 
    <h3 style="text-align:center; ">Items List</h3>
   
    
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
    
    %> 
    <tr>

    <td><%= (int)rs.getInt(1) %></td>
    <td><%= (String)rs.getString(2) %></td>
    <td><%= (int)rs.getInt(3)%></td>
    <td><%= (String)rs.getString(4) %></td>
   
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
    
    <br><br>








</div>
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