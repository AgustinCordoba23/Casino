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
  				<form action="actualizar" method="get">
  					<input type="hidden" name="user" value=<%=u.getId()%>>
  					<button type="submit" class="btn btn-outline-secondary" style="margin-left:55px">Editar perfil</button>
  				</form>
			</div> 
			
			
			
		  </div>
		  
		  
		  <div class="column right">
		    
		    
		    
		    
		    
		  </div>
		</div>
	 
 
	</body>

</html>