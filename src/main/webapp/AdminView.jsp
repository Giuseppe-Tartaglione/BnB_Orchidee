//implementare funzioni dell'admin (link alle jsp)

//aggiunge/rimuove/modifica stanza (modifica attributi singoli della stanza)
//controllo ordini utenti (sia dettaglio che in gruppo)
//cancellare/aggiungere ordine
//creazione/rimozione pacchetti
//cambiare i dati anagrafici e di pagamento dell'utente

<%@page import="java.io.*,it.unisa.model.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Collection<?> products = (Collection<?>) request.getSession().getAttribute("products");
UserBean user = (UserBean) request.getSession().getAttribute("currentSessionUser");
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">   
    <link rel="stylesheet" href="table.css"> 
    <title>Admin View</title>
</head>

</body>
</html>

<body>
    <nav>
        <ul>
            <li>Stanza</li> 
                <button>Visualizza</button>
                <button>Aggiungi</button> 
                <button>Rimouovi</button>
                <button><a href="ModifyRoom.jsp">Modifica</a></button> 
            <li>Ordine</li>
                <button>Aggiungi</button>
                <button>Rimouovi</button>
            <li>Pacchetti</li>
                <button>Crea</button> 
                <button>Elimina</button>
            <li>Dati Anagrafici</li>
                <button>Modifica</button> 
            <li>Dati di Pagamento</li>
                <button>Modifica</button>
        </ul>
    </nav>
</body>
</html>