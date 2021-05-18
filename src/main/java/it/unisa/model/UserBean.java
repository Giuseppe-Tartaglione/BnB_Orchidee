package it.unisa.model;

public class UserBean {

	String CF;
	String Nome;
	String Cognome;
	String email;
	String password;
	String Via;
	String Città;
	String CAP;
	String Provincia;
	String telefono;
	String Data_Nascita;
	String card;
	String Scadenza_Card;
	boolean valid, iscritto, admin;

	public UserBean() {
		CF=null;
		Nome=null;
		Cognome=null;
		email=null;
		password=null;
		telefono=null;
		card=null;
		valid=false;
		iscritto=false;
	}
	
	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	public String getCF() {
		return CF;
	}

	public void setCF(String cF) {
		CF = cF;
	}

	public String getNome() {
		return Nome;
	}

	public void setNome(String nome) {
		Nome = nome;
	}

	public String getCognome() {
		return Cognome;
	}

	public void setCognome(String cognome) {
		Cognome = cognome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email= email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	public String getVia() {
		return Via;
	}

	public void setVia(String via) {
		Via = via;
	}

	public String getCittà() {
		return Città;
	}

	public void setCittà(String città) {
		Città = città;
	}

	public String getCAP() {
		return CAP;
	}

	public void setCAP(String cAP) {
		CAP = cAP;
	}

	public String getProvincia() {
		return Provincia;
	}

	public void setProvincia(String provincia) {
		Provincia = provincia;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getData_Nascita() {
		return Data_Nascita;
	}

	public void setData_Nascita(String data_Nascita) {
		Data_Nascita = data_Nascita;
	}

	public String getCard() {
		return card;
	}

	public void setCard(String card) {
		this.card = card;
	}

	public String getScadenza_Card() {
		return Scadenza_Card;
	}

	public void setScadenza_Card(String scadenza_Card) {
		Scadenza_Card = scadenza_Card;
	}

	public boolean isIscritto() {
		return iscritto;
	}

	public void setIscritto(boolean iscritto) {
		this.iscritto = iscritto;
	}

	
	
	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean valid) {
		this.valid = valid;
	}
	
}
