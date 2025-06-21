<%-- 
    Document   : usuarios
    Created on : 1 jun. 2025, 16:09:31
    Author     : Matiasjobeth
--%>

<%@page import="Entidades.usuarios"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="sessionTimeout.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de Usuarios</title>
        <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/nuevoProduc.css"/>
        <script>
            function confirmarEliminacion(usuario) {
                if (usuario === 'JGARCIA') {
                    alert('No se puede eliminar al usuario administrador principal.');
                    return false;
                }
                return confirm('¿Estás seguro de que deseas eliminar el usuario "' + usuario + '"?');
            }
            
            function togglePassword(inputId, buttonId) {
                var input = document.getElementById(inputId);
                var button = document.getElementById(buttonId);
                
                if (input.type === "password") {
                    input.type = "text";
                    button.innerHTML = "👁️‍🗨️";
                    button.title = "Ocultar contraseña";
                } else {
                    input.type = "password";
                    button.innerHTML = "👁️";
                    button.title = "Mostrar contraseña";
                }
            }
            
            function togglePasswordDisplay(elementId) {
                var element = document.getElementById(elementId);
                var currentText = element.innerHTML;
                
                if (currentText.includes('•')) {
                    element.innerHTML = element.getAttribute('data-password');
                } else {
                    element.innerHTML = '••••••••';
                }
            }
        </script>
    </head>
    <body>
        <%  
            if (session.getAttribute("user")==null){
                response.sendRedirect("login.jsp");
                return;
            }
            
            Boolean esAdmin = (Boolean) session.getAttribute("esAdmin");
            if (esAdmin == null || !esAdmin) {
                session.setAttribute("mensaje", "Acceso denegado. Solo los administradores pueden gestionar usuarios.");
                response.sendRedirect("index.jsp");
                return;
            }
            
            usuarios usuarioActual = (usuarios) session.getAttribute("user");
        %>
        
        <div class="container">
            <div class="header-box">
                <h1>Panel de Administración - Gestión de Usuarios</h1>
                <p>Acceso exclusivo para: <%= usuarioActual.getIdUsuario() %></p>
                    <a href="index.jsp" class="btn btn-secondary">Volver al Menú Principal</a>
            </div>
            
            <% if (request.getAttribute("mensaje") != null) { %>
                <div class="message success">
                    <%= request.getAttribute("mensaje") %>
                </div>
            <% } %>
            
            <% if (request.getAttribute("error") != null) { %>
                <div class="message error">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>
            
            <% 
                usuarios usuarioEditar = (usuarios) request.getAttribute("usuarioEditar");
                if (usuarioEditar != null) {
            %>
            <div class="edit-form">
                <h3> Modificar Usuario: <%= usuarioEditar.getIdUsuario() %></h3>
                
                <div class="form-group">
                    <div class="password-label">Contraseña actual:</div>
                    <div class="password-display" id="currentPassword<%= usuarioEditar.getIdUsuario() %>" 
                         data-password="<%= usuarioEditar.getPassword() %>">
                        ••••••••
                    </div>
                    <span class="show-password" 
                          onclick="togglePasswordDisplay('currentPassword<%= usuarioEditar.getIdUsuario() %>')">
                         Mostrar/Ocultar contraseña actual
                    </span>
                </div>
                        <div class="main-content">
                <form action="UsuariosServlet" method="post">
                    <input type="hidden" name="accion" value="modificar">
                    <input type="hidden" name="idOriginal" value="<%= usuarioEditar.getIdUsuario() %>">
                    
                    <div class="form-group">
                        <label for="txtUsuarioEdit">ID Usuario:</label>
                        <input type="text" id="txtUsuarioEdit" name="txtUsuario" 
                               value="<%= usuarioEditar.getIdUsuario() %>" 
                               required maxlength="50"
                               <%= "JGARCIA".equals(usuarioEditar.getIdUsuario()) ? "readonly style='background-color: #f8f9fa;'" : "" %>>
                        <% if ("JGARCIA".equals(usuarioEditar.getIdUsuario())) { %>
                            <small style="color: #856404;">El ID del administrador principal no se puede modificar</small>
                        <% } %>
                    </div>
                    
                    <div class="form-group">
                        <label for="txtPasswordEdit">Nueva Contraseña:</label>
                        <div class="password-container">
                            <input type="password" id="txtPasswordEdit" name="txtPassword" 
                                   value="<%= usuarioEditar.getPassword() %>" required>
                            <button type="button" class="password-toggle" id="toggleBtnEdit" 
                                    onclick="togglePassword('txtPasswordEdit', 'toggleBtnEdit')" 
                                    title="Mostrar contraseña">👁️</button>
                        </div>
                        <small style="color: #666;">Puede mantener la contraseña actual o establecer una nueva</small>
                    </div>
                    
                    <button type="submit" class="btn btn-warning">Guardar Cambios</button>
                    <a href="UsuariosServlet?accion=listar" class="btn btn-secondary">Cancelar</a>
                </form>
                        </div>
            </div>
            <% } %>
            
            <div class="form-section">
                <h3>Agregar Nuevo Usuario</h3>
                <form action="UsuariosServlet" method="post">
                    <input type="hidden" name="accion" value="agregar">
                    
                    <div class="form-group">
                        <label for="txtUsuario">ID Usuario:</label>
                        <input type="text" id="txtUsuario" name="txtUsuario" required maxlength="50">
                    </div>
                    
                    <div class="form-group">
                        <label for="txtPassword">Contraseña:</label>
                        <div class="password-container">
                            <input type="password" id="txtPassword" name="txtPassword" required>
                            <button type="button" class="password-toggle" id="toggleBtn" 
                                    onclick="togglePassword('txtPassword', 'toggleBtn')" 
                                    title="Mostrar contraseña">👁️</button>
                        </div>
                    </div>
                    
                    <button type="submit" class="btn btn-primary">Agregar Usuario</button>
                </form>
                
            
            <h3>Lista de Usuarios</h3>
            <% 
                List<usuarios> listaUsuarios = (List<usuarios>) request.getAttribute("usuarios");
                if (listaUsuarios != null && !listaUsuarios.isEmpty()) {
            %>
                <table>
                    <thead>
                        <tr>
                            <th>ID Usuario</th>
                            <th>Contraseña</th>
                            <th>Tipo</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (usuarios user : listaUsuarios) { 
                            boolean esUsuarioAdmin = "JGARCIA".equals(user.getIdUsuario());
                        %>
                        <tr class="<%= esUsuarioAdmin ? "admin-user" : "" %>">
                            <td>
                                <%= user.getIdUsuario() %>
                                <%= esUsuarioAdmin ? " 👑" : "" %>
                            </td>
                            <td>
                                <span id="password<%= user.getIdUsuario() %>" 
                                      data-password="<%= user.getPassword() %>">••••••••</span>
                                <span class="show-password" 
                                      onclick="togglePasswordDisplay('password<%= user.getIdUsuario() %>')">
                                    
                                </span>
                            </td>
                            <td>
                                <%= esUsuarioAdmin ? "Administrador" : "Usuario" %>
                            </td>
                            <td>
                                <% if (!esUsuarioAdmin) { %>
                                    <a href="UsuariosServlet?accion=editar&id=<%= user.getIdUsuario() %>" 
                                       class="btn btn-warning">
                                        Modificar
                                    </a>
                                    <a href="UsuariosServlet?accion=eliminar&id=<%= user.getIdUsuario() %>" 
                                       class="btn btn-danger"
                                       onclick="return confirmarEliminacion('<%= user.getIdUsuario() %>')">
                                        Eliminar
                                    </a>
                                <% } else { %>
                                    <a href="UsuariosServlet?accion=editar&id=<%= user.getIdUsuario() %>" 
                                       class="btn btn-warning">
                                       ️ Modificar
                                    </a>
                                    <span style="color: #666; font-style: italic;">Admin Principal</span>
                                <% } %>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            <% } else { %>
                <div class="message">
                    No hay usuarios registrados en el sistema.
                </div>
            <% } %>
            
            <div style="margin-top: 30px; text-align: center;">
            
            </div>
        </div>
    </body>
</html>