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
import it.unisa.model.ProductModel;
import it.unisa.model.UserBean;
import it.unisa.model.ProductModelDS;
/**
 * Servlet implementation class GenerateControl
 */
@WebServlet("/GenerateControl")
public class GenerateControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ProductModel model= new ProductModelDS();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenerateControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	    UserBean userTest = (UserBean) request.getSession(true).getAttribute("currentSessionUser"); 
	    UserBean user= new UserBean();
	    if (userTest==null) {
	    	request.getSession(true).removeAttribute("currentSessionUser");
	    	request.getSession(true).setAttribute("currentSessionUser", user);
	     	
	    }
	     String sort = request.getParameter("sort");
	     try {
			request.getSession().removeAttribute("products");
			request.getSession().setAttribute("products", model.doRetrieveAll(sort));
			request.getSession().removeAttribute("currentSessionUser");
	    	request.getSession().setAttribute("currentSessionUser", user);
	     }catch (SQLException e) {
			System.out.println("the error was: "+e);
		}
	     RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
		dispatcher.forward(request, response);
	     /*
	      * metodi per inviare dati tra servlet
	      * request.setAttribute("varName", variable);
	      * getServletContext().getRequestDispatcher("servlet2").forward(request,response);
	      * request.getAttribute("varName");
	      * getServletContext().setAttribute("varName", variable);
	      */
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     
	     	/*session.setAttribute("currentSessionUser", user);
			Cart cart = (Cart)session.getAttribute("cart");
			if(cart == null) {
				cart = new Cart();
				session.setAttribute("cart", cart);
			}
			try {
			String sort = request.getParameter("sort");
			session.removeAttribute("products");
			session.setAttribute("products", model.doRetrieveAll(sort));
			}catch (SQLException e) {
				System.out.println("Error:" + e.getMessage());
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
			dispatcher.forward(request, response);
		//System.out.println("stronzo2");*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
