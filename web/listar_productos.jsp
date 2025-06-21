<%-- 
    Document   : listarProducto
    Created on : 7 may. 2025, 19:52:51
    Author     : Matiasjobeth
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <script src="sessionTimeout.js"></script>
        <meta charset="UTF-8">
        <title>Listado de Productos</title>
         <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap" rel="stylesheet">
        <<link rel="stylesheet" href="css/lista.css"/>>
    </head>
    <body>
       <div class="header-box">
            <h1>Listado de producto</h1>
             <a href="index.jsp" class="back-button">Volver al menú principal</a>
        </div> 
        <table border="1">
            <tr>
                <th>Id Producto</th>
                <th>Descripción</th>
                <th>Precio</th>
                <th>Cantidad</th>
                <th>Acciones</th>
            </tr>
            <c:forEach var="campo" items="${Lista}">
                <tr>
                    <td>${campo.id}</td>
                    <td>${campo.descripcion}</td>
                    <td>${campo.precio}</td>
                    <td>${campo.cantidad}</td>
                    <td>
                        <a href="ControlerProducto?Op=Consultar&Id=${campo.id}">Consultar</a>
                        <a href="ControlerProducto?Op=Modificar&Id=${campo.id}">Modificar</a>
                        <a href="ControlerProducto?Op=Eliminar&Id=${campo.id}">Eliminar</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
