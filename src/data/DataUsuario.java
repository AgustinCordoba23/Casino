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
					"select id,nombre,apellido,email,genero from usuarios where usuario=? and contraseña=?"
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
				u.setGenero(rs.getString("genero"));
				u.setNombre_usuario(user.getNombre_usuario());
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
							"insert into usuarios(usuario, contraseña, nombre, apellido, email, fecha_nacimiento, genero) values(?,?,?,?,?,?,?)"
							);
			stmt.setString(1, u.getNombre_usuario());
			stmt.setString(2, u.getPassword());
			stmt.setString(3, u.getNombre());
			stmt.setString(4, u.getApellido());
			stmt.setString(5, u.getEmail());
			stmt.setDate(6, new java.sql.Date(u.getFecha_nacimiento().getTime()));
			stmt.setString(7, u.getGenero());
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
	
	public void update(Usuario u) {
		PreparedStatement stmt= null;
		try {
			stmt=Conexion.getInstancia().getConn().prepareStatement(
			"update usuarios set usuario = ?, nombre = ?, apellido = ?, email = ?, contraseña = ? where id = ?");
			stmt.setString(1, u.getNombre_usuario());
			stmt.setString(2, u.getNombre());
			stmt.setString(3, u.getApellido());
			stmt.setString(4, u.getEmail());
			stmt.setString(5, u.getPassword());
			stmt.setInt(6, u.getId());
			stmt.executeUpdate();
		}  catch (SQLException e) {
            e.printStackTrace();
		} finally {
            try {
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
