package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.*;
import logic.User;
import java.util.LinkedList;

@WebServlet({ "/MostrarUsuarios", "/mostrar_usuarios"})
public class MostrarUsuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MostrarUsuarios() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User ctrl = new User();
		LinkedList<Usuario> usuarios = new LinkedList<>();
		usuarios = ctrl.getAll();
		
		Integer id = Integer.parseInt(request.getParameter("user")); 

        request.getSession().setAttribute("id", id);
        request.getSession().setAttribute("usuarios", usuarios);
        request.getRequestDispatcher("WEB-INF/admin/users.jsp").forward(request, response);      
	}
}

