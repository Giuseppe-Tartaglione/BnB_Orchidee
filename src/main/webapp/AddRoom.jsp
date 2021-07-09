<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Aggiungi Stanza</title>
		<link rel="stylesheet" href="adminPageStyle.css">
	</head>
	
<body>
	<form action="UserControl" method="post">
    <input type="hidden" name="action" value="modify"/>
    <fieldset name="Dati Stanza"><legend>Aggiungi una nuova stanza</legend>
    	<div class="div_form">
  			<input type="text" id="Nome Stanza" class="form_input">
			<label for="Nome Stanza" class="form_label">Nome Stanza</label> 
		</div>
		
		<div class="div_form">	
			<input type="checkbox" name="TV" class="form_input">
			<label for="TV" class="form_label">TV</label>
		</div>	
		
		<div class="div_form">	
			<input type="checkbox" class="form_input">
			<label for="Panorama" class="form_label">Panorama</label>
		</div>
		
		<div class="div_form">	
			<input type="number" class="form_input">
			<label for="Prezzo" class="form_label">Prezzo</label>
		</div>
        
        <div class="div_form">	
			<input type="number" class="form_input">
			<label for="Matrimoniali" class="form_label">Matrimoniali</label>
		</div>
        
        <div class="div_form">	
			<input type="number" class="form_input">
			<label for="Singoli" class="form_label">Singoli</label>
		</div>
        
        <div>      
           <input type="submit" value="Aggiungi">
      	</div> 
	</fieldset>
	
	<fieldset name="Dati Stanza"><legend>Immagini stanza</legend>
		<form action="#" method="post" enctype="multipart/form-data">
    		<label>Seleziona immagine: </label>
    		<input type="file" name="image" accept="image/jpeg, image/png, image/gif" multiple="multiple">
    		<input type="submit" name="submit" value="Carica">
		</form>
	</fieldset>
</form>
</body>
</html>