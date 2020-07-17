package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Usuario;
import logic.Login;

@WebServlet({ "/Signin", "/signin", "/signIn", "/SignIn", "/SIGNIN" })
public class Signin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Signin() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Login ctrl=new Login();
		String nombre_usuario=request.getParameter("usuario");
        String password=request.getParameter("password");
        
        Usuario u = new Usuario();
        
        u.setNombre_usuario(nombre_usuario);
        u.setPassword(password);
        
        u = ctrl.validate(u);
        
        if (u==null) {
        	//esto no anda, no escribe el script ¿?
        	PrintWriter out = response.getWriter();
        	out.println("<script type=\"text/javascript\">");
        	out.println("function load_error(){");
        	out.println("alert('Usuario no encontrado');");
        	//out.println("return false;");
        	out.println("}");
        	out.println("</script>");
        	response.sendRedirect("index.html"); 
        } else {
            request.getSession().setAttribute("usuario", u); 
            request.getRequestDispatcher("WEB-INF/casino.jsp").forward(request, response); 
        }
	}

}