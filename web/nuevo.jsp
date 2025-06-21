<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : index
    Created on : 19/11/2021, 07:15:10 PM
    Author     : javie
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <script src="sessionTimeout.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/nuevo.css"/>
    </head>
    <body>
        <div class="header-box">
            <h1>Insertar cliente</h1>
             <a href="index.jsp" class="back-button">Volver al menú principal</a>
        </div> 
        <div class="main-content">
        <form action="ControlerCliente" method="post">   
            <table border="1">
                    <tr>
                        <td>Id Cliente</td>
                        <td><input type="hidden" name="Id"></td>
                    </tr>
                    <tr>
                        <td>Apellidos</td>
                        <td><input type="text" name="apellidos"></td>
                    </tr>
                    <tr>
                        <td>Nombres</td>
                        <td><input type="text" name="nombres"></td>
                    </tr>     
                    <tr>
                        <td>DNI</td>
                        <td><input type="text" name="DNI"></td>
                    </tr>        
                    <tr>
                        <td>Dirección</td>
                        <td><input type="text" name="direccion"></td>
                    </tr>  
                    <tr>
                        <td>Teléfono</td>
                        <td><input type="text" name="telefono"></td>
                    </tr>                 
                    <tr>
                        <td>Móvil</td>
                        <td><input type="text" name="movil"></td>
                    </tr>                 
            </table>
            <button type="submit" name="modificar"class="grabar-button"> Grabar</button>
        </form>
        </div>
    </body>
</html>


