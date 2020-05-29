
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
    <%@ page import=" java.sql.Connection" %> 
    
      <%@  page import="java.sql.*" %>
      <%@  page import="java.util.*" %>
    <%@ page isErrorPage="true" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SkHome</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <style>

table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
 
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}

.drop1btn {
  background-color: #4CAF50;
  color: white;
  padding: 8px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

.drop1btn:hover, .drop1btn:focus {
  background-color: #3e8e41;
}

#myInput {
  box-sizing: border-box;
  background-image: url('searchicon.png');
  background-position: 10px 12px;
  background-repeat: no-repeat;
  font-size: 16px;
  padding-top:12px;
  padding-bottom:12px;
  padding-left:6px;
  padding-right:6px;
  border: none;
  border-bottom: 1px solid #ddd;
}

#myInput:focus {outline: 3px solid #ddd;}

.drop1down {
  position: relative;
  display: inline-block;
}

.drop1down-content {
  display: none;
  position: absolute;
  background-color: #f6f6f6;
  min-width: 100px;
  overflow: auto;
  border: 1px solid #ddd;
  z-index: 1;
}

.drop1down-content a {
  color: black;
  padding-top:12px;
  padding-bottom:12px;
  padding-left:6px;
  padding-right:6px;
  
  text-decoration: none;
  display: block;
}


.drop1down a:hover {background-color: #ddd;}

.show {display: block;}

.scrollable-menu {
    height: auto;
    max-height: 200px;
    overflow-x: hidden;
}
li 
{
list-style:none;
}
</style>
  
</head>
<body>
	<%@ include file="dkbheader.jsp" %>
	<%
	    String name = (String)session.getAttribute("name");
	    String shopname = (String)session.getAttribute("shopname");
		String phone = (String)session.getAttribute("phone");
		 int sid = (int)session.getAttribute("sid");
		if(session.getAttribute("name")==null)
		{
			 response.sendRedirect("dkblogin.jsp");
		}
		
		 String url="jdbc:mysql://localhost:3306/dkb_test";
	        String uname="root";
	        String pass="";
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection conn = DriverManager.getConnection(url,uname,pass);
	        String qry = "select itemid, itemname , price  from item_list where sid="+ sid;
	        String qry2 = "select cid from sk_cust where sid = "+ sid;
	        PreparedStatement ps=conn.prepareStatement(qry);  
	        ResultSet rs=ps.executeQuery();  
	        PreparedStatement pscli=conn.prepareStatement(qry2);  
	        ResultSet rscli=pscli.executeQuery();
	        
	        
	        ArrayList<Integer> list=new ArrayList<Integer>();
	        while(rscli.next())
	        { 
				int idt =  (int)rscli.getInt(1);
				list.add(idt);
	        }	
	      
	        
		
	%>
	
	 
	 	
<div class="row">
    <div class="col-sm-1"  style="background-color: #66ffb3;">
	
		<div id="mySidenav" class="sidenav">
	  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	
	  <a href="SkWelcome.jsp"><b style="color:#c65353;">Home</b></a>
	  <a href="dkbshowcust.jsp"><b>Show Customers</b></a>
	  <a href="dkbaddcust.jsp"><b>Add Customers</b></a>
	  <a href="dkbskadditem.jsp"><b>Add Items</b></a>
	  
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
 
  <br>
 
<div class="row" >
  <div class="col-sm-12" style="text-align:center;">
  <b style="font-size:30px;">Total : </b><b id="total" style="font-size:30px;" > 0 </b> <br><br>
  <b style=" font-size:20px;">
    Enter CID : 
  </b>
  
  
  <input type="text"  id="cid1" onkeyup="validatecid()" > 
  <i class="material-icons" id="correct" style="vertical-align:middle; color:white;">
  check
  </i>
  
  </div>
  </div>
</div><br>
<div class="row" >
  <div class="col-sm-6" >
			<div class="drop1down" style="margin-left:300px; height:350px;">
			<button onclick="myFunction()" class="drop1btn">Item List</button>
			<input type="text" placeholder="1" id="ct" value="1">
			<button onclick="addi()" style="background-color:">GO</button>
			<div id="myDropdown" class="drop1down-content">
			<input type="text" placeholder="Search.." value="" id="myInput" onkeyup="filterFunction()">
			<ul class="drop1down-menu scrollable-menu" role="menu">
			<%  
			while(rs.next())
	        { 
				int idt =  (int)rs.getInt(1);
				int pr = (int)rs.getInt(3);
				String ina = (String)rs.getString(2);
	        %> 
			
			<li> <a id=<%=idt%> onclick="my(this.id)"><%=ina%> | <%=pr%></a></li>
			
			<% 
	        }
	        %> 
			</ul>
		
			</div>
			</div>
			
			<form action="Addbill" onsubmit="return con1()" style="padding-left: 400px;">
			<button type="submit" class="btn btn-success"  >SUBMIT</button>
			</form>
			

  </div>
  <div class="col-sm-6"  style="border-left:2px solid black;">
    <table id="myTable" style="float:right; border:1px solid black; margin-right:300px; margin-top:0px;">   
    <tr>
		<th>Item Name</th>
		<th>Price</th>
		<th>Quantity</th>
    </tr>

	</table>
  </div>
 
</div>


<br>
<br>
<br>
<br>
 

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
                
               
                
                function myFunction() {
                	  document.getElementById("myDropdown").classList.toggle("show");
                	}

                	function filterFunction() {
                	  var input, filter, ul, li, a, i;
                	  input = document.getElementById("myInput");
                	  filter = input.value.toUpperCase();
                	  div = document.getElementById("myDropdown");
                	  a = div.getElementsByTagName("a");
                	  for (i = 0; i < a.length; i++) {
                	    txtValue = a[i].textContent || a[i].innerText;
                	    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                	      a[i].style.display = "";
                	    } else {
                	      a[i].style.display = "none";
                	    }
                	  }
                	}

                	function my(id)
                	{
                	 var input = document.getElementById(id).innerHTML;
                	
                	 document.getElementById("myInput").value = input;
                	}

                	function addi()
                	{
                	   
                	  var input = document.getElementById("myInput").value;
                	  var ct = document.getElementById("ct").value;
                	  var res = input.split(" | ");
                	  if(res[0]=="" || res[1]=="" || ct=="")
                	  {
                	   alert("Please Insert data");
                	  }
                	  else
                	  {
                	  //document.getElementById("demo").innerHTML = res[0];
                	  var table = document.getElementById("myTable");
                	  var row = table.insertRow(1);
                	  var cell1 = row.insertCell(0);
                	  var cell2 = row.insertCell(1);
                	  var cell3 = row.insertCell(2);
                	  cell1.innerHTML = res[0];
                	   cell2.innerHTML = res[1];
                	    cell3.innerHTML = ct;
                	 var total1 = document.getElementById("total").innerHTML;
                	 
                	 total1 = +total1 +  (+res[1])*(+ct);
                	  document.getElementById("total").innerHTML=total1;
                	  document.getElementById("ct").value="1";
                	   document.getElementById("ct").placeholder="1";
                	   document.getElementById("myInput").placeholder="Search..";
                	   document.getElementById("myInput").value = "";
                	   }
                	}
                	
                	function con1()
                	{
                		var a;
                		if(document.getElementById("correct").style.color == "white")
                		{
                			a = false;
                			alert("Please Enter Valid Customer Id !!!");
                		}
                		else
                		{
                			a = confirm("Are you Sure?");
                		}
                		return a;
                	}
                	
        			
                	function validatecid()
                	{
                		var i=0;
                		var li = <%= list %>
                		while(li[i])
                		{
                			//console.log(li[i]);
                		if(document.getElementById("cid1").value==li[i]+"")
                			{
                				
	                			document.getElementById("correct").style.color="lightgreen";
	                			break;
                			}
                		else
                			{
                			document.getElementById("correct").style.color="white";	
                			}
                		i=i+1;
                		}
                	}
                	
                
                	 
    </script>
 
  
  
</body>
</html>