<%@ page import="java.sql.*" %>


<%! 
ResultSet rs;
Connection con;
PreparedStatement ps;
%>


<%
        String name= request.getParameter("name");
        String fname = request.getParameter("fname");
        String mname = request.getParameter("mname");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String course = request.getParameter("course");
        
        boolean valid = false;


       
        try
        {

   Class.forName("com.mysql.jdbc.Driver");
   con =DriverManager.getConnection("jdbc:mysql:///sms","root", "super");
   ps=con.prepareStatement("select email from addstudent");
   rs=ps.executeQuery();
   while(rs.next())
   {

     if(email.equals(rs.getString("email")))
  
        {

                 valid=true;
                 break;

        }

     } 
                if(valid)
                {
 %>
                           <html><font color=red><b> id already exist </b></font></html>
                           <jsp:include page="addstudent.jsp"/>
          
                      <%
                }

               else
               {

                ps = con.prepareStatement("insert into addstudent values (?,?,?,?,?,?,?,?)");
                ps.setString(1,name);
                ps.setString(2,fname);
                ps.setString(3,mname);
                ps.setInt(4,Integer.parseInt(contact));
                ps.setString(5,email);
                ps.setString(6,gender);
                ps.setString(7,dob);
                ps.setString(8,course);
                ps.executeUpdate();
                out.print(ps);
                response.sendRedirect("staffinbox.jsp");
               }
        }
        catch(Exception e)
        {
            out.print(e);
        }
%>



               

    
        
