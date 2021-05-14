package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import it.unisa.model.UserBean;
import java.util.Calendar;
import java.util.Date;

public class UserDao {
	private static DataSource ds;
	static ResultSet rs = null; 
	
	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/bnb_db");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
	
	private static final String TABLE_NAME = "utente";
	private static final int EXPIRE_DATE = 1;
	//metodo richiamato in ProductControl.java, prende in input l'oggetto utente (vedi UserBean.java) 
	//e controlla se il risultato della query sia true o false (non ne ho capito il meccanismo)
	//se è true imposta il valore isValid a true cioè l'utente esiste nel db, altrimenti lo imposta a false e passa avanti
	public static UserBean doRetrieve(UserBean user) throws SQLException{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String selectSQL = "SELECT * from " + UserDao.TABLE_NAME
				+ " where Email= ? and Password= ?;";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, user.getEmail());
			preparedStatement.setString(2, user.getPassword());
			//visualizzazioni di testing
			/*System.out.println("-------inizio-----------");
			System.out.println(user.getEmail());
			System.out.println(user.getPassword());
			System.out.println(preparedStatement);
			
			System.out.println("---------fine-----------");*/
			
			ResultSet rs = preparedStatement.executeQuery();
			boolean more=false;
			more=rs.next();
			/*System.out.println(rs);
			System.out.println("more UserDAO"+more);*/
			 // if user does not exist set the isValid variable to false
		      if (!more) 
		      {
		         System.out.println("Sorry, you are not a registered user! Please sign up first");
		         user.setValid(false);
		      } 
			        
		      //if user exists set the isValid variable to true
		      else if (more) 
		      {
		    		  //	System.out.println("more è vero");
		    		  //	System.out.println("nome"+ rs.getString("Nome"));
						user.setCF(rs.getString("CF"));
						user.setNome(rs.getString("Nome"));
						user.setCognome(rs.getString("Cognome"));
						user.setEmail(rs.getString("Email"));
						user.setPassword(rs.getString("Password"));
						user.setValid(true);
						//System.out.println("se more è valido"+user.isValid());
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
		return user;
	}
	public static void doInsert (UserBean user) throws SQLException {
	
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String selectSQL = "INSERT INTO " + UserDao.TABLE_NAME
				+ " (CF,Nome,Cognome,Email,Password,Via,Città,Cap,Provincia,Telefono,Data_Nascita,Iscritto,Card,Scadenza_Card) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, user.getCF());
			preparedStatement.setString(2, user.getNome());
			preparedStatement.setString(3, user.getCognome());
			preparedStatement.setString(4, user.getEmail());
			preparedStatement.setString(5, user.getPassword());
			preparedStatement.setString(6, user.getVia());
			preparedStatement.setString(7, user.getCittà());
			preparedStatement.setString(8, user.getCAP());
			preparedStatement.setString(9, user.getProvincia());
			preparedStatement.setString(10, user.getTelefono());
			preparedStatement.setString(11, user.getData_Nascita());
			preparedStatement.setBoolean(12, user.isIscritto());
			preparedStatement.setString(13, user.getCard());
			preparedStatement.setString(14, user.getScadenza_Card());
			
			preparedStatement.executeUpdate();
			connection.commit();
			
		}finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}
	public static String GenerateCardNumber () throws SQLException{
		String number=null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String SQLquery="SELECT Random FROM (SELECT FLOOR(RAND() * 99999999999999999999) AS Random) AS Random_1 "
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
	   
	     
	   	 
	       

