package logic;

import data.*;
import entities.*;

public class Login {
	private DataUsuario du;
	
	public Login() {
		du=new DataUsuario();
	}
	
	public Usuario validate(Usuario u) {
		return du.getUsuario(u);
	}
	
	public void add(Usuario u) {
		du.add(u);
	}
	
	public void update(Usuario u) {
		du.update(u);
	}

}
