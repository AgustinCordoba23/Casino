package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Usuario;
import logic.User;

@WebServlet({ "/Signin", "/signin", "/signIn", "/SignIn", "/SIGNIN" })
public class Signin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Signin() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User ctrl=new User();
		String nombre_usuario=request.getParameter("usuario");
        String password=request.getParameter("password");
        
        Usuario u = new Usuario();
        
        u.setNombre_usuario(nombre_usuario);
        u.setPassword(password);
        
        u = ctrl.validate(u);
        
        if (u==null) {
        	response.sendRedirect("index.html"); 
        } else {
        	if(u.getRol()==2) {
	            request.getSession().setAttribute("usuario", u); 
	            request.getRequestDispatcher("WEB-INF/casino.jsp").forward(request, response);
        	} else {
        		request.getSession().setAttribute("usuario", u); 
                request.getRequestDispatcher("WEB-INF/admin/admin.jsp").forward(request, response);
        	}
        }
	}

}