<%-- 
    Document   : index
    Created on : 17/09/2022, 08:38:47 AM
    Author     : javie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de Gestión</title>
        <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap" rel="stylesheet">
        <<link rel="stylesheet" href="css/panles.css"/>>
   
        <!-- Sistema de Inactividad -->
        <script src="sessionTimeout.js"></script>
    </head>
    <body>
        <%  
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");  
            if (session.getAttribute("user")==null){
                response.sendRedirect("login.jsp");
                return;
            }

            Entidades.usuarios usuario = (Entidades.usuarios) session.getAttribute("user");
            Boolean esAdmin = (Boolean) session.getAttribute("esAdmin");
        %>

        <div class="header-box">
            <h1>Menú principal</h1>
 <a href="CerrarSesion" class="back-button">Cerrar Sesión</a>
        </div>
            <% if (usuario != null) { %>
                <div class="welcome-box">
                    <h3>¡Bienvenido, <%= usuario.getIdUsuario() %>!</h3>
                    <% if (esAdmin != null && esAdmin) { %>
                        <span class="admin-badge">Administrador</span>
                    <% } %>
                </div>
            <% } %>

            <% if (session.getAttribute("mensaje") != null) { %>
                <div style="color: green; text-align: center; margin-bottom: 15px;">
                    <%= session.getAttribute("mensaje") %>
                    
                </div>
                <% session.removeAttribute("mensaje"); %>
            <% } %>

            <a href="Clientes.jsp" class="menu-item">Clientes</a>
            <a href="Productos.jsp" class="menu-item">Productos</a>
            <a href="Pedidos.jsp" class="menu-item">Pedidos</a>

            <% if (esAdmin != null && esAdmin) { %>
                <a href="UsuariosServlet?accion=listar" class="menu-item admin-only">Usuarios (Admin)</a>
            <% } %>

           
    </body>
</html>