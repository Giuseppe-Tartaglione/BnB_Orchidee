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
        <table style="width: auto; "> 
        <tr>
           	<th>
               	<div class="div_form">
  					<input type="text" >
				</div>
			</th>
			<th>
               	<div class="div_form">
					<label for="Nome Stanza">Nome Stanza</label> 
				</div>
			</th>
		</tr>
        <tr>
        	<th>
        		<div class="div_form">
            		<input type="checkbox" name="TV" />
            	</div>
            </th>
            <th>
        		<div class="div_form">
            		<label for="TV"><b> TV </b></label>
            	</div>
            </th>
        </tr>
            
		<tr>
        	<th>
        		<div class="div_form">
            		<input type="checkbox" name="Panorama"/>
            	</div>
            </th>
            <th>
        		<div class="div_form">
            		<label for="Panorama"><b> Panorama</b></label>
            	</div>
            </th>
            
        </tr>

		<tr>
        	<th>
        		<div class="div_form">
            		<input type="number" name="Prezzo"/>
            	</div>
            </th>
             <th>
        		<div class="div_form">
            		<label for="Prezzo"><b>Prezzo</b></label>            		
            	</div>
            </th>
        </tr>

       	<tr>
        	<th>
        		<div class="div_form">
            		<input type="checkbox" name="Matrimoniali"/>
            	</div>
            </th>
            <th>
        		<div class="div_form">
        			<label for="Matrimoniali"><b>Matrimoniali</b></label>
            	</div>
            </th>
            
        </tr>
     	<tr>
        	<th>
        		<div class="div_form">
            		<input type="checkbox" name="Singoli"/>
            	</div>            	
            </th>
             <th>
        		<div class="div_form">
        			<label for="Singoli"><b>Singoli</b></label>
            	</div>
            </th>
        </tr>
        </table>
        <input type="submit" value="Modifica">
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