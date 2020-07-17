package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Usuario;
import logic.Login;

@WebServlet({ "/Actualizar", "/actualizar"})
public class Actualizar extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Actualizar() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer u = Integer.parseInt(request.getParameter("user")); 
		request.getSession().setAttribute("id", u);
		request.getRequestDispatcher("WEB-INF/update.jsp").forward(request, response); 
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Login ctrl=new Login();
		String nombre_usuario=request.getParameter("nombre_usuario");
        String password=request.getParameter("password");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        
        Usuario v = new Usuario();
        Integer id = Integer.parseInt(request.getParameter("id"));
        v.setId(id);
        v.setEmail(email);
        int b = ctrl.validateEmail(v);
        System.out.println(b);
        
        if(b==id || b==0) {
        	Usuario u = new Usuario();
            u.setNombre_usuario(nombre_usuario);
            u.setNombre(nombre);
            u.setApellido(apellido);
            u.setEmail(email);
            u.setPassword(password);
            u.setId(id);             
            ctrl.update(u);          
            Usuario nuevo = new Usuario();
            nuevo.setNombre_usuario(nombre_usuario);
            nuevo.setPassword(password);
            nuevo = ctrl.validate(nuevo);          
            request.getSession().setAttribute("usuario", nuevo); 
            request.getRequestDispatcher("WEB-INF/casino.jsp").forward(request, response);
        } else{
        	request.getSession().setAttribute("id", id);
    		request.getRequestDispatcher("WEB-INF/update.jsp").forward(request, response); 
        }
 
        
        
	}

}