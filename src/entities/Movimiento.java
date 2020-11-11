package entities;

import java.io.Serializable;
import java.util.Date;

public class Movimiento implements Serializable {

	private static final long serialVersionUID = 1L;
	private Date fecha;
	private Integer monto;
	
	public Date getFecha() {
		return fecha;
	}
	
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	
	public Integer getMonto() {
		return monto;
	}
	
	public void setMonto(Integer monto) {
		this.monto = monto;
	}
	
	
}
