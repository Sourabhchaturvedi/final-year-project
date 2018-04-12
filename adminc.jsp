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

            <html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
                <link rel="stylesheet" href="admin.css">
                <style type="text/css">

                </style>
            </head>

            <div class="containerm">
                <div class="containerh">
                    <h1>Student Management System </h1>
                    <button type="button" class="btn btn-info btn-lg but" data-toggle="modal" data-target="#myModal">
                    <a href="LogOut.jsp">Logout</a>
                    </button>
                </div>


                <div class="containerr">
                 <button type="button" class="btn btn-info btn-lg but1" data-toggle="modal" data-target="#myModal">ADD COURSE</button>
                </div>


                <div class=" container-fluid containerl">

                    <table style="display:block;">
                        <tr>
                            <th>Courses</th>
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
                                          con.close();	
                                  }
                                      catch(Exception e)
                                      {
                                          out.print(e);
                                      }
                                  %>

                    </table>

                    <div id="course">
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
                    </div>
                </div>

            </div>
            <script>
                    var x,y,z;
                    x = document.getElementById('course');
                    function myfun() {   
                        if (x.style.display === 'none') {
                            x.style.display = 'block';	
                        } else {
                            x.style.display = 'none';		
                        }
                    }
                    </script>
                    </html>
                    <%
                        }
                    %>
        