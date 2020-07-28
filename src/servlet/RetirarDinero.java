package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Usuario;
import logic.User;
import logic.MovimientosDinero;

@WebServlet({ "/Retirar_dinero", "/retirar_dinero"})
public class RetirarDinero extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RetirarDinero() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer u = Integer.parseInt(request.getParameter("user")); 
		Integer dinero = Integer.parseInt(request.getParameter("dinero"));
		request.getSession().setAttribute("id", u);
		request.getSession().setAttribute("dinero", dinero);
		request.getRequestDispatcher("WEB-INF/retirar.jsp").forward(request, response); 
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User ctrl=new User();
		MovimientosDinero rtr=new MovimientosDinero();
		Usuario u = new Usuario();
		Integer dinero= Integer.parseInt(request.getParameter("monto"));
        Integer id = Integer.parseInt(request.getParameter("id"));
        u.setId(id);
    	u.setDinero(dinero);
        rtr.retirar(u);
        rtr.historial_movimiento(u, 1);
        
        Usuario nuevo = new Usuario();
        nuevo.setId(id);
        nuevo = ctrl.getById(nuevo);
        request.getSession().setAttribute("usuario", nuevo); 
        request.getRequestDispatcher("WEB-INF/casino.jsp").forward(request, response);
    }

}