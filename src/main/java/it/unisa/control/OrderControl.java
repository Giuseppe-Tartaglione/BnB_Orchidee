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

import it.unisa.model.BundleBean;
import it.unisa.model.BundleDao;
import it.unisa.model.Cart;
import it.unisa.model.OrderDao;
import it.unisa.model.ProductBean;
import it.unisa.model.UserBean;

/**
 * Servlet implementation class OrderControl
 */
@WebServlet("/OrderControl")
public class OrderControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	OrderDao order = new OrderDao();

	/**
	 * Default constructor.
	 */
	public OrderControl() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String ID_Prenotazione = request.getParameter("ID");
		String sort = request.getParameter("sort");
		String action = request.getParameter("action");
		UserBean user = (UserBean) request.getSession().getAttribute("currentSessionUser");
		String ID_Utente = user.getEmail();
		if (action.equalsIgnoreCase("all")) {
			try {
				request.getSession().removeAttribute("UserOrder");
				request.getSession().setAttribute("UserOrder", order.doRetrieveAll(ID_Utente, sort));
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/OrderView.jsp");
				dispatcher.forward(request, response);
			} catch (SQLException e) {
				System.out.println("the error was: " + e);
			}
		} else if (action.equalsIgnoreCase("detail")) {
			try {
				request.getSession().removeAttribute("UserOrder");
				request.getSession().setAttribute("UserOrder", order.doRetrievebyKey(ID_Prenotazione, ID_Utente));
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/OrderDetail.jsp");
				dispatcher.forward(request, response);
			} catch (SQLException e) {
				System.out.println("the error was: " + e);
			}
		} else if (action.equalsIgnoreCase("setOrder")) {
			System.out.println("test");
		}
			try {
				if (user.isValid()) {
					Cart cart = (Cart) request.getSession().getAttribute("cart");
					boolean isPackage = true; //(boolean) request.getSession().getAttribute("isPackage");
					String ID = (String) request.getSession().getAttribute("IDPackage");
					ProductBean[] products = cart.doFillArray();
					if (cart != null) {
						if (isPackage) {		
							order.doSave(products, BundleDao.doRetrieveByKey(ID), ID_Utente);	
								System.out.println("Ordine fatto");
						}
					} else {
						System.out.println("Errore Tentato ordine invalido");
					}

					// implementazione dell'aggiunta della tupla in prenotazione, vanno settati
					// prima i metodi nel OrderDao e nel productDao
				}
			} catch (SQLException e) {
				System.out.println("the error was: " + e);
			} // errore dovuto al fatto che non c'� anccora il comando sql
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
