
<%
    String Username=(String)(session.getAttribute("username"));
    if(Username==null)
    {
        response.sendRedirect("index.html");
    }
    else
    {
%>


<html>

<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="studentinbox.css">
    <style type="text/css">

    </style>
</head>


<div class="container1">
    <div class="containerh">
        <img src="Student.png" class="imgc" style="float:left">
     <p>   <h1>Student Management System </h1></p>

       <p><h2>hello<%= Username%> Welcome  to your Inbox</h2>
        </p>
    </div>


    <div>
        <ul>
            <li><a href="#home">Home</a></li>
            <li><a href="#news">News</a></li>
            <li><a href="#contact">Contact</a></li>
            <li><a href="#about">About</a></li>
            <li class="logo"><a href="LogOut.jsp">Logout</a></li>
        </ul>
    </div>

    <div class="containerl">
        <a href="#"><button class="button">ABOUT</button></a><br>
        <a href="#"><button class="button">Upload ATTENDENCE</button></a><br>
        <a href="#"><button class="button">UPLOAD MARKS</button></a><br>
        <a href="#"><button class="button">ASSIGNMENT</button></a><br>
        <a href="#"><button class="button"> CONTACT PARENT</button></a><br>

    </div>


</div>
<div class="containerr">
    <h1 style="float:left">Staff Dashhboard</h1>



</div>
<div class="containerf">
</div>
</div>

</html>
<%
    }
%>