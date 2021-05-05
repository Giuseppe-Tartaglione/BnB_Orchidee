package it.unisa.model;

import java.io.Serializable;

public class ProductBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	int ID_Stanza;
	String Nome;
	boolean TV,Panorama;
	int Prezzo;
	int Matrimoniali;
	int Singoli;
	
	public ProductBean() {
		ID_Stanza = -1;
		Nome = "";
		TV=true;
		Panorama=false;
		Prezzo=0;
		Matrimoniali=0;
		Singoli=0;
	}

	public int getID_Stanza() {
		return ID_Stanza;
	}

	public void setID_Stanza(int iD_Stanza) {
		ID_Stanza = iD_Stanza;
	}

	public String getNome() {
		return Nome;
	}

	public void setNome(String nome) {
		Nome = nome;
	}

	public boolean isTV() {
		return TV;
	}

	public void setTV(boolean tV) {
		TV = tV;
	}

	public boolean isPanorama() {
		return Panorama;
	}

	public void setPanorama(boolean panorama) {
		Panorama = panorama;
	}

	public int getPrezzo() {
		return Prezzo;
	}

	public void setPrezzo(int prezzo) {
		Prezzo = prezzo;
	}

	public int getMatrimoniali() {
		return Matrimoniali;
	}

	public void setMatrimoniali(int matrimoniali) {
		Matrimoniali = matrimoniali;
	}

	public int getSingoli() {
		return Singoli;
	}

	public void setSingoli(int singoli) {
		Singoli = singoli;
	}

	@Override
	public String toString() {
		return "Stanza: [Nome=" + Nome + "(ID Stanza=" + ID_Stanza + ") , TV=" + TV + ", Panorama=" + Panorama
				+ ", Prezzo=" + Prezzo + ", Matrimoniali=" + Matrimoniali + ", Singoli=" + Singoli+ "]";
	}

	
}
