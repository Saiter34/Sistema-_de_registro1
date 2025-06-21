<%-- 
    Document   : nuevoPedido
    Created on : 8 jun. 2025, 17:46:54
    Author     : Matiasjobeth
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="sessionTimeout.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Nuevo Pedido</title>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/nuevoProduc.css"/>
    
 
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="header-box">
            <h1>Insertar producto</h1>
             <a href="index.jsp" class="back-button">Volver al menú principal</a>
        </div> 
        </div>

        <div class="info-box">
            <h4>Instrucciones:</h4>
            <p>• Complete todos los campos obligatorios marcados con <span class="required">*</span></p>
            <p>• Seleccione un cliente válido del sistema</p>
            <p>• La fecha del pedido se establecerá automáticamente</p>
        </div>
        <div class="main-content">
        <form action="ControlerPedido" method="post" id="formNuevoPedido">
            <input type="hidden" name="Op" value="Crear">
            
            <!-- Información Básica del Pedido -->
            <div class="form-section">
                <div class="section-title">Información Básica del Pedido</div>
                
                <div class="form-grid">
                    <div class="form-row">
                        <label>Cliente <span class="required">*</span>:</label>
                        <select name="Id_Cliente" id="clienteSelect" required onchange="mostrarInfoCliente()">
                            <option value="">Seleccione un cliente</option>
                            <!-- Aquí deberías cargar los clientes desde la base de datos -->
                            <option value="C001">C001 - Juan Pérez García</option>
                            <option value="C002">C002 - María López Rodríguez</option>
                            <option value="C003">C003 - Carlos Mendoza Silva</option>
                            <option value="C004">C004 - Ana Torres Morales</option>
                            <option value="C005">C005 - Luis Herrera Castro</option>
                        </select>
                    </div>
                    
                    <div class="form-row">
                        <label>Fecha Pedido:</label>
                        <input type="date" name="Fecha" id="fechaPedido" required readonly>
                    </div>
                </div>

                <div id="clienteInfo" class="cliente-info">
                    <strong>Información del Cliente:</strong>
                    <div id="datosCliente"></div>
                </div>
            </div>

            <!-- Estado y Configuración -->
            <div class="form-section">
                <div class="section-title">Configuración del Pedido</div>
                
                <div class="form-grid">
                    <div class="form-row">
                        <label>Estado Inicial:</label>
                        <select name="Estado">
                            <option value="Pendiente" selected>Pendiente</option>
                            <option value="En Proceso">En Proceso</option>
                            <option value="Completado">Completado</option>
                        </select>
                    </div>
                    
                    <div class="form-row">
                        <label>Fecha Entrega Estimada:</label>
                        <input type="date" name="FechaEntrega" id="fechaEntrega">
                    </div>
                </div>
            </div>

            <!-- Información de Entrega -->
            <div class="form-section">
                <div class="section-title">Información de Entrega</div>
                
                <div class="form-row full-width">
                    <label>Dirección de Entrega:</label>
                    <textarea name="DireccionEntrega" placeholder="Ingrese la dirección completa de entrega..."></textarea>
                </div>
                
                <div class="form-row">
                    <label>Teléfono de Contacto:</label>
                    <input type="tel" name="TelefonoContacto" placeholder="Ej: 999-123-456">
                </div>
            </div>

            <!-- Montos del Pedido -->
            <div class="form-section">
                <div class="section-title">Información Económica</div>
                
                <div class="form-grid">
                    <div class="form-row">
                        <label>SubTotal <span class="required">*</span>:</label>
                        <input type="number" name="SubTotal" step="0.01" min="0" placeholder="0.00" required>
                    </div>
                    
                    <div class="form-row">
                        <label>Total Venta <span class="required">*</span>:</label>
                        <input type="number" name="TotalVenta" step="0.01" min="0" placeholder="0.00" required>
                    </div>
                </div>
            </div>

            <!-- Observaciones -->
            <div class="form-section">
                <div class="section-title">Observaciones</div>
                
                <div class="form-row">
                    <label>Observaciones:</label>
                    <textarea name="Observaciones" placeholder="Ingrese observaciones adicionales del pedido..."></textarea>
                </div>
            </div>

            <!-- Botones -->
            <div class="buttons">
                <button type="submit" class="btn btn-success">
                    Crear Pedido
                </button>
                <a href="ControlerPedido?Op=Listar" class="btn btn-secondary">
                    Cancelar
                </a>
            </div>
        </form>
        </div>
    </div>

    <script>
        // Establecer fecha actual al cargar la página
        document.addEventListener('DOMContentLoaded', function() {
            const today = new Date().toISOString().split('T')[0];
            document.getElementById('fechaPedido').value = today;
            
            // Establecer fecha mínima de entrega (mañana)
            const tomorrow = new Date();
            tomorrow.setDate(tomorrow.getDate() + 1);
            document.getElementById('fechaEntrega').min = tomorrow.toISOString().split('T')[0];
        });

        // Mostrar información del cliente seleccionado
        function mostrarInfoCliente() {
            const select = document.getElementById('clienteSelect');
            const infoDiv = document.getElementById('clienteInfo');
            const datosDiv = document.getElementById('datosCliente');
            
            if (select.value) {
                
                const clienteData = {
                    'C001': { apellidos: 'Pérez García', nombres: 'Juan', telefono: '999-111-222' },
                    'C002': { apellidos: 'López Rodríguez', nombres: 'María', telefono: '999-333-444' },
                    'C003': { apellidos: 'Mendoza Silva', nombres: 'Carlos', telefono: '999-555-666' },
                    'C004': { apellidos: 'Torres Morales', nombres: 'Ana', telefono: '999-777-888' },
                    'C005': { apellidos: 'Herrera Castro', nombres: 'Luis', telefono: '999-999-000' }
                };
                
                const cliente = clienteData[select.value];
                if (cliente) {
                    datosDiv.innerHTML = `
                        <p><strong>Apellidos:</strong> ${cliente.apellidos}</p>
                        <p><strong>Nombres:</strong> ${cliente.nombres}</p>
                        <p><strong>Teléfono:</strong> ${cliente.telefono}</p>
                    `;
                    infoDiv.style.display = 'block';
                }
            } else {
                infoDiv.style.display = 'none';
            }
        }

        // Validar fechas
        document.getElementById('fechaEntrega').addEventListener('change', function() {
            const fechaPedido = document.getElementById('fechaPedido').value;
            const fechaEntrega = this.value;
            
            if (fechaEntrega && fechaPedido && fechaEntrega <= fechaPedido) {
                alert('La fecha de entrega debe ser posterior a la fecha del pedido');
                this.value = '';
            }
        });

        // Validar formulario antes de enviar
        document.getElementById('formNuevoPedido').addEventListener('submit', function(e) {
            const cliente = document.getElementById('clienteSelect').value;
            const subTotal = document.querySelector('input[name="SubTotal"]').value;
            const totalVenta = document.querySelector('input[name="TotalVenta"]').value;
            
            if (!cliente) {
                alert('Debe seleccionar un cliente');
                e.preventDefault();
                return false;
            }
            
            if (!subTotal || parseFloat(subTotal) <= 0) {
                alert('El subtotal debe ser mayor a 0');
                e.preventDefault();
                return false;
            }
            
            if (!totalVenta || parseFloat(totalVenta) <= 0) {
                alert('El total de venta debe ser mayor a 0');
                e.preventDefault();
                return false;
            }
            
            if (parseFloat(totalVenta) < parseFloat(subTotal)) {
                alert('El total de venta no puede ser menor al subtotal');
                e.preventDefault();
                return false;
            }
            
            return confirm('¿Está seguro de crear este pedido?');
        });

        // Calcular total automáticamente (ejemplo básico)
        document.querySelector('input[name="SubTotal"]').addEventListener('input', function() {
            const subTotal = parseFloat(this.value) || 0;
            const igv = subTotal * 0.18; // Asumiendo IGV del 18%
            const total = subTotal + igv;
            document.querySelector('input[name="TotalVenta"]').value = total.toFixed(2);
        });
    </script>
</body>
</html>