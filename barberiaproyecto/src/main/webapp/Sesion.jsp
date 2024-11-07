<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio sesion</title>
    <link rel="stylesheet" href="style.CSS">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body class="Sesion">
    <div class="wrapper">
    <nav class="nav">
        <div class="nav-logo">
            <p>LOGO .</p>
        </div>
        <div class="nav-menu">
            <ul>
                <li><a href="#" class="link active">Home</a></li>
                <li><a href="#" class="link">Sobre Nosotros</a></li>
            </ul>
        </div>

        <div class="nav-button">
            <buttom class="btn white-btn" id="loginBtn">Sign in</buttom>
            <buttom class="btn" id="registerBtn">Sign up</buttom>
        </div>
        <div class="nav-menu-btn">
             <i class="bx bx-menu"></i>
        </div>
    </nav>
    <!------------------------------ Form box ---------------------------------->
     <div class="form-box">
        <!-------------------------- registrar -------------------------->
    <div class="register-container" id="register">
        <div class="top">
            <span>Tienes una cuenta? <a href="#" onclick="Metodo"></a>Login</span>
           
        </div>
        <div class="two-forms">
            <div class="input-box">
                <p>Ingrese su correo</p>
                <input type="email" class="input-field" placeholder="Correo" required>
                <i class="bx bx-user"></i>
            </div>
            <div class="input-box">
                <p>Ingrese su correo</p>
                <input type="password" class="input-field" placeholder="Contraseña" required>
                <i class="bx bx-lock"></i>
            </div>
            <input type="submit" class="submit" value="Register">
        </div>
        <div class="two-col">
            <div class="one">
                <input type="checkbox" id="register-check">

            </div>
            <div class="two">
                <label href="#">Terminos & condiciones</label>
            </div>
        </div>
    </div>
    <!-------------------------- fin de registrar div-------------------------->
   
    </div>
</div>
</body>
</html>