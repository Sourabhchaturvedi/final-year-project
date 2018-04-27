<%@ page import="java.sql.*" %>


<%! 
ResultSet rs;
Connection con;
PreparedStatement ps;
%>


<%
        String staffid= request.getParameter("staffid");
        boolean valid = false;

        try
        {
                Class.forName("com.mysql.jdbc.Driver");
                con =DriverManager.getConnection("jdbc:mysql:///sms","root", "super");
                ps =con.prepareStatement("select staffid from addstaff");
                rs =ps.executeQuery();
   while(rs.next())
   {
     if(staffid.equals(rs.getString("staffid")))
  
        {

                 valid=true;
                 break;

        }

     } 
                if(valid)
                {
 %>              
             <html> 
                    <head>
                     <style>
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
                                   
                                    ps=con.prepareStatement("select * from addstaff where staffid='"+staffid+"'");
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
                  </body>
                  </html> 
          
                      <%
                }

               else
               {
                      %>
                 <html><font color=red><b> Staffid does not  exist </b></font></html>
            <%
               }
        }
        catch(Exception e)
        {
            out.print(e);
        }
%>



               

    
        
