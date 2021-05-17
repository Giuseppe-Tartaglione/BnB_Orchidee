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
		<label for Name="Nome"><b>Nome</b></label><br>
		<input type="text" name="Nome"/>
		<br>
		<label for Name="Cognome"><b>Cognome</b></label><br>
		<input type="text" name="Cognome"/>
		<br>
		<label for Name="Nascita"><b>Data di nascita</b></label><br>
		<input type="date" name="Nascita"/>
		<br>
		<label for Name="CF"><b>Codice Fiscale</b></label><br>
		<input type="text" name="CF"/>
		<br>
		<table>
		<tr>
			<td>
			<label for Name="Residenza"><b>Via/Viale/Piazza</b></label>
			</td>
			<td>
			<label for Name="CAP"><b>CAP</b></label>
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
			<label for name="Citt�"><b>Citt�</b></label>
			</td>
			<td>
			<label for name="Provincia"><b>Prov</b></label>
			</td>				
		</tr>
		<tr>	
			<td>
			<input type="text" name="Citt�">
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