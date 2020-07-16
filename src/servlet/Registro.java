package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
//import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Usuario;
import logic.Login;

@WebServlet({ "/Registro", "/registro"})
public class Registro extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Registro() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Login ctrl=new Login();
		String nombre_usuario=request.getParameter("nombre_usuario");
        String password=request.getParameter("password");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String fecha_nacimiento_string = request.getParameter("fecha_nacimiento");
        String email = request.getParameter("email");
        String genero = request.getParameter("genero");
        
        Usuario u = new Usuario();
        
        u.setNombre_usuario(nombre_usuario);
        u.setPassword(password);
        u.setNombre(nombre);
        u.setApellido(apellido);
        u.setEmail(email);
        u.setGenero(genero);
        try {
			u.setFecha_nacimiento(new SimpleDateFormat("yyyy-MM-dd").parse(fecha_nacimiento_string));
		} catch (ParseException e) {
			e.printStackTrace();
		}
        
        Boolean b = ctrl.add(u);
        
        if(b) {
        	request.getRequestDispatcher("index.html").forward(request, response);
        } else {
        	request.getRequestDispatcher("registro.html").forward(request, response);
        }       
	}

}