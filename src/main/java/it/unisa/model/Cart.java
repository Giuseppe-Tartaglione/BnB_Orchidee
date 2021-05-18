package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Cart {

	private List<ProductBean> products;

	public Cart() {
		products = new ArrayList<ProductBean>();
	}
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

	public static final String TABLE_NAME = "stanza";

	public void addProduct(ProductBean product) {
		boolean i = false;
		for (ProductBean prod : products) {
			if (prod.getID_Stanza() == product.getID_Stanza()) {
				i = true;
				break;
			}
		}
		if (!i) {
			products.add(product);
		}
	}

	public void deleteProduct(ProductBean product) {
		for (ProductBean prod : products) {
			if (prod.getID_Stanza() == product.getID_Stanza()) {
				products.remove(prod);
				break;
			}
		}
	}

	public void deleteAllProduct() {
		products.clear();
	}

	public List<ProductBean> getProducts() {
		return products;
	}

	public ProductBean[] doFillArray() {
	    ProductBean[] array = new ProductBean[products.size()];
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int i=0;
		for(ProductBean bean : products) {
			try {
				String SQLquery = "SELECT * FROM " + TABLE_NAME + "WHERE ID_Stanza= ? ";
				connection = ds.getConnection();
				preparedStatement = connection.prepareStatement(SQLquery);
				preparedStatement.setInt(1, bean.getID_Stanza());

				ResultSet rs = preparedStatement.executeQuery();
				while(rs.next()){
					array[i].setID_Stanza(Integer.parseInt(rs.getString("ID_STanza")));
					array[i].setNome(rs.getString("Nome"));
					array[i].setTV(rs.getBoolean("TV"));
					array[i].setPanorama(rs.getBoolean("Panorama"));
					array[i].setMatrimoniali(Integer.parseInt(rs.getString("Matrimoniali")));
					array[i].setSingoli(Integer.parseInt(rs.getString("Singoli")));
				}
		}catch(SQLException e) {System.out.println("The error was: "+e);}
	}
		return array;
}
}