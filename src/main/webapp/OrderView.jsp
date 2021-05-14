<%@page import="javax.websocket.SendResult"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Collection<?> orders = (Collection<?>) request.getSession().getAttribute("orders");
OrderBean order= (OrderBean) request.getSession().getAttribute("UserOrder");
UserBean user = (UserBean) request.getSession().getAttribute("currentSessionUser");
if((user == null) && (orders == null)) {
response.sendRedirect("./GenerateControl");
return; 
}
boolean result=false;
//qui si controlla se valid è true o false, se è true si visaulizza il nome dellútente, se è false si visualizza il link alla pagina di login
//questo è da controllare perchè se lo attivo mi da errore 500 dicendo che user è null, quindi non passa l`oggetto
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart,it.unisa.model.UserBean, it.unisa.model.OrderBean"%>
<%=user.isValid() %>
<%
try{
	if ((user.isValid())){%>
<a href="./OrderControl"><%=user.getCognome()%></a>
	
<%	}else{ %>
	<% response.sendRedirect("./Login.jsp?state=notLogged");%>
	<%}
}catch(IOException e){System.out.println("errore");}	%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="ProductStyle.css" rel="stylesheet" type="text/css">
<title>BnB Orchidee</title>
</head>
<body>

<h2>Products</h2>
<table border="1">
<tr>
<th>Nome <a href="OrderControl?sort=nome">Sort</a></th>
<th>Data <a href="OrderControl?sort=data"></a></th>
<th>Prezzo <a href="OrderControl?sort=prezzo">Sort</a></th>
<th>Action</th>
</tr>
<%
if (orders != null && orders.size() != 0) {
Iterator<?> it = orders.iterator();
while (it.hasNext()) {
ProductBean bean = (ProductBean) it.next();
%>
<tr>
<td><%=order.getNome()%></td>
<td><%=order.getData_Ordine()%></td>
<td><%=order.getPrezzo() %></td>
<td>
<a href="OrderControl?action=read&id=<%=bean.getID_Stanza()%>">Dettagli</a><br>
</td>
</tr>
<%
}
} else {
%>
<tr>
<td colspan="6">Nessun ordine Effettuato</td>
</tr>
<%
}
%>
</table>
<a href="./ProductView.jsp">Torna al Catalogo</a>
</body>
</html>

