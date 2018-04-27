<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%! 
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
%>
<%
String email=request.getParameter("email");

try
{
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql:///sms","root","super");
    ps=con.prepareStatement("delete from  addstudent where email='"+email+"'");
    ps.executeUpdate();
	out.print(email+" has been deleted");
%>
	<jsp:include page="staffinbox.jsp"/>
<%
}
catch(Exception e)
{
	
}
finally
{
}
%>