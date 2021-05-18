package it.unisa.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.util.Collection;
import java.util.LinkedList;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class OrderDao {
	private static DataSource ds;
	static Connection conn;
	static Statement stmt;
	static PreparedStatement pstmt;
	static ResultSet rs = null;

	static enum pay {
		Pagato, Alloggio, Concluso
	};

	private static final ProductModelDS productDao = new ProductModelDS();
	private static final Cart Cart = new Cart();
	private static final BundleDao bundleDao = new BundleDao();
	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/bnb_db");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
	private static final String TABLE_NAME = "prenotazione";
	private static final int IVA = 22;

	public OrderBean doRetrievebyKey(String prenotazione, String ID_Utente) throws SQLException {
		OrderBean order = new OrderBean();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String SQLquery = "SELECT * FROM " + TABLE_NAME + "WHERE ID_Prenotazione = ? AND ID_Utente = ?";
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(SQLquery);
			preparedStatement.setString(1, prenotazione);
			preparedStatement.setString(2, ID_Utente);
			ResultSet rs = preparedStatement.executeQuery();
			boolean more = rs.next();
			if (more) {
				order.setID_Utente(rs.getString("ID_Utente"));
				order.setID_Prenotazione(rs.getString("ID_Prenotazione"));
				order.setData_Ordine(rs.getString("Data_Ordine"));
				order.setCheck_in(rs.getString("Check_in"));
				order.setCheck_out(rs.getString("Check_out"));
				order.setPiscina(rs.getBoolean("Piscina"));
				order.setRistorante(rs.getBoolean("Ristorante"));
				order.setNome(rs.getString("Nome"));
				order.setTV(rs.getBoolean("TV"));
				order.setVista_Panoramica(rs.getBoolean("Vista_Panoramica"));
				order.setLetti_Matrimoniali(rs.getInt("Letti_Matrimoniali"));
				order.setLetti_Singoli(rs.getInt("Letti_Singoli"));
			} else if (!more) {
				System.out.println("Prenotazione non presente nel sistema");
			}
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}

		return order;
	}

	public void openConnection() {

		try {

			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/bnb_db?autoReconnect=true&useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					"root", "root");
			stmt = conn.createStatement();

		} catch (SQLException s) {
			System.out.println("Connessione Fallita!");
		}

	}

	public void closeConnection() {
		try {
			conn.close();
			stmt.close();

		} catch (SQLException s) {
			System.out.println(s);
		}
	}

	public synchronized Collection<OrderBean> doRetrieveAll(String ID_Utente, String sort) throws SQLException {
		Collection<OrderBean> orders = new LinkedList<OrderBean>();
		OrderBean order = new OrderBean();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String SQLquery = "SELECT * FROM " + TABLE_NAME + "WHERE ID_Utente= ? ";

		if (sort != null && !sort.equals("")) {
			SQLquery += " ORDER BY " + sort;
		}
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(SQLquery);
			preparedStatement.setString(1, ID_Utente);
			ResultSet rs = preparedStatement.executeQuery();
			boolean more = rs.next();
			if (more) {
				while (rs.next()) {
					order.setID_Utente(rs.getString("ID_Utente"));
					order.setID_Prenotazione(rs.getString("ID_Prenotazione"));
					order.setData_Ordine(rs.getString("Data_Ordine"));
					order.setCheck_in(rs.getString("Check_in"));
					order.setCheck_out(rs.getString("Check_out"));
					order.setPiscina(rs.getBoolean("Piscina"));
					order.setRistorante(rs.getBoolean("Ristorante"));
					order.setNome(rs.getString("Nome"));
					order.setTV(rs.getBoolean("TV"));
					order.setVista_Panoramica(rs.getBoolean("Vista_Panoramica"));
					order.setLetti_Matrimoniali(rs.getInt("Letti_Matrimoniali"));
					order.setLetti_Singoli(rs.getInt("Letti_Singoli"));
					orders.add(order);
				}
			} else if (!more) {
				System.out.println("Prenotazioni non presenti nel sistema");
			}
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}

		return orders;
	}

	// questo metodo non so cosa sia, ma pu� essere non me lo ricordi perch� sono in
	// after XD
	public synchronized void getProduct() {
		ProductBean product = new ProductBean();
	}

	public synchronized void doSave(ProductBean[] products, BundleBean bundle, String ID_Utente)
			throws SQLException {
		// vanno implementati oggetti di tipo prodotto, carrello, Pacchetto, stanza da
		// cui vanno presi tutti i dati per settare la prenotazione
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		// 1.bisogna controllare se � stato usato un pacchetto o una prenotazione
		// classica, se � stato usato un pacchetto inserire in ID_Pacchetto, Piscina e
		// ristorante i valori presi dallo stesso, altrimenti inserire null
		// 2.bisogna fare un doRetrivebykey di stanza e prendere i dati sotto
		// esplicitati
		// 3.gestire pacchetto allo stesso modo del punto 1, ma invece di null bisogna
		// prendere il prezzo da stanza e non da pacchetto
		
		for(int i=0;i<products.length;i++) {

			String insertSQL = "INSERT INTO " + OrderDao.TABLE_NAME
					+ " (ID_Prenotazione,ID_Utente,Data_Ordine,Check_in,Check_out,Piscina,Ristorante,Nome,TV,Vista_Panoramica,Letti_Matrimoniali,Letti_Singoli,iva,Prezzo,Stato) VALUES (?,?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?, ?,?)";

			try {
				connection = ds.getConnection();
				preparedStatement = connection.prepareStatement(insertSQL);
				// tutti questi order. sono placeholder, vanno poi sostituiti con l'fettivo
				// oggetto usato
				// generazione valore
				while (rs.next()) {
					preparedStatement.setString(1, OrderDao.GenerateExpireCard());
					preparedStatement.setString(2, ID_Utente);
				preparedStatement.setString(3, OrderDao.doCurrentDate());
				preparedStatement.setString(4, "2021-05-15"); // da implementare con i filtri del catalogo, per ora verranno
																// sostituiti con una data standard
				preparedStatement.setString(5, "2021-05-15"); // da implementare con i filtri del catalogo, per ora verranno
																// sostituiti con una data standard
				if (bundle.isValid()) {
					preparedStatement.setBoolean(6, bundle.isPiscina()); // recuperare da pacchetto
					preparedStatement.setBoolean(7, bundle.isRistorante()); // recuperare da pacchetto
					preparedStatement.setFloat(14, bundle.getPrezzo()); // se pacchetto.isvalid() = true recuperare da
																		// pacchetto, altrimenti recuperare da stanza
				} else {
					preparedStatement.setBoolean(6, false); // recuperare da pacchetto
					preparedStatement.setBoolean(7, false); // recuperare da pacchetto
					preparedStatement.setFloat(14, products[i].getPrezzo());
				}

				preparedStatement.setString(8, products[i].getNome()); // recuperare da stanza
				preparedStatement.setBoolean(9, products[i].isTV()); // recuperare da stanza
				preparedStatement.setBoolean(10, products[i].isPanorama()); // recuperare da stanza
				preparedStatement.setInt(11, products[i].getMatrimoniali()); // recuperare da stanza
				preparedStatement.setInt(12, products[i].getSingoli());// recuperare da stanza
				preparedStatement.setInt(13, IVA);
				preparedStatement.setString(15, "Pagato");

				preparedStatement.executeUpdate();
				connection.commit();
				}
				} finally {
				try {
					if (preparedStatement != null)
						preparedStatement.close();
				} finally {
					if (connection != null)
						connection.close();
				}

			
		}
				}
	}

	// implementazione di questa funziona slittata per la prossima consegna
	// VARIABILE PAGATO: vanno implementati metodi per gestire la variabile stato,
	// quest'ultima pu� avere 3 voci
	// pagato=l'utente ha pagato e sta aspettando il giorno del checkin per
	// alloggiare, in questa fase si pu� richiedere un rimborsofino ad una settimana
	// prima dal all'alloggio
	// alloggio=l'utente � residente nel periodo pagato, durante questo periodo la
	// stanza non verr� mostrata nella ricerca delle stanze disponibili, al checkout
	// verr� impostato su Concluso
	// concluso= l'utente ha effettuato il check out e la stanza � libera di poter
	// essere usata da altri, quest'ultima verr� mostrata nella ricerca delle camere
	// libere
	public static String doCurrentDate() {
		String date = null;
		DateFormat dformat = new SimpleDateFormat("yyyy/MM/dd");
		Date curDate = new Date();
		date = dformat.format(curDate);
		return date;
	}

	public static void controlDate() throws SQLIntegrityConstraintViolationException {
		// checkout < checkin
		// controllo le date scelte dall'utente
		try {
			conn = ds.getConnection();
			Date d = new Date();
			rs = stmt.executeQuery(
					"SELECT *" + "FROM prenotazione " + "WHERE Check_in >= " + d + " and Check_in > Check_out");
			if (rs.getDate("Check_in").before(d) || rs.getDate("Check_in").after(rs.getDate("Check_out"))) {
				System.out.println("Errore di prenotazione con Check-in nel giorno" + rs.getDate("Check_in"));
			}
			while (rs.next() == true) {

			}

		} catch (SQLIntegrityConstraintViolationException s) {
			throw (s);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	public static String GenerateOrderID() {
		String number=null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String SQLquery="SELECT Random FROM (SELECT FLOOR(RAND() * 999999999999999) AS Random) AS Random_1 "
				+ "WHERE Random NOT IN (SELECT Card FROM utente WHERE Card IS NOT NULL) "
				+ "LIMIT 1";
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(SQLquery);
			ResultSet rs = preparedStatement.executeQuery();
			boolean more=rs.next();
			if(more) {
				number=rs.getString("Random");
			}
			
		}finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return number;
	}
	public static String GenerateExpireCard () {
		String date= null;
		 DateFormat dformat = new SimpleDateFormat("yyyy/MM/dd");
	        Date curDate = new Date();
	        Calendar cal = Calendar.getInstance();
	        cal.setTime(curDate);
	        cal.add(Calendar.YEAR, EXPIRE_DATE);
	        date = dformat.format(cal.getTime());
		return date;
	}
	
	}
}
