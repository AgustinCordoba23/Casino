<!DOCTYPE html>
<%@page import="entities.Usuario"%>
<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	    <title>CASINO</title>
	
	    <link href="style/bootstrap.css" rel="stylesheet">
	
	    <link href="style/casino.css" rel="stylesheet">
	    
	    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	    
	    <% 
	    	Usuario u= (Usuario)session.getAttribute("usuario");
	    %>
  	</head>

  	<body>

	    <div class="row">
		  <div class="column left">
			<div class="w3-container w3-white">
				 <%if (u.getGenero().equals("femenino")) { %> 
					<img style="margin-left:60px" src="images/avatar_female.png">
				<% }else{ %>
					<img style="margin-left:40px" src="images/avatar_male.png">
				<% }
				%>	
				<div style="text-align:center"> 
					<h6><%=u.getNombre_usuario()%>#<%=u.getId()%></h6>
				</div>
  				<h6>Nombre: <%=u.getNombre() %></h6>
  				<h6>Apellido: <%=u.getApellido() %></h6>
  				<h6>Email: <%=u.getEmail() %></h6>
  				<h6>Dinero actual: $<%=u.getDinero() %></h6>
  				<form action="actualizar" method="get">
  					<input type="hidden" name="user" value=<%=u.getId()%>>
  					<button type="submit" class="btn btn-outline-secondary" style="margin-left:53px; margin-bottom:10px">Editar perfil</button>
  				</form>
			</div> 
			
			<form action="recargar_dinero" method="get">
  					<input type="hidden" name="user" value=<%=u.getId()%>>
  					<button type="submit" class="btn btn-warning" style="margin-top: 10px; margin-left:53px">Recargar dinero</button>
  			</form>
  			
  			<form action="retirar_dinero" method="get">
  					<input type="hidden" name="user" value=<%=u.getId()%>>
  					<button type="submit" class="btn btn-success" style="margin-top: 10px; margin-left:60px">Retirar dinero</button>
  			</form>
  			
  			<form action="" method="">
  					<input type="hidden" name="user" value=<%=u.getId()%>>
  					<button type="" class="btn btn-primary" style="margin-top: 10px; margin-left:82px">TOPs 10</button>
  			</form>
			
		  </div>

		  <div class="column right">
		    
		    
		    <button type="submit" style="margin-left:100px"><img src="images/bj.png" width="250px" height="250px"></button>
		    <button type="submit" style="margin-left:200px"><img src="images/ruleta.jpg" width="250px" height="250px"></button>
		    <button type="submit" style="margin-left:340px;margin-top:30px"><img src="images/loteria.png" width="250px" height="250px"></button>
		    
		  </div>
		</div>
	 
 
	</body>

</html>