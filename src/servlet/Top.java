package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.*;
import logic.Historial;
import java.util.LinkedList;

@WebServlet({ "/top", "/Top"})
public class Top extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Top() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Historial hist = new Historial();
		LinkedList<UsuarioTop> ruleta = new LinkedList<>();
		LinkedList<UsuarioTop> loteria = new LinkedList<>();
		LinkedList<UsuarioTop> bj = new LinkedList<>();
		Integer id = Integer.parseInt(request.getParameter("user")); 
		ruleta = hist.getTop(3);
		loteria = hist.getTop(1);
		bj = hist.getTop(2);
		request.getSession().setAttribute("id", id);
		request.getSession().setAttribute("ruleta", ruleta);
		request.getSession().setAttribute("loteria", loteria);
		request.getSession().setAttribute("bj", bj);
		request.getRequestDispatcher("WEB-INF/top.jsp").forward(request, response); 
	}
}
