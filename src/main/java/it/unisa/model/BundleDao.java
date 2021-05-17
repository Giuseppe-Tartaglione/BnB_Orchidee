package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BundleDao {
	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/bnb_db");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	private static final String TABLE_NAME = "pacchetto";

	public synchronized void doSave(BundleBean bundle) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + BundleDao.TABLE_NAME
				+ " (ID_Stanza, Check_in, Check_out, Piscina, valid, Ristorante, Prezzo) VALUES (?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, bundle.getID_Stanza()));
			preparedStatement.setString(2, bundle.getCheck_in());
			preparedStatement.setString(3, bundle.getCheck_out());
			preparedStatement.setBoolean(4, bundle.isPiscina());
			preparedStatement.setBoolean(5, bundle.isRistorante());
			preparedStatement.setBoolean(6, bundle.isValid());
			preparedStatement.setInt(7, bundle.getPrezzo());
			preparedStatement.executeUpdate();

			connection.commit();
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

	public synchronized OrderBean doRetrieveByKey(String ID) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		OrderBean bean = new OrderBean();

		String selectSQL = "SELECT * FROM " + BundleDao.TABLE_NAME + " WHERE ID_Pacchetto = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, ID);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setID_Stanza(rs.getInt("ID_Stanza"));
				bean.setNome(rs.getString("Nome"));
				bean.setTV(rs.getBoolean("TV"));
				bean.setPanorama(rs.getBoolean("Panorama"));
				bean.setPrezzo(rs.getInt("Prezzo"));
				bean.setMatrimoniali(rs.getInt("Matrimoniali"));
				bean.setSingoli(rs.getInt("Singoli"));
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
		return bean;
	}
}
