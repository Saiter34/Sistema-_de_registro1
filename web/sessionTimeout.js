/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

// Sistema de Cierre Automático por Inactividad
// Configuración: 30 segundos de inactividad
class SessionTimeoutManager {
    constructor() {
        this.timeoutDuration = 30000; // 30 segundos en milisegundos
        this.timeoutId = null;
        this.isActive = true;
        
        // Inicializar el sistema
        this.init();
    }
    
    init() {
        // Solo activar si hay una sesión activa (no estamos en login.jsp)
        if (this.isLoginPage()) {
            return;
        }
        
        // Eventos que resetean el timer de inactividad
        const events = ['mousedown', 'mousemove', 'keypress', 'scroll', 'touchstart', 'click'];
        
        // Agregar listeners para detectar actividad
        events.forEach(event => {
            document.addEventListener(event, () => this.resetTimer(), true);
        });
        
        // Listener para detectar cuando se cierra la ventana/pestaña
        window.addEventListener('beforeunload', () => this.cleanup());
        
        // Iniciar el timer
        this.resetTimer();
        
        console.log('🔒 Sistema de timeout de sesión iniciado (30 segundos)');
    }
    
    isLoginPage() {
        // Verificar si estamos en la página de login
        return window.location.pathname.includes('login.jsp') || 
               document.title.includes('Iniciar Sesión');
    }
    
    resetTimer() {
        if (!this.isActive) return;
        
        // Limpiar el timeout anterior si existe
        if (this.timeoutId) {
            clearTimeout(this.timeoutId);
        }
        
        // Establecer nuevo timeout
        this.timeoutId = setTimeout(() => {
            this.handleTimeout();
        }, this.timeoutDuration);
    }
    
    handleTimeout() {
        if (!this.isActive) return;
        
        console.log('⏰ Tiempo de inactividad alcanzado, cerrando sesión...');
        
        // Desactivar el sistema para evitar múltiples llamadas
        this.isActive = false;
        
        // Mostrar mensaje al usuario (opcional)
        this.showTimeoutMessage();
        
        // Realizar el cierre de sesión
        this.performLogout();
    }
    
    showTimeoutMessage() {
        // Crear un mensaje temporal
        const message = document.createElement('div');
        message.innerHTML = '⏰ Sesión cerrada por inactividad';
        message.style.cssText = `
            position: fixed;
            top: 20px;
            right: 20px;
            background-color: #dc3545;
            color: white;
            padding: 15px 20px;
            border-radius: 5px;
            z-index: 10000;
            font-family: Arial, sans-serif;
            font-size: 14px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.3);
        `;
        
        document.body.appendChild(message);
        
        // Remover el mensaje después de 2 segundos
        setTimeout(() => {
            if (message.parentNode) {
                message.parentNode.removeChild(message);
            }
        }, 2000);
    }
    
    performLogout() {
        // Usar el servlet existente CerrarSesion
        try {
            // Método 1: Redirección directa
            window.location.href = 'CerrarSesion';
        } catch (error) {
            console.error('Error al cerrar sesión:', error);
            
            // Método 2: Como fallback, intentar con fetch
            fetch('CerrarSesion', {
                method: 'POST',
                credentials: 'same-origin'
            }).then(() => {
                window.location.href = 'login.jsp';
            }).catch(() => {
                // Método 3: Redirección directa a login como último recurso
                window.location.href = 'login.jsp';
            });
        }
    }
    
    cleanup() {
        // Limpiar el timeout cuando se cierra la ventana
        if (this.timeoutId) {
            clearTimeout(this.timeoutId);
        }
        this.isActive = false;
    }
    
    // Método público para pausar el sistema temporalmente
    pause() {
        this.isActive = false;
        if (this.timeoutId) {
            clearTimeout(this.timeoutId);
        }
        console.log('⏸️ Sistema de timeout pausado');
    }
    
    // Método público para reanudar el sistema
    resume() {
        this.isActive = true;
        this.resetTimer();
        console.log('▶️ Sistema de timeout reanudado');
    }
}

// Inicializar el sistema cuando se carga la página
document.addEventListener('DOMContentLoaded', function() {
    // Crear la instancia global del manager
    window.sessionManager = new SessionTimeoutManager();
});

// También inicializar si la página ya está cargada
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', function() {
        if (!window.sessionManager) {
            window.sessionManager = new SessionTimeoutManager();
        }
    });
} else {
    // La página ya está cargada
    if (!window.sessionManager) {
        window.sessionManager = new SessionTimeoutManager();
    }
}
