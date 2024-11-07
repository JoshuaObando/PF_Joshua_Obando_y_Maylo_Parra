<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.CSS">
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
            // Oculta ambos paneles
            document.querySelector('.iniciar-sesion').classList.remove('activo');
            document.querySelector('.crearcuenta').classList.remove('activo');
            document.querySelector('.sobrenostros').classList.remove('activo');
            
            // Muestra el panel seleccionado
            document.querySelector(`.${panelId}`).classList.add('activo');
        }
    </script>

        </div>
    </div>
    <h1 class="eslogan">Bienvenido a tu barbería de confianza</h1>
    <div class="iniciar-sesion panel activo">
        <div class="contenedor">
            <form class="formulario-sesioninicio">
            <h2>Iniciar sesion</h2>
            <input class="input-box" type="email" placeholder="Correo electronico" required>
            <input class ="input-box" type="password" placeholder="Contraseña" required> 
            <input type="submit" value="Iniciar sesion" onclick="">
            </form>
        </div>
    </div>
    <div class="crearcuenta panel">
        <div class="contenedor">
            <form class="formulario-crearcuenta">
            <h2>Crear cuenta</h2>
            <input class="input-box" type="email" placeholder="Correo electronico">
            <input class="input-box" type="password" placeholder="Contraseña">
            <input type="submit" value="Crear cuenta" onclick="">
            </form>
        </div>
    </div>
    <div class="sobrenostros panel">
        <div class="headerUs">
            <h2>Sobre Nosotros</h2>
        <img src="https://cdn.create.vista.com/downloads/5b64726e-b531-42d9-a480-cf0f85605c33_1024.jpeg" alt="Imagen de barberia">
        </div>
        
        <div class="cuerpo">
            <img class="img" src="https://ayalatin.com/docs/bd9ca31e.jpg" alt="Ice cube">
            <p>En TheMan, la esencia del hombre se encuentra. Nuestra barbería ofrece cortes personalizados que no solo cambian la apariencia, sino que también elevan el estado de ánimo. Con un equipo de barberos expertos y una pasión por la calidad, nos dedicamos a hacer que cada cliente se sienta como un verdadero hombre. ¡Ven y descubre la diferencia que solo un toque de calidez y profesionalismo puede hacer?</p>
        </div>
    </div>
</body>
</html>