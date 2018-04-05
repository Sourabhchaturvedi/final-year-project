<!DOCTYPE html>
<html lang="en">

<head>

    <title>FINAL YEAR PROJECT</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        body {
            font: 20px Montserrat, sans-serif;
            line-height: 1.8;
            color: #f5f6f7;
        }
        
        p {
            font-size: 16px;
        }
        
        .margin {
            margin-bottom: 45px;
        }
        
        .imgr {
            border-radius: 40px;
            float: left;
        }
        
        .imgr1 {
            border-radius: 40px;
            float: right;
        }
        
        .we {
            font-weight: bold;
        }
        
        .bg-1 {
            background-color: #123C69;
            /* Green */
            color: #ffffff;
        }
        
        .bg-2 {
            background-color: #474e5d;
            /* Dark Blue */
            color: #ffffff;
        }
        
        .bg-3 {
            background-color: #D83F87;
            /* White */
            color: white;
        }
        
        .bg-4 {
            background-color: #2f2f2f;
            /* Black Gray */
            color: #fff;
        }
        
        .container-fluid {
            padding-top: 70px;
            padding-bottom: 70px;
        }
        
        .navbar {
            padding-top: 15px;
            padding-bottom: 15px;
            border: 0;
            border-radius: 0;
            margin-bottom: 0;
            font-size: 12px;
            letter-spacing: 5px;
            background: #17E9E0;
        }
        
        .navbar-nav li a:hover {
            color: RED !important;
        }
    </style>
</head>

<body>

    <!-- Navbar -->
    <nav class="navbar navbar-default">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">STUDENT</a></li>
                    <li><a href="#">STAFF</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- First Container -->
    <div class="container-fluid bg-1 text-center">
        <h3 class="margin">STUDENT MANAGEMENT SYSTEM</h3>
        <img src="Student.png" class="img-responsive we margin" style="display:inline" alt="Bird" width="350" height="350">
    </div>

    <!-- Second Container -->
    <div class="container-fluid bg-2 text-center">
        <h3 class="margin">ABOUT STUDENT MANAGEMENT SYSTEM</h3>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </p>
    </div>

    <!-- Footer -->
    <footer class="container-fluid bg-4 text-center">
        <p>DEVELOPED BY SOURABH
            <a href="#"></a>
        </p>
    </footer>

</body>

</html>