<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recupera la tua password</title>
    <link rel="stylesheet" href="password.css">
</head>

<body>
	<h2>Hai dimenticato la password?</h2>
	<div class="mailtext">
		<h3>Inserisci il tuo indirizzo email per recuperarla: </h3>
	</div>
	<div class="mailbox">
		<input type="email" name="email" placeholder="Indirizzo e-mail" required> 
	</div>
	<div class="submit_button">
		<input type="submit" value="Invia">
		<!-- Aggiungere link alla pagina che deve recuperare -->
	</div>
</body>
</html>