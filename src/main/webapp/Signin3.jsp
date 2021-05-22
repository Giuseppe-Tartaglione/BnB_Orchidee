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
		<li id="st1">
			<div onclick="Signin.jsp">Step 1</div>
			<span>Dati personali</span>
		</li>
		<li id="st2">
			<div onclick="Signin2.jsp">Step 2</div>
			<span>Dati accesso</span>
		</li>
		<li id="st3"  class="current-step">
			<div>Step 3</div>
			<span>Dati fatturazione</span>
		</li>
	</ul>
</div>
	<form> <!--action="UserControl" method="post">  --> 
	<input class="text" type="hidden" name="action" value="signin"/>
	
	<!-- START STEP 3 -->
	<fieldset id="st3" title="Step3" class="step" name="Dati_fattura">
		<legend style="display: none;">Dati fattura</legend>
		<div class="five columns alpha">
			<label for="Titolare"><b>Titolare</b></label> 
			<input type="text" name="Titolare" placeholder="Mario Rossi"> 
		</div>
		<div class="five columns alfa">
			<label for="CodiceCarta"><b>Codice Carta</b></label> 
			<input type="text" name="CodiceCarta"/> 	
		</div>
		<div class="five columns alpha">
			<label for="Password"><b>Scandenza</b></label> 
			<input type="month" name="Password"/> 	
		</div>
		<div class="five columns alfa">
			<label for="CVV"><b> CVV </b></label> 
			<input type="text" name="CVV" size="5"/> 	
		</div>
		<br class="clear">
		<p>		
			<div class="checker">	
				<input type="checkbox" name="terms" value="Yes">
			</div>
			<a class="fancybox" href="#.txt">I accept terms and condition </a>
		<p id="custom-buttons-2" class="custom-buttons">
			<a id="custom-back-2" href="Signin2.jsp" class="button-back">Previous step</a>
			<input type="submit" class="finish" value="Register!">
		</p>	
	</fieldset>
	<div class="stepy-error">
	<label for="Titolare" class="error">Titolare required!</label>
	<label for="CodiceCarta"  class="error">Codice invalid!</label>
	<label for="name"  class="error">Scadenza required</label>
	<label for="CodiceCarta"  class="error">CVV invalid!</label>
	</div>
		<!-- END STEP 3 -->
   </form>
  </article>
 </body>
</html>	