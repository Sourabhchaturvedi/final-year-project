<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%! 
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
%>

<%
        String course= request.getParameter("course");
        String code= request.getParameter("code");
        String elegibility= request.getParameter("elegibility");
     
try
{
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql:///sms","root","super");
    ps=con.prepareStatement("update courses  set  elegibility='"+elegibility+"',code='"+code+"' where course='"+course+"'");
    ps.executeUpdate();
	out.print(course+" has been updated");
%>
	<jsp:include page="addcourses.jsp"/>
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