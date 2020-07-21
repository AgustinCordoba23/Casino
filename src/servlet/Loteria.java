package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet({ "/Loteria", "/loteria"})
public class Loteria extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Loteria() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer u = Integer.parseInt(request.getParameter("id")); 
		Integer dinero = Integer.parseInt(request.getParameter("dinero"));
		request.getSession().setAttribute("id", u);
		request.getSession().setAttribute("dinero", dinero);
		request.getRequestDispatcher("WEB-INF/games/loteria.jsp").forward(request, response); 
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
	}

}