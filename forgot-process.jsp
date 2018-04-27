<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%!
Connection con;
ResultSet rs;
Statement stmt ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Count Rows JSP</title>
</head>
<body>
<%
String email=request.getParameter("email"); 
	boolean valid=false;
	try
	{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql:///sms","root","super"); 
	Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM user");
		while(rs.next())
		{
			if(email.equals(rs.getString("UserName")))
			{	
				valid=true;
				break;
			}
		}
		if(valid)
		{
		String password=rs.getString("Password");
        out.println(password);
	
    	
		
		}
		else
		{
			out.println("Invalid Email Id !");
		}
	}
	catch (Exception e)
	{
	out.println(e);
	}
    finally{
        con.close();
    }
%>

</body>
</html> 