<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%! 
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
%>

<%
        String email= request.getParameter("email");
        String contact = request.getParameter("contact");
        String fname = request.getParameter("fname");      
        String mname = request.getParameter("mname");
     
try
{
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql:///sms","root","super");
    ps=con.prepareStatement("update addstudent  set  contact='"+contact+"',fname='"+fname+"',  mname='"+mname+"' where email='"+email+"'");
    ps.executeUpdate();
	out.print(email+" has been updated");
%>
	<jsp:include page="staffinbox.jsp"/>
<%
}
catch(Exception e)
{
	out.print(e);
}
finally
{
}
%>