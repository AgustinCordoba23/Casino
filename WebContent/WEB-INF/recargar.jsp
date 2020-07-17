<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>RECARGA</title>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link href="style/bootstrap.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="style/recarga.css">
</head>
<body>
	<table>
				<tr>
					<th> 
					<div class="container" >
					    <div class="row">
					        <div class="col-md-12">
				            <div class="panel panel-default credit-card-box">
				                <div class="panel-heading display-table" >
				                    <div class="row display-tr" >
				                        <h3 class="panel-title display-td" >DETALLES DE PAGO</h3>
				                        <div class="display-td" >                            
				                            <img class="img-responsive pull-right" src="images/tarjetas.png">
				                        </div>
				                    </div>                    
				                </div>
				                <div class="panel-body">
				                    <form role="form" id="payment-form" action="recargar_dinero" method="post">
				                        <div class="row">
				                            <div class="col-xs-12">
				                                <div class="form-group">
				                                    <label for="cardNumber">NÚMERO DE LA TARJETA</label>
				                                    <div class="input-group">
				                                        <input 
				                                            type="tel"
				                                            class="form-control"
				                                            name="cardNumber"
				                                            placeholder="2311 2509 4682 0905"
				                                            disabled
				                                        />
				                                        <span class="input-group-text" ><i class="fa fa-credit-card"></i></span>
				                                    </div>
				                                </div>                            
				                            </div>
				                        </div>
				                        <div class="row">
				                            <div class="col-xs-7 col-md-7">
				                                <div class="form-group">
													<label for="cardNumber">NÚMERO DE LA TARJETA</label><input 
				                                        type="tel" 
				                                        class="form-control" 
				                                        name="cardExpiry"
				                                        placeholder="12 / 30"
				                                        autocomplete="cc-exp"
				                                        disabled 
				                                    />
				                                </div>
				                            </div>
				                            <div class="col-xs-5 col-md-5 pull-right">
				                                <div class="form-group">
				                                    <label for="cardCVC">CÓDIGO</label>
				                                    <input 
				                                        type="tel" 
				                                        class="form-control"
				                                        name="cardCVC"
				                                        placeholder="666"
				                                        autocomplete="cc-csc"
				                                        disabled
				                                    />
				                                </div>
				                            </div>
				                        </div>
				                        <div class="row">
				                            <div class="col-xs-12">
				                                <div class="form-group">
				                                    <label for="couponCode">MONTO (u$d)</label>
				                                    <input name="monto" id="monto" type="text" class="form-control"/> 
				                                </div>
				                            </div>                        
				                        </div>
				                        <div class="row">
				                            <div class="col-xs-12">
				                                <button class="subscribe btn btn-success btn-lg btn-block" type="submit">RECARGAR</button>
				                            </div>
				                        </div>
				                        <input type="hidden" name="id" value=<%=session.getAttribute("id")%>>
				                    </form>
				                </div>
		            		</div>   
		            	</div>
		            </div>
		            </div>         	
					</th>
					<th> <img src="images/recarga.png" width="550px" height="500px"></th>
				</tr>
		</table>
</body>
</html>