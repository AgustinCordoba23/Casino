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
	
	    <title>ASAN'S ROULETTE</title>
	
	    <link href="style/bootstrap.css" rel="stylesheet"> 
	    <link href="style/juegos.css" rel="stylesheet">   
	    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	  	</head>
<body>

	<div class="w3-container w3-khaki" style="margin-top:50px; margin-left:50px; margin-right:50px; text-align:center; padding: 10px; border:2px solid #1d2951">

		<div class="row">
			<div class="col-md-4">
				<h6 style="background: khaki">DINERO DISPONIBLE $<%=session.getAttribute("dinero")%></h6>
				<table align="center" style="margin-top:10px; border:1px solid green">
					<tr>
						<td>APUESTA</td>
						<td>MONTO</td>
					</tr>
					<tr>
						<td>COLOR ROJO</td>
						<td><input type="text" id="apuesta_rojo" name="apuesta_rojo" placeholder="$0000" size="5" style="text-align:center"></td>
					</tr>
					<tr>
						<td>COLOR NEGRO</td>
						<td><input type="text" id="apuesta_negro" name="apuesta_negro" placeholder="$0000" size="5" style="text-align:center"></td>
					</tr>
					<tr>
						<td>PAR</td>
						<td><input type="text" id="apuesta_par" name="apuesta_par" placeholder="$0000" size="5" style="text-align:center"></td>
					</tr>
					<tr>
						<td>IMPAR</td>
						<td><input type="text" id="apuesta_impar" name="apuesta_impar" placeholder="$0000" size="5" style="text-align:center"></td>
					</tr>
					<tr>
						<td>1era DOCENA</td>
						<td><input type="text" id="apuesta_1d" name="apuesta_1d" placeholder="$0000" size="5" style="text-align:center"></td>
					</tr>
					<tr>
						<td>2da DOCENA</td>
						<td><input type="text" id="apuesta_2d" name="apuesta_2d" placeholder="$0000" size="5" style="text-align:center"></td>
					</tr>
					<tr>
						<td>3era DOCENA</td>
						<td><input type="text" id="apuesta_3d" name="apuesta_3d" placeholder="$0000" size="5" style="text-align:center"></td>
					</tr>
					<tr>
						<td>1era FILA</td>
						<td><input type="text" id="apuesta_1f" name="apuesta_1f" placeholder="$0000" size="5" style="text-align:center"></td>
					</tr>
					<tr>
						<td>2da FILA</td>
						<td><input type="text" id="apuesta_2f" name="apuesta_2f" placeholder="$0000" size="5" style="text-align:center"></td>
					</tr>
					<tr>
						<td>3era FILA</td>
						<td><input type="text" id="apuesta_3f" name="apuesta_3f" placeholder="$0000" size="5" style="text-align:center"></td>
					</tr>
					<tr>
						<td>1-18</td>
						<td><input type="text" id="apuesta_1a18" name="apuesta_1a18" placeholder="$0000" size="5" style="text-align:center"></td>
					</tr>
					<tr>
						<td>19-36</td>
						<td><input type="text" id="apuesta_19a36" name="apuesta_19a36" placeholder="$0000" size="5" style="text-align:center"></td>
					</tr>
					<tr>
						<td>PLENO</td>
						<td>
							<input type="text" id="pleno" name="pleno" placeholder="00" maxlength="2" size="5" style="text-align:center">	
							<input type="text" id="apuesta_pleno" name="apuesta_pleno" placeholder="$0000" size="5" style="text-align:center">
						</td>
					</tr>
				</table>
			</div>
			
			<div class="col-md-8">
				<img src="images/ruleta_pa.jpg" style="margin-top:20px">
				
				<table align="center">
					<tr>
					<td>
						<form action="VolverMenu" method="post">
		  					<input type="hidden" name="id" id="id" value=<%=session.getAttribute("id")%>>
							<button type="submit" id="volver_menu" class="btn btn-primary" style="margin-top:20px; width: 100px; height: 50px; margin-right:10px">VOLVER</button>
						</form>
					</td>
					<td><button type="button" id="tirar" class="btn btn-danger" onclick="return jugar()" style="margin-top:20px; width: 100px; height: 50px; background:#711585; margin-left:10px">TIRAR</button></td>
					</tr>
				</table>

				<h1 hidden id="h1" style="background:khaki; margin-top:20px; color:green"></h1>
				<h1 hidden id="h2" style="background:khaki; margin-top:20px; color:green"></h1>
			
			
			<div class="row">
				<div class="col-md-6">
					<form action="ruleta" method="post">
		  					<input type="hidden" name="id" id="id" value=<%=session.getAttribute("id")%>>
		  					<input type="hidden" name="ganancia" id="ganancia_0" value=""> 
		  					<input type="hidden" name="tipo" id="tipo" value="0">
							<button hidden type="submit" id="again" class="btn btn-primary" style="margin-top:20px">JUGAR DE NUEVO</button>
  					</form>
				</div>
				<div class="col-md-6">
					<form action="ruleta" method="post">
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
		function jugar(){
		
			var apuesta = document.getElementById("apuesta_rojo").value;
			if(apuesta===""){
				var apuesta_rojo = 0;
			} else{
				var apuesta_rojo = parseFloat(apuesta);
			}
			
			apuesta = document.getElementById("apuesta_negro").value;
			if(apuesta===""){
				var apuesta_negro = 0;
			} else{
				var apuesta_negro = parseFloat(apuesta);
			}
			
			apuesta = document.getElementById("apuesta_par").value;
			if(apuesta===""){
				var apuesta_par = 0;
			} else{
				var apuesta_par = parseFloat(apuesta);
			}
			
			apuesta = document.getElementById("apuesta_impar").value;
			if(apuesta===""){
				var apuesta_impar = 0;
			} else{
				var apuesta_impar = parseFloat(apuesta);
			}
			
			apuesta = document.getElementById("apuesta_1d").value;
			if(apuesta===""){
				var apuesta_1d = 0;
			} else{
				var apuesta_1d = parseFloat(apuesta);
			}
			
			apuesta = document.getElementById("apuesta_2d").value;
			if(apuesta===""){
				var apuesta_2d = 0;
			} else{
				var apuesta_2d = parseFloat(apuesta);
			}
			
			apuesta = document.getElementById("apuesta_3d").value;
			if(apuesta===""){
				var apuesta_3d = 0;
			} else{
				var apuesta_3d = parseFloat(apuesta);
			}
			
			apuesta = document.getElementById("apuesta_1f").value;
			if(apuesta===""){
				var apuesta_1f = 0;
			} else{
				var apuesta_1f = parseFloat(apuesta);
			}
			
			apuesta = document.getElementById("apuesta_2f").value;
			if(apuesta===""){
				var apuesta_2f = 0;
			} else{
				var apuesta_2f = parseFloat(apuesta);
			}
			
			apuesta = document.getElementById("apuesta_3f").value;
			if(apuesta===""){
				var apuesta_3f = 0;
			} else{
				var apuesta_3f = parseFloat(apuesta);
			}
			
			apuesta = document.getElementById("apuesta_1a18").value;
			if(apuesta===""){
				var apuesta_1a18 = 0;
			} else{
				var apuesta_1a18 = parseFloat(apuesta);
			}
			
			apuesta = document.getElementById("apuesta_19a36").value;
			if(apuesta===""){
				var apuesta_19a36 = 0;
			} else{
				var apuesta_19a36 = parseFloat(apuesta);
			}
			
			apuesta = document.getElementById("apuesta_pleno").value;
			if(apuesta===""){
				var apuesta_pleno = 0;
			} else{
				var apuesta_pleno = parseFloat(apuesta);
			}
			
			var apuesta = apuesta_rojo+apuesta_negro+apuesta_par+apuesta_impar+apuesta_1d+apuesta_2d+apuesta_3d+apuesta_1f+apuesta_2f+
			apuesta_3f+apuesta_1a18+apuesta_19a36+apuesta_pleno;
			
			if(apuesta === 0){
				alert("Debes apostar para jugar");
				return false;
			}
			
			if (apuesta><%=session.getAttribute("dinero")%>){
				alert("No puedes apostar más dinero del que tienes");
				return false;
			} 
			
			var n =  Math.floor(Math.random() * 37);			
			
			if(n>0 && n<11 && n%2==0){
				var color = "negro";
			} else if(n>0 && n<11 && n%2==1){
				var color = "rojo";
			}
			
			if(n>18 && n<29 && n%2==0){
				var color = "negro";
			} else if(n>18 && n<29 && n%2==1){
				var color = "rojo";
			}
			
			if(n>10 && n<19 && n%2==0){
				var color = "rojo";
			} else if(n>10 && n<19 && n%2==1){
				var color = "negro";
			}
			
			if(n>28 && n<37 && n%2==0){
				var color = "rojo";
			} else if(n>28 && n<37 && n%2==1){
				var color = "negro";
			}
			
			if(n===0){
				var color= "verde";
			}
			
			var n_string = n.toString();
			let h1 = document.getElementById('h1');
			h1.innerHTML="RESULTADO " + n_string + " " + color;
			h1.removeAttribute("hidden");
			document.getElementById('tirar').disabled = true;
			
			var ganancia = 0;

			if(color==="rojo" && apuesta_rojo!==0){
				ganancia += apuesta_rojo;
			}
			
			if(color==="negro" && apuesta_negro!==0){
				ganancia += apuesta_negro;
			}
			
			if(n%2==0 && apuesta_par!==0){
				ganancia += apuesta_par;
			}
			
			if(n%2==1 && apuesta_impar!==0){
				ganancia += apuesta_impar;
			}
			
			if(n>0 && n<19 && apuesta_1a18!==0){
				ganancia += apuesta_1a18;
			}
			
			if(n>18 && n<37 && apuesta_19a36!==0){
				ganancia += apuesta_19a36;
			}
			
			if(n>0 && n<13 && apuesta_1d!==0){
				ganancia += apuesta_1d*2;
			}
			
			if(n>11 && n<25 && apuesta_2d!==0){
				ganancia += apuesta_2d*2;
			}
			
			if(n>23 && n<37 && apuesta_3d!==0){
				ganancia += apuesta_3d*2;
			}
			
			var fila1 = [1,4,7,10,13,16,19,22,25,28,31,34];
			var fila2 = [2,5,8,11,14,17,20,23,26,29,32,35];
			var fila3 = [3,6,9,12,15,18,21,24,27,30,33,36];
			
			if(fila1.includes(n)===true && apuesta_1f!==0){
				ganancia += apuesta_1f*2;
			}
			
			if(fila2.includes(n)===true && apuesta_2f!==0){
				ganancia += apuesta_2f*2;
			}
			
			if(fila3.includes(n)===true && apuesta_3f!==0){
				ganancia += apuesta_3f*2;
			}
			
			var pleno = document.getElementById("pleno").value;
			pleno = parseFloat(pleno);
			
			if(n===pleno){
				ganancia += apuesta_pleno*35;
			}
			
			if(ganancia === 0){
				let h2 = document.getElementById('h2');
				apuesta = apuesta.toString();
				h2.innerHTML="PERDISTE $" + apuesta;
				h2.removeAttribute("hidden");
				apuesta = "-" + apuesta;
				document.getElementById("ganancia_0").value = apuesta;
				document.getElementById("ganancia_1").value = apuesta;
			} else{
				let h2 = document.getElementById('h2');
				ganancia = ganancia.toString();
				h2.innerHTML="GANASTE $" + ganancia;
				h2.removeAttribute("hidden");
				document.getElementById("ganancia_0").value = ganancia;
				document.getElementById("ganancia_1").value = ganancia;
			}
			document.getElementById("again").removeAttribute("hidden");
			document.getElementById('volver').removeAttribute("hidden");
			document.getElementById("volver_menu").disabled = true;
			return true;
		}
	</script>

</body>
</html>