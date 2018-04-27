<%@  page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%!
Connection con;
ResultSet rs;
PreparedStatement ps;
%>
<%
String username=request.getParameter("username");
String password=request.getParameter("password");
String category=request.getParameter("category");
String decision=request.getParameter("decision");
boolean valid=false;
try
{
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql:///hr","root","root123");
    ps=con.prepareStatement("select username,password from login");
    rs=ps.executeQuery();
    while(rs.next())
    {
        if(username.equals(rs.getString("username")) && password.equals(rs.getString("password")))
	{
		valid=true;
		break;
	}
    }
    if(valid)
	{
		%>
		<font color=blue><%=username%>Already exists </font>
        <jsp:include page="ADD.jsp"/>
		<%
    }
    else
	{
        ps=con.prepareStatement("insert into login values(?, ?, ?, ?)");
        ps.setString(1,username);
        ps.setString(2,password);
	    ps.setString(3,category);
        ps.setString(4,decision);
        ps.executeUpdate();
	response.sendRedirect("ADD.jsp");
    }
    

}

catch(Exception e)
	{
	out.print(e);
    }
    %>