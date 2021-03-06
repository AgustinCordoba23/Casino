package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Usuario;
import logic.User;


@WebServlet({ "/VolverMenu", "/volver_menu"})
public class VolverMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public VolverMenu() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User ctrl=new User();
		Integer id = Integer.parseInt(request.getParameter("id")); 
        
        Usuario nuevo = new Usuario();
        nuevo.setId(id);
        nuevo = ctrl.getById(nuevo);
		request.getSession().setAttribute("usuario", nuevo); 
        request.getRequestDispatcher("WEB-INF/admin/admin.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User ctrl=new User();
		Integer id = Integer.parseInt(request.getParameter("id")); 
        
        Usuario nuevo = new Usuario();
        nuevo.setId(id);
        nuevo = ctrl.getById(nuevo);
		request.getSession().setAttribute("usuario", nuevo); 
        request.getRequestDispatcher("WEB-INF/casino.jsp").forward(request, response);

	}

}