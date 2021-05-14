<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="UserControl" method="post">
<input type="hidden" name="action" value="signin"/>
<fieldset name="Dati Personali">
	<legend>Dati Personali</legend>
		<label for name="Nome"><b>Nome</b></label><br>
		<input type="text" name="Nome"/>
		<br>
		<label for name="Cognome"><b>Cognome</b></label><br>
		<input type="text" name="Cognome"/>
		<br>
		<label for name="Nascita"><b>Data di nascita</b></label><br>
		<input type="date" name="Nascita"/>
		<br>
		<label for name="CF"><b>Codice Fiscale</b></label><br>
		<input type="text" name="CF"/>
		<br>
		<table>
		<tr>
			<td>
			<label for name="Residenza"><b>Via/Viale/Piazza</b></label>
			</td>
			<td>
			<label for name="CAP"><b>CAP</b></label>
			</td>
		</tr>
		<tr>	
			<td>
			<input type="text" name="Via" placeholder="via Bisanzio,14" >
			</td>
			<td>
			<input type="text" name="CAP" size="5"/>
			</td>				
		</tr>
		<tr>	
			<td>
			<label for name="Città"><b>Città</b></label>
			</td>
			<td>
			<label for name="Provincia"><b>Prov</b></label>
			</td>				
		</tr>
		<tr>	
			<td>
			<input type="text" name="Città">
			</td>
			<td>
			<input type="text" name="Provincia" size="5">
			</td>				
		</tr>
		</table>
		<label for name="Telefono"><b>Telefono/Cellulare</b></label><br>
		<input type="text" name="Telefono">
</fieldset>
<fieldset>
	<legend>Dati di accesso</legend>
		<label for="Email"><b>Email</b></label><br>
		<input type="text" name="Email"/><br>
		<label for="Password"><b>Password</b></label><br>
		<input type="text" name="Password"/><br>
</fieldset>
<fieldset>
	<legend>Dati di fatturazione</legend>
		<label for name="Titolare"><b>Titolare</b></label><br>
		<input type="text" name="Titolare" placeholder="Mario Rossi"><br>
		<label for="CodiceCarta"><b>Codice Carta</b></label><br>
		<input type="text" name="CodiceCarta"/><br>
		<label for="Password"><b>Scandenza</b></label><br>
		<input type="text" name="Password"/><br>
		<label for="CVV"><b>CVV</b></label><br>
		<input type="text" name="CVV" size="5"/><br>
</fieldset>
	
	<input type="submit" value="Registrati">
</form>
</body>
</html>