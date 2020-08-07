<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="entities.Usuario"%>
<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	    <title>ASAN'S ADMIN PANEL</title>
	
	    <link href="style/bootstrap.css" rel="stylesheet"> 
	    <link href="style/admin.css" rel="stylesheet">   
	    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	    
	    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	    
	    <% 
	    	Usuario u= (Usuario)session.getAttribute("usuario");
	    %>
	    
</head>
<body>

		<div class="w3-container w3-blue" style="margin-top:50px; margin-left:50px; margin-right:50px; text-align:center; padding: 10px; border:2px solid blue">
	
				<h3>Bienvenido <%=u.getNombre_usuario()%>#<%=u.getId()%></h3>
				
				<div class="row">
				
					<div class="col-md-4">
							<button onclick="agregar_usuario()" class="btn btn-secundary" style="margin: 10px">INGRESAR NUEVO ADMINISTRADOR</button>
							<button onclick="cambiar_rol()" class="btn btn-secundary" style="margin: 10px">CAMBIAR ROL DE UN USUARIO</button>
							<button onclick="eliminar()" class="btn btn-secundary" style="margin: 10px">ELIMINAR USUARIO</button>
							<form action="mostrar_usuarios" method="post">
	  							<input type="hidden" name="user" value=<%=u.getId()%>>
	  							<button type="submit" class="btn btn-secundary" style="margin: 10px">MOSTRAR USUARIOS</button>
	  						</form>
	  						<button type="button" class="btn btn-secundary" onclick="window.location.href='index.html'" style="margin: 10px">CERRAR SESION</button>	
					</div>
					
					<div class="col-md-8">
						<div hidden id="agregar_usuario" class="w3-container w3-grey" style="padding: 10px; margin-top: 20px">
							<form action="registro_admin" method="post">
								<input type="text" name="nombre_usuario" placeholder="Nombre de usuario" class="form-control" required style="margin-bottom:10px">
			  					<input type="text" name="nombre" placeholder="Nombre" class="form-control" required style="margin-bottom:10px">
			  					<input type="text" name="apellido" placeholder="Apellido" class="form-control" required style="margin-bottom:10px">
			  					<input type="text" name="email" placeholder="Email" class="form-control" required style="margin-bottom:10px">
			  					<input type="password" name="password" placeholder="Contraseña" class="form-control" required style="margin-bottom:10px">
			  					<select name="genero" class="form-control" style="margin-bottom:10px">
									<option value="" disabled selected>Género</option>
									<option value="masculino">Masculino</option>
									<option value="femenino">Femenino</option>
								</select>
								<input type="hidden" name="user" value=<%=u.getId()%>>
			  					<button id="agregar" class="btn btn-primary">AGREGAR</button>
							</form>
						</div>
						
						<div hidden id="cambiar_rol" class="w3-container w3-grey" style="padding: 10px; margin-top: 20px">
							<form action="cambiar_rol" method="post">
			  					<input type="text" name="email" placeholder="Email del usuario" class="form-control" required style="margin-bottom:10px">
			  					<select name="rol" class="form-control" style="margin-bottom:10px">
									<option value="" disabled selected>Nuevo rol</option>
									<option value="admin">Administrador</option>
									<option value="player">Jugador</option>
								</select>
								<input type="hidden" name="user" value=<%=u.getId()%>>
								<button id="cambiar" class="btn btn-primary">CAMBIAR</button>
							</form>
						</div>
						
						<div hidden id="eliminar" class="w3-container w3-grey" style="padding: 10px; margin-top: 20px">
			  				<form action="eliminar_usuario" method="post">	
			  					<input type="text" name="email" placeholder="Email del usuario" class="form-control" required style="margin-bottom:10px">
								<input type="hidden" name="user" value=<%=u.getId()%>>
								<button id="cambiar" class="btn btn-primary">BORRAR</button>
							</form>
						</div>
						
		
					</div>
				</div>
	
		</div>
		
		
		<script>
			function agregar_usuario(){
				document.getElementById("agregar_usuario").removeAttribute("hidden");
			}
			
			function cambiar_rol(){
				document.getElementById("cambiar_rol").removeAttribute("hidden");
			}
			
			function eliminar(){
				document.getElementById("eliminar").removeAttribute("hidden");
			}
		
		</script>
</body>
</html>