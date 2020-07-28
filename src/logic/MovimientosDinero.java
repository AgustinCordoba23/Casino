package logic;

import data.*;
import entities.*;

public class MovimientosDinero {
	private DataUsuario du;
	
	public MovimientosDinero() {
		du=new DataUsuario();
	}
	
	public void recargar(Usuario u) {
		du.recargar(u);
	}
	
	public void retirar(Usuario u) {
		du.retirar(u);
	}
	
	public void historial_movimiento(Usuario u, Integer tipo) {
		du.historial_movimiento(u, tipo);
	}
}
