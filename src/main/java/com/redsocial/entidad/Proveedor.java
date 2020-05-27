package com.redsocial.entidad;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "tb_proveedor")
public class Proveedor {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "cod_proveedor")
	private int idProveedor;
	@Column(name = "razon_social_proveedor")
	private String razSocial;
	@Column(name = "dir_proveedor")
	private String dirProveedor;
	@Column(name = "ruc_proveedor")
	private String rucProveedor;
	@Column(name = "fec_reg_proveedor")
	private String fecProveedor;
	
	
	@ManyToOne@JsonIgnore
	@JoinColumn(name = "cod_categoria")
	private Categoria categoria;


	public int getIdProveedor() {
		return idProveedor;
	}


	public void setIdProveedor(int idProveedor) {
		this.idProveedor = idProveedor;
	}


	public String getRazSocial() {
		return razSocial;
	}


	public void setRazSocial(String razSocial) {
		this.razSocial = razSocial;
	}


	public String getDirProveedor() {
		return dirProveedor;
	}


	public void setDirProveedor(String dirProveedor) {
		this.dirProveedor = dirProveedor;
	}


	public String getRucProveedor() {
		return rucProveedor;
	}


	public void setRucProveedor(String rucProveedor) {
		this.rucProveedor = rucProveedor;
	}


	public String getFecProveedor() {
		return fecProveedor;
	}


	public void setFecProveedor(String fecProveedor) {
		this.fecProveedor = fecProveedor;
	}


	public Categoria getCategoria() {
		return categoria;
	}


	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}
	
	
}
