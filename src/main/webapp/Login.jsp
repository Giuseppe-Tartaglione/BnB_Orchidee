<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="css_file/style.css">
</head>

<body>
	<div class="center">   
        <h1><img class="image" src="img/immagine.png" alt="login_image"></h1>
        <form action="./user" method="post">             
            <div class="txt-field">            	
                <input type="text" name="email" required>  
                <span></span>
                <label>Email</label>
            </div>
            <div class="txt-field">
                <input type="password" name="password"  required>
            	<span></span>
                <label>Password</label>
            </div>
            <div class="pass">Password dimenticata?</div>
            <div>
                <table class="table">
                    <tr>
                        <th><input type="submit" class="button" name="action" value="Login"></th>
                        <th><input type="button" class="button" onclick="location.href='./Signin.jsp'" value="Registrati"></th>
                    </tr>
                </table>  
            </div>
        </form>
    </div>
</body>
</html>


