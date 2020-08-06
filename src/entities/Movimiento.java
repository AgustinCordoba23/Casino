package entities;

import java.util.Date;

public class Movimiento {
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
