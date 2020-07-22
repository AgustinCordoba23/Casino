package logic;

import data.*;
import entities.*;

public class Historial {
	private DataUsuario du;
	
	public Historial() {
		du=new DataUsuario();
	}
	
	public void add(Usuario u, Integer juego) {
		du.add_historial(u, juego);
	}
}