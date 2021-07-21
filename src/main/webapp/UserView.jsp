<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Collection<?> products = (Collection<?>) request.getSession().getAttribute("products");
UserBean user = (UserBean) request.getSession().getAttribute("currentSessionUser");
if((user == null) && (products == null)) {
response.sendRedirect("./generate");
return;
}
boolean result=false;
//qui si controlla se valid è true o false, se è true si visaulizza il nome dell'utente, se è false si visualizza il link alla pagina di login
//questo è da controllare perchè se lo attivo mi da errore 500 dicendo che user è null, quindi non passa l`oggetto
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart,it.unisa.model.UserBean"%>
<%=user.isValid() %>


<a href="./Change?action=CambioPagamento">Cambia i dati di pagamento</a> 
<a href="./Change?action=CambiaDatiAnagrafici">Modifica i dati Anagrafici</a>
<a href="./Change?action=ModificaStanza">Modifica Stanza</a>
<a href="./Change?action=GestisciOrdiniUtente">Gestisci Ordini Utente</a>
<a href="./Change?action=ModificaPacchetti">Modifica Pacchetti Stanza</a>
<%
try {
	if ((user.isAdmin()))%>
        <a href="./AdminView.jsp"></a>	
<%	

} catch(IOException e) {System.out.println("errore");}	%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="ProductStyle.css" rel="stylesheet" type="text/css">
    <title>BnB Orchidee</title>
</head>