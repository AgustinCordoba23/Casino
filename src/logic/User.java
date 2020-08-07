package logic;

import java.util.LinkedList;

import data.*;
import entities.*;

public class User {
	private DataUsuario du;
	
	public User() {
		du=new DataUsuario();
	}
	
	public Usuario validate(Usuario u) {
		return du.getUsuario(u);
	}
	
	public Boolean add(Usuario u) {
		return du.add(u);
	}
	
	public void update(Usuario u) {
		du.update(u);
	}
	
	public Usuario getById(Usuario u) {
		return du.getById(u);
	}
	
	public Integer validateEmail(Usuario u) {
		return du.validateEmail(u);
	}
	
	public void changeRol(Usuario u) {
		du.changeRol(u);
	}
	
	public void delete(Usuario u) {
		du.delete(u);
	}
	
	public LinkedList<Usuario> getAll(){
		return du.getAll();
	}

}
