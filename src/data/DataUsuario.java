package data;

import entities.*;

import java.sql.*;
import java.util.LinkedList;

public class DataUsuario {
	
	public Usuario getUsuario(Usuario user) {
		Usuario u=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=Conexion.getInstancia().getConn().prepareStatement(
					"select id,nombre,apellido,email,genero,dinero,rol from usuarios where usuario=? and contraseña=?"
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
				u.setDinero(rs.getInt("dinero"));
				u.setRol(rs.getInt("rol"));
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
	
	public Boolean add(Usuario u) {
		PreparedStatement stmt1= null;
		ResultSet rs=null;
		try {
			stmt1=Conexion.getInstancia().getConn().prepareStatement(
					"select * from usuarios where email=?");
			stmt1.setString(1, u.getEmail());
			rs = stmt1.executeQuery();
			if(rs!=null && rs.next()) {
				return false;
			} else {
				PreparedStatement stmt= null;
				ResultSet keyResultSet=null;
				try {
					stmt=Conexion.getInstancia().getConn().
							prepareStatement(
									"insert into usuarios(usuario, contraseña, nombre, apellido, email, fecha_nacimiento, genero, dinero, rol) values(?,?,?,?,?,?,?,?,?)"
									);
					stmt.setString(1, u.getNombre_usuario());
					stmt.setString(2, u.getPassword());
					stmt.setString(3, u.getNombre());
					stmt.setString(4, u.getApellido());
					stmt.setString(5, u.getEmail());
					stmt.setDate(6, new java.sql.Date(u.getFecha_nacimiento().getTime()));
					stmt.setString(7, u.getGenero());
					stmt.setInt(8, u.getDinero());
					stmt.setInt(9, u.getRol());
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
		                return true;
		            } catch (SQLException e) {
		            	e.printStackTrace();
		            }
				}
			}	
		}  catch (SQLException e) {
            e.printStackTrace();
		} finally {
            try {
                if(stmt1!=null) {
                	stmt1.close();
                }   
                Conexion.getInstancia().releaseConn();
            } catch (SQLException e) {
            	e.printStackTrace();
            }
		}
		return null;		
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
	
	public void recargar(Usuario u) {
		PreparedStatement stmt= null;
		try {
			stmt=Conexion.getInstancia().getConn().prepareStatement(
			"update usuarios set dinero=dinero+? where id=?");
			stmt.setInt(1, u.getDinero());
			stmt.setInt(2, u.getId());
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
	
	public void retirar(Usuario u) {
		PreparedStatement stmt= null;
		try {
			stmt=Conexion.getInstancia().getConn().prepareStatement(
			"update usuarios set dinero=dinero-? where id=?");
			stmt.setInt(1, u.getDinero());
			stmt.setInt(2, u.getId());
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
	
	public Usuario getById(Usuario user) {
		Usuario u=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=Conexion.getInstancia().getConn().prepareStatement(
					"select nombre,apellido,email,dinero,usuario,genero from usuarios where id=?"
					);
			stmt.setInt(1, user.getId());
			rs=stmt.executeQuery();
			if(rs!=null && rs.next()) {
				u=new Usuario();
				u.setNombre(rs.getString("nombre"));
				u.setApellido(rs.getString("apellido"));
				u.setEmail(rs.getString("email"));
				u.setGenero(rs.getString("genero"));
				u.setNombre_usuario(rs.getString("usuario"));
				u.setDinero(rs.getInt("dinero"));
				u.setId(user.getId());
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
	
	public Integer validateEmail(Usuario u) {
		PreparedStatement stmt= null;
		ResultSet rs=null;
		try {
			stmt= Conexion.getInstancia().getConn().prepareStatement(
					"select id from usuarios where email=?");
			stmt.setString(1, u.getEmail());
			System.out.println(u.getEmail());
			rs = stmt.executeQuery();
			if(rs!=null && rs.next()) {
				int id = rs.getInt("id");
				System.out.println(id);
				return id;
			}
			return 0;
		}catch (SQLException e) {
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
		return 0;
	}
	
	public void add_historial(Usuario u, Integer juego) {
		PreparedStatement stmt= null;
		try {
			stmt=Conexion.getInstancia().getConn().prepareStatement(
			"insert into historial (id_usuario, ganancia, id_juego) values (?,?,?)");
			stmt.setInt(1, u.getId());
			stmt.setInt(2, u.getDinero());
			stmt.setInt(3, juego);
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
	
	public void historial_movimiento(Usuario u, Integer tipo) {
		PreparedStatement stmt= null;
		Integer dinero;
		try {
			if (tipo == 1) {
				dinero = u.getDinero() * (-1);
			} else {
				dinero = u.getDinero();
			}
			stmt=Conexion.getInstancia().getConn().prepareStatement(
			"insert into movimientos (id_usuario, monto, fecha_hora) values (?,?,current_timestamp())");
			stmt.setInt(1, u.getId());
			stmt.setInt(2, dinero);
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
	
	public LinkedList<Movimiento> getMovimientos(Usuario u){
		PreparedStatement stmt=null;
		ResultSet rs=null;
		LinkedList<Movimiento> mov= new LinkedList<>();
		try {
			stmt= Conexion.getInstancia().getConn().prepareStatement(
			"select monto, fecha_hora from movimientos where id_usuario=? limit 20");
			stmt.setInt(1, u.getId());
			rs = stmt.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					Movimiento m = new Movimiento();
					m.setFecha(rs.getTimestamp("fecha_hora"));
					m.setMonto(rs.getInt("monto"));
					mov.add(m);
				}
			}
		}catch (SQLException e) {
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
		return mov;
	}
	
	public LinkedList<UsuarioTop> getTop(Integer juego){
		PreparedStatement stmt=null;
		ResultSet rs=null;
		LinkedList<UsuarioTop> top = new LinkedList<>();
		try {
			stmt= Conexion.getInstancia().getConn().prepareStatement(
			"select usuario, sum(ganancia) as ganancia from usuarios u " + 
			"inner join historial h on u.id=h.id_usuario " + 
			"where id_juego=? " + 
			"group by 1 " + 
			"order by 2 desc " + 
			"limit 10");
			stmt.setInt(1, juego);
			rs = stmt.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					UsuarioTop u = new UsuarioTop();
					u.setNombre_usuario(rs.getString("usuario"));
					u.setGanancia(rs.getInt("ganancia"));
					top.add(u);
				}
			}
		}catch (SQLException e) {
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
		return top;
	}
	
	public void changeRol(Usuario u) {
		PreparedStatement stmt=null;
		try {
			stmt=Conexion.getInstancia().getConn().prepareStatement(
			"update usuarios set rol=? where email=?");
			stmt.setInt(1, u.getRol());
			stmt.setString(2, u.getEmail());
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
	
	public void delete(Usuario u) {
		PreparedStatement stmt=null;
		try {
			stmt=Conexion.getInstancia().getConn().prepareStatement(
			"delete from usuarios where email=?");
			stmt.setString(1, u.getEmail());
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
	
	public LinkedList<Usuario> getAll(){
		PreparedStatement stmt=null;
		ResultSet rs=null;
		LinkedList<Usuario> users= new LinkedList<>();
		try {
			stmt= Conexion.getInstancia().getConn().prepareStatement(
			"select id, usuario, nombre, apellido, email, fecha_nacimiento, genero, dinero, rol from usuarios");
			rs = stmt.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					Usuario u = new Usuario();
					u.setApellido(rs.getString("apellido"));
					u.setDinero(rs.getInt("dinero"));
					u.setEmail(rs.getString("email"));
					u.setFecha_nacimiento(rs.getDate("fecha_nacimiento"));
					u.setGenero(rs.getString("genero"));
					u.setId(rs.getInt("id"));
					u.setNombre(rs.getString("nombre"));
					u.setNombre_usuario(rs.getString("usuario"));
					u.setRol(rs.getInt("rol"));
					users.add(u);
				}
			}
		}catch (SQLException e) {
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
		return users;
	}
	
	
	
}
