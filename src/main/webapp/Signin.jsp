<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="signin.css">
<title>Signin</title>
</head>
<body>
<article class="container">
<div>
	<ul id="custom-titles" class="step-text">
		<li id="st1" class="current-step">
			<div>Step 1</div>
			<span>Dati personali</span>
		</li>
		<li id="st2">
			<div>Step 2</div>
			<span>Dati accesso</span>
		</li>
		<li id="st3">
			<div>Step 3</div>
			<span>Dati fatturazione</span>
		</li>
	</ul>
</div>
	<form> <!--action="UserControl" method="post">  --> 
	<input class="text" type="hidden" name="action" value="signin"/>
	
	<!--  Start step 1 -->
	
	<fieldset id="st1" title="Step1" class="step" name="Dati Personali">
		<legend style="display: none;">Personal info</legend>
	<div class="five columns alpha">
            <label for="Nome"><b>Nome</b>
            	<a href="#" class="tooltip_1" title="Your tooltip">Info</a>
            </label>
            <input type="text" name="Nome" class="text error" required>
    </div>
    <div class="five columns omega">
		<label for="Cognome"><b>Cognome</b>
			<a href="#" class="tooltip_1" title="Your tooltip">Info</a>
		</label>
		<input type="text"  name="Cognome" class="text error" required/>
    </div>
    <div class="five columns alpha">
		<label for="Nascita"><b>Data di nascita</b>
			<a href="#" class="tooltip_1" title="Your tooltip">Info</a>
		</label>
		<input type="date" name="Nascita" class="text error" required/>    
    </div >
    <div class="five columns omega">
   		<label for="CF"><b>Codice Fiscale</b>
   			<a href="#" class="tooltip_1" title="Your tooltip">Info</a>
   		</label>
		<input type="text" name="CF" class="text error" required/> 
    </div>
    <div class="five columns alpha">
		<label for="Residenza"><b>Via</b>
			<a href="#" class="tooltip_1" title="Your tooltip">Info</a>
		</label>
		<input type="text" name="CAP" size="5" class="text error" required/>
    </div>
    <div class="five columns omega">
		<label for="CAP"><b>CAP</b>
			<a href="#" class="tooltip_1" title="Your tooltip">Info</a>
		</label>
		<input type="text" name="Via" placeholder="via Bisanzio,14" >
    </div>
    <div class="five columns alpha">				
    	<label for="Città"><b>Città</b>
    		<a href="#" class="tooltip_1" title="Your tooltip">Info</a>
    	</label>
    	<input type="text" name="Città" class="text error" required>
	</div>
    <div class="five columns omega">				
  		<label for="Provincia"><b>Prov</b>
    			<a href="#" class="tooltip_1" title="Your tooltip">Info</a>
    	</label>
		<input type="text" name="Provincia" size="5">
    </div>
    <div class="five columns alpha">
		<label for="Telefono"><b>Telefono/Cellulare</b>
				<a href="#" class="tooltip_1" title="Your tooltip">Info</a>
		</label>
		<input type="text" name="Telefono">   
    </div>
    <p id="custom-buttons-0" class="custom-buttons">
    	<a id="custom-next-0" href="Signin2.jsp" class="button-next">Next step</a>
    </p>
</fieldset>
 	<!-- END STEP 1 -->
</form>
</article>
</body>
</html>