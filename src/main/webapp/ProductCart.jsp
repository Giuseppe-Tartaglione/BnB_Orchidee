<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
ProductBean product = (ProductBean) request.getAttribute("product");
Cart cart = (Cart) request.getSession().getAttribute("cart");
UserBean user = (UserBean) request.getSession().getAttribute("currentSessionUser");
    int Totale=0;
%>    
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart,it.unisa.model.UserBean"%>
<head>
	<meta charset="ISO-8859-1">
	<title>Carrello</title>
	<link rel="stylesheet" href="css_file/table.css">
</head>

<body>
	<%= user.getCognome() %>
	<% if(cart != null) { %>
	<h2>Carrello</h2>
	<table>
		<tr>
			<th>ID_Stanza</th>
			<th>Nome</th>
			<th>Prezzo</th>
			<th>Action</th>
		</tr>
		<% List<ProductBean> prodcart = cart.getProducts();
		for(ProductBean beancart: prodcart) {
		%>
	
		<tr>
			<td><%=beancart.getID_Stanza()%></td>
			<td><%=beancart.getNome()%></td>
			<td><%=beancart.getPrezzo()%></td>
			<td><a href="product?action=deleteC&id=<%=beancart.getID_Stanza()%>">Elimina dal carrello</a></td>
		</tr>
	
		<%Totale+=beancart.getPrezzo();%>
		<%} %>
	
	</table>
	
	<a href="order?action=setOrder">Paga</a>
	<h2>Totale: <%=Totale%> </h2>
	<% } %>
	<a href="CatalogView.jsp">Torna al Catalogo</a>
</body>
</html>