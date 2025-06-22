<%-- 
    Document   : consultar_producto
    Created on : 7 may. 2025, 20:09:50
    Author     : Matiasjobeth
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <script src="sessionTimeout.js"></script>
    <title>Consultar Producto</title>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap" rel="stylesheet">
        <<link rel="stylesheet" href="css/consultar.css?v=<%= System.currentTimeMillis() %>">
</head>
<body>
    <div class="header-box">
            <h1>Consulta de producto</h1>
             <a href="index.jsp" class="back-button">Volver al menú principal</a>
        </div> 

    <c:if test="${not empty producto}">
         <div class="welcome-box">
        <table>
            <tr><th>Id Producto</th><td>${producto.id}</td></tr>
            <tr><th>Descripción</th><td>${producto.descripcion}</td></tr>
            <tr><th>Costo</th><td>${producto.costo}</td></tr>
            <tr><th>Precio</th><td>${producto.precio}</td></tr>
            <tr><th>Cantidad</th><td>${producto.cantidad}</td></tr>
        </table>
         </div>
    </c:if>

    <c:if test="${empty producto}">
        <p>No se encontró el producto con ese Id.</p>
    </c:if>
</body>
</html>
