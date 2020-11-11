package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.*;
import logic.MovimientosDinero;
import java.util.LinkedList;

@WebServlet({ "/HistorialMovimientos", "/historial_movimientos"})
public class HistorialMovimientos extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HistorialMovimientos() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario u = new Usuario();
		MovimientosDinero md = new MovimientosDinero();
		LinkedList<Movimiento> movimientos = new LinkedList<>();
		Integer id = Integer.parseInt(request.getParameter("user")); 
		u.setId(id);
		movimientos = md.getMovimientos(u);
		request.getSession().setAttribute("id", id);
		request.getSession().setAttribute("movimientos", movimientos);
		request.getRequestDispatcher("WEB-INF/movimientos.jsp").forward(request, response); 
		
		//try catch para la exccion y dsp redirigir a una pagina de error con mensaje
	}
}
