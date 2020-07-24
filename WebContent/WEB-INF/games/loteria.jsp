<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	    <title>ASAN'S LOTTERY</title>
	
	    <link href="style/bootstrap.css" rel="stylesheet"> 
	    <link href="style/juegos.css" rel="stylesheet">   
	    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	  	</head>

<body>

	<div class="w3-container w3-khaki" style="margin-top:50px; margin-left:50px; margin-right:50px; text-align:center; padding: 10px; border:2px solid #1d2951">
	<div class="row">
		<div class="col-md-4">
			<h6 style="background: khaki">DINERO DISPONIBLE $<%=session.getAttribute("dinero")%></h6>
			<input type="text" name="apuesta" id="apuesta" placeholder="Haga su apuesta" class="form-control" style="text-align:center">
			<img src="images/numeros-loteria.png" style="margin-top:20px; border: 2px solid #711585">
			<table align="center" style="margin-top:20px" >
				<tr>
				<td><input type="text" pattern="\d+" name="numero_1" id="numero_1" placeholder="00" size="5" maxlength="2" style="text-align:center"></td>
				<td><input type="text" pattern="\d+" name="numero_2" id="numero_2" placeholder="00" size="5" maxlength="2" style="text-align:center"></td>		
				<td><input type="text" pattern="\d+" name="numero_3" id="numero_3" placeholder="00" size="5" maxlength="2" style="text-align:center"></td>
				<td><input type="text" pattern="\d+" name="numero_4" id="numero_4" placeholder="00" size="5" maxlength="2" style="text-align:center"></td>
				</tr>
			</table>
		</div>
		
		<div class="col-md-8">
			<h6>CADA ACIERTO SE PAGA 1:0.5 </h6>
			<table align="center" style="margin-top:20px" >
				<tr>
				<td><input type="text" name="numero_1_r" id="numero_1_r" placeholder="00" size="5" disabled style="text-align:center; font-size:35px; border:1px solid green"></td>
				<td><input type="text" name="numero_2_r" id="numero_2_r" placeholder="00" size="5" disabled style="text-align:center; font-size:35px; border:1px solid green"></td>		
				<td><input type="text" name="numero_3_r" id="numero_3_r" placeholder="00" size="5" disabled style="text-align:center; font-size:35px; border:1px solid green"></td>
				<td><input type="text" name="numero_4_r" id="numero_4_r" placeholder="00" size="5" disabled style="text-align:center; font-size:35px; border:1px solid green"></td>
				</tr>
			</table>
			
			<table align="center">
				<tr>
				<td>
					<form action="VolverMenu" method="post">
	  					<input type="hidden" name="id" id="id" value=<%=session.getAttribute("id")%>>
						<button type="submit" id="volver_menu" class="btn btn-primary" style="margin-top:20px; width: 100px; height: 50px; margin-right:10px">VOLVER</button>
					</form>
				</td>
				<td><button type="button" id="tirar" class="btn btn-danger" onclick="return random_nro()" style="margin-top:20px; width: 100px; height: 50px; background:#711585; margin-left:10px">TIRAR</button></td>
				</tr>
			</table>
			
			<h1 hidden id="h1" style="background:khaki; margin-top:20px; color:green"></h1>
			
			<div class="row">
				<div class="col-md-8">
					<img hidden id="ganaste" src="images/asan_win.jpg" style="margin-top:20px; border-radius:15px; border:2px solid red" height="250px">
					<img hidden id="perdiste" src="images/asan_vino.png" style="margin-top:20px; border-radius:15px; border:2px solid red" height="250px">
				</div>
				<div class="col-md-3">
					<form action="loteria" method="post">
	  					<input type="hidden" name="id" id="id" value=<%=session.getAttribute("id")%>>
	  					<input type="hidden" name="ganancia" id="ganancia_0" value=""> 
	  					<input type="hidden" name="tipo" id="tipo" value="0">
						<button hidden type="submit" id="again" class="btn btn-primary" style="margin-top:40px">JUGAR DE NUEVO</button>
  					</form>
					<form action="loteria" method="post">
	  					<input type="hidden" name="id" id="id" value=<%=session.getAttribute("id")%>>
	  					<input type="hidden" name="ganancia" id="ganancia_1" value=""> 
	  					<input type="hidden" name="tipo" id="tipo" value="1">
						<button hidden type="submit" id="volver" class="btn btn-primary" style="margin-top:20px">VOLVER</button>
  					</form>
				</div>	
			</div>
			
		</div>
		</div>
	
	</div>
	
	<script>
		function randomNumber() {
		    var randomNumber;
		    var n = '';
	        randomNumber = Math.floor(Math.random() * 9);
	        	n = randomNumber.toString();
		        n = 0+n;
	        	return n;          
		}
		
		function random_nro(){
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
			
			document.getElementById("numero_1_r").value = randomNumber();
			document.getElementById("numero_2_r").value = randomNumber();
			document.getElementById("numero_3_r").value = randomNumber();
			document.getElementById("numero_4_r").value = randomNumber();
			
			var n1 = document.getElementById("numero_1").value;
			var n2 = document.getElementById("numero_2").value;
			var n3 = document.getElementById("numero_3").value;
			var n4 = document.getElementById("numero_4").value;
			
			if (n1<"01" || n1>"08" || n2<"01" || n2>"08" || n3<"01" || n3>"08" || n4<"01" || n4>"08"){
				alert("Debes ingresar tus 4 números elegidos respetando el formato");
				return false;
			}
			
			var n1_r = document.getElementById("numero_1_r").value;
			var n2_r = document.getElementById("numero_2_r").value;
			var n3_r = document.getElementById("numero_3_r").value;
			var n4_r = document.getElementById("numero_4_r").value;

			var contador=0;
			
			if (n1===n1_r){
				contador+=1;
			}
			if (n2===n2_r){
				contador+=1;
			}
			if (n3===n3_r){
				contador+=1;
			}
			if (n4===n4_r){
				contador+=1;
			}
			
			document.getElementById("again").removeAttribute("hidden");
			document.getElementById('volver').removeAttribute("hidden");
			document.getElementById('tirar').disabled = true;
			document.getElementById("volver_menu").disabled = true;
			
			if (contador===0){
				let p = document.getElementById('h1');
				let m = document.getElementById('perdiste');
				apuesta = apuesta.toString();
				p.innerHTML="PERDISTE $" + apuesta;
				p.removeAttribute("hidden");
				m.removeAttribute("hidden");
				apuesta = "-" + apuesta;
				document.getElementById("ganancia_0").value = apuesta;
				document.getElementById("ganancia_1").value = apuesta;
				return true;
			} else{
				let p = document.getElementById('h1');	
				let m = document.getElementById('ganaste');
				var ganancia = apuesta*0.5*contador;	
				ganancia = ganancia.toString();
				contador = contador.toString();
				p.innerHTML="ACERTASTE " + contador + " VECES. GANASTE $" + ganancia;
				p.removeAttribute("hidden");
				m.removeAttribute("hidden");
				document.getElementById("ganancia_0").value = ganancia;
				document.getElementById("ganancia_1").value = ganancia;
				return true;
			}
		}	
	</script>
</body>
</html>