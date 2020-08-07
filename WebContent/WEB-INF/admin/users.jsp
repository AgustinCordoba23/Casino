<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="entities.Usuario"%>
<%@page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	    <title>ASAN'S USERS</title>
	
	    <link href="style/bootstrap.css" rel="stylesheet"> 
	    <link href="style/admin.css" rel="stylesheet">   
	    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

	  	<% 
	  		LinkedList<Usuario> usuarios= (LinkedList<Usuario>)session.getAttribute("usuarios");
	    %>
	    </head>
<body>
		<div class="w3-container w3-khaki" style="margin-top:50px; margin-left:50px; margin-right:50px; text-align:center; padding: 10px; border:2px solid #1d2951">
			<h3> USUARIOS</h3>
			<table align="center">
				<tr>
					<th>ID</th>
					<th>USUARIO</th>
					<th>NOMBRE</th>
					<th>APELLIDO</th>
					<th>EMAIL</th>
					<th>FECHA NACIMIENTO</th>
					<th>GENERO</th>
					<th>DINERO</th>
					<th>ROL</th>
				</tr>
				<% 
				for(int i=0; i<usuarios.size(); i++) { 	
					Usuario u = usuarios.get(i); %>
				<tr>
					<td><%=u.getId()%></td>
					<td><%=u.getNombre_usuario()%></td>
					<td><%=u.getNombre()%></td>
					<td><%=u.getApellido()%></td>
					<td><%=u.getEmail()%></td>
					<td><%=u.getFecha_nacimiento()%></td>
					<td><%=u.getGenero()%></td>
					<td><%=u.getDinero()%></td>
					<%if (u.getRol() == 1) { %>
						<td>Administrador</td>
					<% } else {
					%> <td>Jugador</td><% }
				}%>
			</table>
			
			<form action="VolverMenu" method="get">
  					<input type="hidden" name="id" id="id" value=<%=session.getAttribute("id")%>>
					<button type="submit" id="volver_menu" class="btn btn-primary" style="width: 100px; height: 45px; margin-top:10px">VOLVER</button>
			</form>
		</div>
</body>
</html>