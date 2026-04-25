<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Don Rosel - Iniciar Sesión</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        :root { --russet: #88471F; --soldier: #506039; }
        body {
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?auto=format&fit=crop&q=80');
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            align-items: center;
        }
        .login-card { border: none; border-radius: 20px; max-width: 420px; width: 100%; overflow: hidden; }
        .btn-donrosel { background-color: var(--russet); color: white; border-radius: 50px; transition: 0.3s; }
        .btn-donrosel:hover { background-color: #6d3919; color: white; transform: translateY(-2px); }
    </style>
</head>
<body>

<div class="container d-flex justify-content-center px-3">
    <div class="card login-card shadow-lg p-4 p-md-5 bg-white">
        <div class="text-center mb-4">
            <h2 class="fw-bold" style="color: var(--soldier);">¡Hola de nuevo!</h2>
            <p class="text-muted">Ingresa a tu cuenta de Don Rosel</p>
        </div>

        <%-- Alerta de Registro Exitoso --%>
        <c:if test="${param.registro == 'success'}">
            <div class="alert alert-success small py-2 text-center">
                <i class="bi bi-check-circle me-1"></i> ¡Cuenta creada! Ya puedes ingresar.
            </div>
        </c:if>

        <%-- Alerta de Error de Login --%>
        <c:if test="${param.error == '1'}">
            <div class="alert alert-danger small py-2 text-center">
                <i class="bi bi-exclamation-triangle me-1"></i> Correo o clave incorrectos.
            </div>
        </c:if>

        <form action="login" method="POST">
            <div class="mb-3">
                <label class="form-label small fw-bold">Correo Electrónico</label>
                <div class="input-group">
                    <span class="input-group-text bg-light border-end-0"><i class="bi bi-envelope text-muted"></i></span>
                    <input type="email" name="txtemail" class="form-control border-start-0 bg-light" placeholder="ejemplo@correo.com" required>
                </div>
            </div>

            <div class="mb-4">
                <label class="form-label small fw-bold">Contraseña</label>
                <div class="input-group">
                    <span class="input-group-text bg-light border-end-0"><i class="bi bi-lock text-muted"></i></span>
                    <input type="password" name="txtpass" class="form-control border-start-0 bg-light" placeholder="••••••••" required>
                </div>
            </div>

            <button type="submit" class="btn btn-donrosel w-100 fw-bold p-2 mb-3 shadow-sm">INGRESAR</button>

            <div class="text-center">
                <p class="small mb-1">¿Eres nuevo en la tienda?</p>
                <a href="registro" class="fw-bold text-decoration-none" style="color: var(--russet);">Crea una cuenta aquí</a>
                <hr>
                <a href="home" class="text-muted small text-decoration-none"><i class="bi bi-house me-1"></i> Volver al inicio</a>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>