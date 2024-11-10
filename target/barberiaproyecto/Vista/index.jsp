<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link rel="icon" type="image/x-icon" href="https://cdn-icons-png.flaticon.com/128/595/595777.png">
    <title>Barberia TheMan</title>
</head>
<body class="Sesion2">
    <div class="overlay"></div>
    <div class="Header">
        <div class="Logo">The<span class="dorado">Man</span></div>
        <div class="navegacion">
            <nav>
                <ul>
                    <li><a onclick="togglePanel('iniciar-sesion')">Home</a></li>
                    <li><a onclick="togglePanel('sobrenostros')">Sobre Nosotros</a></li>
                </ul>
            </nav>
        </div>
        <div class="auth-buttons">
            <button class="btn-registro" onclick="togglePanel('iniciar-sesion')">Iniciar sesión</button>
            <button class="btn-registro" onclick="togglePanel('crearcuenta')">Crear cuenta</button>
            <script>
                function togglePanel(panelId) {
                    document.querySelector('.iniciar-sesion').classList.remove('activo');
                    document.querySelector('.crearcuenta').classList.remove('activo');
                    document.querySelector('.sobrenostros').classList.remove('activo');
                    document.querySelector(`.${panelId}`).classList.add('activo');
                }
            </script>
        </div>
    </div>
    <h1 class="eslogan">Bienvenido a tu barbería de confianza</h1>
    <div class="iniciar-sesion panel activo">
        <div class="contenedor">
         <form action="/barberiaproyecto/Controlador/Logica.jsp" method="post">
                <h2>Iniciar sesión</h2>
                <input class="input-box" type="email" placeholder="Correo electronico" name="email" required>
                <input class="input-box" type="password" placeholder="Contraseña" name="password" required>
                <input type="submit" name="Iniciar-sesion" value="Iniciar sesión">
            </form>
        </div>
    </div>
    <div class="crearcuenta panel">
        <div class="contenedor">
            <form action="../Controlador/Logica.jsp" method="post">
                <h2>Crear cuenta</h2>
                <input class="input-box" type="email" placeholder="Correo electronico" name="email2" required>
                <input class="input-box" type="password" placeholder="Contraseña" name="password2" required>
                <input type="submit" name="Crear-cuenta" value="Crear cuenta">
            </form>
        </div>
    </div>
</body>
</html>