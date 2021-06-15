<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Document</title>
</head>

</head>
<body>
    <form action="UserControl" method="post">
        <input type="hidden" name="action" value="modify"/>
        <fieldset name="Dati Stanza">
            <legend>Dati Stanza</legend>
            <table> 
        <tr>
           <th>
               <label for Name="Nome"><b>Nome Stanza</b></label>
            </th>
            <th>
                <input type="text" name="Nome"/>
            </th>
		</tr>
        <tr>
            <th>
                <label for Name="TV"><b>TV</b></label>
            </th>
            <th>
                <input type="checkbox" name="TV"/>
            </th>
        </tr>
            
        <tr>
            <th> 
                <label for Name="Panorama"><b>Panorama</b></label>       
            </th>               
            <th>
                <input type="checkbox" name="Panorama"/>    
            </th>
        </tr>

        <tr>
            <th>
                <label for Name="Prezzo"><b>Prezzo</b></label> 
            </th>
            <th>
                <input type="number" min="0" name="Prezzo"/>
            </th>
        </tr>

        <tr>
            <th>
                <label for Name="Matrimoniali"><b>Matrimoniali</b></label>
            </th>
            <th>
                <input type="number" min="0" name="Matrimoniali"/>
            </th>
        </tr>
        
        <tr>
            <th>
                <label for Name="Singoli"><b>Singoli</b></label>
            </th>
            <th>
                <input type="number" min="0" name="Singoli"/>
            </th>
        </tr>

        <tr>
            <th>
                <input type="submit" value="Annulla">
            </th>
            <th>
                <input type="submit" value="Modifica">
            </th>
        </tr>
      </table>
	</fieldset>
	<fieldset name="Dati Stanza">
      <legend>Immagini stanza</legend>
		<form action="" method="post" enctype="multipart/form-data">
    	<label>Seleziona immagine:</label>
    	<input type="file" name="image" accept="image/jpeg, image/png, image/gif" multiple="multiple">
    	<input type="submit" name="submit" value="Upload">
</form>	
</fieldset>
</form>
</body>
</html>