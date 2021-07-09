<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifica Stanza</title>
    <link rel="stylesheet" href="adminPageStyle.css">
</head>

<body>
    <form action="UserControl" method="post">
        <input type="hidden" name="action" value="modify"/>
        <fieldset name="Dati Stanza">
        <legend>Modifica i dati della stanza</legend>
        <table> 
        <tr>
           	<th>
               	<div class="div_form">
  					<input type="text" class="form_input">
					<label for="Nome Stanza" class="form_label">Nome Stanza</label> 
				</div>
			</th>
		
        <tr>
        	<th>
        		<div class="div_form">
            		<input type="checkbox" name="TV" class="form_input"/>
            		<label for="TV"><b>TV</b></label>
            	</div>
            </th>
        </tr>
            
		<tr>
        	<th>
        		<div class="div_form">
            		<input type="checkbox" name="Panorama"/>
            		<label for="Panorama"><b>Panorama</b></label>
            	</div>
            </th>
        </tr>

		<tr>
        	<th>
        		<div class="div_form">
            		<input type="number" name="Prezzo"/>
            		<label for="Prezzo"><b>Prezzo</b></label>
            	</div>
            </th>
        </tr>

       	<tr>
        	<th>
        		<div class="div_form">
            		<input type="checkbox" name="Matrimoniali"/>
            		<label for="Matrimoniali"><b>Matrimoniali</b></label>
            	</div>
            </th>
        </tr>
        
     	<tr>
        	<th>
        		<div class="div_form">
            		<input type="checkbox" name="Singoli"/>
            		<label for="Singoli"><b>Singoli</b></label>
            	</div>
            </th>
        </tr>

        <tr>
            <th><input type="submit" value="Modifica"></th>
        </tr>
        </table>
		</fieldset>
		
	<fieldset name="Dati Stanza">
      <legend>Immagini stanza</legend>
		<form action="#" method="post" enctype="multipart/form-data">
    		<label>Seleziona immagine: </label>
    		<input type="file" name="image" accept="image/jpeg, image/png, image/gif" multiple="multiple">
    		<input type="submit" name="submit" value="Carica">
		</form>
	</fieldset>
</form>	
</body>
</html>