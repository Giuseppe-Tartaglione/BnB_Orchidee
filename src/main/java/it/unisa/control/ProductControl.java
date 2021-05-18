package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import it.unisa.model.Cart;
import it.unisa.model.ProductBean;
import it.unisa.model.ProductModel;
import it.unisa.model.ProductModelDS;
import it.unisa.model.UserBean;

@WebServlet("/ProductControl")
public class ProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static boolean isDataSource = true;

	static ProductModel model = new ProductModelDS();

	public ProductControl() {
		super();
	}

	public void createCart() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		String action = request.getParameter("action");

		try {
			if (action != null) {
				if (action.equalsIgnoreCase("addC")) {
					// manda al carrello
					int id = Integer.parseInt(request.getParameter("id"));
					cart.addProduct(model.doRetrieveByKey(id));
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductCart.jsp");
					dispatcher.forward(request, response);
				} else if (action.equalsIgnoreCase("deleteC")) {
					// elimina dal carrello
					int id = Integer.parseInt(request.getParameter("id"));
					cart.deleteProduct(model.doRetrieveByKey(id));
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductCart.jsp");
					dispatcher.forward(request, response);
				} else if (action.equalsIgnoreCase("read")) {
					// Visualizza dettagli
					int id = Integer.parseInt(request.getParameter("id"));
					request.removeAttribute("product");
					request.setAttribute("product", model.doRetrieveByKey(id));
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductDetail.jsp");
					dispatcher.forward(request, response);
				} else if (action.equalsIgnoreCase("deleteAll")) {
					// elimina tutto il carrello
					cart.deleteAllProduct();
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
					dispatcher.forward(request, response);
				} else if (action.equalsIgnoreCase("deleteR")) {
					// AMMINISTRATORE:elimina una stanza
					int id = Integer.parseInt(request.getParameter("id"));
					model.doDelete(id);
				} else if (action.equalsIgnoreCase("insertR")) {
					// AMMINISTRATORE:inserimento di una nuova stanza
					String nome = request.getParameter("Nome");
					boolean tv = Boolean.parseBoolean(request.getParameter("TV"));
					boolean panorama = Boolean.parseBoolean(request.getParameter("Panorama"));
					int prezzo = Integer.parseInt(request.getParameter("Prezzo"));
					int matrimoniali = Integer.parseInt(request.getParameter("Matrimoniali"));
					int singoli = Integer.parseInt(request.getParameter("Singoli"));

					ProductBean bean = new ProductBean();
					bean.setNome(nome);
					bean.setTV(tv);
					bean.setPanorama(panorama);
					bean.setPrezzo(prezzo);
					bean.setMatrimoniali(matrimoniali);
					bean.setSingoli(singoli);
					model.doSave(bean);
				} else if (action.equalsIgnoreCase("modifyR")) {

				}

			} else {
				String sort = request.getParameter("sort");
				request.getSession().removeAttribute("products");
				request.getSession().setAttribute("products", model.doRetrieveAll(sort));
				UserBean user = new UserBean();
				request.getSession().removeAttribute("currentSessionUser");
				request.getSession().setAttribute("currentSessionUser", user);

				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
				dispatcher.forward(request, response);
			}
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// prendere i dati di login

	}
}
