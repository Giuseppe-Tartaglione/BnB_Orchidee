<%@ page import="java.util.Calendar, java.util.Date, java.text.DateFormat, java.text.SimpleDateFormat" %>
<% DateFormat dformat = new SimpleDateFormat("dd/MM/yyyy");
Date d = new Date(); 
   Calendar cal = Calendar.getInstance();
	        cal.setTime(d);
	        cal.add(Calendar.DAY_OF_MONTH, 1);
	        %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>B&B Orchidee</title>
    <link rel="stylesheet" href="css_file/home.css">
</head>

<body>
	<header>  
    	<div class="logo_icon">
    		<a href="Home.jsp"><img src="img/Logo.png" alt="logo"></a>
    	</div>
     
    	<nav>
        	<div class="nav_text">
            	<ul>
                	<li><a href="CatalogView.jsp">Listino</a></li>  
                	<li><a href="#">Novità</a></li>
                	<li><a href="#">Servizi</a></li>
                	<li><a href="#">About us</a></li>
            	</ul>
        	</div>
    	</nav>
    
    	<div class="icon cart_icon">
    		<a href="ProductCart.jsp">
    			<img src="img/Cart.png" alt="cart_button">
    		</a>
    	</div>
    	
    	<div class="icon login_icon">
    		<a href="Login.jsp">
    			<img src="img/Login.png" alt="login_button">
    		</a>
    	</div>
	</header>

    <form method="post">
        <nav class="searchbar">
            <ul>
                <li>
                    <div class="check-in">Check In: 
                        <input type="date" value="<%=dformat.format(d)%>" required>
                    </div>
                </li>

                <li>
                    <div class="check-out">Check Out: 
                        <input type="date" value="<%=dformat.format(cal.getTime())%>" required>
                    </div>
                </li>

                <li>
                    <div class="persone">Persone
                    	<input type="number" name="adulti" min="0" max="4" placeholder="Max. 4" required>
                	</div>
                </li>
                
                <li>
                    <div>
                        <select> 
                            <option value="bb">BB</option> 
                            <option value="mp">Mezza Pensione</option>
                            <option value="pc">Pensione Completa</option>   
                        </select>                 
                    </div>
                </li>
                
                <li>
                	<input type="image" src="img/search_icon.png">
                </li>
            </ul>
        </nav>
    </form>

    <div class="pacchetti">
        <div class="novità">
            <table>
                <tr>
                    <td>
                        check-in
                        check-out
                        ristorante
                        persone
                        prezzo
                    </td>
                </tr>
            </table>
        </div>
        <div class="novità">Novità 1</div>
        <div class="novità">Novità 2</div>
    </div>

    <h1>Testo di prova h1</h1>
    <h2>Testo di prova h2</h2>
    <h3>Testo di prova h3</h3>
    <p>Paragrafo di prova</p>
    
</body>
</html>