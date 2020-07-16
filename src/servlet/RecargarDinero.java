package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Usuario;
import logic.Login;
import logic.MovimientosDinero;

@WebServlet({ "/Recargar_dinero", "/recargar_dinero"})
public class RecargarDinero extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RecargarDinero() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer u = Integer.parseInt(request.getParameter("user")); 
		request.getSession().setAttribute("id", u);
		request.getRequestDispatcher("WEB-INF/recargar.jsp").forward(request, response); 
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Login ctrl=new Login();
		MovimientosDinero rcg=new MovimientosDinero();
		Usuario u = new Usuario();
		Integer dinero= Integer.parseInt(request.getParameter("monto"));
        Integer id = Integer.parseInt(request.getParameter("id"));
        u.setId(id);
        u.setDinero(dinero);
        rcg.recargar(u);
        
        Usuario nuevo = new Usuario();
        nuevo.setId(id);
        nuevo = ctrl.getById(nuevo);
        
        request.getSession().setAttribute("usuario", nuevo); 

        request.getRequestDispatcher("WEB-INF/casino.jsp").forward(request, response);
        
	}

}