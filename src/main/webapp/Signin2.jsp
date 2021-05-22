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
		<li id="st1" >
			<div>Step 1</div>
			<span>Dati personali</span>
		</li>
		<li id="st2" class="current-step">
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
	<!-- START STEP 2 -->
	<fieldset id="st2" title="Step2" class="step" name="Dati_accesso">
	<legend style="display: none;">dati di accesso</legend>
	<div class="five columns alpha">
		<label for="Email"><b>Email</b></label> 
		<input type="email" name="Email"/>
	</div>
	<div class="five columns alpha">
		<label for="Password"><b>Password</b></label> 
		<input type="password" name="Password"/>
	</div>
	<br class="clear">
	<p id="custom-buttons-1" class="custom-buttons">
		<a id="custom-back-1" href="Signin.jsp" class="button-back">Previous step</a>
		<a id="custom-next-1" href="Signin3.jsp" class="button-next">Next step</a>
	</p>
	
	</fieldset>
		<!-- END STEP 2 -->  
	</form>
	</article>
</body>
</html>