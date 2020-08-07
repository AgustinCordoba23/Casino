package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Usuario;
import logic.User;

@WebServlet({ "/CambiarRol", "/cambiar_rol"})
public class CambiarRol extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CambiarRol() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User ctrl=new User();
        Usuario u = new Usuario();
        String email = request.getParameter("email");
        String rol = request.getParameter("rol");
        if(rol.equals("admin")) {
        	u.setRol(1);
        } else {
        	u.setRol(2);
        }
        u.setEmail(email);
        ctrl.changeRol(u);

		Integer id = Integer.parseInt(request.getParameter("user")); 
        Usuario nuevo = new Usuario();
        nuevo.setId(id);
        nuevo = ctrl.getById(nuevo);
        request.getSession().setAttribute("usuario", nuevo); 
        request.getRequestDispatcher("WEB-INF/admin/admin.jsp").forward(request, response);      
	}

}