<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="entities.UsuarioTop"%>
<%@page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	    <title>TOPs 10</title>
	
	    <link href="style/bootstrap.css" rel="stylesheet"> 
	    <link href="style/juegos.css" rel="stylesheet">   
	    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

	  	<% 
	  		LinkedList<UsuarioTop> loteria = (LinkedList<UsuarioTop>)session.getAttribute("loteria");
	  		LinkedList<UsuarioTop> ruleta = (LinkedList<UsuarioTop>)session.getAttribute("ruleta");
	  		LinkedList<UsuarioTop> bj = (LinkedList<UsuarioTop>)session.getAttribute("bj");
	    %>
	    </head>
<body>

	<div class="w3-container w3-khaki" style="margin-top:50px; margin-left:50px; margin-right:50px; text-align:center; border:2px solid #1d2951">
			<h2> TOPs 10</h2>
			<div class="row">
			
				<div class="col third">
					<h3>RULETA</h3>
					<table align="center" style="border:2px solid #1d2951">
						<tr>
							<td>USUARIO</td>
							<td>GANANCIA</td>
						</tr>
						<% 
						for(int i=0; i<ruleta.size(); i++) { 	
							UsuarioTop u = ruleta.get(i); %>
						<tr>
							<td><%=u.getNombre_usuario()%></td>
							<td><%=u.getGanancia()%></td>
						</tr><%
						}%>
					</table>
				</div>
				
				<div class="col third">
					<h3>LOTERIA</h3>
					<table align="center" style="border:2px solid #1d2951">
						<tr>
							<td>USUARIO</td>
							<td>GANANCIA</td>
						</tr>
						<% 
						for(int i=0; i<loteria.size(); i++) { 	
							UsuarioTop u = loteria.get(i); %>
						<tr>
							<td><%=u.getNombre_usuario()%></td>
							<td><%=u.getGanancia()%></td>
						</tr><%
						}%>
					</table>
				</div>
				
				<div class="col third">
					<h3>BLACKJACK</h3>
					<table align="center" style="border:2px solid #1d2951">
						<tr>
							<td>USUARIO</td>
							<td>GANANCIA</td>
						</tr>
						<% 
						for(int i=0; i<bj.size(); i++) { 	
							UsuarioTop u = bj.get(i); %>
						<tr>
							<td><%=u.getNombre_usuario()%></td>
							<td><%=u.getGanancia()%></td>
						</tr><%
						}%>
					</table>
				</div>

			</div>
			
			<form action="VolverMenu" method="post">
  					<input type="hidden" name="id" id="id" value=<%=session.getAttribute("id")%>>
					<button type="submit" id="volver_menu" class="btn btn-primary" style="width: 100px; height: 45px; margin-top:10px; margin-bottom:10px">VOLVER</button>
			</form>

</body>
</html>