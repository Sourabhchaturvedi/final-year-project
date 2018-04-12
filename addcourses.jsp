<%@ page import="java.sql.*" %>


<%! 
ResultSet rs;
Connection con;
PreparedStatement ps;
%>


<%
        String course= request.getParameter("course");
        String fees= request.getParameter("fees");
        String duration= request.getParameter("duration");
        String code= request.getParameter("code");
        String elegibility= request.getParameter("elegibility");


        boolean valid =false;
        try
        {

   Class.forName("com.mysql.jdbc.Driver");
   con =DriverManager.getConnection("jdbc:mysql:///sms","root", "super");
   ps=con.prepareStatement("select course from courses");
   rs=ps.executeQuery();
   while(rs.next())
   {

     if(course.equals(rs.getString("course")))
  
        {

                 valid=true;
                 break;

        }

     } 
                if(valid)
                {
%>
                           <html><font color=red><b> courses already exist </b></font></html>
                           <jsp:include page="adminc.jsp"/>

                      <%
                }

               else
               {
                ps = con.prepareStatement("insert into courses values (?,?,?,?,?)");
                ps.setString(1,course);
                  ps.setString(2,fees);
                    ps.setString(3,duration);
                      ps.setString(4,code);
                        ps.setString(5,elegibility);
                ps.executeUpdate();
                response.sendRedirect("adminc.jsp");
               }
        }
        catch(Exception e)
        {
            out.print(e);
        }
%>


