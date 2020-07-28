package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Usuario;
import logic.Historial;
import logic.User;
import logic.MovimientosDinero;


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
		User ctrl=new User();
		Historial hist = new Historial();
		MovimientosDinero rcg=new MovimientosDinero();
		Integer id = Integer.parseInt(request.getParameter("id")); 
		Integer tipo = Integer.parseInt(request.getParameter("tipo"));
		Float ganancia_f = Float.parseFloat(request.getParameter("ganancia")); 
		Integer ganancia = Math.round(ganancia_f);
		
		Usuario u = new Usuario();
		u.setId(id);
		u.setDinero(ganancia);
		
		rcg.recargar(u);
		hist.add(u, 1);
        
        Usuario nuevo = new Usuario();
        nuevo.setId(id);
        nuevo = ctrl.getById(nuevo);

		if(tipo==0) {
			request.getSession().setAttribute("id", id);
			request.getSession().setAttribute("dinero", nuevo.getDinero());
			request.getRequestDispatcher("WEB-INF/games/loteria.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("usuario", nuevo); 
	        request.getRequestDispatcher("WEB-INF/casino.jsp").forward(request, response);
		}
		
	}

}