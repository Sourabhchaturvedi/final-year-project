<%@ page import="java.sql.*" %>


<%! 
ResultSet rs;
Connection con;
PreparedStatement ps;
%>


<%
        String username= request.getParameter("username");
        String number = request.getParameter("number");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean valid = false;
        try
        {

   Class.forName("com.mysql.jdbc.Driver");
   con =DriverManager.getConnection("jdbc:mysql:///sms","root", "super");
   ps=con.prepareStatement("select username from register");
   rs=ps.executeQuery();
   while(rs.next())
   {

     if(username.equals(rs.getString("username")))
  
        {

                 valid=true;
                 break;

        }

     } 
                if(valid)
                {
                                     %>
                           <html><font color=red><b> email already exist </b></font></html>
                           <jsp:include page="newuser.html"/>
          
                      <%
                }

               else
               {

                ps = con.prepareStatement("insert into register values (?,?,?,?)");
                ps.setString(1,username);
                ps.setString(2,number);
                ps.setString(3,email);
                ps.setString(4,password);
                ps.executeUpdate();
                response.sendRedirect("login.html");
               }
        }
        catch(Exception e)
        {
            out.print(e);
        }
%>



               }

    
        }
