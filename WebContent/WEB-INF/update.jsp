<%@page%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>ACTUALIZACION</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="style/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
		<link rel="stylesheet" href="style/registro.css">
	</head>

	<body>

		<div class="wrapper" style="background-image: url('images/fondo.jpg');">
			<div class="inner">
				<div class="image-holder">
					<img src="images/lado-update.png" height= "100%" >
				</div>
				<form action="actualizar" method="post">
					<h3>Actualiza todos los siguientes datos</h3>
					<h4 style="margin-bottom: 10px; text-align:center">Si hay alguno que no desees, ingresa su valor actual</h4>
					<div class="form-group">
						<input type="text" name="nombre" placeholder="Nombre" class="form-control" required>
						<input type="text" name="apellido" placeholder="Apellido" class="form-control" required>
					</div>
					<div class="form-wrapper">
						<input type="text" name="nombre_usuario" placeholder="Usuario" class="form-control" required>
						<i class="zmdi zmdi-account"></i>
					</div>
					<div class="form-wrapper">
						<input type="text" name= "email" placeholder="Email" class="form-control" required>
						<i class="zmdi zmdi-email"></i>
					</div>
					<div class="form-wrapper">
						<input type="password" name="password" id="password" placeholder="ContraseÒa" class="form-control">
						<i class="zmdi zmdi-lock"></i>
					</div>
					<div class="form-wrapper">
						<input type="password" name="confirm_password" id="confirm_password" placeholder="Confirmar contraseÒa" class="form-control">
						<i class="zmdi zmdi-lock"></i>
					</div>
					<input type="hidden" name="id" value=<%=session.getAttribute("id")%>>
					<button onclick="return Validate()" style="margin-top:10px; margin-bottom:10px">Actualizar
						<i class="zmdi zmdi-arrow-right"></i>
					</button>
					<p style="text-align:center"><small>Si se vuelve a presentar, el email ya est· siendo utilizado</small></p>
				</form>
			</div>
		</div>
				
	<script type="text/javascript">
	    function Validate(){
	        var password = document.getElementById("password").value;
	        var confirmPassword = document.getElementById("confirm_password").value;
	        if (password != confirmPassword) {
	            alert("Contrase√±as no coinciden");
	            return false;
	        }
		 return true;
	    }
    </script>
			
	</body>
</html>