package it.unisa.model;

public class BundleBean {
	String ID_Pacchetto;
	String ID_Stanza;
	String Check_in;
	String Check_out;
	boolean Piscina;
	boolean Ristorante;
	int Prezzo;
	
	public BundleBean() {
		ID_Pacchetto=null;
		ID_Stanza=null;
		Check_in=null;
		Check_out=null;
		Piscina=false;
		Ristorante=false;
		Prezzo=0;

	}

	public String getID_Pacchetto() {
		return ID_Pacchetto;
	}

	public void setID_Pacchetto(String iD_Pacchetto) {
		ID_Pacchetto = iD_Pacchetto;
	}

	public String getID_Stanza() {
		return ID_Stanza;
	}

	public void setID_Stanza(String iD_Stanza) {
		ID_Stanza = iD_Stanza;
	}

	public String getCheck_in() {
		return Check_in;
	}

	public void setCheck_in(String check_in) {
		Check_in = check_in;
	}

	public String getCheck_out() {
		return Check_out;
	}

	public void setCheck_out(String check_out) {
		Check_out = check_out;
	}

	public boolean isPiscina() {
		return Piscina;
	}

	public void setPiscina(boolean piscina) {
		Piscina = piscina;
	}

	public boolean isRistorante() {
		return Ristorante;
	}

	public void setRistorante(boolean ristorante) {
		Ristorante = ristorante;
	}

	public int getPrezzo() {
		return Prezzo;
	}

	public void setPrezzo(int prezzo) {
		Prezzo = prezzo;
	}

	@Override
	public String toString() {
		return "BundleBean [ID_Pacchetto=" + ID_Pacchetto + ", ID_Stanza=" + ID_Stanza + ", Check_in=" + Check_in
				+ ", Check_out=" + Check_out + ", Piscina=" + Piscina + ", Ristorante=" + Ristorante + ", Prezzo="
				+ Prezzo + "]";
	}
	
	
	
	
	
	
	

}
