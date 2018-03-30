<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>


<%! 
ResultSet rs;
Connection con;
PreparedStatement ps;
%>


<%
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean advalid = false;
        boolean uvalid=false;
        
        try
        {

   Class.forName("com.mysql.jdbc.Driver");
   con =DriverManager.getConnection("jdbc:mysql:///sms","root", "super");
   ps=con.prepareStatement("select * from indexnew");
   rs=ps.executeQuery();
   while(rs.next())
   {

     if(email.equals(rs.getString("email"))&& password.equals(rs.getString("password")))
     {
        String authority=rs.getString("authority");
        if(authority.equals("admin"))
        {
                
                 advalid=true;
                 break;

        }
        else if(authority.equals("authority"))
        {
                
                 uvalid=true;
                 break;

        }

      } 
    }
                if(advalid)
                {
                     %>
                           
                           <jsp:forward page="indexold.html"/>
          
                      <%
                }
                else if(uvalid)
                {
                    %>
                    <jsp:forward page="inbox.html"/>
                    <%
                }

               else
               {%>

                <html><font color=red><b> email already exist </b></font></html>
                <jsp:include page="inbox.html"/>
                <%
               }
        }
        catch(Exception e)
        {
            out.print(e);
        }
        finally
        {

        }
%>



               

    
        
