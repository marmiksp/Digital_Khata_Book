<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
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
                
                var dropdown = document.getElementsByClassName("dropdown-btn");
                var i;
                
                for (i = 0; i < dropdown.length; i++) {
                dropdown[i].addEventListener("click", function() {
                this.classList.toggle("active");
                var dropdownContent = this.nextElementSibling;
                if (dropdownContent.style.display === "block") {
                dropdownContent.style.display = "none";
                } else {
                dropdownContent.style.display = "block";
                }
                });
                }
    </script>
 
  
</head>
<body>
	
	<%
	    String name = (String)session.getAttribute("name");
	    String shopname = (String)session.getAttribute("shopname");
		String phone = (String)session.getAttribute("phone");
		if(session.getAttribute("name")==null)
		{
			 response.sendRedirect("dkblogin.jsp");
		}
	%>
	
	 <%@ include file="dkbheader.jsp" %>
	 
	 
	
<div class="row">
    <div class="col-sm-1"  style="background-color: #66ffb3;">
	
		<div id="mySidenav" class="sidenav">
	  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>

	
	
	  <a href="SkWelcome.jsp"><b >Home</b></a>
	  <a href="dkbshowcust.jsp"><b>Show Customers</b></a>
	  <a href="dkbaddcust.jsp"><b style="color:#c65353;">Add Customers</b></a>
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
  


  <div class="row">
    <div class="col-sm-3" style="background-color:; height:530px;"></div>
    <div class="col-sm-6" style="background-color:lavender;">
  <br>
  <br>
      <h3 style="text-align: center;">Add Customers</h3>
      
  <br>
  <br>
        <form action="AddCustomer">
            <div class="form-group">
              <label for="id">Enter CID:</label>
              <input type="number" class="form-control" placeholder="Enter cid no" id="cid" name="cid">
            </div>
            <div class="form-group">
              <label for="pwd">MOBILE NO:</label>
              <input type="text" class="form-control" placeholder="Enter mobile no" id="phone" name="phone">
            </div>
            
            <button type="submit" class="btn btn-primary">Submit</button>
            
          </form> 
                <br>
                

    </div>
    <div class="col-sm-3" style="background-color:;"></div>
  </div>
  
  






   <div style="border:1px solid black;"></div>
   <div class="row" style="background-color:#e6fff2;">
    <div class="col" style=" height:50px; ">
      <p style="text-align: center;">Created by MS</p>
    </div>
  </div>



</div>


</body>
</html>