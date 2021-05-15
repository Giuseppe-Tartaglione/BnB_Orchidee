<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="google-signin-client_id" content="YOUR_CLIENT_ID.apps.googleusercontent.com">
<title>Login</title>
<link rel="stylesheet" href="./style.css">
</head>
<body>
		<div class="center">   
        	<h1><img class="image" src="immagine.png" alt="login_image"></h1>
        <form action="./user" method="post">             
            <div class="txt-field">
                <input type="text" name="email" required>  
                 <label>Email</label>
            </div>
            <div class="txt-field">
            <input type="password" name="password"  required>
                 <label>Password</label>
            </div>
            <div class="pass">Password dimenticata?</div>
            <div>
            <table class="table">
                <tr>
                    <th>
                        <input type="submit" name="action" value="Login">
                    </th>
                    <th>
                        <input type="submit" value="Registrati">    
                    </th>
                </tr>
            </table>  
            </div>
            <h2 align=center>OR</h2>
            <div class="g-signin2" data-onsuccess="onSignIn" style="width: auto; height: 50px;">
            	<table class="table">
                <tr>
                    <th>
                <script src="https://apis.google.com/js/platform.js" async defer></script>  
                <input type="submit">
              	  	</th>
              	</tr>
              	</table>
            </div>       
		</form>
	</div>
</body>
</html>