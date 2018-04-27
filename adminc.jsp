

<%@ page import="java.sql.*" %>
<%! 
ResultSet rs;
Connection con;
PreparedStatement ps;
%>

    <%

       String Username=(String)(session.getAttribute("username"));
       if(Username==null)
       {
         response.sendRedirect("index.html");
       }
       else
        {
    %>



<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="admin.css">
    <style type="text/css">     
        table {
    margin-left: 100px;
    margin-top: 50px;
    border: none;
    outline: none;
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 80%;
}

td {
    border: 1px solid white;
    text-align: left;
    padding: 3px;
    width: 30%;
}

tr:nth-child(even) {
    background-color: #85929e;
}

th {
    color: white;
    background-color: #3498db;
    padding: 8px;
    border: 1px solid white;
}

tr:nth-child(odd) {
    background-color: #d0d3d4;
}
    </style>
</head>

<body>
    <div class="containerf">

        <div class="containerh">
            <h1>Student Management System </h1>
            ADMIN PANEL
            <button type="button" class="btn btn-info btn-lg but">
               <span id="userName"><%=(String)session.getAttribute("name")%></span>
                <a href="LogOut.jsp">Logout</a>
                </button>

        </div>

        <div class="containerr">
         <button type="button" class="btn btn-info btn-lg but1" onclick="mydash()">DASHBOARD</button>
            <button type="button" class="btn btn-info btn-lg but1" onclick="myfun()">COURSES</button>
            <button type="button" class="btn btn-info btn-lg but1" onclick="mystaf()">ADD STAFF</button>
            <button type="button" class="btn btn-info btn-lg but1" onclick="mysal()">SALARY</button>


        </div>

        <div class="containerl">

            <div id="course" style="display:none ">
                <button type="button" class="btn btn-info btn-lg but1" data-toggle="modal" data-target="#myModal">ADD COURSE</button>
                <button type="button" class="btn btn-info btn-lg but1" data-toggle="modal" data-target="#myModaledic">EDIT COURSE</button>
                <button type="button" class="btn btn-info btn-lg but1" data-toggle="modal" data-target="#myModaldelc">DELETE</button>


              <div>


                       <table>
                        <tr>
                            <th>Course</th>
                            <th>Fees</th>
                            <th>Duration</th>
                            <th>Code</th>
                            <th>Elegibility</th>
                        </tr>
                        <%
                                try
                                  {
                                   Class.forName("com.mysql.jdbc.Driver");
                                   con =DriverManager.getConnection("jdbc:mysql:///sms","root", "super");
                                    ps=con.prepareStatement("select * from courses");
                                    rs=ps.executeQuery();
                                      while(rs.next())
                                      {
                        %>

                            <tr>
                                <td>
                                    <%=rs.getString("course")%>
                                </td>
                                <td>
                                    <%=rs.getString("fees")%>
                                </td>
                                <td>
                                    <%=rs.getString("duration")%>
                                </td>
                                <td>
                                    <%=rs.getString("code")%>
                                </td>
                                <td>
                                    <%=rs.getString("elegibility")%>
                                </td>
                            </tr>
                                <%			
                                  
                                      }
                                          	
                                  }
                                      catch(Exception e)
                                      {
                                          out.print(e);
                                      }
                                      finally{

                                          con.close();
                                      }
                               


                   %>          

                    </table>

                



              </div>


                <div class="container">
                    <!-- Trigger the modal with a button -->
                    <!-- Modal -->
                    <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <form action="addcourses.jsp" method="GET">
                                        <center>
                                            <input type="text" placeholder="Enter Course" name="course"><br><br>
                                            <input type="text" placeholder="Enter Fees" name="fees"><br><br>
                                            <input type="text" placeholder=" Enter Duration" name="duration"><br><br>
                                            <input type="text" placeholder="Enter Code" name="code"><br><br>
                                            <input type="text" placeholder="Enter Eleigibility" name="elegibility"><br><br>
                                            <input type="submit">
                                        </center>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="container">
                    <!-- Trigger the modal with a button -->
                    <!-- Modal -->
                    <div class="modal fade" id="myModaledic" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <form action="edic.jsp" method="GET">
                                        <center>
                                            <input type="text" placeholder="Enter Course" name="course"><br><br>
                                            <input type="text" placeholder="Enter Code" name="code"><br><br>
                                            <input type="text" placeholder="Enter elegibility" name="elegibility"><br><br>
                                            <input type="submit">
                                        </center>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container">
                    <!-- Trigger the modal with a button -->
                    <!-- Modal -->
                    <div class="modal fade" id="myModaldelc" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <form action="edic.jsp" method="GET">
                                        <center>
                                            <input type="text" placeholder="Enter Course" name="course"><br><br>
                                            <input type="text" placeholder="Enter Code" name="code"><br><br>
                                            <input type="text" placeholder="Enter elegibility" name="elegibility"><br><br>
                                            <input type="submit">
                                        </center>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>







            </div>

            <div id="staff" style="display:none ">
                <button type="button" class="btn btn-info btn-lg but1 " data-toggle="modal" data-target="#myModal1">ADD STAFF</button>
                <button type="button" class="btn btn-info btn-lg but1 " data-toggle="modal" data-target="#myModaledis">EDIT STAFF</button>
                <button type="button" class="btn btn-info btn-lg but1 " data-toggle="modal" data-target="#myModaldels">DELETE</button>

                  <div>
                   <table>
                    <th>staffid</th>
                    <th>name</th>
                    <th>contact</th>
                    <th>email</th>
                    <th>gender</th>
                    <th>dob</th>
                    <th>experience</th>
                    <th>payscale</th>
                    <th>qualification</th>
                    <th>stafftype</th>
                            
                    <%

                   
                                          try
                                  {
                                   Class.forName("com.mysql.jdbc.Driver");
                                   con =DriverManager.getConnection("jdbc:mysql:///sms","root", "super");
                                    ps=con.prepareStatement("select * from addstaff");
                                    rs=ps.executeQuery();
                                      while(rs.next())
                                      {
                        %>

                            <tr>
                                <td>
                                    <%=rs.getString(1)%>
                                </td>
                                <td>
                                    <%=rs.getString(2)%>
                                </td>
                                <td>
                                    <%=rs.getString(3)%>
                                </td>
                                <td>
                                    <%=rs.getString(4)%>
                                </td>
                                <td>
                                    <%=rs.getString(5)%>
                                </td>

                                  <td>
                                    <%=rs.getString(6)%>
                                </td>
                                  
                                   <td>
                                    <%=rs.getString(7)%>
                                </td>
                                 <td>
                                    <%=rs.getString(8)%>
                                </td>
                                 <td>
                                    <%=rs.getString(9)%>
                                </td>
                                 <td>
                                    <%=rs.getString(10)%>
                                </td>

                            </tr>
                            <%			
                                  
                                      }
                                          	
                                  }
                                      catch(Exception e)
                                      {
                                          out.print(e);
                                      }
                                      finally{

                                          con.close();
                                      }
                               


                   %>          
                  </table>
                  </div> 

                <div class="container">
                    <!-- Trigger the modal with a button -->
                    <!-- Modal -->
                    <div class="modal fade" id="myModal1" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <form action="addstaff.jsp" method="post" name="f1">
                                        <center>
                                            <input type="text" placeholder="staff id" name="staffid"><br><br>
                                            <input type="text" placeholder="Enter name" name="name"><br><br>
                                            <input type="number" placeholder="contact" name="contact"><br><br>
                                            <input type="email" placeholder="Enter email" name="email"><br><br>
                                            <input type="radio" name="gender" value="Male">Male
                                            <input type="radio" name="gender" value="Female">Female<br><br>
                                            <input type="date" name="dob"><br><br>
                                            <input type="text" placeholder="Experience" name="experience"><br><br>
                                            <input type="number" placeholder="pay scale" name="payscale"><br><br>
                                            <input type="text" placeholder="Qualification" name="qualification"><br><br>
                                            <select name="stafftype">
                                      <option value="Academics">Teacher</option>
                                     <option value="Non">Non Academic</option>
                                      
                                          </select><br><br>
                                          <select name="subject">
                                            <%
                                            try
                                            {

                                                Class.forName("com.mysql.jdbc.Driver");
                                                con =DriverManager.getConnection("jdbc:mysql:///sms","root", "super");
                                                ps=con.prepareStatement("select * from subject");
                                                rs=ps.executeQuery();
                                                while(rs.next())
                                                {
                                                    %>
                                                    <option value='<%=rs.getString("sid")%>'><%=rs.getString("sname")%></option>

                                                    <%
                                                }
                                            }
                                            catch(Exception e)
                                            {
                                                out.println(e);
                                            }
                                            %>
                                          </select>
                                            <input type="submit">
                                        </center>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container">
                    <!-- Trigger the modal with a button -->
                    <!-- Modal -->
                    <div class="modal fade" id="myModaledis" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <form action="edis.jsp" method="POST">
                                        <center>
                                            <input type="text" placeholder="Enter id" name="id"><br><br>
                                            <input type="text" placeholder="Enter contact" name="contact"><br><br>
                                            <input type="text" placeholder="Enter email" name="email"><br><br>
                                            <input type="text" placeholder="Enter payscale" name="payscale"><br><br>
                                            <input type="submit">
                                        </center>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container">
                    <!-- Trigger the modal with a button -->
                    <!-- Modal -->
                    <div class="modal fade" id="myModaldels" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <form action="dels.jsp" method="POST">
                                        <center>
                                            <input type="text" placeholder="Enter id" name="id"><br><br>
                                            <input type="submit">
                                        </center>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>













            </div>

            <div id="dash" style="display:none ">
                <button type="button" class="btn btn-info btn-lg but1 " data-toggle="modal" data-target="#myModal1">STUDENT INFO</button>
                <button type="button" class="btn btn-info btn-lg but1 " data-toggle="modal" data-target="#myModalstaffi">STAFF INFO</button>
                <button type="button" class="btn btn-info btn-lg but1 " data-toggle="modal" data-target="#myModaldels">INSTITUTE INFO</button>


              <div class="container">
                    <!-- Trigger the modal with a button -->
                    <!-- Modal -->
                    <div class="modal fade" id="myModalstaffi" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <form action="staffinfo.jsp" method="GET">
                                        <center>
                                            <input type="text" placeholder="Enter Staffid" name="staffid"><br><br>
                                            <input type="submit">
                                        </center>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
           
             

            </div>

        </div>

    </div>



</body>

</html>

<script>
    var x, y, z;
    x = document.getElementById('course');
    y = document.getElementById('staff');
    z = document.getElementById('dash');

    function myfun() {
        if (x.style.display === 'none') {
            x.style.display = 'block';
        } else {
            x.style.display = 'none';
        }
    }

    function mystaf() {
        if (y.style.display == 'none') {
            y.style.display = 'block';
        } else {
            y.style.display = 'none';
        }
    }

    function mydash() {
        if (z.style.display == 'none') {
            z.style.display = 'block';
        } else {
            z.style.display = 'none';
        }
    }
</script>
 </html>
                    <%
                        }
                    %>
        