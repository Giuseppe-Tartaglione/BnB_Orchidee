<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="./user" method="post">
<input type="text" name="email" placeholder="email" />
<input type="text" name="password" placeholder="password" />
<input type="hidden" name="action" value="login" />
<input type="submit" value="Accedi">
</form>
</body>
</html>