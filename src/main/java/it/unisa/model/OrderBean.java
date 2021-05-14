package it.unisa.model;

public class OrderBean {
	String ID_Utente,ID_Prenotazione;
	String Check_in,Check_out,Data_Ordine;
	boolean Piscina,Ristorante,TV,Vista_Panoramica;
	String Nome;
	int Letti_Matrimoniali,Letti_Singoli,iva;
	float Prezzo;
	String Stato;
	
	public OrderBean() {
		ID_Utente=ID_Prenotazione=null;
		Check_in=Check_out=null;
		Piscina=Ristorante=TV=Vista_Panoramica=false;
		Nome=null;
		Letti_Matrimoniali=Letti_Singoli=iva=0;
		Prezzo=0;
		Stato=null;
			
	}

	public String getID_Utente() {
		return ID_Utente;
	}

	public void setID_Utente(String iD_Utente) {
		ID_Utente = iD_Utente;
	}

	public String getID_Prenotazione() {
		return ID_Prenotazione;
	}

	public void setID_Prenotazione(String iD_Prenotazione) {
		ID_Prenotazione = iD_Prenotazione;
	}

	public String getData_Ordine() {
		return Data_Ordine;
	}

	public void setData_Ordine(String data_Ordine) {
		Data_Ordine = data_Ordine;
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

	public boolean isTV() {
		return TV;
	}

	public void setTV(boolean tV) {
		TV = tV;
	}

	public boolean isVista_Panoramica() {
		return Vista_Panoramica;
	}

	public void setVista_Panoramica(boolean vista_Panoramica) {
		Vista_Panoramica = vista_Panoramica;
	}

	public String getNome() {
		return Nome;
	}

	public void setNome(String nome) {
		Nome = nome;
	}

	public int getLetti_Matrimoniali() {
		return Letti_Matrimoniali;
	}

	public void setLetti_Matrimoniali(int letti_Matrimoniali) {
		Letti_Matrimoniali = letti_Matrimoniali;
	}

	public int getLetti_Singoli() {
		return Letti_Singoli;
	}

	public void setLetti_Singoli(int letti_Singoli) {
		Letti_Singoli = letti_Singoli;
	}

	public int getIva() {
		return iva;
	}

	public void setIva(int iva) {
		this.iva = iva;
	}

	public float getPrezzo() {
		return Prezzo;
	}

	public void setPrezzo(float prezzo) {
		Prezzo = prezzo;
	}

	public String getStato() {
		return Stato;
	}

	public void setStato(String stato) {
		Stato = stato;
	}

	@Override
	public String toString() {
		return "OrderBean [ID_Utente=" + ID_Utente + ", ID_Prenotazione=" + ID_Prenotazione + ", Check_in=" + Check_in
				+ ", Check_out=" + Check_out + ", Piscina=" + Piscina + ", Ristorante=" + Ristorante + ", TV=" + TV
				+ ", Vista_Panoramica=" + Vista_Panoramica + ", Nome=" + Nome + ", Letti_Matrimoniali="
				+ Letti_Matrimoniali + ", Letti_Singoli=" + Letti_Singoli + ", iva=" + iva + ", Prezzo=" + Prezzo
				+ ", Stato=" + Stato + "]";
	}
	
	
	
	
}


