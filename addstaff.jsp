<%@ page import="java.sql.*" %>


<%! 
ResultSet rs;
Connection con;
PreparedStatement ps;
%>


<%
        String staffid= request.getParameter("staffid");
        String name = request.getParameter("name");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String experience = request.getParameter("experience");
        String payscale = request.getParameter("payscale");
        String  qualification= request.getParameter("qualification");
        String stafftype = request.getParameter("stafftype");
        String subject=request.getParameter("subject");
        boolean valid = false;


        out.println(staffid +name +contact +email +gender +dob +experience +payscale +qualification  +stafftype);

        try
        {

   Class.forName("com.mysql.jdbc.Driver");
   con =DriverManager.getConnection("jdbc:mysql:///sms","root", "super");
   ps=con.prepareStatement("select staffid from addstaff");
   rs=ps.executeQuery();
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
                           <html><font color=red><b> id already exist </b></font></html>
                           <jsp:include page="addstaff.jsp"/>
          
                      <%
                }

               else
               {

                ps = con.prepareStatement("insert into addstaff values (?,?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1,staffid);
                ps.setString(2,name);
                ps.setInt(3,Integer.parseInt(contact));
                ps.setString(4,email);
                ps.setString(5,gender);
                ps.setString(6,dob);
                ps.setString(7,experience);
                ps.setInt(8,Integer.parseInt(payscale));
                ps.setString(9,qualification);
                ps.setString(10,stafftype);
                ps.setString(11,subject);
                ps.executeUpdate();
                out.print(ps);
                response.sendRedirect("adminc.jsp");
               }
        }
        catch(Exception e)
        {
            out.print(e);
        }
%>



               

    
        
