<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
</head>

<body>
	<fieldset class="row2">
                <legend>Dettagli Pacchetti</legend>
                <p>
                    <label>Check-In *</label>
                    <input type="date" name="Check-In" required>
                </p>
                
                <p>
                    <label>Check-Out *</label>
                    <input type="date" name="Check-Out" required>
                </p>

                <p>
                    <label>Persone: </label>                                        
                    <label>Adulti</label>
                    <input type="number" name="Adulti" max="8" min="0" maxlength="5">
                    <label>Bambini</label>
                    <input type="number" name="Bambini" max="4" min="0" maxlength="5">
                </p>
                
                <p>
                    <label>Metodo di Pagamento*</label>
                    <select>
                    	<option>Visa/Mastercard</option>
                    	<option>Contanti</option>
                    	<option>PayPal</option>
                    	<option>Non Specificato</option>
                    </select>
                </p>
                				            
                <p>
                    <label>Dettagli *</label>
                    <textarea></textarea>
                </p>
                
				<p>
					<label>Prezzo</label>
                    <input type="number" name="prezzo" maxlength="10" required>
				</p>  			
            </fieldset>   
</body>
</html>