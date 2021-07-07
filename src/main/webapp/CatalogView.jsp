<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catalogo</title>
    <link rel="stylesheet" href="catalog.css">
</head>

<body>
    <div class="wrapper">
    	<div class="links">
        	<ul>        
            	<li class="li-list active" data-view="list-view">Lista</li> 
            	<li class="li-grid" data-view="grid-view">Griglia</li>  
        	</ul>
        </div>

   	 	<div class="view-main">
            <!-- Visualizzazione a lista -->
        	<div class="view-wrap list-view" style="display: block;">
                <div class="view-item">
                    <div class="vi-left">
                        <img src="Logo.png" alt="object">
                    </div>
                    <div class="vi-right">
                        <p class="title">Camera</p>
                        <p class="content">Descirizone del prodotto</p>
                        <div class="button">Mostra di più</div>
                    </div>
                </div>

                <div class="view-item">
                    <div class="vi-left">
                        <img src="immagine.png" alt="Camera">
                    </div>
                    <div class="vi-right">
                        <p class="title">Object</p>
                        <p class="content">Descrizione</p>
                        <div class="button">Mostra di più</div>
                    </div>
                </div>

                <div class="view-item">
                    <div class="vi-left">
                        <img src="CartIcon.png" alt="object">
                    </div>
                    <div class="vi-right">
                        <p class="title">Camera 22</p>
                        <p class="content">Descrizione</p>
                        <div class="button">Mostra di più</div>
                    </div>

                <!-- Aggiungere qui un div per ogni prodotto

                <div class="view-item">
                    <div class="vi-left">
                        <img src="#" alt="object">
                    </div>
                    <div class="vi-right">
                        <p class="title">Object</p>
                        <p class="content">Testo di prova</p>
                        <div class="button">Mostra di più</div>
                    </div>
                </div> -->
            </div>

            <!-- Visualizzazione a griglia -->
        	<div class="view-wrap grid-view" style="display: none;">
                <div class="view-item">
                    <div class="vi-left">
                        <img src="Logo.png" alt="object">
                    </div>
                    <div class="vi-right">
                        <p class="title">Camera</p>
                        <p class="content">Descirizone del prodotto</p>
                        <div class="button">Mostra di più</div>
                    </div>
                </div>

                <div class="view-item">
                    <div class="vi-left">
                        <img src="immagine.png" alt="Camera">
                    </div>
                    <div class="vi-right">
                        <p class="title">Object</p>
                        <p class="content">Descrizione</p>
                        <div class="button">Mostra di più</div>
                    </div>
                </div>

                <div class="view-item">
                    <div class="vi-left">
                        <img src="CartIcon.png" alt="object">
                    </div>
                    <div class="vi-right">
                        <p class="title">Camera 22</p>
                        <p class="content">Descrizione</p>
                        <div class="button">Mostra di più</div>
                    </div>
                </div>               
            </div>

        </div>
	</div>

    <script src="script.js"></script>
</body>
</html>