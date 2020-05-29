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
</head>
<body>


                   <%@ include file="dkbheader.jsp" %>
                   	  <div class="row">
			    <div class="col-sm-12"  style="background-color: #66ffb3; height:40px;">
				
				  
				</div>
			</div>
                   


    <div class="row">
        <div class="col-sm-2" style="background-color:white;">

        </div>
        <div class="col-sm-8">
              
              <div class="row">
                <div class="col" style="background-color:white; height:20px"></div>
              </div>  
              

             <div class="row">
                <div class="col" style="background-color:white; height:20px"></div>
              </div>
             
              <!-- ========================login completed ===================-->
              
              <div class="row">
                  <div class="col" style="background-color:lavender;">
                        <p></p>
                        <h4 style="text-align: center;">REGISTER AS SHOPKEEPER</h4>
                        <br><br>
                        <form action="RegisterShopkeeper">
                                <table>
                                  <tr>
                                    <td>Name      </td>
                                    <td> : </td>
                                    <td><input type="text" name="name" required></td>
                                  </tr>
                                  <tr>
                                    <td><br> </td>
                                    <td><br> </td>
                                  </tr>
                                  <tr>
                                      <td>ShopName      </td>
                                      <td> : </td>
                                      <td><input type="text" name="shopname" required></td>
                                    </tr>
                                    <tr>
                                      <td><br> </td>
                                      <td><br> </td>
                                    </tr>
                                    <tr>
                                        <td>Mobile No      </td>
                                        <td> : </td>
                                        <td><input type="text" name="phone" required></td>
                                      </tr>
                                      <tr>
                                        <td><br> </td>
                                        <td><br> </td>
                                      </tr>
                                      <tr>
                                          <td>Shop Address      </td>
                                          <td> : </td>
                                          <td><input type="text" name="shopadr" required></td>
                                        </tr>
                                        <tr>
                                          <td><br> </td>
                                          <td><br> </td>
                                        </tr>
                                        <tr>
                                            <td>City      </td>
                                            <td> : </td>
                                            <td><input type="text" name="city" required></td>
                                          </tr>
                                          <tr>
                                            <td><br> </td>
                                            <td><br> </td>
                                          </tr>
                                          <tr>
                                              <td>Password      </td>
                                              <td> : </td>
                                              <td><input type="text" name="password" required></td>
                                            </tr>
                                            <tr>
                                              <td><br> </td>
                                              <td><br> </td>
                                            </tr>  
                                             
                                </table>
                                
                                <br>
                                <input type="submit" name="submit">
                                 <a href="dkblogin.jsp" style=" padding-left:20px;">Login</a>
                        </form>
                       
                                <br><br>
                  </div>
                  <div class="col" style="background-color:rgb(248, 220, 168); ">
                        <p></p>
                        <h4 style="text-align: center;">REGISTER AS CUSTOMER</h4>
                        <br><br>
                        <form action="RegisterCustomer">
                            <table>
                                <tr>
                                  <td>Name      </td>
                                  <td> : </td>
                                  <td><input type="text" name="name" required></td>
                                </tr>
                                <tr>
                                  <td><br> </td>
                                  <td><br> </td>
                                </tr>
                               
                                  <tr>
                                      <td>Mobile No      </td>
                                      <td> : </td>
                                      <td><input type="text" name="phone" required></td>
                                    </tr>
                                    <tr>
                                      <td><br> </td>
                                      <td><br> </td>
                                    </tr>
                                    <tr>
                                        <td>Address      </td>
                                        <td> : </td>
                                        <td><input type="text" name="adr" required></td>
                                      </tr>
                                      <tr>
                                        <td><br> </td>
                                        <td><br> </td>
                                      </tr>
                                      <tr>
                                          <td>City      </td>
                                          <td> : </td>
                                          <td><input type="text" name="city" required></td>
                                        </tr>
                                        <tr>
                                          <td><br> </td>
                                          <td><br> </td>
                                        </tr>
                                        <tr>
                                            <td>Password      </td>
                                            <td> : </td>
                                            <td><input type="text" name="password" required></td>
                                          </tr>
                                          <tr>
                                            <td><br> </td>
                                            <td><br> </td>
                                          </tr>  
                                          
                              </table>
                            <br><br><br>
                            <input type="submit" name="submit">
                             <a href="dkblogin.jsp" style=" padding-left:20px;">Login</a>
                            <br><br>
                        </form>
                  </div>
             </div>
             <br>
             <div class="row">
             <% 
                String cid = request.getParameter("cid");
 				String sid = request.getParameter("sid"); 
 				if(cid==null){ cid=""; }
 				if(sid==null){ sid=""; }
             %>
                <div class="col" style="background-color:lavender;">YOUR REGISTRATION SID NO : <%= sid %> </div>
                <div class="col" style="background-color:rgb(248, 220, 168);">YOUR REGISTRATION CID NO : <%= cid %></div>
                
              </div>
        </div>
        <div class="col-sm-2" style="background-color:white;">

        </div>
      </div>
    <div class="row">
    <div class="col" style=" height:50px; ">
    </div>
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