<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>


<%
ResultSet rs;
Connection con;
PreparedStatement ps;
%>


    <%
        String UserName = ""+request.getParameter("UserName");
        String Password = ""+request.getParameter("Password");
        boolean advalid = false;
        boolean uvalid=false;
        
        try
        {

   Class.forName("com.mysql.jdbc.Driver");
   con =DriverManager.getConnection("jdbc:mysql:///sms","root", "super");
   ps=con.prepareStatement("select * from user");
   rs=ps.executeQuery();
   while(rs.next())
   {

     if(UserName.equals(rs.getString("UserName"))&&(Password.equals(rs.getString("Password"))))
     {
         session.setAttribute("username",UserName);
        String authority=rs.getString("Category");
        if(authority.equals("admin"))
        {
                
                 advalid=true;
                 break;

        }
        else if(authority.equals("staff"))
        {
                
                 uvalid=true;
                 break;

        }

      } 
    }
                if(advalid)
                {
                     
                  response.sendRedirect("adminc.jsp"); 

                }
                else if(uvalid)
                {
                     response.sendRedirect("staffinbox.jsp"); 
                }

               else
               {
                   %>

                <html><font color=red><b> email or password wrong </b></font></html>
                <jsp:include page="index.html"/>
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



               

    
        
