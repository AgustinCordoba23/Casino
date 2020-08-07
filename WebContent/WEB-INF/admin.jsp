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
	
				<h3>Bienvenido <%=u.getNombre_usuario()%>#<%=u.getId()%> <%=u.getNombre()%></h3>
				
				<div class="row">
				
					<div class="col half">
							
					
					</div>
					
					<div class="col half">
					
						
					
					</div>
				
				</div>
	
		</div>
</body>
</html>