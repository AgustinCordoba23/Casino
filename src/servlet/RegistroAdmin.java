package servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Usuario;
import logic.User;

@WebServlet({ "/RegistroAdmin", "/registro_admin"})
public class RegistroAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RegistroAdmin() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User ctrl=new User();
		String nombre_usuario=request.getParameter("nombre_usuario");
        String password=request.getParameter("password");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String genero = request.getParameter("genero");
        Integer dinero = 9999999;
        Integer rol = 1;
        Date fecha = new Date();
        
        Usuario u = new Usuario();

        u.setNombre_usuario(nombre_usuario);
        u.setPassword(password);
        u.setNombre(nombre);
        u.setApellido(apellido);
        u.setEmail(email);
        u.setGenero(genero);
        u.setDinero(dinero);
        u.setRol(rol);
        u.setFecha_nacimiento(fecha);
        
        Boolean b = ctrl.add(u);
        if (b) {}
        
		Integer id = Integer.parseInt(request.getParameter("user")); 
        Usuario nuevo = new Usuario();
        nuevo.setId(id);
        nuevo = ctrl.getById(nuevo);
        
        request.getSession().setAttribute("usuario", nuevo); 
        request.getRequestDispatcher("WEB-INF/admin/admin.jsp").forward(request, response);      
	}

}
