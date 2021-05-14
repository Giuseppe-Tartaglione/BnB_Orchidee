package it.unisa.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

	private List<ProductBean> products;
	
	public Cart() {
		products = new ArrayList<ProductBean>();
	}
	
	public void addProduct(ProductBean product) {
		boolean i = false;
			for(ProductBean prod : products) {
				if(prod.getID_Stanza() == product.getID_Stanza()) {
					i=true;
					break;
				}
			}
				if(!i) {
					products.add(product);	
				}
	}
	
	public void deleteProduct(ProductBean product) {
		for(ProductBean prod : products) {
			if(prod.getID_Stanza() == product.getID_Stanza()) {
				products.remove(prod);
				break;
			}
		}
 	}
	public void deleteAllProduct() {
				products.clear();
 	}
	
	public List<ProductBean> getProducts() {
		return  products;
	}
}
