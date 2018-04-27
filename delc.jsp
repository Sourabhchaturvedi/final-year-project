<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%! 
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
%>
<%
String course=request.getParameter("course");

try
{
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql:///sms","root","super");
    ps=con.prepareStatement("delete from  courses where course='"+course+"'");
    ps.executeUpdate();
	out.print(course+" has been deleted");
%>
	<jsp:include page="adminc.jsp"/>
<%
}
catch(Exception e)
{
	
}
finally
{
}
%>