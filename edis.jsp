<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%! 
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
%>

<%
        String id= request.getParameter("id");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");      
        String payscale = request.getParameter("payscale");
     
try
{
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql:///sms","root","super");
    ps=con.prepareStatement("update addstaff  set  contact='"+contact+"',email='"+email+"',  payscale='"+payscale+"' where id='"+id+"'");
    ps.executeUpdate();
	out.print(id+" has been updated");
%>
	<jsp:include page="adminc.jsp"/>
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