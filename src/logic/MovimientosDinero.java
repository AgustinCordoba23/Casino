package logic;

import java.util.LinkedList;

import data.*;
import entities.*;

public class MovimientosDinero {
	private DataUsuario du;
	
	public MovimientosDinero() {
		du=new DataUsuario();
	}
	
	public void recargar(Usuario u){
		du.recargar(u);
	}
	
	public void retirar(Usuario u) {
		du.retirar(u);
	}
	
	public void historial_movimiento(Usuario u, Integer tipo) /* throws Exception */{
		du.historial_movimiento(u, tipo) ;
	}
	
	public LinkedList<Movimiento> getMovimientos(Usuario u){
		return du.getMovimientos(u);
	}
}
