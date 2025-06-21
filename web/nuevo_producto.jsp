<%-- 
    Document   : nuevo_producto
    Created on : 7 may. 2025, 20:12:43
    Author     : Matiasjobeth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <script src="sessionTimeout.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Producto</title>
         <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/nuevo.css"/>
    </head>
    <body>
       <div class="header-box">
            <h1>Insertar producto</h1>
             <a href="index.jsp" class="back-button">Volver al menú principal</a>
        </div> 
        <div class="main-content">
        <form action="ControlerProducto" method="post">   
            <table border="1">
                    <tr>
                        <td>Id Producto</td>
                        <td><input type="hidden" name="Id"></td>
                    </tr>
                    <tr>
                        <td>Descripción</td>
                        <td><input type="text" name="descripcion"></td>
                    </tr>
                    <tr>
                        <td>Costo</td>
                        <td><input type="text" name="costo"></td>
                    </tr>     
                    <tr>
                        <td>Precio</td>
                        <td><input type="text" name="precio"></td>
                    </tr>        
                    <tr>
                        <td>Cantidad</td>
                        <td><input type="text" name="cantidad"></td>
                    </tr>                 
            </table>
             <button type="submit" name="modificar"class="grabar-button"> Grabar</button>
        </form>
        </div>
    </body>
</html>
