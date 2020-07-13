package data;

import entities.*;

import java.sql.*;

public class DataUsuario {
	
	public Usuario getUsuario(Usuario user) {
		Usuario u=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=Conexion.getInstancia().getConn().prepareStatement(
					"select id,nombre,apellido,email from usuarios where usuario=? and contraseña=?"
					);
			stmt.setString(1, user.getNombre_usuario());
			stmt.setString(2, user.getPassword());
			rs=stmt.executeQuery();
			if(rs!=null && rs.next()) {
				u=new Usuario();
				u.setId(rs.getInt("id"));
				u.setNombre(rs.getString("nombre"));
				u.setApellido(rs.getString("apellido"));
				u.setEmail(rs.getString("email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				Conexion.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return u;
	}
	
	public void add(Usuario u) {
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try {
			stmt=Conexion.getInstancia().getConn().
					prepareStatement(
							"insert into usuarios(usuario, contraseña, nombre, apellido, email, fecha_nacimiento) values(?,?,?,?,?,?)"
							);
			stmt.setString(1, u.getNombre_usuario());
			stmt.setString(2, u.getPassword());
			stmt.setString(3, u.getNombre());
			stmt.setString(4, u.getApellido());
			stmt.setString(5, u.getEmail());
			stmt.setDate(6, new java.sql.Date(u.getFecha_nacimiento().getTime()));
			stmt.executeUpdate();	
		}  catch (SQLException e) {
            e.printStackTrace();
		} finally {
            try {
                if(keyResultSet!=null)keyResultSet.close();
                if(stmt!=null) {
                	stmt.close();
                }   
                Conexion.getInstancia().releaseConn();
            } catch (SQLException e) {
            	e.printStackTrace();
            }
		}
	}
}
