<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
ProductBean product = (ProductBean) request.getAttribute("product");
%>    
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart"%>
<head>
<meta charset="UTF-8">
<title>Dettagli</title>
</head>
<body>

<h2>Dettagli</h2>
<%
//System.out.println(product);
if (product != null ) {
	
%>
<table border="1">
<tr>
<th>ID_Stanza</th>
<th>Nome</th>
<th>TV</th>
<th>Panorama</th>
<th>Matrimoniali</th>
<th>Singoli</th>
<th>Prezzo</th>
<th>Acquista</th>
</tr>
<tr>
<td><%=product.getID_Stanza()%></td>
<td><%=product.getNome()%></td>
<td><%=product.isTV()%></td>
<td><%=product.isPanorama()%></td>
<td><%=product.getMatrimoniali()%></td>
<td><%=product.getSingoli()%></td>
<td><%=product.getPrezzo()%></td>
<td><a href="product?action=addC&id=<%=product.getID_Stanza()%>">Aggiungi</a> </td>
</tr>
</table>
<%
} else {
%>
<table>
<tr>
<td colspan="6">Prodotto non disponibile</td>
</tr>
<%
}
%>
</table>
<a href="./product">Torna al Catalogo</a>
</body>
</html>