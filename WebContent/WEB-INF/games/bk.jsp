<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	    <title>ASAN'S BLACKJACK</title>
	
	    <link href="style/bootstrap.css" rel="stylesheet"> 
	    <link href="style/juegos.css" rel="stylesheet">   
	    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	    
	    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	    
	    <!-- ESTO NO ANDA: NO LO RECONOCE POR MAS QUE PROBEMOS CON TODOS LOS PATHS  
			<script src="bk.js"></script>
		-->
</head>
<body>
	<div class="w3-container" style="margin-top:50px; margin-left:50px; margin-right:50px; text-align:center; padding: 10px; border:2px solid #1d2951; background-color: #269300">
		<h6 style="background: #269300">DINERO DISPONIBLE $<%=session.getAttribute("dinero")%></h6>		
		<div class="row">
			<div class="col-md-3">
					<img src="images/bj_girls.png" height="520px" width="120%">
			</div>
		
		<div class="col-md-6">
		
		<img src="images/croupier.png" height="250px" width="90%">
		<table id="tabla_croupier" align="center" style="margin-bottom:10px; margin-top:10px">
			<tr>
				<td> <img hidden id="carta_1c" src="" width="45px" height="65px" style="margin-right:5px"> </td>
				<td> <img hidden id="carta_2c" src="" width="45px" height="65px" style="margin-right:5px"> </td>
				<td> <img hidden id="carta_3c" src="" width="45px" height="65px" style="margin-right:5px"> </td>
				<td> <img hidden id="carta_4c" src="" width="45px" height="65px" style="margin-right:5px"> </td>
				<td> <img hidden id="carta_5c" src="" width="45px" height="65px" style="margin-right:5px"> </td>
				<td> <img hidden id="carta_6c" src="" width="45px" height="65px" style="margin-right:5px"> </td>
				<td> <img hidden id="carta_7c" src="" width="45px" height="65px" style="margin-right:5px"> </td>
				<td> <img hidden id="carta_8c" src="" width="45px" height="65px" style="margin-right:5px"> </td>
				<td> <img hidden id="carta_9c" src="" width="45px" height="65px" style="margin-right:5px"> </td>
				<td> <input hidden type="text" name="contador_crupier" id="contador_crupier" size="1" value=""  style="text-align:center; background: orange; border: 0" disabled></td>
			</tr>
		</table>
		
		<table align="center" style="border:1px solid brown">
			<tr>
				<td style="color:gold "> Haga su apuesta: </td>
				<td> <input type="text" name="apuesta" id="apuesta" placeholder="$0000" class="form-control" size="5" style="text-align:center; background: #90ee90; margin-left: 10px">
				<td> <button type="button" id="jugar" class="btn btn-danger" onclick="return jugar()" style="margin-left: 50px; width: 100px; height: 50px; background:#711585">JUGAR</button></td>
				<td>
					<form action="VolverMenu" method="post">
	  					<input type="hidden" name="id" id="id" value=<%=session.getAttribute("id")%>>
						<button type="submit" id="volver_menu" class="btn btn-primary" style="width: 100px; height: 45px; margin-left:10px">VOLVER</button>
					</form>
				</td>
		</table>
		
		<table id="tabla_user" align="center" style="margin-top:10px; margin-bottom:10px">
			<tr>
				<td> <img hidden id="carta_1u" src="" width="45px" height="65px" style="margin-right:5px"> </td>
				<td> <img hidden id="carta_2u" src="" width="45px" height="65px" style="margin-right:5px"> </td>
				<td> <img hidden id="carta_3u" src="" width="45px" height="65px" style="margin-right:5px"> </td>
				<td> <img hidden id="carta_4u" src="" width="45px" height="65px" style="margin-right:5px"> </td>
				<td> <input hidden type="text" name="contador_user" id="contador_user" size="1" value="" style="text-align:center; background: orange; border: 0" disabled></td>
			</tr>
		</table>
		
		<input hidden type="text" name="n" id="n" size="1" value="" disabled>

		<table align="center">
			<tr>
				<td><button hidden type="button" id="otra" class="btn btn-success" onclick="otra()" style="margin-left: 20px; width: 100px; height: 40px">OTRA</button></td>
				<td><button hidden type="button" id="plantarse" class="btn btn-danger" onclick="plantarse()" style="margin-left: 20px; width: 150px; height: 40px">PLANTARSE</button></td>	
			</tr>
		</table>
		
		<h1 hidden id="resultado"></h1>
		
		<div class="row">
				<div class="col-md-6">
					<form action="blackjack" method="post">
		  					<input type="hidden" name="id" id="id" value=<%=session.getAttribute("id")%>>
		  					<input type="hidden" name="ganancia" id="ganancia_0" value=""> 
		  					<input type="hidden" name="tipo" id="tipo" value="0">
							<button hidden type="submit" id="again" class="btn btn-primary">JUGAR DE NUEVO</button>
  					</form>
				</div>
				<div class="col-md-6">
					<form action="blackjack" method="post">
	  					<input type="hidden" name="id" id="id" value=<%=session.getAttribute("id")%>>
	  					<input type="hidden" name="ganancia" id="ganancia_1" value=""> 
	  					<input type="hidden" name="tipo" id="tipo" value="1">
						<button hidden type="submit" id="volver" class="btn btn-primary">VOLVER</button>
  					</form>
				</div>
		</div>
		
		</div>
		
			<div class="col-md-3">
				<img src="images/bj_singer.png" height="520px" width="100%">		
			</div>
	</div>
	</div>
	

	<script>
		function jugar(){
			document.getElementById("volver_menu").disabled = true;
			var apuesta = document.getElementById("apuesta").value;
			
			if(apuesta === ""){
				alert("No has apostado, por favor ingresa un valor");
				return false;
			}
			
			apuesta = parseFloat(apuesta);
			
			if (apuesta><%=session.getAttribute("dinero")%>){
				alert("No puedes apostar más dinero del que tienes");
				return false;
			}
			
			document.getElementById("jugar").disabled = true;
			
			var numeros = ["A",2,3,4,5,6,7,8,9,10,"J","Q","K"];
			var colores = ["C", "D", "P", "T"];
			
			let carta_abajo = document.getElementById("carta_2c");
			carta_abajo.src = "images/cartas/carta_abajo.png";
			carta_abajo.removeAttribute("hidden");
			
			var n = numeros[Math.floor(Math.random() * 13)];
			var c = colores[Math.floor(Math.random() * 4)];
			
			var carta = "images/cartas/" + n.toString() + c.toString() + ".png";
			
			if (n==="J" || n==="Q" || n==="K"){
				var contador_crupier = 10;
			} else if (n==="A"){
				var contador_crupier = 11;
			} else{
				var contador_crupier = n; 
			}
			
			document.getElementById("n").value = n;
	
			document.getElementById("contador_crupier").value = contador_crupier;
			let p = document.getElementById("contador_crupier");
			p.removeAttribute("hidden");
			
			let c1c = document.getElementById("carta_1c");
			c1c.src = carta;
			c1c.removeAttribute("hidden");
			
			var n = numeros[Math.floor(Math.random() * 13)];
			var c = colores[Math.floor(Math.random() * 4)];
			
			var carta = "images/cartas/" + n.toString() + c.toString() + ".png";
			
			var contador_user = 0;
			
			if (n==="J" || n==="Q" || n==="K"){
				contador_user += 10;
			} else if (n==="A"){
				contador_user += 11;
			} else{
				contador_user += n; 
			}
			
			let c1u = document.getElementById("carta_1u");
			c1u.src = carta;
			c1u.removeAttribute("hidden");
			
			var n2 = numeros[Math.floor(Math.random() * 13)];
			var c = colores[Math.floor(Math.random() * 4)];
			
			var carta = "images/cartas/" + n2.toString() + c.toString() + ".png";
			
			if (n2==="J" || n2==="Q" || n2==="K"){
				contador_user += 10;
			} else if (n2==="A"){
				contador_user += 11;
			} else if(n==="A" && n2==="A"){
				contador_user += 1;
			}else{
				contador_user += n2; 
			}
			
			let c2u = document.getElementById("carta_2u");
			c2u.src = carta;
			c2u.removeAttribute("hidden");
			
			document.getElementById("contador_user").value = contador_user;
			let p1 = document.getElementById("contador_user");
			p1.removeAttribute("hidden");
			
			if(contador_user==21){
				let h1 = document.getElementById("resultado");
				var apuesta = document.getElementById("apuesta").value;
				apuesta = parseFloat(apuesta);
				var ganancia = apuesta * 3 / 2;
				h1.innerHTML= "BLACKJACK, GANASTE $" + ganancia.toString();
				h1.removeAttribute("hidden");
				ganancia = ganancia.toString();
				document.getElementById("ganancia_0").value = ganancia;
				document.getElementById("ganancia_1").value = ganancia;
				document.getElementById("again").removeAttribute("hidden");
				document.getElementById("volver").removeAttribute("hidden");
			} else{	
				document.getElementById("otra").removeAttribute("hidden");
				document.getElementById("plantarse").removeAttribute("hidden");	
			}
			
			return true;
		}
	
		function otra(){
			var numeros = ["A",2,3,4,5,6,7,8,9,10,"J","Q","K"];
			var colores = ["C", "D", "P", "T"];
			
			var contador_user = document.getElementById("contador_user").value;
			contador_user = parseFloat(contador_user);
			
			var n = numeros[Math.floor(Math.random() * 13)];
			var c = colores[Math.floor(Math.random() * 4)];
			
			var carta = "images/cartas/" + n.toString() + c.toString() + ".png";
			
			if (n==="J" || n==="Q" || n==="K"){
				contador_user += 10;
			} else if (n==="A"){
				contador_user += 11;
			} else{
				contador_user += n; 
			}
			
			let c3u = document.getElementById("carta_3u");
			c3u.src = carta;
			c3u.removeAttribute("hidden");
			
			document.getElementById("contador_user").value = contador_user;
			
			if (contador_user>21){	
				let h1 = document.getElementById("resultado");
				var apuesta = document.getElementById("apuesta").value;
				h1.innerHTML= "PERDISTE $" + apuesta + ", PASASTE 21";
				h1.removeAttribute("hidden");
				document.getElementById("otra").disabled = true;
				document.getElementById("plantarse").disabled = true;
				apuesta = "-" + apuesta;
				document.getElementById("ganancia_0").value = apuesta;
				document.getElementById("ganancia_1").value = apuesta;
				document.getElementById("again").removeAttribute("hidden");
				document.getElementById("volver").removeAttribute("hidden");
			}
		}
	
		function plantarse(){
			var numeros = ["A",2,3,4,5,6,7,8,9,10,"J","Q","K"];
			var colores = ["C", "D", "P", "T"];
			document.getElementById("otra").disabled = true;
			document.getElementById("plantarse").disabled = true;
			
			var n2 = numeros[Math.floor(Math.random() * 13)];
			var c = colores[Math.floor(Math.random() * 4)];
			
			var carta = "images/cartas/" + n2.toString() + c.toString() + ".png";
			
			var contador_crupier = document.getElementById("contador_crupier").value;
			contador_crupier = parseFloat(contador_crupier);
			var n = document.getElementById("n").value;
			var contador_carta = 3;
			
			if (n2==="J" || n2==="Q" || n2==="K"){
				contador_crupier += 10;
			} else if (n2==="A"){
				contador_crupier += 11;
			} else if(n==="A" && n2==="A"){
				contador_crupier += 1;
			}else{
				contador_crupier += n2; 
			}
			
			let c2c = document.getElementById("carta_2c");
			c2c.src = carta;
			document.getElementById("contador_crupier").value = contador_crupier;
			
			while (contador_crupier<17){
				var n = numeros[Math.floor(Math.random() * 13)];
				var c = colores[Math.floor(Math.random() * 4)];
				var carta = "images/cartas/" + n.toString() + c.toString() + ".png";
				
				if (n==="J" || n==="Q" || n==="K"){
					contador_crupier += 10;
				} else if (n==="A"){
					contador_crupier += 11;
				} else{
					contador_crupier += n; 
				}
	
				var nombre_id = "carta_" + contador_carta + "c";
				
				let cc = document.getElementById(nombre_id);
				console.log(cc);
				cc.src = carta;
				cc.removeAttribute("hidden");
				document.getElementById("contador_crupier").value = contador_crupier;
				contador_carta += 1;
			}
	
			var contador_user = document.getElementById("contador_user").value;
			contador_user = parseFloat(contador_user);
			
			if (contador_crupier>21){
				let h1 = document.getElementById("resultado");
				var apuesta = document.getElementById("apuesta").value;
				h1.innerHTML= "GANASTE $" + apuesta;
				h1.removeAttribute("hidden");
				document.getElementById("ganancia_0").value = apuesta;
				document.getElementById("ganancia_1").value = apuesta;
			} else if (contador_crupier<21 && contador_user>contador_crupier){
				let h1 = document.getElementById("resultado");
				var apuesta = document.getElementById("apuesta").value;
				h1.innerHTML= "GANASTE $" + apuesta;
				h1.removeAttribute("hidden");
				document.getElementById("ganancia_0").value = apuesta;
				document.getElementById("ganancia_1").value = apuesta;
			} else {
				let h1 = document.getElementById("resultado");
				var apuesta = document.getElementById("apuesta").value;
				h1.innerHTML= "PERDISTE $" + apuesta;
				h1.removeAttribute("hidden");
				apuesta = "-" + apuesta;
				document.getElementById("ganancia_0").value = apuesta;
				document.getElementById("ganancia_1").value = apuesta;
			}
			
			document.getElementById("again").removeAttribute("hidden");
			document.getElementById("volver").removeAttribute("hidden");
			
		}

	</script>

</body>
</html>