<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>


<%!
ResultSet rs;
Connection con;
PreparedStatement ps;
%>


    <%
        String UserName = ""+request.getParameter("UserName");
        String Password = ""+request.getParameter("Password");
        boolean advalid = false;
        boolean uvalid=false;
        boolean nvalid=false;
        boolean svalid=false;
        
        try
        {

   Class.forName("com.mysql.jdbc.Driver");
   con =DriverManager.getConnection("jdbc:mysql:///sms","root", "super");
   ps=con.prepareStatement("select * from addstaff");
   rs=ps.executeQuery();
   while(rs.next())
   {

     if(UserName.equals(rs.getString("username"))&&(Password.equals(rs.getString("password"))))
     {
         session.setAttribute("username",UserName);
        String authority=rs.getString("Category");
        /*
        if(authority.equals("Non"))
        {
            session.setAttribute("subject",rs.getString("subject"));
        }
        */
        session.setAttribute("name",rs.getString("name"));

        if(authority.equals("admin"))
        {
                
                 advalid=true;
                 break;

        }
        else if(authority.equals("Academics"))
        {
                
                 uvalid=true;
                 break;

        }

         else if(authority.equals("Non"))
        {
                
                 nvalid=true;
                 break;

        }
        else if (authority.equals("student"))
        {
                
                 svalid=true;
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
                 else if(nvalid)
                {
                     response.sendRedirect("nstaffinbox.jsp"); 
                }
                 else if(svalid)
                {
                     response.sendRedirect("studentinbox.html"); 
                }

               else
               {
                   %>

                <html><font color=red><b> email or password wrong </b></font></html>
                <jsp:include page="index.html"/>
 <%
               }
               con.close();
        }
        catch(Exception e)
        {
            out.print(e);
        }
        finally
        {
            
               
            
        }
%>



               

    
        
