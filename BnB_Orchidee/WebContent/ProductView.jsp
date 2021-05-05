<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./product");	
		return;
	}
	
	ProductBean product = (ProductBean) request.getAttribute(" ");
	
	Cart cart = (Cart) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Storage DS/BF</title>
</head>

<body>
	<h2>Products</h2>
	<a href="product">List</a>
	<table border="1">
		<tr>
			<th>ID <a href="product?sort=id_stanza">Sort</a></th>
			<th>Nome <a href="product?sort=nome">Sort</a></th>
			<th>TV <a href="product?sort=tv">Sort</a></th>
			<th>Panorama <a href="product?sort=panorama">Sort</a></th>
			<th>Prezzo <a href="product?sort=prezzo">Sort</a></th>
			<th>Matrimoniali <a href="product?sort=matrimoniali">Sort</a></th>
			<th>Singoli <a href="product?sort=singoli">Sort</a></th>
			<th>Action</th>
		</tr>
		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
		%>
		<tr>
			<td><%=bean.getID_Stanza()%></td>
			<td><%=bean.getNome()%></td>
			<td><%=bean.isTV()%></td>
			<td><%=bean.isPanorama()%></td>
			<td><%=bean.getPrezzo() %></td>
			<td><%=bean.getMatrimoniali()%></td>
			<td><%=bean.getSingoli()%></td>
			<td><a href="product?action=delete&id=<%=bean.getID_Stanza()%>">Delete</a><br>
				<a href="product?action=read&id=<%=bean.getID_Stanza()%>">Details</a><br>
				<a href="product?action=addC&id=<%=bean.getID_Stanza()%>">Add to cart</a>
				</td>
		</tr>
		<%
				}
			} else {
		%>
		<tr>
			<td colspan="6">No products available</td>
		</tr>
		<%
			}
		%>
	</table>
	
	<h2>Details</h2>
	<%
		if (product != null) {
	%>
	<table border="1">
		<tr>
			<th>ID_Stanza</th>
			<th>Name</th>
			<th>Description</th>
			<th>Price</th>
			<th>Quantity</th>
		</tr>
		<tr>
			<td><%=product.getID_Stanza()%></td>
			<td><%=product.getNome()%></td>
			<td><%=product.isTV()%></td>
			<td><%=product.isPanorama()%></td>
			<td><%=product.getPrezzo()%></td>
			<td><%=product.getMatrimoniali()%></td>
			<td><%=product.getSingoli()%></td>
		</tr>
	</table>
	<%
		}
	%>
	<h2>Insert</h2>
	<form action="product" method="post">
		<input type="hidden" name="action" value="insert"> 
		
		<label for="nome">Nome:</label><br> 
		<input name="nome" type="text" maxlength="20"  placeholder="enter name"><br> 
		
		<label for="prezzo">Prezzo:</label><br> 
		<input name="prezzo" type="number" min="0" value="0" required><br>

		<label for="matrimoniali">Matrimoniali:</label><br> 
		<input name="matrimoniali" type="number" min="1" value="1" required><br>
		
		<label for="singoli">Singoli:</label><br> 
		<input name="singoli" type="number" min="1" value="1" required><br>
		
		<input type="submit" value="Add"><input type="reset" value="Reset">
	</form>
	<% if(cart != null) { %>
		<h2>Cart</h2>
		<table border="1">
		<tr>
			<th>Nome</th>
			<th>Action</th>
		</tr>
		<% List<ProductBean> prodcart = cart.getProducts(); 	
		   for(ProductBean beancart: prodcart) {
		%>
		<tr>
			<td><%=beancart.getNome()%></td>
			<td><a href="product?action=deleteC&id=<%=beancart.getID_Stanza()%>">Delete from cart</a></td>
		</tr>
		<%} %>
	</table>		
	<% } %>	
</body>
</html>