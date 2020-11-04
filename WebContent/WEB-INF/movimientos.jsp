<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="entities.Movimiento"%>
<%@page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	    <title>MOVEMENTS</title>
	
	    <link href="style/bootstrap.css" rel="stylesheet"> 
	    <link href="style/juegos.css" rel="stylesheet">   
	    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

	  	<% 
	  		LinkedList<Movimiento> mov= (LinkedList<Movimiento>)session.getAttribute("movimientos");
	    %>
	    </head>
<body>
		<div class="w3-container w3-khaki" style="margin-top:50px; margin-left:50px; margin-right:50px; text-align:center; padding: 10px; border:2px solid #1d2951">
			<h3> ÚLTIMOS 20 MOVIMIENTOS - INCLUYE RECARGAS Y RETIRO</h3>
			<table align="center" style="border:2px solid #1d2951">
				<tr>
					<td>MONTO</td>
					<td>FECHA Y HORA</td>
				</tr>
				<% 
				for(int i=0; i<mov.size(); i++) { 	
					Movimiento m = mov.get(i); %>
				<tr>
					<td><%=m.getMonto()%></td>
					<td><%=m.getFecha()%></td>
				</tr><%
				}%>
				<!-- Error: java.io.NotSerializableException, pero funciona OK-->
			</table>
			
			<form action="VolverMenu" method="post">
  					<input type="hidden" name="id" id="id" value=<%=session.getAttribute("id")%>>
					<button type="submit" id="volver_menu" class="btn btn-primary" style="width: 100px; height: 45px; margin-top:10px">VOLVER</button>
			</form>
		</div>
</body>
</html>