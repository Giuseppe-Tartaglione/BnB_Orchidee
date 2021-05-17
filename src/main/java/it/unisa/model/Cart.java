package it.unisa.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

	private List<ProductBean> products;

	public static public Cart() {
		products = new ArrayList<ProductBean>();
	}

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

	public ProductBean doInsert(ProductBean product) {
		ProductBean bean = new ProductBean();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String SQLquery = "SELECT * FROM " + TABLE_NAME + "WHERE ID_Utente= ? ";
		return bean;
	}
}
