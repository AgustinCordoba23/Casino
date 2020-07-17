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
		    
		    <div class="w3-container w3-trasnparent">
		    	<div class="row">
				    <div class="col-md-3">
				   		 <img src="images/bj.png" width="200px" height="150px" style="margin-top:5px">
				    </div>
				    <div class="col-md-7" style="text-align:justify; color:gold" >
							<p><small>El blackjack, también llamado veintiuno, es un juego de cartas, propio de los casinos con una o más
							barajas inglesas de 52 cartas sin los comodines, que consiste en sumar un valor lo más próximo a 21
							pero sin pasarse. Cada jugador de la mesa juega únicamente contra el crupier, 
						    intentando conseguir una mejor jugada que este. El crupier está sujeto a reglas fijas que le impiden
						    tomar decisiones sobre el juego. Por ejemplo, está obligado a pedir carta siempre que su 
						    puntuación sume 16 o menos, y obligado a plantarse si suma 17 o más.</small></p>
					 </div>
				    <div class="cold-md-4">
				    <form action="blackjack" method="post">
				    	<input type="hidden" name="id" value=<%=u.getId()%>>
				    	<input type="hidden" name="nombre_usuario" value=<%=u.getNombre_usuario()%>>
				    	<input type="hidden" name="dinero" value=<%=u.getDinero()%>>
				    	<button type="submit" class="btn btn-success" style="margin-top:60px">JUGAR</button>
				    </form>
				    </div>
			    </div>
		    </div>
		    
		    <div class="w3-container w3-trasnparent">
		    	<div class="row">
				    <div class="col-md-3">
				   		 <img src="images/ruleta.jpg" width="200px" height="150px" style="margin-top:5px">
				    </div>
				    <div class="col-md-7" style="text-align:justify; color:gold" >
							<p><small>La ruleta se juega en la mesa de la ruleta, en donde se enumeran todos los resultados 
							posibles y en donde los jugadores ponen sus apuestas en función del resultado que predicen. 
							El crupier hace girar la rueda de la ruleta y arroja la bola de la ruleta en la rueda. La bola 
							finalmente caerá en un número y se darán a conocer a los ganadores de esa ronda particular de la 
							ruleta. La ruleta se juega en contra del casino y no en contra de los otros jugadores. El juego 
							ofrece diferentes opciones de apuestas.</small></p>
					 </div>
				    <div class="cold-md-4">
				    <form action="ruleta" method="post">
				    	<input type="hidden" name="id" value=<%=u.getId()%>>
				    	<input type="hidden" name="nombre_usuario" value=<%=u.getNombre_usuario()%>>
				    	<input type="hidden" name="dinero" value=<%=u.getDinero()%>>
				    	<button type="submit" class="btn btn-success" style="margin-top:60px">JUGAR</button>
				    </form>
				    </div>
			    </div>
		    </div>
		    
		    <div class="w3-container w3-trasnparent">
		    	<div class="row">
				    <div class="col-md-3">
				   		 <img src="images/loteria.png" width="200px" height="150px" style="margin-top:5px">
				    </div>
				    <div class="col-md-7" style="text-align:justify; color:gold" >
							<p><small>En francés, lote significa suerte, luego se aplica a la parte de la herencia que tocó a
							 cada heredero (teniendo en el reparto algo de suerte que otros) y de allí se originó lotería para 
							 nombrar el juego de azar por el que los apostadores reciben más o menos dinero u otros premios 
							 (o nada) dependiendo de su destino. Muchas personas han soñado en algún momento de sus vidas con la 
							 esperanza de ganar premios en el sorteo de la lotería. Recibir un premio millonario para entrar en el 
							 banco y vivir una vida libre de preocupaciones. </small></p>
					 </div>
				    <div class="cold-md-4">
				    <form action="loteria" method="post">
				    	<input type="hidden" name="id" value=<%=u.getId()%>>
				    	<input type="hidden" name="nombre_usuario" value=<%=u.getNombre_usuario()%>>
				    	<input type="hidden" name="dinero" value=<%=u.getDinero()%>>
				    	<button type="submit" class="btn btn-success" style="margin-top:60px">JUGAR</button>
				    </form>
				    </div>
			    </div>
		    </div>
		    
		  </div>
		</div>
	 
 
	</body>

</html>